from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, permissions, generics

# Create your views here.
from rest_framework.decorators import api_view
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from .models import User, Group, Member
from .serializers import UserSerializer, GroupSerializer, MemberSerializer

# Also add these imports
from .permissions import IsLoggedInUserOrAdmin, IsAdminUser, IsOwnerOrReadOnly, IsAdmin, IsOwner, IsGroupOwner


@api_view(['GET', 'POST'])
def hello_world(request):
    if request.method == 'POST':
        return Response({"message": "Got some data!", "data": request.data})
    return Response({"message": "Hello, world!"})


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    #Add this code block
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
        if self.request.user.is_staff:
            group = Group.objects.all()
        else:
            group = Group.objects.filter(user_id=self.request.user.id)
        return group

    def perform_create(self, serializer):
        user = get_object_or_404(
            User, pk=self.request.user.id
        )

        serializer.save(user=user,name=serializer.validated_data['name'])


class RetrieveUpdateDestroyGroup(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = GroupSerializer
    permission_classes = (permissions.IsAuthenticated,)
    lookup_field = 'name'
    queryset = Group.objects.all()

    def perform_update(self, serializer):
        print(serializer.validated_data['name'])

        serializer.save(name=serializer.validated_data['name'].lower())

    # def get_object(self):
    #     queryset = self.filter_queryset(self.get_queryset())
    #     # make sure to catch 404's below
    #     obj = queryset.get(name=self.kwargs.get('name'))
    #     self.check_object_permissions(self.request, obj)
    #     return obj


class ListCreateMember(generics.ListCreateAPIView):
    serializer_class = MemberSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,
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
    queryset = Member.objects.all()
    serializer_class = MemberSerializer

    def get_queryset(self):
        return get_object_or_404(
            Member,
            group_id=self.kwargs.get('group_pk'),
            pk=self.kwargs.get('pk')
        )

    def get_object(self):
        return get_object_or_404(
            self.get_queryset(),
            group_id=self.kwargs.get['group_pk'],
            pk=self.kwargs.get['pk']

        )

    permission_classes = (permissions.IsAuthenticatedOrReadOnly,
                          IsOwnerOrReadOnly,)
