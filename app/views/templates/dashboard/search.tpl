{extends file="index-2.tpl"}
{block name="body"}
    <div class="container page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">Search</li>
                        <li class="breadcrumb-item">{$smarty.get.q}</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">{$smarty.get.q}</li>
                    </ol>
                </nav>
                <h1 class="m-0">{$smarty.get.q}</h1>
            </div>
        </div>
    </div>
    <div class="container page__container">
        <div class="col-md-12">
            <div class="card card-form">
                <div class="card-header">Results for Search <b class="text-primary">'{$smarty.get.q}'</b> in stories</div>
                <div class="row no-gutters">
                    <div class="col-lg-12 card-form__body">
                        {if ! empty($stories)}
                            {foreach $stories item=list}
                                {foreach $stats.stories_data item=list}
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
                                            <small class="text-muted">{$list.title}</small>
                                        </div>
                                        <div>{$list.date_modified}</div>

                                        <A href="//{$smarty.server.SERVER_NAME}/story/{$list.url}">
                                            <i class="material-icons icon-muted ml-3">arrow_forward</i>
                                        </A>
                                    </div>
                                {/foreach}
                            {/foreach}
                        {else}
                            <div class="text-center p-3 bg-warning">No results for <b class="text-primary">'{$smarty.get.q}'</b> in comments</div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="card card-form">
                <div class="card-header">Results for Search <b class="text-primary">'{$smarty.get.q}'</b> in users</div>
                <div class="row no-gutters">
                    <div class="col-lg-12 card-form__body">
                        {if ! empty($accounts)}
                            <div class="tab-pane table-responsive"
                                 id="activity_quotes">
                                <table class="table mb-0 thead-border-top-0">
                                    <thead>
                                    <tr>
                                        <th style="width: 37px;">Gender</th>

                                        <th>Employee</th>
                                        <th style="width:120px">Email</th>
                                        <th style="width: 37px;">Role</th>
                                        <th style="width: 37px;">Gender</th>

                                        <th style="width: 120px;">Username</th>
                                        <th style="width: 51px;">DOB</th>
                                        <th style="width: 24px;"></th>
                                    </tr>
                                    </thead>
                                    <tbody class="list"
                                           id="staff02">
                                    {foreach $accounts item=list}
                                        <tr>
                                            <td>
                                                <div class="avatar avatar-sm mr-3">
                                                    <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}">
                                                        <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}" alt="Avatar" class="avatar-img rounded-circle">
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}">
                                                    <span class="js-lists-values-employee-name">{$list.names}</span>
                                                </a>
                                            </td>
                                            <td>{$list.email}</td>
                                            <td><span class="badge badge-primary">{if $list.role == 1}Anchor{elseif $list.role == 2}Admin{/if}</span></td>
                                            <td>{$list.gender}</td>
                                            <td><small class="text-muted">{$list.username}</small></td>
                                            <td>{$list.dob}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                <div class="card-footer text-center border-0">
                                    <a class="text-muted"
                                       href="//{$smarty.server.SERVER_NAME}/app/users">View All users</a>
                                </div>
                            </div>
                        {else}
                            <div class="text-center p-3 bg-warning">No results for <b class="text-primary">'{$smarty.get.q}'</b> in users</div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="card card-form">
                <div class="card-header">Results for Search <b class="text-primary">'{$smarty.get.q}'</b> in comments</div>
                <div class="row no-gutters">
                    <div class="col-lg-12 card-form__body">
                        {if ! empty($comments)}
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
                        {else}
                            <div class="text-center p-3 bg-warning">No results for <b class="text-primary">'{$smarty.get.q}'</b> in comments</div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="card card-form">
                <div class="card-header">Results for Search <b class="text-primary">'{$smarty.get.q}'</b> in media</div>
                <div class="row no-gutters">
                    <div class="col-lg-12 card-form__body table-responsive">
                        {if ! empty($media)}
                            <table class="table mb-0 thead-border-top-0">
                                <thead>
                                <tr>
                                    <th style="width: 37px;"></th>
                                    <th>Names</th>
                                    <th>File</th>
                                    <th>Caption</th>
                                    <th>URL</th>
                                    <th style="width: 37px;">Date added</th>

                                </tr>
                                </thead>
                                <tbody class="list"
                                       id="staff02">
                                {foreach $media item=list name=cat}
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
                                        <td><a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}#files">{$list.names}</a></td>
                                        <td>{$list.caption}</td>
                                        <td><h6 class="text-lowercase">//{$smarty.server.SERVER_NAME}/files/{$list.file_path} FILE</h6></td>
                                        <td>{$list.date_added}</td>

                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        {else}
                            <div class="text-center p-3 bg-warning">No results for <b class="text-primary">'{$smarty.get.q}'</b> in media</div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
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