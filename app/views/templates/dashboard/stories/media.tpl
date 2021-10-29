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
                            aria-current="page">Media</li>
                    </ol>
                </nav>
                <h1 class="m-0">Media</h1>
            </div>
        </div>
    </div>

    <div class="container-fluid page__container">
        <div class="card card-form">
            <div class="row no-gutters">
                <div class="col-lg-12 card-form__body table-responsive">
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