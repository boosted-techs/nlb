new Vue ({
    delimiters : ["%%", "%%"],
    el : "#login-search-box",
    data : {
        inputSubmitDisabled : false,
        email : '',
        password : '',
        error : false
    },
    methods : {
        login : function (e) {
            this.inputSubmitDisabled = true
            this.error = false
            let vue = this
            let form = new FormData()
            form.append("email", this.email)
            form.append("password", this.password)
           axios({
               url : "./login",
               data : form,
               method : 'POST'
           }).then(function (e) {
                //console.log(e.data)
                if (e.data === true)
                    window.location = './app'
               else {
                    vue.inputSubmitDisabled = false
                    vue.error = "Wrong credentials"
                }
           })
        }

    }
});