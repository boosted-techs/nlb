function addMember() {
    let html = `
     <form action="//` + window.location.host + `/app/add-account" method="post">
                            <div class="form-group">
                                <label for="username">Name:</label>
                                <input class="form-control"
                                       type="text"
                                        name ="names"
                                       required=""
                                       placeholder="John Doe" />
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address:</label>
                                <input class="form-control" name="email"
                                       type="email"
                                       id="email"
                                       required=""
                                       placeholder="john@doe.com" />
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input class="form-control" name="password"
                                       type="password"
                                       required=""
                                      
                                       placeholder="Enter password" />
                            </div>
                           <div class="form-group">
                                <label for="password">Address:</label>
                                <input class="form-control" name="address"
                                       type="text"
                                       required=""
                                       
                                       placeholder="Address" />
                            </div>
                            <div class="form-group">
                                <label for="password">Contacts:</label>
                                <input class="form-control" name="contacts"
                                       type="text"
                                       required=""
                                       
                                       placeholder="Contacts" />
                            </div>
                             <div class="form-group">
                                <label for="role">Role:</label>
                               <select name="role" class="form-control" name="role">
                               <option value="1">Anchor</option>
                               <option value="2">Admin / Editor</option>
</select>
                            </div>
                             <div class="form-group">
                                <label for="password">DOB:</label>
                                <input class="form-control" name="dob"
                                       type="date"
                                       required=""
                                       
                                    
                            </div>
                             <div class="form-group">
                                <label for="password">NIN:</label>
                                <input class="form-control" name="nin"
                                       type="text"
                                       required=""
                                       
                                       placeholder="National ID Number" />
                            </div>
                             <div class="form-group">
                                <label for="password">Gender:</label>
                                <select class="form-control" name="gender">
                                <option>M</option>
                                <option>F</option>
</select>
                            </div>
                            <div class="form-group text-center">
                                <button class="btn btn-primary"
                                        type="submit">Create Account</button>
                            </div>
                        </form>
    `
    toggleFormModal(html)
}

function toggleFormModal(content) {
    $("#modal-signup").modal("show")
    $("#form-modal").html(content)
}

function loadErrorModal(content) {
    //alert(content)
    $("#modal-danger").modal("toggle")
    $("#modal-danger-content").html(content)
}

function loadSuccessModal(content) {
    //alert(content)
    $("#modal-success").modal("toggle")
    $("#modal-sccess-content").html(content)
}

function loadWarningModal(content) {
    //alert(content)
    $("#modal-warning").modal("toggle")
    $("#modal-warning-content").html(content)
}

function loadInfoModal(content) {
    //alert(content)
    $("#modal-info").modal("toggle")
    $("#modal-info-content").html(content)
}


function updateMemberBio() {
    let html = `
     <form action="//` + window.location.host + `/app/update-account" method="post">
                            <input type="hidden" value="` + userBio.user + `" name="user"/>
                            <div class="form-group">
                                <label for="username">Name:</label>
                                <input class="form-control"
                                       type="text"
                                        name ="names"
                                       required=""
                                       value="` + userBio.names + `"
                                       placeholder="John Doe" />
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address:</label>
                                <input class="form-control" name="email"
                                       type="email"
                                       id="email"
                                       required=""
                                       disabled
                                       value="` + userBio.email + `"
                                       placeholder="john@doe.com" />
                            </div>
                           
                           <div class="form-group">
                                <label for="password">Address:</label>
                                <input class="form-control" name="address"
                                       type="text"
                                       required=""
                                       value="`+ userBio.address +`"
                                       placeholder="Address" />
                            </div>
                            <div class="form-group">
                                <label for="password">Contacts:</label>
                                <input class="form-control" name="contacts"
                                       type="text"
                                       required=""
                                       value="` + userBio.contacts +`"
                                       placeholder="Contacts" />
                            </div>
                             <div class="form-group">
                                <label for="role">Role:</label>
                               <select name="role" class="form-control" name="role">
                               <option value="1">Anchor</option>
                               <option value="2">Admin / Editor</option>
</select>
                            </div>
                             <div class="form-group">
                                <label for="password">DOB:</label>
                                <input class="form-control" name="dob"
                                       type="date"
                                       value="` + userBio.dob +`"
                                       required=""
                                       
                                    
                            </div>
                             <div class="form-group">
                                <label for="password">NIN:</label>
                                <input class="form-control" name="nin"
                                       type="text"
                                       required=""
                                       value="` + userBio.nin +`"
                                       placeholder="National ID Number" />
                            </div>
                             <div class="form-group">
                                <label for="password">Gender:</label>
                                <select class="form-control" name="gender">
                                <option>M</option>
                                <option>F</option>
</select>
                            </div>
                            <div class="form-group text-center">
                                <button class="btn btn-primary"
                                        type="submit">Update Account</button>
                            </div>
                        </form>
    `
    toggleFormModal(html)
}

function addCategory() {
    let html = `
    <div class="p-2 text-center">Add story category</div>
    <form action='//` + window.location.host + `/app/add-category' method="post">
    <div class="form-group">
                                <label for="username">Name of Category:</label>
                                <input class="form-control rounded-0"
                                       type="text"
                                        name ="category"
                                       required=""
                                    
                                       placeholder="Eg Sports" />
                            </div>
                            <button class="btn btn-primary rounded-0 form-control">ADD CATEGORY</button>
    </form>
    `;
    toggleFormModal(html)
}

function updateContent(id, value, table, column, pk = 'id') {
    let html = `
    <div>
    <h4 class="p-2 text-center">UPDATE</h4>
    <form action="//` + window.location.host +`/app/update-content?t=` + table + `&i=` + id + `&p=` + pk + `&c=` + column +`" method="post">
    <input type="text" name="s" value="` + value + `" class="form-control rounded-0"/>
    <button class="btn btn-primary rounded-0 form-control mt-2">UPDATE</button>
    </form>
    </div>
    `
    toggleFormModal(html)
}

function updatePassword() {
    let html = `
    <div>
    <h4 class="p-2 text-center">CHANGE PASSWORD</h4>
    <form action="//` + window.location.host +`/app/change-password?" method="post">
    <label>OLD PASSWORD</label>
    <input type="password" name="old-pwd" class="form-control rounded-0"/>
    <label>New password</label>
    <input type="password" name="new-pwd"  class="form-control rounded-0"/>
    <button class="btn btn-primary rounded-0 form-control mt-2">UPDATE</button>
    </form>
    </div>
    `
    toggleFormModal(html)
}