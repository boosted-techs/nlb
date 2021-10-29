<!DOCTYPE html>
<html lang="en"
      dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible"
          content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>News Light Board</title>

    <!-- Prevent the demo from appearing in search engines -->
    <meta name="robots"
          content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/perfect-scrollbar.css"
          rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/app.css"
          rel="stylesheet">
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/app.rtl.css"
          rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/vendor-material-icons.css"
          rel="stylesheet">
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/vendor-material-icons.rtl.css"
          rel="stylesheet">

    <!-- Font Awesome FREE Icons -->
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/vendor-fontawesome-free.css"
          rel="stylesheet">
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/vendor-fontawesome-free.rtl.css"
          rel="stylesheet">
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/dashboard/css/vendor-fontawesome-free.rtl.css"
          rel="stylesheet">
    <link type="text/css"
          href="//{$smarty.server.SERVER_NAME}/assets/editor/dist/ui/trumbowyg.min.css"
          rel="stylesheet">

</head>

<body class="layout-default">

<div class="preloader"></div>

<!-- Header Layout -->
<div class="mdk-header-layout js-mdk-header-layout">

    <!-- Header -->

    <div id="header"
         class="mdk-header js-mdk-header m-0"
         data-fixed>
        <div class="mdk-header__content">

            <div class="navbar navbar-expand-sm navbar-main navbar-dark bg-dark  pr-0" id="navbar" data-primary>
                <div class="container-fluid p-0">

                    <!-- Navbar toggler -->

                    <button class="navbar-toggler navbar-toggler-right d-block d-lg-none" type="button" data-toggle="sidebar">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Navbar Brand -->
                    <a href="//{$smarty.server.SERVER_NAME}/app/"
                       class="navbar-brand ">
                        <span>NEWS LIGHT BOARD</span>
                    </a>

                    <form class="search-form d-none d-sm-flex flex" action="//{$smarty.server.SERVER_NAME}/search" method="get">
                        <button class="btn" type="submit"><i class="material-icons">search</i></button>
                        <input type="text" class="form-control" name="q" {if isset($smarty.get.q)} value="{$smarty.get.q}" {/if} placeholder="Search">
                    </form>

                    <ul class="nav navbar-nav d-none d-sm-flex border-left navbar-height align-items-center">
                        <li class="nav-item dropdown">
                            <a href="#account_menu" class="nav-link dropdown-toggle" data-toggle="dropdown" data-caret="false">
                                        <span class="mr-1 d-flex-inline">
                                            <span class="text-light">{$user.names}</span>
                                        </span>
                                <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}" class="rounded-circle" width="32" alt="Frontted">
                            </a>
                            <div id="account_menu"
                                 class="dropdown-menu dropdown-menu-right">
                                <div class="dropdown-item-text dropdown-item-text--lh">
                                    <div><strong>{$user.names}</strong></div>
                                    <div class="text-muted">@{$user.username}</div>
                                </div>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="//{$smarty.server.SERVER_NAME}/app"><i class="material-icons">dvr</i> Dashboard</a>
                                <a class="dropdown-item" href="//{$smarty.server.SERVER_NAME}/app/{$user.username}"><i class="material-icons">account_circle</i> My profile</a>
                                <a class="dropdown-item" href="//{$smarty.server.SERVER_NAME}/app/profile/edit"><i class="material-icons">edit</i> Edit account</a>
                                <a class="dropdown-item" href="javascript:updatePassword()"><i class="material-icons">key</i>Change password</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="//{$smarty.server.SERVER_NAME}/logout"><i class="material-icons">exit_to_app</i> Logout</a>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>

        </div>
    </div>

    <!-- // END Header -->

    <!-- Header Layout Content -->
    <div class="mdk-header-layout__content">

        <div class="mdk-drawer-layout js-mdk-drawer-layout"
             data-push
             data-responsive-width="992px">
            <div class="mdk-drawer-layout__content page">
                {block name="body"}{/block}

            </div>
            <!-- // END drawer-layout__content -->

            <div class="mdk-drawer  js-mdk-drawer"
                 id="default-drawer"
                 data-align="start">
                <div class="mdk-drawer__content">
                    <div class="sidebar sidebar-light sidebar-left sidebar-p-t"
                         data-perfect-scrollbar>
                        <div class="sidebar-heading">Menu</div>
                        <ul class="sidebar-menu">
                            <li class="sidebar-menu-item">
                                <a class="sidebar-menu-button"
                                   href="//{$smarty.server.SERVER_NAME}/app/">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dvr</i>
                                    <span class="sidebar-menu-text">Dashboard</span>
                                </a>

                            </li>
                            <li class="sidebar-menu-item open">
                                <a class="sidebar-menu-button" data-toggle="collapse" href="#apps_menu">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">slideshow</i>
                                    <span class="sidebar-menu-text">Stories</span>
                                    <span class="ml-auto sidebar-menu-toggle-icon"></span>
                                </a>
                                <ul class="sidebar-submenu collapse"
                                    id="apps_menu">
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button" href="//{$smarty.server.SERVER_NAME}/app/stories">
                                            <span class="sidebar-menu-text">Stories</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button"href="//{$smarty.server.SERVER_NAME}/app/stories/media">
                                            <span class="sidebar-menu-text">Media</span>
                                        </a>
                                    </li>
                                    {if $user.role == 2}
                                        <li class="sidebar-menu-item">
                                            <a class="sidebar-menu-button" href="javascript:addCategory()">
                                                <span class="sidebar-menu-text">Add category</span>
                                            </a>
                                        </li>
                                    {/if}
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button"  href="//{$smarty.server.SERVER_NAME}/app/categories">
                                            <span class="sidebar-menu-text">Story Categories</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="sidebar-menu-item active open">
                                <a class="sidebar-menu-button"
                                   data-toggle="collapse"
                                   href="#pages_menu">
                                    <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">description</i>
                                    <span class="sidebar-menu-text">Pages</span>
                                    <span class="ml-auto sidebar-menu-toggle-icon"></span>
                                </a>
                                <ul class="sidebar-submenu collapse show "
                                    id="pages_menu">
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button"
                                           href="//{$smarty.server.SERVER_NAME}/app/users">
                                            <span class="sidebar-menu-text">All users</span>
                                        </a>
                                    </li>
                                    {if $user.role == 2}
                                        <li class="sidebar-menu-item">
                                            <a class="sidebar-menu-button" href="javascript:addMember()">
                                                <span class="sidebar-menu-text">Add user</span>
                                            </a>
                                        </li>
                                    {/if}
                                    <li class="sidebar-menu-item">
                                        <a class="sidebar-menu-button"
                                           href="//{$smarty.server.SERVER_NAME}/app/comments">
                                            <span class="sidebar-menu-text">Comments</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>


                        <div class="d-flex align-items-center sidebar-p-a border-bottom sidebar-account">
                            <a href="//{$smarty.server.SERVER_NAME}/app/{$user.username}"
                               class="flex d-flex align-items-center text-underline-0 text-body">
                                        <span class="avatar avatar-sm mr-2">
                                            <img src="//{$smarty.server.SERVER_NAME}/profile_pics/{$user.profile_pic}"
                                                 alt="avatar"
                                                 class="avatar-img rounded-circle">
                                        </span>
                                <span class="flex d-flex flex-column">
                                            <strong>{$user.names}</strong>
                                            <small class="text-muted text-uppercase">{if $user.role == 1}Anchor{else}Admin{/if}</small>
                                        </span>
                            </a>
                            <div class="dropdown ml-auto">
                                <a href="#"
                                   data-toggle="dropdown"
                                   data-caret="false"
                                   class="text-muted"><i class="material-icons">more_vert</i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="dropdown-item-text dropdown-item-text--lh">
                                        <div><strong>{$user.names}</strong></div>
                                        <div>@{$user.username}</div>
                                    </div>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item"
                                       href="//{$smarty.server.SERVER_NAME}/app/">Dashboard</a>
                                    <a class="dropdown-item"
                                       href="//{$smarty.server.SERVER_NAME}/app/profile/{$user.username}">My profile</a>
                                    <a class="dropdown-item"
                                       href="//{$smarty.server.SERVER_NAME}/app/profile/edit">Edit account</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item"
                                       href="//{$smarty.server.SERVER_NAME}/logout">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- // END drawer-layout -->

    </div>
    <!-- // END header-layout__content -->

</div>
<!-- // END header-layout -->

<!-- App Settings FAB -->
{block name="app_settings"}{/block}
<!-- jQuery -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/popper.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/bootstrap.min.js"></script>

<!-- Perfect Scrollbar -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/perfect-scrollbar.min.js"></script>

<!-- DOM Factory -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/dom-factory.js"></script>

<!-- MDK -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/vendor/material-design-kit.js"></script>

<!-- App -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/toggle-check-all.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/check-selected-row.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/dropdown.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/sidebar-mini.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/app.js"></script>

<!-- App Settings (safe to remove) -->
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/app-settings.js"></script>
{* For scripts that need to be read before the js file is loaded *}

<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/trumbowyg.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/base64/trumbowyg.base64.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/cleanpaste/trumbowyg.cleanpaste.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/pasteimage/trumbowyg.pasteimage.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/jquery-resizing.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/resizimg/trumbowyg.resizimg.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/upload/trumbowyg.upload.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/emoji/trumbowyg.emoji.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/colors/trumbowyg.colors.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/fontsize/trumbowyg.fontsize.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/insertaudio/trumbowyg.insertaudio.min.js"></script>
<script src="//{$smarty.server.SERVER_NAME}/assets/editor/dist/plugins/allowtagsfrompaste/trumbowyg.allowtagsfrompaste.min.js"></script>

<script src="//{$smarty.server.SERVER_NAME}/assets/dashboard/js/custom.js"></script>
{block name="scripts"}{/block}

<script>
    $(document).ready(function(){
        {if isset($smarty.get.error)}
            loadErrorModal ("{$smarty.get.error}")
        {/if}
        {if isset($smarty.get.success)}
            loadSuccessModal("{$smarty.get.success}")
        {/if}
        {if isset($smarty.get.info)}
            loadInfoModal("{$smarty.get.info}")
        {/if}
        {if isset($smarty.get.warning)}
            loadWarningModal("{$smarty.get.warning}")
        {/if}
        {literal}
        $('textarea').trumbowyg({
            btns: [
                ['viewHTML'],
                ['undo', 'redo'], // Only supported in Blink browsers

                ['formatting'],
                ['strong', 'em', 'del'],
                ['superscript', 'subscript'],
                ['link'],
                ['insertImage'],
                ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
                ['unorderedList', 'orderedList'],
                ['horizontalRule'],
                ['removeformat'],
                ['fullscreen'],
                ['base64', 'upload', 'foreColor', 'backColor', 'emoji', 'fontsize', 'insertAudio', 'cleanPaste', 'fontSize'],
            ],
            plugins: {
                upload: {
                    serverPath : '//' + window.location.host + '/app/uploads',
                    fileFieldName : 'fileToUpload',
                }
            }
        });
        {/literal}
    })
</script>
    {* Actions for Admin *}
    <!-- Sign Up Modal -->
    <div id="modal-signup"
         class="modal fade"
         tabindex="-1"
         role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="px-3">
                        <div class="d-flex justify-content-center mt-2 mb-4 navbar-light">
                            <a href="index.html"
                               class="navbar-brand"
                               style="min-width: 0">
                                <span>NLB</span>
                            </a>
                        </div>
                       <div id="form-modal">

                       </div>
                    </div>
                </div> <!-- // END .modal-body -->
            </div> <!-- // END .modal-content -->
        </div> <!-- // END .modal-dialog -->
    </div> <!-- // END .modal -->


               <!-- Success Alert Modal -->
    <div id="modal-success"
         class="modal fade"
         tabindex="-1"
         role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content bg-success">
                <div class="modal-body text-center p-4">
                    <i class="material-icons icon-40pt text-white mb-2">check</i>
                    <h4 class="text-white">Well Done!</h4>
                    <p class="text-white mt-3" id="modal-sccess-content"></p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-dismiss="modal">Continue</button>
                </div> <!-- // END .modal-body -->
            </div> <!-- // END .modal-content -->
        </div> <!-- // END .modal-dialog -->
    </div> <!-- // END .modal -->

                             <!-- Info Alert Modal -->
    <div id="modal-info"
         class="modal fade"
         tabindex="-1"
         role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <i class="material-icons icon-40pt text-info mb-2">info_outline</i>
                    <h4>Heads Up!</h4>
                    <p class="mt-3" id="modal-info-content"></p>
                    <button type="button"
                            class="btn btn-info my-2"
                            data-dismiss="modal">Continue</button>
                </div> <!-- // END .modal-body -->
            </div> <!-- // END .modal-content -->
        </div> <!-- // END .modal-dialog -->
    </div> <!-- // END .modal -->

           <!-- Warning Alert Modal -->
    <div id="modal-warning"
         class="modal fade"
         tabindex="-1"
         role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <i class="material-icons icon-40pt text-warning mb-2">warning</i>
                    <h4>Warning!</h4>
                    <p class="mt-3" id="modal-warning-content"></p>
                    <button type="button"
                            class="btn btn-warning my-2"
                            data-dismiss="modal">Continue</button>
                </div> <!-- // END .modal-body -->
            </div> <!-- // END .modal-content -->
        </div> <!-- // END .modal-dialog -->
    </div> <!-- // END .modal -->

           <!-- Danger Alert Modal -->
    <div id="modal-danger"
         class="modal fade"
         tabindex="-1"
         role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content bg-danger">
                <div class="modal-body text-center p-4">
                    <i class="material-icons icon-40pt text-white mb-2">report_problem</i>
                    <h4 class="text-white">Ohhh Snap!</h4>
                    <p class="text-white mt-3" id="modal-danger-content"></p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-dismiss="modal">Continue</button>
                </div> <!-- // END .modal-body -->
            </div> <!-- // END .modal-content -->
        </div> <!-- // END .modal-dialog -->
    </div> <!-- // END .modal -->

</body>

</html>