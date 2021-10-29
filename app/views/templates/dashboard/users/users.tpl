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
                            aria-current="page">Users</li>
                    </ol>
                </nav>
                <h1 class="m-0">USERS</h1>
            </div>
        </div>
    </div>

    <div class="container-fluid page__container">
        <div class="card card-form">
            {if isset($smarty.get.password)}
                <div class="alert alert-dark-gray">
                    Password: <b>{$smarty.get.password}</b>
                </div>
            {/if}
            <div class="row no-gutters">
                <div class="col-lg-12 card-form__body">
                    <div class="table-responsive border-bottom"
                         data-toggle="lists"
                         data-lists-values='["js-lists-values-employee-name"]'>

                        <div class="search-form search-form--light m-3">
                            <input type="text" class="form-control search" placeholder="Search">
                            <button class="btn" type="button"><i class="material-icons">search</i></button>
                        </div>
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
                                    <td>
                                        <a href="//{$smarty.server.SERVER_NAME}/password-reset/{$list.user}" class="text-muted"><small>Password reset</small></a>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>

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
        {block name="scripts"}
          <!-- List.js -->
        <script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/list.min.js"></script>
        <script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/list.js"></script>
        {/block}