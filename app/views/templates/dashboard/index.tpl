{extends file="index-2.tpl"}
{block name="styles"}

{/block}
{block name="body"}
    <div class="container-fluid page__heading-container">
        <div class="page__heading d-flex align-items-center">
            <div class="flex">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="//{$smarty.server.SERVER_NAME}/app"><i class="material-icons icon-20pt">home</i></a></li>
                        <li class="breadcrumb-item">Home</li>
                        <li class="breadcrumb-item active"
                            aria-current="page">DASHBOARD</li>
                    </ol>
                </nav>
                <h1 class="m-0">Home</h1>
            </div>

            <a href="//{$smarty.server.SERVER_NAME}/app/users"
               class="btn btn-success ml-1">Users</a>
            <a href="//{$smarty.server.SERVER_NAME}/app/stories"
               class="btn btn-info ml-1">Stories</a>
        </div>
    </div>

    <div class="container-fluid page__container">
        <div class="card card-body px-3 d-flex flex-row align-items-center"
             role="alert">
            <span class="badge badge-outline-info mr-md-2">NEWS LIGHT BOARD</span>
            <span class="flex">Did you know you can comment on any story,  attach files to your story on the Go?</span>
            <a href="//{$smarty.server.SERVER_NAME}/app/stories"
               class="ml-3"><i class="material-icons">arrow_forward</i></a>
        </div>
        <div class="row card-group-row">
            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card card-body flex-row align-items-center">
                    <div class="position-relative mr-2">
                        <div class="text-center fullbleed d-flex align-items-center justify-content-center flex-column z-0">
                            <h3 class="text-danger mb-0">{$stats.users.today|number_format:1}</h3>
                            <small class="text-uppercase">Today</small>
                        </div>
                        <canvas width="90" height="90" class="position-relative z-1" data-toggle="progress-chart" data-progress-chart-value="12" data-progress-chart-color="danger" data-progress-chart-tone="300"></canvas>
                    </div>
                    <!-- <div><i class="material-icons icon-muted icon-40pt mr-3">gps_fixed</i></div> -->
                    <div class="flex">
                        <div class="text-amount">{$stats.users.users|number_format:1}</div>
                        <div class="text-muted mt-1">Users</div>
                        <!-- <div class="text-stats text-success">31.5% <i class="material-icons">arrow_upward</i></div> -->
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card card-body flex-row align-items-center">
                    <div class="position-relative mr-2">
                        <div class="text-center fullbleed d-flex align-items-center justify-content-center flex-column z-0">
                            <h3 class="text-info mb-0">{$stats.story_stats.today|number_format:1}</h3>
                            <small class="text-uppercase">Today</small>
                        </div>
                        <canvas width="90" height="90" class="position-relative z-1" data-toggle="progress-chart" data-progress-chart-value="12" data-progress-chart-color="danger" data-progress-chart-tone="300"></canvas>
                    </div>
                    <!-- <div><i class="material-icons icon-muted icon-40pt mr-3">gps_fixed</i></div> -->
                    <div class="flex">
                        <div class="text-amount">{$stats.story_stats.stories|number_format:1}</div>
                        <div class="text-muted mt-1">Stories</div>
                        <!-- <div class="text-stats text-success">31.5% <i class="material-icons">arrow_upward</i></div> -->
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card card-body flex-row align-items-center">
                    <div class="position-relative mr-2">
                        <div class="text-center fullbleed d-flex align-items-center justify-content-center flex-column z-0">
                            <h3 class="text-success mb-0">{$stats.comment_stats.today|number_format:1}</h3>
                            <small class="text-success">Today</small>
                        </div>
                        <canvas width="90" height="90" class="position-relative z-1" data-toggle="progress-chart" data-progress-chart-value="12" data-progress-chart-color="danger" data-progress-chart-tone="300"></canvas>
                    </div>
                    <!-- <div><i class="material-icons icon-muted icon-40pt mr-3">gps_fixed</i></div> -->
                    <div class="flex">
                        <div class="text-amount">{$stats.comment_stats.comments|number_format:1}</div>
                        <div class="text-muted mt-1">Comments</div>
                        <!-- <div class="text-stats text-success">31.5% <i class="material-icons">arrow_upward</i></div> -->
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 card-group-row__col">
                <div class="card card-group-row__card card-body flex-row align-items-center">
                    <div class="position-relative mr-2">
                        <div class="text-center fullbleed d-flex align-items-center justify-content-center flex-column z-0">
                            <h3 class="text-blue mb-0">{$stats.files_stats.today|number_format:1}</h3>
                            <small class="text-blue">Today</small>
                        </div>
                        <canvas width="90" height="90" class="position-relative z-1" data-toggle="progress-chart" data-progress-chart-value="12" data-progress-chart-color="danger" data-progress-chart-tone="300"></canvas>
                    </div>
                    <!-- <div><i class="material-icons icon-muted icon-40pt mr-3">gps_fixed</i></div> -->
                    <div class="flex">
                        <div class="text-amount">{$stats.files_stats.files|number_format:1}</div>
                        <div class="text-muted mt-1">Media uploaded</div>
                        <!-- <div class="text-stats text-success">31.5% <i class="material-icons">arrow_upward</i></div> -->
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg">
                <div class="card">
                    <div class="card-header card-header-large bg-white d-flex align-items-center">
                        <h4 class="card-header__title flex m-0">Recent Activity</h4>
                    </div>
                    <div class="card-header card-header-tabs-basic nav" role="tablist">
                        <a href="#activity_all" class="active" data-toggle="tab" role="tab" aria-selected="true">Stories</a>
                        <a href="#activity_purchases" data-toggle="tab" role="tab" aria-selected="false">Comments</a>
                        <a href="#activity_emails" data-toggle="tab" role="tab" aria-selected="false">Files</a>
                        <a href="#activity_quotes" data-toggle="tab" role="tab" aria-selected="false">Users</a>
                    </div>
                    <div class="list-group tab-content list-group-flush">
                        <div class="tab-pane active show fade" id="activity_all">
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
                            <div class="card-footer text-center border-0">
                                <a class="text-muted"
                                   href="//{$smarty.server.SERVER_NAME}/app/stories">View All ({$stats.story_stats.stories})</a>
                            </div>
                        </div>
                        <div class="tab-pane"
                             id="activity_purchases">

                            <div class="tab-pane active show fade" id="activity_all">
                                {foreach $stats.comments item=list}
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
                                <div class="card-footer text-center border-0">
                                    <a class="text-muted"
                                       href="//{$smarty.server.SERVER_NAME}/app/comments">View All ({$stats.comment_stats.comments})</a>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane table-responsive"
                             id="activity_emails">
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
                                {foreach $stats.media item=list name=cat}
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
                                        <td>{$list.names}</td>
                                        <td>{$list.caption}</td>
                                        <td><h6 class="text-lowercase">//{$smarty.server.SERVER_NAME}/files/{$list.file_path} FILE</h6></td>
                                        <td>{$list.date_added}</td>

                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                            <div class="card-footer text-center border-0">
                                <a class="text-muted"
                                   href="//{$smarty.server.SERVER_NAME}/app/stories/media">View All ({$stats.files_stats.files})</a>
                            </div>
                        </div>
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
                                {foreach $stats.user_data item=list}
                                    <tr>
                                        <td>
                                            <div class="avatar avatar-sm mr-3">
                                                <a href="//{$smarty.server.SERVER_NAME}/app/{$list.username}">
                                                    <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$list.profile_pic}"
                                                         alt="Avatar"
                                                         class="avatar-img rounded-circle">
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
                                   href="//{$smarty.server.SERVER_NAME}/app/users">View All ({$stats.users.users})</a>
                            </div>
                        </div>
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
      'default': 'blank',
      'fixed': 'fixed-blank',
      'fluid': 'fluid-blank',
      'mini': 'mini-blank'
    }"
        ></app-settings>
    </div>
{/block}