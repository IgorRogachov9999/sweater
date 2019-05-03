<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    User edit

    <form action="/user", method="post">
        <input type="hidden" name="_csrf" value="${ _csrf.token }">
        <input type="hidden" value="${user.id}" name="userId">
        <input type="text" value="${user.username}" name="username">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <button type="submit">Save</button>
    </form>
</@c.page>