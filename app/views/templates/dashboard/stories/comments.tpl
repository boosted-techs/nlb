{extends file="index-2.tpl"}
{block name="body"}
    <div class="container-fluid page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}/app"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">Home</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">Comments</li>
                    </ol>
                </nav>
                <h1 class="m-0">Comments</h1>
            </div>
        </div>
    </div>

    <div class="container-fluid page__container">
        <div class="card card-form">
            <div class="row no-gutters">
                <div class="col-lg-12 card-form__body">
                    {foreach $comments item=list}
                        <div class="list-group-item list-group-item-action d-flex align-items-center ">
                            <div class="flex">
                                <div class="d-flex align-items-middle">
                                    <div class="avatar avatar-xxs mr-1">
                                        <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}"
                                             alt="Avatar"
                                             class="avatar-img rounded-circle">
                                    </div>

                                    <strong class="text-15pt mr-1">{$list.names}</strong>
                                </div>
                                <small class="text-muted text-truncate">{$list.comment}</small>
                            </div>
                            <div>{$list.date_added}</div>

                            <A href="//{$smarty.server.SERVER_NAME}/story/{$list.url}#comment{$list.id}">
                                <i class="material-icons icon-muted ml-3">arrow_forward</i>
                            </A>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>

    </div>
{/block}
{block name="app_settings"}
    <div id="app-settings">
        <app-settings layout-active="fixed"
                      :layout-location="{
      'default': 'ui-tables.html',
      'fixed': 'fixed-ui-tables.html',
      'fluid': 'fluid-ui-tables.html',
      'mini': 'mini-ui-tables.html'
    }"></app-settings>
    </div>
{/block}