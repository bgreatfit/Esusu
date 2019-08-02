from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, permissions, generics

# Create your views here.
from rest_framework.permissions import AllowAny

from .models import User, Group
from .serializers import UserSerializer, UserProfileSerializer, GroupSerializer

# Also add these imports
from .permissions import IsLoggedInUserOrAdmin, IsAdminUser, IsOwnerOrReadOnly


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    # Add this code block
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsLoggedInUserOrAdmin]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsLoggedInUserOrAdmin]
        return [permission() for permission in permission_classes]


class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserProfileSerializer


class ListCreateGroup(generics.ListCreateAPIView):
    serializer_class = GroupSerializer

    def get_queryset(self):
        group = Group.objects.filter(is_searchable=1)
        if self.kwargs.get('user_pk') is not None:
            group = Group.objects.filter(user_id=self.kwargs.get('user_pk'))
        return group

    def perform_create(self, serializer):
        user = get_object_or_404(
            User, pk=self.kwargs.get('user_pk')
        )
        serializer.save(user=user)


class RetrieveUpdateDestroyGroup(generics.RetrieveUpdateDestroyAPIView):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

    def get_queryset(self):
        return get_object_or_404(
            Group,
            user_id=self.kwargs.get('user_pk'),
            pk=self.kwargs.get('pk')
        )

    permission_classes = (permissions.IsAuthenticatedOrReadOnly,
                          IsOwnerOrReadOnly,)
