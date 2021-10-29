{extends file="index-2.tpl"}
{block name="styles"}

{/block}
{block name="body"}
    <div class="mdk-header-layout__content">
    {if ! empty($account)}
        <div class="mdk-drawer-layout js-mdk-drawer-layout"
             data-push
             data-responsive-width="992px">
            <div class="mdk-drawer-layout__content page">
                <div style="padding-bottom: calc(5.125rem / 2); position: relative; margin-bottom: 1.5rem;">
                    <div class="bg-primary"
                         style="min-height: 150px;">
                        <div class="d-flex align-items-end container-fluid page__container"
                             style="position: absolute; left: 0; right: 0; bottom: 0;">
                            <div class="avatar avatar-xl">
                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}"
                                     alt="avatar"
                                     class="avatar-img rounded"
                                     style="border: 2px solid white;">
                            </div>
                            <div class="card-header card-header-tabs-basic nav flex"
                                 role="tablist">
                                <a href="#activity"
                                   class="active show"
                                   data-toggle="tab"
                                   role="tab"
                                   aria-selected="true">Activity</a>
                                <a href="#files"
                                   data-toggle="tab"
                                   role="tab"
                                   aria-selected="false">FILES</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid page__container">
                    <div class="row">
                        <div class="col-lg-3">
                            <h1 class="h4 mb-1">{$account.names}</h1>
                            <p class="text-muted">@{$account.username}</p>
                            <p>{$user.email}</p>
                            <div class="text-muted d-flex align-items-center">
                                <i class="material-icons mr-1">location_on</i>
                                <div class="flex">{$account.address}</div>
                            </div>
                            <div class="text-muted d-flex align-items-center">
                                <i class="material-icons mr-1">link</i>
                                <div class="flex"><a href="tel:{$account.contacts}">{$user.contacts}</a></div>
                            </div>
                            <div class="text-muted d-flex align-items-center">
                                <i class="material-icons mr-1">person</i>
                                <div class="flex">GENDER: {$account.gender}</div>
                            </div>
                            <div class="text-muted d-flex align-items-center">
                                <i class="material-icons mr-1">speaker</i>
                                <div class="flex">NIN: {$account.nin}</div>
                            </div>
                            <div class="text-muted d-flex align-items-center">
                                <i class="material-icons mr-1">today</i>
                                <div class="flex">DOB: {$account.dob}</div>
                            </div>
                            <div class="text-muted d-flex align-items-center">
                                <i class="material-icons mr-1">schedule</i>
                                <div class="flex">Modified: {$account.date_modified}</div>
                            </div>
                            <button class="btn btn-primary form-control rounded-0" onclick="updateMemberBio()">UPDATE INFO</button>
                        </div>
                        <div class="col-lg-9">
                            <div class="tab-content">
                                <div class="tab-pane active"
                                     id="activity">
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
                                <div class="tab-pane"
                                     id="files">
                                    <div class="card card-form">
                                        <div class="row no-gutters">
                                            <div class="col-lg-12 card-form__body">

                                                <div class="table-responsive border-bottom"
                                                     data-toggle="lists"
                                                     data-lists-values='["js-lists-values-employee-name"]'>
                                                    <div class="search-form search-form--light m-3">
                                                        <input type="text"
                                                               class="form-control search"
                                                               placeholder="Search">
                                                        <button class="btn"
                                                                type="button"><i class="material-icons">search</i></button>
                                                    </div>
                                                    <table class="table mb-0 thead-border-top-0">
                                                        <thead>
                                                        <tr>
                                                            <th style="width: 37px;"></th>

                                                            <th>File</th>
                                                            <th>Caption</th>
                                                            <th>URL</th>
                                                            <th style="width: 37px;">Date added</th>
                                                            <th style="width: 80px">Action</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody class="list"
                                                               id="staff02">
                                                        {foreach $files item=list name=cat}
                                                            <tr>
                                                                <td>{$smarty.foreach.cat.index+1}</td>
                                                                <Td  style="cursor: pointer">
                                                                    {if $list.file_type == 1}
                                                                        <a href="//{$smarty.server.SERVER_NAME}/files/{$list.file_path}"><img src="//{$smarty.server.SERVER_NAME}/files/{$list.file_path}" style="height: 100px; width: 100px; object-fit: cover"></a>
                                                                    {elseif $list.file_type == 2}
                                                                        <video src="//{$smarty.server.SERVER_NAME}/files/{$list.file_path}" style="height: 50px; width: 50px; object-fit: cover" controls></video>
                                                                    {elseif $list.file_type == 3}
                                                                        <audio src="//{$smarty.server.SERVER_NAME}/files/{$list.file_path}" style="height: 50px; width: 50px; object-fit: cover" controls></audio>
                                                                    {else}
                                                                        <a href="//{$smarty.server.SERVER_NAME}/files/{$list.file_path}"><h4 class="text-uppercase">{$list.ext} FILE</h4></a>
                                                                    {/if}
                                                                </Td>
                                                                <td>{$list.caption}</td>
                                                                <td><h6 class="text-lowercase">//{$smarty.server.SERVER_NAME}/files/{$list.file_path} FILE</h6></td>
                                                                <td>{$list.date_added}</td>
                                                                <Td>
                                                                    <a class="btn btn-primary" href="//{$smarty.server.SERVER_NAME}/app/activate?t=story_files&i={$list.id}&s=1&p=id&c=deleted">Delete</a>
                                                                </Td>
                                                            </tr>
                                                        {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- // END drawer-layout__content -->
        </div>
    {else}
        <div class="alert alert-blue text-center p-5">NOTHING TO SHOW YOU</div>
    {/if}
    </div>

{/block}
{block name="app_settings"}
 <div id="app-settings">
            <app-settings layout-active="default"
                          :layout-location="{
      'default': 'profile.html',
      'fixed': 'fixed-profile.html',
      'fluid': 'fluid-profile.html',
      'mini': 'mini-profile.html'
    }"></app-settings>
        </div>
{/block}
{block name="scripts"}
    <script>
        let userBio = {$account|json_encode};

    </script>
    <!-- List.js -->
    <script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/list.min.js"></script>
    <script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/list.js"></script>
{/block}
