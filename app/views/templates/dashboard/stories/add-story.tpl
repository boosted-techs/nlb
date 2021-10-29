{extends file="index-2.tpl"}
{block name='body'}
    <div class="container page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">Pages</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">New story</li>
                    </ol>
                </nav>
                <h1 class="m-0">New stories</h1>
            </div>
            <a href="//{$smarty.server.SERVER_NAME}/app/stories"
               class="btn btn-success ml-3">Stories</a>
        </div>
    </div>
    <div class="container page__container">
        <form action="//{$smarty.server.SERVER_NAME}/app/save-story" method="post" enctype="multipart/form-data">
            <input type="text" required class="form-control rounded-0" name="title" placeholder="TITLE"/>
            <select class="form-control rounded-0" required name="category">
                <option value="">Select category</option>
                {foreach $categories item=cat}
                    <option {if $cat.status == 1}value="{$cat.id}"{else}disabled{/if}>{$cat.category}</option>
                {/foreach}
            </select>
            <textarea name="story"></textarea>
            <button class="btn btn-primary form-control mt-2 p-2 rounded-0">SAVE</button>
        </form>
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
