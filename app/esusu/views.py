from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, permissions, generics, status

# Create your views here.
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response

from .models import User, Group, Member
from .serializers import UserSerializer, GroupSerializer, MemberSerializer

# Also add these imports
from .permissions import IsLoggedInUserOrAdmin, IsAdminUser, IsOwnerOrReadOnly, IsAdmin, IsOwner, IsGroupOwner

from django.conf import settings


def welcome(request):
    return HttpResponse('WELCOME')


@api_view(['GET'])
def accept(request):
    if request.method == 'GET':
        return Response({"message": "Got some data!", "data": request.data})
    return Response({"message": "Hello, world!"})


@api_view(['GET'])
def search(request):
    if request.method == 'GET':
        queryset = Group.objects.all().order_by('created_at')
        serializer = GroupSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def join(request, link):
    if request.method == 'POST':
        try:
            group = Group.objects.get(share_link=link)
        except Group.DoesNotExist:
            return Response(data={"detail": "Not Found"}, status=status.HTTP_404_NOT_FOUND)
        serializer = MemberSerializer(data=request.data)

        if serializer.is_valid():
            data = request.data
            contribution = float(data['contribution'])
            member = group.members.all()
            member_count = member.count()
            if member.filter(user_id=request.user.id):
                return Response({"detail": "You are already in this Group"})
            if member_count == group.max_number:
                return Response({"detail": "Maximum Group count reached"})
            if contribution < group.max_amount:
                return Response({"detail": "Contribution Amount Cannot be lower than Group Amount"})
            elif contribution > group.max_amount:
                return Response({"detail": "Contribution Amount Cannot be greater than Group Amount"})
            serializer.save(user_id=request.user.id)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    # Add this code block
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin, IsOwner]
        elif self.action == 'list':
            permission_classes = [IsAdminUser]
        elif self.action == 'destroy':
            permission_classes = [IsLoggedInUserOrAdmin, IsOwner]
        return [permission() for permission in permission_classes]


# class UserProfileViewSet(viewsets.ModelViewSet):
#     queryset = User.objects.all()
#     serializer_class = UserProfileSerializer


class GroupViewSet(viewsets.ModelViewSet):
    # queryset = Group.objects.all()
    # serializer_class = GroupSerializer

    pass


class ListCreateGroup(generics.ListCreateAPIView):
    serializer_class = GroupSerializer
    permission_classes = (permissions.IsAuthenticated,
                          IsOwner,)

    def get_queryset(self):
        return Group.objects.all()

    def perform_create(self, serializer):
        user = get_object_or_404(
            User, pk=self.request.user.id
        )
        serializer.save(user=user, name=serializer.validated_data['name'])


class RetrieveUpdateDestroyGroup(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = GroupSerializer
    permission_classes = (permissions.IsAuthenticated, IsGroupOwner)

    def get_queryset(self):
        queryset = Group.objects.filter(pk=self.kwargs.get('pk'))
        return queryset

    def perform_update(self, serializer):
        user = get_object_or_404(
            User, pk=self.request.user.id
        )
        serializer.save(user=user)

    # def get_object(self):
    #     queryset = self.filter_queryset(self.get_queryset())
    #     # make sure to catch 404's below
    #     obj = queryset.get(name=self.kwargs.get('name'))
    #     self.check_object_permissions(self.request, obj)
    #     return obj


class ListCreateMember(generics.ListCreateAPIView):
    serializer_class = MemberSerializer
    permission_classes = (permissions.IsAuthenticated,
                          IsGroupOwner)

    def get_queryset(self):
        member = Member.objects.filter(group_id=self.kwargs.get('group_pk'))
        return member

    def perform_create(self, serializer):
        group = get_object_or_404(
            Group, pk=self.kwargs.get('group_pk')
        )

        serializer.save(group=group)


class RetrieveUpdateDestroyMember(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = MemberSerializer

    permission_classes = (permissions.IsAuthenticatedOrReadOnly,
                          IsOwnerOrReadOnly,)

    def get_queryset(self):

        return get_object_or_404(
            Member,
            group_id=self.kwargs.get('group_pk'),
            pk=self.kwargs.get('pk')
        )




