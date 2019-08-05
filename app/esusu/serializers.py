from rest_framework import serializers
from .models import User, Group, Member
#
#
# class UserProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = UserProfile
#         fields = ('title', 'dob', 'address', 'country', 'city', 'photo')


class MemberSerializer(serializers.ModelSerializer):

    class Meta:
        model = Member
        fields = ('id', 'group', 'user', 'rank', 'contribution', 'created_at', 'updated_at')


class GroupSerializer(serializers.ModelSerializer):
    # members = serializers.HyperlinkedRelatedField(many=True, read_only=True,
    #                                               view_name='member-detail'
    #                                               )
    members = MemberSerializer(many=True, read_only=True)

    class Meta:
        extra_kwargs = {
            'members': {'read_only': True}
        }
        model = Group
        fields = ('id', 'user_id', 'description', 'max_number', 'name', 'is_searchable', 'created_at', 'updated_at',
                  'members')


class UserSerializer(serializers.ModelSerializer):
    # profile = serializers.HyperlinkedRelatedField(many=True, required=True, view_name='esusu:user-detail',
    #                                               queryset=UserProfile.objects.all())
    # profile = UserProfileSerializer(required=True)
    groups = serializers.HyperlinkedRelatedField(many=True, read_only=True,
                                                 view_name='group-list'
                                                 )

    class Meta:
        model = User
        # fields = ('email', 'first_name', 'last_name', 'password', 'profile', 'groups')
        fields = ('id',  'username', 'email', 'first_name', 'last_name', 'password', 'groups')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        # profile_data = validated_data.pop('profile')
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.set_password(password)
        user.save()
        # UserProfile.objects.create(user=user, **profile_data)
        #UserProfile.objects.create(user=user)
        return user

    def update(self, instance, validated_data):
        # profile_data = validated_data.pop('profile')
        # profile = instance.profile

        instance.email = validated_data.get('email', instance.email)
        instance.save()

        # profile.title = profile_data.get('title', profile.title)
        # profile.dob = profile_data.get('dob', profile.dob)
        # profile.address = profile_data.get('address', profile.address)
        # profile.country = profile_data.get('country', profile.country)
        # profile.city = profile_data.get('city', profile.city)
        # profile.photo = profile_data.get('photo', profile.photo)
        # profile.save()

        return instance

