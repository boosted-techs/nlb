/*
App for Dashboard / Index
 */

const dashboard = {

    components: {

        "home" : homeComponent,
        "left-bar" : homeLeftBar,
        "right-bar" : homeRightBar,

    },
    template : `
            <div class="main-wrapper pt-80">
                <div class="container">
                    <div class="row">
                        <left-bar></left-bar>
                        <home></home>
                        <right-bar></right-bar>
                           </div>
                </div>
            </div>
       
        `
}

const profile = {
    components: {
        "home" : profileMainContent,
        "left-bar" : profileLeftBar,
        "right-bar" : homeRightBar,
    },
    template : profileMainNavigation

}

const userBio = {

    components : {

        "home" : bio,

    },
    template : profileMainNavigation
}

const gallery = {

    components : {

        "home" : appGallery,

    },
    template : profileMainNavigation
}

const people = {

    components : {

        "home" : findPeople,

    },
    template : profileMainNavigation
}
