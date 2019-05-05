<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label class="col-sm-6 col-from-label">User Name</label>
            <div class="col-sm-6">
                <input class="form-control ${(usernameError??)?string('is-invalid', '')}" value="<#if user??>${user.username}</#if>"
                       type="text" name="username" placeholder="Enter username">
            </div>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <label class="col-sm-6 col-from-label">Password</label>
            <div class="col-sm-6">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       type="password" name="password" placeholder="Enter password">
            </div>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label class="col-sm-6 col-from-label">Password</label>
                <div class="col-sm-6">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           type="password" name="password2" placeholder="Retype password">
                </div>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <label class="col-sm-6 col-from-label">Email</label>
                <div class="col-sm-6">
                    <input class="form-control ${(emailError??)?string('is-invalid', '')}" value="<#if user??>${user.email}</#if>"
                           type="email" name="email" placeholder="Email">
                </div>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
            <div>
                <div class="g-recaptcha" data-sitekey="6Lcp1qEUAAAAAPDfHjYP7iLPZTf_JgtuHfZ6jYdX"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>

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

