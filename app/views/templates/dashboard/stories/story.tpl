{extends file="index-2.tpl"}
{block name="body"}
    <div class="container page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">Stories</li>
                        <li class="breadcrumb-item">{$story.category}</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">{$story.title}</li>
                    </ol>
                </nav>
                <h1 class="m-0">{$story.title}</h1>
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
                {if $user.role == 2 or $user.user == $story.user}
                    <button class="btn btn-primary rounded-0 form-control mt-3">UPDATE STORY</button>
                {/if}
            </form>
        </div>
        <div class="card mt-5">
            <div class="card-header">
                <h6 class="card-title">Story Edits</h6>
            </div>
            <div class="card-text p-2">
                <div class="stories-cards mb-4">
                    {foreach $edits item=list}
                        <div class="card stories-card">
                            <div class="stories-card__content d-flex align-items-center flex-wrap">
                                <div class="avatar avatar-lg mr-3">
                                    <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}"><img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}"
                                                                                                       alt="avatar"
                                                                                                       class="avatar-img rounded"></a>
                                </div>
                                <div class="stories-card__title flex">
                                    <h5 class="card-title m-0">
                                        <a href="//{$smarty.server.SERVER_NAME}/app/edit/{$list.id}"
                                           class="headings-color">{$list.title}</a></h5>
                                    <small class="text-dark-gray"></small> - <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}"><small class="text-dark-gray">{$list.names}</small></a>
                                </div>
                                <div class="d-flex align-items-center flex-column flex-sm-row stories-card__meta">
                                    <div class="mr-3 text-dark-gray text-uppercase stories-card__tag d-flex align-items-center">
                                        <i class="material-icons text-muted-light mr-1">folder_open</i> {$list.category}
                                    </div>
                                    <div class="mr-3 text-dark-gray stories-card__date">
                                        <small>{$list.date_added}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
        <div class="card mt-5">
            <div class="card-header">
                <h6 class="card-title">Comments</h6>
            </div>
            <div class="card-body">
                <div class="">
                    {foreach $comments item=list}
                        <div class="card stories-card" id="comment{$list.id}">
                            <div class="stories-card__content d-flex align-items-center flex-wrap">
                                <div class="avatar avatar-lg mr-3">
                                    <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}">
                                        <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}"
                                                                                                       alt="avatar"
                                                                                                       class="avatar-img rounded">
                                    </a>
                                </div>
                                <div class="stories-card__title flex">
                                    <h5 class="card-title m-0

                                          headings-color">{$list.comment}</h5>
                                    <small class="text-dark-gray"></small> - <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}"><small class="text-dark-gray">{$list.names}</small></a>
                                </div>
                                <div class="d-flex align-items-center flex-column flex-sm-row stories-card__meta">
                                    <div class="mr-3 text-dark-gray stories-card__date">
                                        <small>{$list.date_added}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
                <form action="//{$smarty.server.SERVER_NAME}/add-comment?url={$story.url}" method="post">
                    <input type="hidden" name="id" value="{$story.id}"/>
                    <input type="text" class="form-control mt-2 mb-2" placeholder="type comment here" name="comments"/>
                    <button class="btn mt-2 btn-dark form-control rounded-0">Add comment</button>
                </form>
            </div>
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