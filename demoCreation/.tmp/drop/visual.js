var demoCreation522AEF1866B94124B4C4F588A968843A;(()=>{"use strict";var e={934:(e,t,s)=>{s.d(t,{Kq:()=>o,ME:()=>l,Tx:()=>r});var i=s(738);let a=0;function r(){a=0}function o(e,t){let s=[];if(!e||!e.hasChildNodes())return;let i=e.children;for(let e=0;e<i.length;e++){let a;a="script"===i.item(e).nodeName.toLowerCase()?n(i.item(e)):i.item(e).cloneNode(!0),t.appendChild(a),s.push(a)}return s}function n(e){let t=document.createElement("script"),s=e.attributes;for(let e=0;e<s.length;e++)t.setAttribute(s[e].name,s[e].textContent),"src"===s[e].name.toLowerCase()&&(a++,t.onload=()=>{a--});return t.innerHTML=e.innerHTML,t}function l(){let e=i.setInterval((()=>{0===a&&(i.clearInterval(e),i.hasOwnProperty("HTMLWidgets")&&i.HTMLWidgets.staticRender&&i.HTMLWidgets.staticRender())}),100)}},50:(e,t,s)=>{s.d(t,{Jx:()=>a});var i=s(554).U;class a extends i{constructor(){super(...arguments),this.GeneralPlot=new o,this.mySettingsAxes=new n,this.BarSettings=new l,this.LegendSettings=new c,this.SmallMultiSettings=new h,this.LowerColumnValue1Format=new u,this.LowerColumnValue2Format=new d,this.LowerColumnValue3Format=new m,this.LowerColumnValue4Format=new p,this.LowerColumnValue5Format=new b,this.UpperColumnValue1Format=new f,this.UpperColumnValue2Format=new g,this.UpperColumnValue3Format=new y,this.UpperColumnValue4Format=new x,this.UpperColumnValue5Format=new w,this.rcv_script=new r}}class r{}class o{constructor(){this.colBack="#FFFFFF",this.colGrid="#F1F2F3"}}class n{constructor(){this.colLabel="#FFFFFF",this.x_axis_title="",this.x_axis_titleTextSize=10,this.x_axis_textSize=8,this.x_axis_textRotate="0",this.y_axis_title="",this.y_axis_titleTextSize=10,this.y_axis_textSize=8}}class l{constructor(){this.colLabel="grey",this.unitLabel="auto",this.decimal="0",this.textSize="12",this.LBarSize="0.6",this.UBarSize="0.35"}}class c{constructor(){this.Orientation="h",this.textSize="8",this.legendTitle="",this.legendTitleSize="12"}}class h{constructor(){this.numCol=2}}class u{constructor(){this.Name="",this.colLabel="#43384a",this.textLabel=!1,this.labelPlace="none"}}class d{constructor(){this.Name="",this.colLabel="#59786c",this.textLabel=!1,this.labelPlace="none"}}class m{constructor(){this.Name="",this.colLabel="#82231c",this.textLabel=!1,this.labelPlace="none"}}class p{constructor(){this.Name="",this.colLabel="#511536",this.textLabel=!1,this.labelPlace="none"}}class b{constructor(){this.Name="",this.colLabel="#443e67",this.textLabel=!1,this.labelPlace="none"}}class f{constructor(){this.Name="",this.colLabel="#fed34c",this.textLabel=!1,this.labelPlace="none"}}class g{constructor(){this.Name="",this.colLabel="#f4d1c1",this.textLabel=!1,this.labelPlace="none"}}class y{constructor(){this.Name="",this.colLabel="#71AFE2",this.textLabel=!1,this.labelPlace="none"}}class x{constructor(){this.Name="",this.colLabel="#3d3c1d",this.textLabel=!1,this.labelPlace="none"}}class w{constructor(){this.Name="",this.colLabel="#625750",this.textLabel=!1,this.labelPlace="none"}}},728:(e,t,s)=>{s.d(t,{u:()=>l});var i,a=s(50),r=s(934),o=s(738);!function(e){e[e.Data=2]="Data",e[e.Resize=4]="Resize",e[e.ViewMode=8]="ViewMode",e[e.Style=16]="Style",e[e.ResizeEnd=32]="ResizeEnd",e[e.All=62]="All"}(i||(i={}));const n=[i.Resize,i.ResizeEnd,i.Resize+i.ResizeEnd];class l{constructor(e){e&&e.element&&(this.rootElement=e.element),this.headNodes=[],this.bodyNodes=[]}update(e){if(!(e&&e.type&&e.viewport&&e.dataViews&&0!==e.dataViews.length&&e.dataViews[0]))return;const t=e.dataViews[0];this.settings=l.parseSettings(t);let s=null;t.scriptResult&&t.scriptResult.payloadBase64&&(s=t.scriptResult.payloadBase64),-1===n.indexOf(e.type)?s&&this.injectCodeFromPayload(s):this.onResizing(e.viewport)}onResizing(e){}injectCodeFromPayload(e){if((0,r.Tx)(),!e)return;let t=document.createElement("html");try{t.innerHTML=o.atob(e)}catch(e){return}if(0===this.headNodes.length){for(;this.headNodes.length>0;){let e=this.headNodes.pop();document.head.removeChild(e)}let e=t.getElementsByTagName("head");if(e&&e.length>0){let t=e[0];this.headNodes=(0,r.Kq)(t,document.head)}}for(;this.bodyNodes.length>0;){let e=this.bodyNodes.pop();this.rootElement.removeChild(e)}let s=t.getElementsByTagName("body");if(s&&s.length>0){let e=s[0];this.bodyNodes=(0,r.Kq)(e,this.rootElement)}(0,r.ME)()}static parseSettings(e){return a.Jx.parse(e)}enumerateObjectInstances(e){return a.Jx.enumerateObjectInstances(this.settings||a.Jx.getDefault(),e)}}},567:(e,t,s)=>{function i(e,t,s){if(!e)return s;let i=e[t];return void 0===i?s:i}s.d(t,{N:()=>i})},982:(e,t,s)=>{s.d(t,{d9:()=>a});var i=s(567);function a(e,t,s){const a=function(e,t,s){return e?i.N(e[t.objectName],t.propertyName,s):s}(e,t,s);return a&&a.solid?a.solid.color:null==a||"object"==typeof a&&!a.solid?s:a}},554:(e,t,s)=>{s.d(t,{U:()=>a});var i=s(982);class a{static getDefault(){return new this}static createPropertyIdentifier(e,t){return{objectName:e,propertyName:t}}static parse(e){let t,s=this.getDefault();if(!e||!e.metadata||!e.metadata.objects)return s;t=s.getProperties();for(let a in t)for(let r in t[a]){const o=s[a][r];s[a][r]=i.d9(e.metadata.objects,t[a][r],o)}return s}static isPropertyEnumerable(e){return!a.InnumerablePropertyPrefix.test(e)}static enumerateObjectInstances(e,t){let s=e&&e[t.objectName];if(!s)return[];let i={objectName:t.objectName,selector:null,properties:{}};for(let e in s)s.hasOwnProperty(e)&&(i.properties[e]=s[e]);return{instances:[i]}}getProperties(){let e={};return Object.keys(this).forEach((t=>{if(a.isPropertyEnumerable(t)){let s=Object.keys(this[t]);e[t]={},s.forEach((s=>{a.isPropertyEnumerable(t)&&(e[t][s]=a.createPropertyIdentifier(t,s))}))}})),e}}a.InnumerablePropertyPrefix=/^_/},738:e=>{e.exports=Function("return this")()}},t={};function s(i){var a=t[i];if(void 0!==a)return a.exports;var r=t[i]={exports:{}};return e[i](r,r.exports,s),r.exports}s.d=(e,t)=>{for(var i in t)s.o(t,i)&&!s.o(e,i)&&Object.defineProperty(e,i,{enumerable:!0,get:t[i]})},s.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),s.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var i={};(()=>{s.r(i),s.d(i,{default:()=>r});var e=s(728),t=s(738).powerbi,a={name:"demoCreation522AEF1866B94124B4C4F588A968843A",displayName:"Overlayering Stacked Column chart",class:"Visual",apiVersion:"3.8.0",create:t=>{if(e.u)return new e.u(t);throw"Visual instance not found"},createModalDialog:(e,t,s)=>{const i=globalThis.dialogRegistry;e in i&&new i[e](t,s)},custom:!0};void 0!==t&&(t.visuals=t.visuals||{},t.visuals.plugins=t.visuals.plugins||{},t.visuals.plugins.demoCreation522AEF1866B94124B4C4F588A968843A=a);const r=a})(),demoCreation522AEF1866B94124B4C4F588A968843A=i})();