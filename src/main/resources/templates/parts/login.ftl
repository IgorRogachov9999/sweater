<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label class="col-sm-6 col-from-label">User Name</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" name="username" placeholder="Username"/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label class="col-sm-6 col-from-label">Email</label>
                <div class="col-sm-6">
                    <input class="form-control" type="email" name="password" placeholder="Email"/>
                </div>
            </div>
        </#if>
        <div class="form-group">
            <label class="col-sm-6 col-from-label">Password</label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${ _csrf.token }">
        <#if !isRegisterForm>
            <div class="form-group">
                <a href="/registration">Registration </a>
            </div>
        </#if>
        <div class="form-group">
            <button class="btn btn-primary" type="submit">Submit</button>
        </div>
    </form>

</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${ _csrf.token }">
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>

