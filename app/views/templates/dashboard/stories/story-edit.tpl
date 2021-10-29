{extends file="index-2.tpl"}
{block name="body"}
    <div class="container page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">EDITS</li>
                        <li class="breadcrumb-item">{$story.category}</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">{$story.title}</li>
                    </ol>
                </nav>
                <h1 class="m-0">{$story.title}</h1>
                <h6>{$story.names} - {$story.date_added}</h6>
            </div>
            <a href="//{$smarty.server.SERVER_NAME}/app/new-story"
               class="btn btn-success ml-3">Add Stories</a>
        </div>
    </div>
    <div class="container page__container">
        <div class="col-md-12">
            <form action="//{$smarty.server.SERVER_NAME}/app/update-story" method="post" enctype="multipart/form-data">
                <input type="text" required class="form-control rounded-0" value="{$story.title}" name="title" placeholder="TITLE"/>
                <input type="hidden" value="{$story.id}" name="id"/>
                <select class="form-control rounded-0" required name="category">
                    <option value="">Select category</option>
                    {foreach $categories item=cat}
                        <option {if $story.cat == $cat.id}selected{/if} {if $cat.status == 1}value="{$cat.id}"{else}disabled{/if}>{$cat.category}</option>
                    {/foreach}
                </select>
                <textarea name="story">
                     {$story.story}
                </textarea>
            </form>
        </div>
    </div>
{/block}
{block name="app_settings"}
    <!-- App Settings FAB -->
    <div id="app-settings">
        <app-settings layout-active="fixed"
                      :layout-location="{
      'default': 'stories.html',
      'fixed': 'fixed-stories.html',
      'fluid': 'fluid-stories.html',
      'mini': 'mini-stories.html'
    }"></app-settings>
    </div>
{/block}