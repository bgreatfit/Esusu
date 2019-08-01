from rest_framework import serializers
from .models import User, UserProfile, Group, GroupInstance


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('title', 'dob', 'address', 'country', 'city', 'photo')


class GroupSerializer(serializers.ModelSerializer):
    groupinstances = serializers.HyperlinkedRelatedField(many=True, read_only=True,
                                                view_name='esusu:group-detail')
    class Meta:
        model = Group
        fields = ('user', 'description', 'max_number', 'slot', 'is_searchable', 'created_at', 'updated_at', 'groupinstances')


class UserSerializer(serializers.ModelSerializer):
    # profile = serializers.HyperlinkedRelatedField(many=True, required=True, view_name='esusu:user-detail',
    #                                               queryset=UserProfile.objects.all())
    profile = UserProfileSerializer(required=True)
    groups = serializers.HyperlinkedRelatedField(many=True, read_only=True,
                                                view_name='esusu:group-detail')

    class Meta:
        model = User
        fields = ('email', 'first_name', 'last_name', 'password', 'profile', 'groups')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.set_password(password)
        user.save()
        UserProfile.objects.create(user=user, **profile_data)
        return user

    def update(self, instance, validated_data):
        profile_data = validated_data.pop('profile')
        profile = instance.profile

        instance.email = validated_data.get('email', instance.email)
        instance.save()

        profile.title = profile_data.get('title', profile.title)
        profile.dob = profile_data.get('dob', profile.dob)
        profile.address = profile_data.get('address', profile.address)
        profile.country = profile_data.get('country', profile.country)
        profile.city = profile_data.get('city', profile.city)
        profile.photo = profile_data.get('photo', profile.photo)
        profile.save()

        return instance


class GroupInstanceSerializer(serializers.ModelSerializer):

    model = GroupInstance

    class Metal:
        fields = ('id', 'group', 'member', 'rank', 'contribution', 'created_at', 'updated_at')
