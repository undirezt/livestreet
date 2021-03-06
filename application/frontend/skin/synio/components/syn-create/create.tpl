{function syn_create item=null}
    <a href="{$item.url}" class="syn-create-item syn-create-item--{$item.name}">
        <div class="syn-create-item-image"></div>
        <div class="syn-create-item-text">{$item.text}</div>
    </a>
{/function}

{capture 'syn_create'}
    {$_menu = [
        [ 'name' => 'blog', 'text' => {lang 'modal_create.items.blog'}, 'url' => {router page='blog/add'} ],
        [ 'name' => 'message', 'text' => {lang 'modal_create.items.talk'}, 'url' => "{router page='talk/add'}" ]
    ]}

    <div class="syn-create-items ls-clearfix">
        {if $iUserCurrentCountTopicDraft}
            {syn_create item=[ 'name' => 'draft', 'text' => {lang 'synio.drafts' count=$iUserCurrentCountTopicDraft plural=true}, 'url' => "{router page='content'}drafts/" ]}
        {/if}

        {foreach $LS->Topic_GetTopicTypes() as $type}
            {syn_create item=[ 'name' => $type->getCode(), 'text' => $type->getName(), 'url' => $type->getUrlForAdd() ]}
        {/foreach}

        {foreach $_menu as $item}
            {syn_create item=$item}
        {/foreach}
    </div>
{/capture}

{component 'modal'
    id='syn-create-modal'
    showFooter=false
    classes='syn-create-modal js-modal-default'
    content=$smarty.capture.syn_create}