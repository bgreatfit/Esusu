from rest_framework import serializers
from rest_framework.reverse import reverse

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
        extra_kwargs = {'rank': {'write_only': True}}
        fields = ('id', 'rank', 'contribution', 'created_at', 'updated_at')


class GroupSerializer(serializers.ModelSerializer):
    # members = serializers.HyperlinkedRelatedField(many=True, read_only=True,
    #                                               view_name='member-detail'
    #                                               )
    members = MemberSerializer(many=True, read_only=True)

    class Meta:
        extra_kwargs = {
            'members': {'read_only': True},
            'is_searchable': {'write_only': True},
        }
        model = Group
        fields = ('id', 'description', 'max_number', 'max_amount', 'name', 'is_searchable', 'created_at', 'updated_at',
                  'members')


class UserSerializer(serializers.ModelSerializer):
    # profile = serializers.HyperlinkedRelatedField(many=True, required=True, view_name='esusu:user-detail',
    #                                               queryset=UserProfile.objects.all())
    groups = GroupSerializer(read_only=True)
    # groups = serializers.HyperlinkedRelatedField(many=True,
    #                                              queryset= Group.objects.all(),
    #                                              view_name='group-detail'
    #                                              )

    extra_kwargs = {'password': {'write_only': True},
                    'groups': {'read_only': True}
                    }

    class Meta:
        model = User
        # fields = ('email', 'first_name', 'last_name', 'password', 'profile', 'groups')
        fields = ('id',  'username', 'email', 'first_name', 'last_name', 'password', 'groups')

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


class CustomerHyperlink(serializers.HyperlinkedRelatedField):
    # We define these as class attributes, so we don't need to pass them as arguments.
    view_name = 'customer-detail'
    queryset = Member.objects.all()

    def get_url(self, obj, view_name, request, format):
        url_kwargs = {
            'organization_slug': obj.organization.slug,
            'customer_pk': obj.pk
        }
        return reverse(view_name, kwargs=url_kwargs, request=request, format=format)

    def get_object(self, view_name, view_args, view_kwargs):
        lookup_kwargs = {
           'organization__slug': view_kwargs['organization_slug'],
           'pk': view_kwargs['customer_pk']
        }
        return self.get_queryset().get(**lookup_kwargs)