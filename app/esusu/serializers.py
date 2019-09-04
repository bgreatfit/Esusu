from rest_framework import serializers
from rest_framework.reverse import reverse

from .models import User, Group, Member, Account, Transaction


#
#
# class UserProfileSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = UserProfile
#         fields = ('title', 'dob', 'address', 'country', 'city', 'photo')


class MemberSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='user.username')

    class Meta:
        model = Member
        extra_kwargs = {'rank': {'write_only': True}}
        fields = ('id', 'rank', 'contribution', 'owner', 'created_at', 'updated_at')


class GroupSerializer(serializers.ModelSerializer):
    # members = serializers.HyperlinkedRelatedField(many=True, read_only=True,
    #                                               view_name='member-detail'
    #                                               )
    owner = serializers.ReadOnlyField(source='user.username')
    members = MemberSerializer(many=True, read_only=True)
    #members = serializers.HyperlinkedIdentityField(view_name='member-list')

    class Meta:
        extra_kwargs = {
            'members': {'read_only': True},
            'share_link': {'read_only': True}
        }
        model = Group
        fields = ('id', 'description', 'max_number', 'max_amount', 'name', 'is_searchable', 'share_link', 'created_at', 'updated_at',
                  'members', 'owner')


class UserSerializer(serializers.ModelSerializer):
    groups = serializers.HyperlinkedRelatedField(many=True, view_name='group-detail', read_only=True)

    class Meta:
        model = User
        extra_kwargs = {'password': {'write_only': True}}

        # fields = ('email', 'first_name', 'last_name', 'password', 'profile', 'groups')
        fields = ('url', 'id',  'username', 'email', 'first_name', 'last_name', 'password','pay_freq','groups')

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


class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'


class TransactionSerializer(serializers.ModelSerializer):

    class Meta:
        model = Transaction
        fields = '__all__'
