var demoCreation522AEF1866B94124B4C4F588A968843A;(()=>{"use strict";var e={934:(e,t,s)=>{s.d(t,{Kq:()=>n,ME:()=>l,Tx:()=>a});var r=s(738);let o=0;function a(){o=0}function n(e,t){let s=[];if(!e||!e.hasChildNodes())return;let r=e.children;for(let e=0;e<r.length;e++){let o;o="script"===r.item(e).nodeName.toLowerCase()?i(r.item(e)):r.item(e).cloneNode(!0),t.appendChild(o),s.push(o)}return s}function i(e){let t=document.createElement("script"),s=e.attributes;for(let e=0;e<s.length;e++)t.setAttribute(s[e].name,s[e].textContent),"src"===s[e].name.toLowerCase()&&(o++,t.onload=()=>{o--});return t.innerHTML=e.innerHTML,t}function l(){let e=r.setInterval((()=>{0===o&&(r.clearInterval(e),r.hasOwnProperty("HTMLWidgets")&&r.HTMLWidgets.staticRender&&r.HTMLWidgets.staticRender())}),100)}},50:(e,t,s)=>{s.d(t,{Jx:()=>o});var r=s(554).U;class o extends r{constructor(){super(...arguments),this.mySettingsAxes=new n,this.BarSettings=new i,this.LowerColumnValue1Format=new l,this.LowerColumnValue2Format=new c,this.LowerColumnValue3Format=new u,this.LowerColumnValue4Format=new h,this.LowerColumnValue5Format=new d,this.UpperColumnValue1Format=new m,this.UpperColumnValue2Format=new p,this.UpperColumnValue3Format=new b,this.UpperColumnValue4Format=new y,this.UpperColumnValue5Format=new g,this.rcv_script=new a}}class a{}class n{constructor(){this.x_axis_title="Nothing at the moment",this.y_axis_title="Nothing at the moment"}}class i{constructor(){this.colLabel="grey",this.textSize=10,this.LBarSize=.6,this.UBarSize=.35}}class l{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class c{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class u{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class h{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class d{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class m{constructor(){this.colLabel="#FF0000",this.textLabel=!1,this.labelPlace="none"}}class p{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class b{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class y{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}class g{constructor(){this.colLabel="grey",this.textLabel=!1,this.labelPlace="none"}}},728:(e,t,s)=>{s.d(t,{u:()=>l});var r,o=s(50),a=s(934),n=s(738);!function(e){e[e.Data=2]="Data",e[e.Resize=4]="Resize",e[e.ViewMode=8]="ViewMode",e[e.Style=16]="Style",e[e.ResizeEnd=32]="ResizeEnd",e[e.All=62]="All"}(r||(r={}));const i=[r.Resize,r.ResizeEnd,r.Resize+r.ResizeEnd];class l{constructor(e){e&&e.element&&(this.rootElement=e.element),this.headNodes=[],this.bodyNodes=[]}update(e){if(!(e&&e.type&&e.viewport&&e.dataViews&&0!==e.dataViews.length&&e.dataViews[0]))return;const t=e.dataViews[0];this.settings=l.parseSettings(t);let s=null;t.scriptResult&&t.scriptResult.payloadBase64&&(s=t.scriptResult.payloadBase64),-1===i.indexOf(e.type)?s&&this.injectCodeFromPayload(s):this.onResizing(e.viewport)}onResizing(e){}injectCodeFromPayload(e){if((0,a.Tx)(),!e)return;let t=document.createElement("html");try{t.innerHTML=n.atob(e)}catch(e){return}if(0===this.headNodes.length){for(;this.headNodes.length>0;){let e=this.headNodes.pop();document.head.removeChild(e)}let e=t.getElementsByTagName("head");if(e&&e.length>0){let t=e[0];this.headNodes=(0,a.Kq)(t,document.head)}}for(;this.bodyNodes.length>0;){let e=this.bodyNodes.pop();this.rootElement.removeChild(e)}let s=t.getElementsByTagName("body");if(s&&s.length>0){let e=s[0];this.bodyNodes=(0,a.Kq)(e,this.rootElement)}(0,a.ME)()}static parseSettings(e){return o.Jx.parse(e)}enumerateObjectInstances(e){return o.Jx.enumerateObjectInstances(this.settings||o.Jx.getDefault(),e)}}},567:(e,t,s)=>{function r(e,t,s){if(!e)return s;let r=e[t];return void 0===r?s:r}s.d(t,{N:()=>r})},982:(e,t,s)=>{s.d(t,{d9:()=>o});var r=s(567);function o(e,t,s){const o=function(e,t,s){return e?r.N(e[t.objectName],t.propertyName,s):s}(e,t,s);return o&&o.solid?o.solid.color:null==o||"object"==typeof o&&!o.solid?s:o}},554:(e,t,s)=>{s.d(t,{U:()=>o});var r=s(982);class o{static getDefault(){return new this}static createPropertyIdentifier(e,t){return{objectName:e,propertyName:t}}static parse(e){let t,s=this.getDefault();if(!e||!e.metadata||!e.metadata.objects)return s;t=s.getProperties();for(let o in t)for(let a in t[o]){const n=s[o][a];s[o][a]=r.d9(e.metadata.objects,t[o][a],n)}return s}static isPropertyEnumerable(e){return!o.InnumerablePropertyPrefix.test(e)}static enumerateObjectInstances(e,t){let s=e&&e[t.objectName];if(!s)return[];let r={objectName:t.objectName,selector:null,properties:{}};for(let e in s)s.hasOwnProperty(e)&&(r.properties[e]=s[e]);return{instances:[r]}}getProperties(){let e={};return Object.keys(this).forEach((t=>{if(o.isPropertyEnumerable(t)){let s=Object.keys(this[t]);e[t]={},s.forEach((s=>{o.isPropertyEnumerable(t)&&(e[t][s]=o.createPropertyIdentifier(t,s))}))}})),e}}o.InnumerablePropertyPrefix=/^_/},738:e=>{e.exports=Function("return this")()}},t={};function s(r){var o=t[r];if(void 0!==o)return o.exports;var a=t[r]={exports:{}};return e[r](a,a.exports,s),a.exports}s.d=(e,t)=>{for(var r in t)s.o(t,r)&&!s.o(e,r)&&Object.defineProperty(e,r,{enumerable:!0,get:t[r]})},s.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),s.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var r={};(()=>{s.r(r),s.d(r,{default:()=>a});var e=s(728),t=s(738).powerbi,o={name:"demoCreation522AEF1866B94124B4C4F588A968843A",displayName:"Overlayering Stacked Column chart",class:"Visual",apiVersion:"3.8.0",create:t=>{if(e.u)return new e.u(t);throw"Visual instance not found"},createModalDialog:(e,t,s)=>{const r=globalThis.dialogRegistry;e in r&&new r[e](t,s)},custom:!0};void 0!==t&&(t.visuals=t.visuals||{},t.visuals.plugins=t.visuals.plugins||{},t.visuals.plugins.demoCreation522AEF1866B94124B4C4F588A968843A=o);const a=o})(),demoCreation522AEF1866B94124B4C4F588A968843A=r})();