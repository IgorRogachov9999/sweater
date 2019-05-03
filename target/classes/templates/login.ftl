<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    ${message?if_exists}
    <@l.login "/login" false/>
</@c.page>



