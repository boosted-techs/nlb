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
                            aria-current="page">Categories</li>
                    </ol>
                </nav>
                <h1 class="m-0">Categories</h1>
            </div>
        </div>
    </div>

    <div class="container-fluid page__container">
        <div class="card card-form">
            <div class="row no-gutters">
                <div class="col-lg-12 card-form__body">

                    <div class="table-responsive border-bottom"
                         data-toggle="lists"
                         data-lists-values='["js-lists-values-employee-name"]'>
                        <button class="btn btn-primary rounded-0" onclick="addCategory()">Add category</button>
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

                                <th>Category</th>
                                <th></th>
                                <th style="width: 37px;">Status</th>
                                <th style="width: 37px;">Date added</th>
                                {if $user.role == 2}<th style="width: 80px">Action</th>{/if}
                            </tr>
                            </thead>
                            <tbody class="list"
                                   id="staff02">
                            {foreach $categories item=list name=cat}
                                <tr>
                                    <td>{$smarty.foreach.cat.index+1}</td>
                                    <Td {if $user.role == 2} onclick="updateContent({$list.id}, '{$list.category}', 'categories', 'category')" style="cursor: pointer"{/if}>{$list.category} ({$list.stories})</Td>
                                    <Td><a href="//{$smarty.server.SERVER_NAME}/app/stories?cat={$list.id}">View All</a></Td>
                                    <td>{if $list.status == 1}Active{else}Inactive{/if}</td>
                                    <td>{$list.date_added}</td>
                                    {if $user.role == 2}
                                        <Td>
                                            {if $list.status == 2}
                                                <a class="btn btn-primary" href="//{$smarty.server.SERVER_NAME}/app/activate?t=categories&i={$list.id}&s=1&p=id&c=status">Activate</a>
                                            {else}
                                                <a class="btn btn-warning" href="//{$smarty.server.SERVER_NAME}/app/activate?t=categories&i={$list.id}&s=2&p=id&c=status">DeActivate</a>
                                            {/if}
                                        </Td>
                                    {/if}
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