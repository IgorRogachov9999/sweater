<#import "parts/common.ftl" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?if_exists}

    <form method="post">
            <div class="form-group">
                <label class="col-sm-6 col-from-label">Email</label>
                <div class="col-sm-6">
                    <input class="form-control" type="email" name="email" placeholder="Email" value="${email!''}"/>
                </div>
            </div>
        <div class="form-group">
            <label class="col-sm-6 col-from-label">Password</label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${ _csrf.token }">
        <div class="form-group">
            <button class="btn btn-primary" type="submit">Save</button>
        </div>
    </form>

</@c.page>