{**
 * Выбор пользователей для чтения в ленте
 *
 * @param array $users
 *}

{include 'components/user_list_add/user_list_add.tpl'
	sUserListAddClasses    = 'js-feed-users'
	aUserList              = $smarty.local.users
	sUserListAddAttributes = 'data-param-type="users"'
	sUserListNote          = $aLang.feed.users.note}