{extends file="index-2.tpl"}
{block name="body"}
    <div class="container page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">Pages</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">Stories</li>
                    </ol>
                </nav>
                <h1 class="m-0">Stories</h1>
            </div>
            <a href="//{$smarty.server.SERVER_NAME}/app/new-story"
               class="btn btn-success ml-3">Add Stories</a>
        </div>
    </div>
    <div class="container page__container">
        <div class="mb-3"><strong class="text-dark-gray">Stories</strong></div>
        <div class="stories-cards mb-4">
            {foreach $stories item=list}
                <div class="card stories-card">
                    <div class="stories-card__content d-flex align-items-center flex-wrap">
                        <div class="avatar avatar-lg mr-3">
                            <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}"><img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}"
                                            alt="avatar"
                                            class="avatar-img rounded"></a>
                        </div>
                        <div class="stories-card__title flex">
                            <h5 class="card-title m-0">
                                <a href="//{$smarty.server.SERVER_NAME}/story/{$list.url}"
                                                          class="headings-color">{$list.title}</a></h5>
                            <small class="text-dark-gray">35 views last week</small> - <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}"><small class="text-dark-gray">{$list.names}</small></a>
                        </div>
                        <div class="d-flex align-items-center flex-column flex-sm-row stories-card__meta">
                            <div class="mr-3 text-dark-gray text-uppercase stories-card__tag d-flex align-items-center">
                                <i class="material-icons text-muted-light mr-1">folder_open</i> {$list.category}
                            </div>
                            <div class="mr-3 text-dark-gray stories-card__date">
                                <small>{$list.date_modified}</small>
                            </div>
                        </div>
                        <div class="dropdown ml-auto">
                            <a href="#"
                               data-toggle="dropdown"
                               data-caret="false"
                               class="text-muted"><i class="material-icons">more_vert</i></a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}"
                                   class="dropdown-item">{$list.names}</a>
                                <a href="//{$smarty.server.SERVER_NAME}/story/{$list.url}"
                                   class="dropdown-item">View story</a>
                                <div class="dropdown-divider"></div>
                                <a  class="dropdown-item" href="//{$smarty.server.SERVER_NAME}/app/activate?t=stories&i={$list.id}&s=1&p=id&c=deleted">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
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