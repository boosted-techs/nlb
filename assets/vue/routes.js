const { createRouter, createWebHistory, createWebHashHistory } = VueRouter
const { createApp } = Vue
const eventBus = mitt()

const router = createRouter({
    history: createWebHistory(),
    routes: [
        { path : '/p', component: dashboard, name : 'Dashboard' },
        {path : '/p/profile', component : profile, name : 'profile'},
        {path : '/p/bio', component : userBio, name : 'userBio',},
        {path : '/p/photos', component : gallery, name : 'gallery'},
        {path : '/p/people', component : people, name : 'People'}
    ]
})

const app = createApp({
    data () {
        return {

        }
    },
    mounted () {
        this.getLatestAccounts()
        this.getUserPosts()
        this.getUserProfile()
    },
    components : {
        "top-nav" : navBar,
        //"fixed-footer" : footer
    },
    methods : {
        getLatestAccounts : function () {
            let vue = this
            axios({
                url : "//" + window.location.host + "/get-latest-accounts",
                method : "post",
                data : null
            }) . then (function(response) {
                //console.log(response)
                //vue.latestAccounts = response.data
            }). catch(function(error) {
                //console.log(error)
            })
        },
        getUserPosts : function() {
            let vue = this
            axios({
                url : "//" + window.location.host + "/get-photo-updates",
                method: "post",
                data : null
            }) . then (function(response) {
                //console.log(response.data)
                //vue.media = response.data
                vue.eventBus.emit("media", response.data)
            })
        },
        getUserProfile : function (username = false) {
            let vue = this
            axios({
                url : "//" + window.location.host + "/dashboard/" + username,
                method : "get",
                data : null
            }) . then (function (response) {
                //console.log(response.data)
                if (response.data)
                    //vue.user = response.data
                    vue.eventBus.emit("userData", response.data)
                else {
                    alert("You are out of session. Login to continue")
                    window.location = vue.hostName + "login"
                }
                console.log(1010)
            }) .catch(function(error) {
                console.log(error)
            })
        }
    }
})
/*
Assigning eventbus
 */
app.config.globalProperties.eventBus = eventBus
app.mixin(getPosts)
app.use(router)
window.vm = app.mount('app')