<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<h1>${uiLabelMap.OrderReturnsCurrent}</h1>
<div><a href="<@ofbizUrl>returnMain</@ofbizUrl>" class="button tiny">${uiLabelMap.OrderCreateReturn}</a></div>


<#if returnList?has_content>
<@section>
<table cellspacing="0" class="basic-table">
     <thead>
  <tr class="header-row">
        <th>${uiLabelMap.OrderReturnId} ${uiLabelMap.CommonNbr}</th>
        <th>${uiLabelMap.FormFieldTitle_entryDate}</th>
        <th>${uiLabelMap.PartyParty}</th>
        <th>${uiLabelMap.FacilityFacility}</th>
        <th>${uiLabelMap.CommonStatus}</th>
  </tr>
      </thead>
  <#list returnList as returnHeader>
  <#assign statusItem = returnHeader.getRelatedOne("StatusItem", false)>
  <#if returnHeader.destinationFacilityId??>
    <#assign facility = returnHeader.getRelatedOne("Facility", false)>
  </#if>
  <tr>
        <td><a href="<@ofbizUrl>returnMain?returnId=${returnHeader.returnId}</@ofbizUrl>" class="button tiny">${returnHeader.returnId}</a></td>
    <td><div>${returnHeader.entryDate.toString()}</div></td>
    <td>
      <#if returnHeader.fromPartyId??>
            <a href="${customerDetailLink}${returnHeader.fromPartyId}${StringUtil.wrapString(externalKeyParam)}" class='button tiny'>${returnHeader.fromPartyId}</a>
      <#else>
            <span>${uiLabelMap.CommonNA}</span>
      </#if>
    </td>
    <td><#if facility??>${facility.facilityName?default(facility.facilityId)}<#else>${uiLabelMap.CommonNone}</#if></td>
    <td>${statusItem.get("description",locale)}</td>
  </tr>
  </#list>
    </table>
</@section>
</#if>