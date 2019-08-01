from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User, UserProfile, GroupInstance, Group


# Register your models here.


class UserProfileInline(admin.StackedInline):
    model = UserProfile
    can_delete = False


class GroupInline(admin.StackedInline):
    model = Group



@admin.register(User)
class UserAdmin(BaseUserAdmin):
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2'),
        }),
    )
    ordering = ('email',)
    #inlines = (UserProfileInline,)
    inlines = (GroupInline,)


class GroupInstanceInline(admin.TabularInline):
    model = GroupInstance


@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    inlines = [GroupInstanceInline]


@admin.register(GroupInstance)
class GroupInstanceAdmin(admin.ModelAdmin):
    list_display = ['id', 'group', 'member', 'rank', 'contribution', 'created_at', 'updated_at']
    list_select_related = ('group',)
    list_filter = ('created_at', 'rank')
    fieldsets = (
        (None, {'fields': ('group', 'id')}),
        ('Availability', {
            'fields': ('status', 'member', 'contribution', 'created_at', 'updated_at')
        }),
    )
