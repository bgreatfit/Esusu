from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User, Member, Group, Account, Transaction


# Register your models here.


# class UserProfileInline(admin.StackedInline):
#     model = UserProfile
#     can_delete = False


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


class MemberInline(admin.TabularInline):
    model = Member


@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    inlines = [MemberInline]


@admin.register(Member)
class MemberAdmin(admin.ModelAdmin):
    list_display = ['id', 'group', 'user', 'rank', 'contribution']
    list_select_related = ('group',)
    list_filter = ('created_at', 'rank')


admin.site.register(Account)
admin.site.register(Transaction)
