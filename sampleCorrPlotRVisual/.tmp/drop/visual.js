var sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796;(()=>{"use strict";var e={50:(e,t,r)=>{r.d(t,{Jx:()=>a});var s=r(554).U;class a extends s{constructor(){super(...arguments),this.rcv_script=new i,this.settings=new n}}class i{}class n{constructor(){this.method="circle"}}},728:(e,t,r)=>{r.d(t,{u:()=>a});var s=r(50);class a{constructor(e){this.imageDiv=document.createElement("div"),this.imageDiv.className="rcv_autoScaleImageContainer",this.imageElement=document.createElement("img"),this.imageElement.className="rcv_autoScaleImage",this.imageDiv.appendChild(this.imageElement),e.element.appendChild(this.imageDiv)}update(e){if(!(e&&e.type&&e.viewport&&e.dataViews&&0!==e.dataViews.length&&e.dataViews[0]))return;const t=e.dataViews[0];this.settings=a.parseSettings(t);let r=null;t.scriptResult&&t.scriptResult.payloadBase64&&(r="data:image/png;base64,"+t.scriptResult.payloadBase64),this.imageElement.src=r||null,this.onResizing(e.viewport)}onResizing(e){this.imageDiv.style.height=e.height+"px",this.imageDiv.style.width=e.width+"px"}static parseSettings(e){return s.Jx.parse(e)}enumerateObjectInstances(e){return s.Jx.enumerateObjectInstances(this.settings||s.Jx.getDefault(),e)}}},567:(e,t,r)=>{function s(e,t,r){if(!e)return r;let s=e[t];return void 0===s?r:s}r.d(t,{N:()=>s})},982:(e,t,r)=>{r.d(t,{d9:()=>a});var s=r(567);function a(e,t,r){const a=function(e,t,r){return e?s.N(e[t.objectName],t.propertyName,r):r}(e,t,r);return a&&a.solid?a.solid.color:null==a||"object"==typeof a&&!a.solid?r:a}},554:(e,t,r)=>{r.d(t,{U:()=>a});var s=r(982);class a{static getDefault(){return new this}static createPropertyIdentifier(e,t){return{objectName:e,propertyName:t}}static parse(e){let t,r=this.getDefault();if(!e||!e.metadata||!e.metadata.objects)return r;t=r.getProperties();for(let a in t)for(let i in t[a]){const n=r[a][i];r[a][i]=s.d9(e.metadata.objects,t[a][i],n)}return r}static isPropertyEnumerable(e){return!a.InnumerablePropertyPrefix.test(e)}static enumerateObjectInstances(e,t){let r=e&&e[t.objectName];if(!r)return[];let s={objectName:t.objectName,selector:null,properties:{}};for(let e in r)r.hasOwnProperty(e)&&(s.properties[e]=r[e]);return{instances:[s]}}getProperties(){let e={};return Object.keys(this).forEach((t=>{if(a.isPropertyEnumerable(t)){let r=Object.keys(this[t]);e[t]={},r.forEach((r=>{a.isPropertyEnumerable(t)&&(e[t][r]=a.createPropertyIdentifier(t,r))}))}})),e}}a.InnumerablePropertyPrefix=/^_/},738:e=>{e.exports=Function("return this")()}},t={};function r(s){var a=t[s];if(void 0!==a)return a.exports;var i=t[s]={exports:{}};return e[s](i,i.exports,r),i.exports}r.d=(e,t)=>{for(var s in t)r.o(t,s)&&!r.o(e,s)&&Object.defineProperty(e,s,{enumerable:!0,get:t[s]})},r.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),r.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var s={};(()=>{r.r(s),r.d(s,{default:()=>i});var e=r(728),t=r(738).powerbi,a={name:"sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796",displayName:"sampleCorrPlotRVisual",class:"Visual",apiVersion:"3.8.0",create:t=>{if(e.u)return new e.u(t);throw"Visual instance not found"},createModalDialog:(e,t,r)=>{const s=globalThis.dialogRegistry;e in s&&new s[e](t,r)},custom:!0};void 0!==t&&(t.visuals=t.visuals||{},t.visuals.plugins=t.visuals.plugins||{},t.visuals.plugins.sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796=a);const i=a})(),sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796=s})();