/*
 * SYSUI-SYSTABLE
 * 2019-01-10 version2.0
 * 799129700@qq.com SYSHUXL-化海天堂 by www.husysui.com
 * Reserved head available commercial use
 * Universal background system interface framework
 */
function extend(o, n, override) {
	for(var key in n) {
		if(n.hasOwnProperty(key) && (!o.hasOwnProperty(key) || override)) {
			o[key] = n[key];
		}
	}
	return o;
};
//处理
function addLoadListener(fn) {
	if(typeof window.addEventListener != 'undefined') {
		window.addEventListener('load', fn, false);
	} else if(typeof document.addEventListener != 'undefined') {
		document.addEventListener('load', fn, false);
	} else if(typeof window.attachEvent != 'undefined') {
		window.attachEvent('onload', fn);
	} else {
		var oldfn = window.onload;
		if(typeof window.onload != 'function') {
			window.onload = fn;
		} else {
			window.onload = function() {
				oldfn();
				fn();
			};
		}
	}
};
//简化document.getElementById方法
function TAB$(i) {
	return document.getElementById(i)
};
//简化document.createElement方法
function TABLAYER$(i) {
	return document.createElement(i)
};
//简化document.getElementsByName方法
function name$(i) {
	return document.getElementsByName(i)
}

function tagname$(i) {
	return document.getElementsByTagName(i)
}
// 插件构造函数 - 返回数组结构
function SYSTableSorter(options) {
	this._initial(options);
};
SYSTableSorter.prototype = {
	constructor: this,
	_initial: function(options) {
		var par = {
			TableName: '', //table表格名称
			btnArea: '', //执行table外的按钮操作区域
			paginName: '', //设置分页区域
			edit: '', //编辑区
			curPage: 1, //默认显示当前页
			Sequence: [], //输入需要排序的位置排序
			RightClick: false, //是否允许右键
			template: true, //是否启用内置模块编辑
			btnpageing: 5, //用于显示分页列表按钮数量
			mode: 'table', //模式
			setItem: '', //存储表名
			loading: '<div class="loading"><div><img src="images/timg.gif" class="load-img"/></div>加载中请稍等</div>', //加载样式设置
			ErrorMessage: '操作失败，请稍后再试！', //错误提示信息
			SuccessPrompt: '操作成功！', //成功提示信息
			timeFormat: '', //时间格式
			pageSize: [10, 20, 30], //设置每页显示条数
			ViewState: [], //无需设置
			sessionArr: [], //无需设置
			Callback: function() {}, //回调table数据
			DeleteEvent: function() {}, //删除
			ModifyEvent: function() {}, //修改
			DetailedEvent: function() {}, //详细
			SaveEvent: function() {}, //保存提交事件
			CheckboxDeleteEvent: function() {}, //批量删除事件
			SearchEvent: function() {} //搜索事件
		};
		this.par = extend(par, options, true);
		//判断是否存在class属性方法
		this.hasClass = function(elements, cName) {
			return !!elements.className.match(new RegExp("(\\s|^)" + cName + "(\\s|$)"));
		}
		//添加class属性方法
		this.addClass = function(elements, cName) {
			if(!this.hasClass(elements, cName)) {
				elements.className += " " + cName;
			};
		};
		//删除class属性方法 elements当前结构  cName类名
		this.removeClass = function(elements, cName) {
			if(this.hasClass(elements, cName)) {
				elements.className = elements.className.replace(new RegExp("(\\s|^)" + cName + "(\\s|$)"), " "); // replace方法是替换
			};
		};
		//根据class类名条件筛选结构
		this.getByClass = function(oParent, sClass) { //根据class获取元素
			var oReasult = [];
			var oEle = oParent.getElementsByTagName("*");
			for(i = 0; i < oEle.length; i++) {
				if(oEle[i].className == sClass) {
					oReasult.push(oEle[i]);
				}
			};
			return oReasult;
		}
		this.show(this.par);
	},
	//方法
	show: function(callback) {
		var _this = this;
		var Table = TAB$(callback.TableName);
		var other = TAB$(callback.btnArea); //声明执行对象
		var mode = callback.mode;
		var args = callback.Sequence;
		if(mode == "table") {
			// 设置表头的状态位，排序时根据状态判断升降序 
			for(var x = 0; x < Table.rows[0].cells.length; x++) {
				callback.ViewState[x] = false;
			};
			if(args != null) {
				if(args.length > 1) {
					for(var x = 1; x < args.length; x++) {
						if(args[x] > Table.rows[0].cells.length) {
							continue;
						} else {
							var newDiv = TABLAYER$("em");
							_this.addClass(newDiv, 'NormalCss');
							Table.rows[0].cells[args[x]].appendChild(newDiv);
							Table.rows[0].cells[args[x]].onclick = function() {
								for(var m = 1; m < args.length; m++) {
									_this.onSequence(Table, args[m]);
								}
							};
							Table.rows[0].cells[args[x]].style.cursor = "pointer";
						}
					}
				}
			};
			//checkbox全选选择操作，表格列宽拖拽
			var tTD;
			for(var x = 0; x < Table.rows[0].cells.length; x++) {
				var checkbox = Table.rows[0].cells[x].getElementsByTagName('input')[x];
				checkbox ? Table.rows[0].cells[x].onclick = function(e) {
					for(var m = 0; m < Table.rows[0].cells.length; m++) {
						_this.oncheckbox(Table, m)
					}
				} : '';
				//表格拖拽
				Table.rows[0].cells[x].onmousedown = function(e) {
					_this.Dragdrop(e, Table, tTD, this);
				}
				Table.rows[0].cells[x].onmouseup = function(e) {
					_this.onmouseupDrop(e, Table, tTD, this);

				}
				Table.rows[0].cells[x].onmousemove = function(e) {
					_this.onmousemoveDrop(e, Table, tTD, this);
				}
			};
		}
		_this.callbackf(Table, _this, other);
		if(callback.RightClick == true) {
			document.oncontextmenu = function(e) {
				e.preventDefault();
				e.stopPropagation();
			}
		}; //禁用右键功能
		_this.sessionArrhtml(Table);
	},
	currentcheckbox: function(Table, index) {
		for(var x = 1; x < Table.rows.length; x++) {
			var checkbox = Table.rows[x].cells[0].getElementsByTagName('input')[0];
			checkbox ? Table.rows[x].cells[0].onclick = function() {
				for(var m = 1; m < Table.rows.length; m++) {
					index.onlikecheck(Table, m)
				}
			} : ''; //单选事件
		};
	},
	//回调table数据的方法
	callbackf: function(Table, obj, other) {
		var size = obj.par.pageSize;
		var pageSize = size[0];
		var curPage = obj.par.curPage;
		obj.par.Callback(Table, obj, curPage, pageSize);
		obj.ajaxObject(obj);
		obj.Selectedbtnmethod(other, Table, obj, curPage, pageSize);
	},
	//设置一个提示框，编辑提示框，texts为提示文本 ，time为显示时间秒单位
	PromptBox: function(texts, time, status) {
		var _this = this;
		var b = document.body.querySelector(".box_Bullet");
		if(!b) {
			var box = document.createElement("div");
			document.body.appendChild(box).className = "box_Bullet";
			var boxcss = document.querySelector(".box_Bullet");
			var winWidth = window.innerWidth;
			document.body.appendChild(box).innerHTML = texts;
			var wblank = winWidth - boxcss.offsetWidth;
			box.style.cssText = "width:" + boxcss.offsetWidth + "px" + "; left:" + (wblank / 2) + "px" + ";" +
				"margin-top:" + (-boxcss.offsetHeight / 2) + "px";

			var int = setInterval(function() {
				time--;
				_this.endclearInterval(time, box, int);
			}, 1000);

		} else if(status == true) {
			document.body.removeChild(b);
			return;
		}
	},
	endclearInterval: function(time, box, int) {
		time > 0 ? time-- : clearInterval(int);
		if(time == 0) {
			clearInterval(int);
			document.body.removeChild(box);
			return;
		}
	},
	//声明ajax方法.，用于判断浏览器是否支持ajax
	ajaxObject: function(obj) {
		var xmlHttp;
		try {
			// Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch(e) {
			// Internet Explorer
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e) {
					obj.PromptBox('您的浏览器不支持AJAX', 2, false);
					return false;
				}
			}
		}
		return xmlHttp;
	},
	//get请求
	ajaxGet: function(url, success, curPage, pageSize) {
		var _this = this;
		var template = _this.par.template;
		var start = 0,
			end = 0;
		var Table = TAB$(_this.par.TableName);
		var ajax = _this.ajaxObject();
		ajax.open("get", url, true);
		if(ajax) {
			_this.PromptBox(_this.par.loading, 0, true);
		}
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) {
				if(ajax.status == 200) {
					var json = ajax.responseText; //获取到json字符串，还需解析
					if(json == "202") {
						_this.PromptBox(_this.par.SuccessPrompt, 2, false);
						_this.par.Callback(Table, _this, curPage, pageSize); //执行回调的方法
						_this.PromptBox(_this.par.SuccessPrompt, 0, true);
						return;
					} else if(json == "101") {
						_this.PromptBox(_this.par.ErrorMessage, 2, false);
						_this.PromptBox(null, 0, true);
						return;
					} else {
						var jsonStr = JSON.parse(json); //将字符串转换为json数组
						if(template == true) {
							_this.contenthtml(Table, jsonStr, _this, curPage, pageSize);
						} else {
							success(jsonStr);
						}
						_this.PromptBox(null, 0, true);
						return;
					}
				} else {
					_this.PromptBox("HTTP请求错误！错误码：" + ajax.status, 2, false);
				}
			}
		};
		ajax.send();
	},
	//Post请求
	ajaxPost: function(url, data, evnet, layer) {
		var _this = this;
		var ajax = _this.ajaxObject();
		ajax.open("post", url, true);
		ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) {
				if(ajax.status == 200) {
					_this.statusname(ajax.responseText, _this, evnet, layer);
				} else {
					_this.PromptBox("HTTP请求错误！错误码：" + ajax.status, 2, false);
					return;
				}
			} else {
				return
			}
		}
		typeof(data) != "undefined" ? ajax.send(data): '';
	},
	//状态类型判断
	statusname: function(status, set, evnet, layer) {
		//判断是的保存按钮操作
		if(evnet.name == "SaveEvent") {
			if(status == "101") {
				set.PromptBox(set.par.ErrorMessage, 2, false);
			} else if(status == "202") {
				//保存信息返回修改后的信息，不刷新界面，需用户主动刷新，减少服务器请求，查看修改后的信息
				set.PromptBox(set.par.SuccessPrompt, 2);
				var edit = set.getByClass(layer.parentNode, 'table-edit');
				for(var i = 0; i < edit.length; i++) {
					var text = edit[i].getElementsByTagName("input")[0].value;
					var muster = _this.getByClass(edit[i], 'radio');
					if(muster != 0) {
						for(var c = 0; c < muster.length; c++) {
							var n = muster[c].getElementsByTagName("input")[0].getAttribute("data-name");
							if(muster[c].getElementsByTagName("input")[0].checked == true) {
								var text = n;
							}
						}
					}
					edit[i].innerHTML = text;
				}
				evnet.innerText = "修改";
				evnet.name = 'modifyEvent';
			}
		} else {
			if(status == "101") {
				set.PromptBox(set.par.ErrorMessage, 2, false);
			} else if(status == "202") {
				set.PromptBox(set.par.SuccessPrompt, 2, false);
			}
		}
	},
	//session存储html
	sessionArrhtml: function(Table) {
		_this = this;
		 var list,
		     edit = TAB$(_this.par.edit);
		edit?list = TAB$(_this.par.edit):list =Table.getElementsByTagName('tbody')[0];
		var rota = _this.par.setItem;
		var sessionArr = _this.par.sessionArr; //声明新的数组
		var obj = {html: list.innerHTML};
		sessionArr.push(obj);
		var html = JSON.stringify(sessionArr);
		window.sessionStorage.setItem(rota, html); //保存存储名为menu
	},
	//模版
	contenthtml: function(Table, jsonStr, _this, curPage, pageSize) {
		 var nameedit,
		     edit = TAB$(_this.par.edit);
		edit?nameedit = TAB$(_this.par.edit):nameedit =Table.getElementsByTagName('tbody')[0];
		var total = parseInt(jsonStr.total);
		var pageTotal = Math.ceil(total / pageSize);
		var rota = _this.par.setItem;
		var mode = _this.par.mode;
		var menu = JSON.parse(window.sessionStorage.getItem(rota));
		if(jsonStr.data != null) {
			var s = navigator.userAgent.toLowerCase();
            var BrowserInfo = {
                IsIE: /*@cc_on!@*/false,
                IsIE9Under: /*@cc_on!@*/false && (parseInt(s.match(/msie (\d+)/)[1], 10) <= 9),
            };
            if( BrowserInfo.IsIE9Under  ){
		        nameedit.appendChild = menu[0].html; //获取session存储的内容导入table表格中   
		    }else{
		        nameedit.innerHTML = menu[0].html; //获取session存储的内容导入table表格中
		    }
		    for(var i = 0; i< pageSize; i++) {
		    	 var number=jsonStr.data.length,
		    	     num;
		    	number <= pageSize?num =i:num = (curPage-1) * pageSize + i;
				var Array=jsonStr.data[num];
				if(Array){
					if(mode == "ul") {
					var rows = nameedit.getElementsByTagName("ul");
					var clonedNode = nameedit.children[i].cloneNode(true); // 克隆节点
					nameedit.appendChild(clonedNode); // 在父节点插入克隆的节点
					var tds = rows[i].getElementsByTagName("li");
					for(var x = 0; x < tds.length; x++) {
						var Child = tds[x];
						_this.stencil(nameedit, rows, jsonStr, tds.length, Array, i, Child, x);
					    }
					} else if(mode == "table") {
						var rows = nameedit.children;
						if(BrowserInfo.IsIE9Under){
							var clonedNode =rows[0].cloneNode(true); // 克隆节点
						    nameedit.appendChild(clonedNode);
							var cells =nameedit.rows[0].children;
							var tds =cells.length;
							for(var x = 0; x < tds; x++) {
							var Child = cells[x];
							_this.stencil(nameedit, rows, jsonStr, tds, Array, i, Child, x,BrowserInfo);
						}
						}else{
							var clonedNode = nameedit.rows[i].cloneNode(true); // 克隆节点
						    nameedit.appendChild(clonedNode); // 在父节点插入克隆的节点
						    var tds = nameedit.rows[i].cells.length;
						    for(var x = 0; x < tds; x++) {
							var Child = nameedit.rows[i].cells[x];
							_this.stencil(nameedit, rows, jsonStr, tds, Array, i, Child, x,BrowserInfo);
						    }
						}				
					}
					var a=1;//起始条数
				    var amount=a+i;//每循环一次加1，直到数据为空为止结束
				}
			}
			if(mode == "ul") {
				var Child = nameedit.children[amount];
				nameedit.removeChild(Child);
				if(amount != (nameedit.children.length)) {
					var ms = nameedit.children.length;
					for(var a = ms - 1; a >= amount; a--) {
						nameedit.children[a].remove();
					}
				}
			} else if(mode == "table") {
				var rows = nameedit.getElementsByTagName("tr");
				var Child = nameedit.rows[amount];//设置最后一条数据
				nameedit.removeChild(Child);//删除起始html样式
				if(amount != (nameedit.rows.length)) {
					var ms = nameedit.rows.length;
					for(var a = ms - 1; a >= amount; a--) {
						nameedit.rows[a].remove();
					}
				}
				_this.BtnoperationMethod(Table, _this, curPage, pageSize);
			}
		} else {
			if(mode == "ul") {
				nameedit.innerHTML = '<span class="prompt padding15">暂时还没有相关内容</span>';
			} else if(mode == "table") {
				var tds = nameedit.rows[0].cells.length;
				nameedit.innerHTML = '<td colspan="' + tds + '">暂时还没有相关内容</td>';
			}
		}
		_this.pageTableMethod(null, curPage, pageTotal, pageSize, total);
	},
	//获取内容模版方法
	stencil: function(nameedit, rows, jsonStr, tds, Array, i, Child, x,BrowserInfo) {
		var _this = this;
		var keyvalue = Child.getAttribute("data-value");
		var formatname = Child.getAttribute("data-format"); //格式
		var defaults = Child.getAttribute("data-default"); //格式
		var btn = Child.getAttribute("data-button"); //设置起始按钮
		if(formatname == 'time') {
			var format = _this.par.timeFormat;
			var dates = Array[keyvalue];
			var value = _this.formatDate(format, dates);
		} else if(formatname == 'checkbox') {
			var ArrayString = Child.getAttribute("data-Array");
			if(ArrayString) {
				var result = ArrayString.split(",");
				var newarr = []; //声明一个数组
				for(var n = 0; n < result.length; n++) {
					var newgroup = {
						id: n,
						cname: result[n]
					};
					newarr.push(newgroup); //从新整合数组 
				} //对数组进行判断	
				for(var c = 0; c < newarr.length; c++) {
					if(Array[keyvalue] == newarr[c].id) {
						var value = newarr[c].cname;
					} else {
						Child.innerHTML = "无";
					}
				};
			} else {
				var value = "<label class='checkbox radio'><input name='checkbox' data-name='checkbox'  type='checkbox' value='" + Array[keyvalue] + "' class='ace'><span class='lbl'></span></label>"
			}
		}else if(formatname=="img"){
			  var formatname = Child.getAttribute("data-Array"); //参数
			  var img="default_img.png";
			  var value='<img src="'+formatname + Array[keyvalue]+'" class="imgset" onerror="this.src='+"'"+formatname+img+"'"+',this.onerror=null "/>'
			  
		} else {
			var value = Array[keyvalue];
		}
		if(btn == "btn") {
			if(x == (tds - 1)) {
				if( BrowserInfo.IsIE9Under  ){
		            var s=nameedit.rows[0].children[tds - 1];
		         }else{
		            var s=nameedit.rows[i].cells[tds - 1];
		          }
				var btn = s.getElementsByTagName("button") || s.getElementsByTagName("a"); //获取按钮
				for(var b = 0; b < btn.length; b++) {
					var atr = document.createAttribute("data-id");
					atr.nodeValue = value;
					btn[b].setAttributeNode(atr);
				}
			}
		} else {
			if(keyvalue) {
				Array[keyvalue] ? Child.innerHTML = value : Child.innerHTML = "无";
			}
		}
	},
	//时间戳转换
	formatDate: function(format, date) {
		if(typeof date === "string") {
			var mts = date.match(/(\/Date(\d+)\/)/);
			if(mts && mts.length >= 3) {
				date = parseInt(mts[2]);
			}
		}
		date = new Date(parseInt(date * 1000));
		if(!date || date.toUTCString() == "Invalid Date") {
			return "";
		}
		var map = {
			"M": date.getMonth() + 1, //月份
			"d": date.getDate(), //日
			"h": date.getHours(), //小时
			"m": date.getMinutes(), //分
			"s": date.getSeconds(), //秒
			"q": Math.floor((date.getMonth() + 3) / 3), //季度
			"S": date.getMilliseconds() //毫秒
		};
		format = format.replace(/([yMdhmsqS])+/g, function(all, t) {
			var v = map[t];
			if(v !== undefined) {
				if(all.length > 1) {
					v = '0' + v;
					v = v.substr(v.length - 2);
				}
				return v;
			} else if(t === 'y') {
				return(date.getFullYear() + '').substr(4 - all.length);
			}
			return all;
		});
		return format;
	}, //时间转换
	// table以外层按钮操作方法
	Selectedbtnmethod: function(other, Table, obj, curPage, pageSize) {
		if(other) {
			var btn = other.getElementsByTagName("a") || other.getElementsByTagName("button");
			for(var i = 0; i < btn.length; i++) {
				btn[i].onclick = function(e) {
					var Table = TAB$(obj.par.TableName);
					if(this.name == "DeleteCheckbox") {
						//判断是否存在checkbox选中栏目，
						var checkbox = name$('checkbox');
						var trm = Table.rows.length;
						var batchDelete = "";
						for(var x = Table.rows.length - 1; x >= 1; x--) {
							if(checkbox[x].checked == true) {
								var id = checkbox[x].value;
								var keyname = checkbox[x].getAttribute("data-name");
								batchDelete += id + ",";
								var remove = checkbox[x].parentNode.parentNode.parentNode;
								var trm = Table.rows.length - 1;
							}
						};
						if(Table.rows.length == trm) {
							obj.PromptBox("请选择你要删除的信息！", 2, false);
						} else {
							batchDelete = batchDelete.substring(0, batchDelete.lastIndexOf(','));
							obj.par.CheckboxDeleteEvent(obj, batchDelete, curPage, pageSize);
						}
					} else if(this.name == "searchEvent") {
						//搜索方法操作
						var value = this.parentNode.getElementsByTagName('input')[0].value;
						if(value) {
							obj.par.SearchEvent(obj, value, curPage, pageSize);
						} else {
							obj.PromptBox("请输入查询关键字！", 2, false);
						}
					} else if(this.name == "RefreshEvent") {
						//执行刷新当前table数据请求					   
						obj.par.Callback(Table, obj, curPage, pageSize);
					} else if(this.name == "ExcelEvent") {
						var name = this.getAttribute("data-name"); //获表格名称
						var Table = obj.par.TableName; //指定导出区域
						//Excel导出功能
						var idTmr;
						var explorer = obj.BrowserSpot(explorer);
						if(explorer == "ie") {
							var oXL = new ActiveXObject("Excel.Application");
							var oWB = oXL.Workbooks.Add();
							var xlsheet = oWB.Worksheets(1);
							var sel = document.body.createTextRange();
							sel.moveToElementText(Table);
							sel.select();
							sel.execCommand("Copy");
							xlsheet.Paste();
							oXL.Visible = true;
							try {
								var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
							} catch(e) {
								print("Nested catch caught " + e);
							} finally {
								oWB.SaveAs(fname);
								oWB.Close(savechanges = false);
								oXL.Quit();
								oXL = null;
								idTmr = window.setInterval(obj.Cleanup(), 1);
							}
						} else {
							obj.tableToExcel(Table, name, obj);
						}
					}
				};
			};
		}
	},
	/**
	 * 设置拷贝需要下载的table表格，对拷贝的表格进行操作，然后下载修改的table表格
	 * 主要删除操作的内容区，只保留数据显示的区域，以使表格整洁，不影响显示区表格的样式
	 */
	ExcelHTML: function(html) {
		var _table = this;
		var list = TAB$(_table.par.TableName);
		var newtable;
		newtable = TABLAYER$('table');
		newtable.id = 'Newtable';
		document.body.appendChild(newtable);
		newtable.style.cssText = "display:none;";
		var copy = list.innerHTML;
		newtable.innerHTML = copy; //拷贝样式内容到新的table中
		for(var x = 1; x < newtable.rows.length; x++) {
			var z = newtable.rows[x].cells.length;
			newtable.rows[x].cells[z - 1].remove();
			newtable.rows[x].cells[0].remove();
		}
		var z = newtable.rows[0].cells.length;
		newtable.rows[0].cells[z - 1].remove();
		newtable.rows[0].cells[0].remove();
		var html = newtable.innerHTML;
		return html; //对新拷贝的表格进行处理获取内容
	},
	tableToExcel: function(table, name, obj) {
		var html = obj.ExcelHTML(html);
		var uri = 'data:application/vnd.ms-excel;base64,',
			         template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"' +                   'xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'                   + '<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>'                   + '</x:ExcelWorkbook></xml><![endif]-->' +                   ' <style type="text/css">' +                   '.table{' +                   ' border-collapse:collapse;' +                   ' border:thin solid #999; ' +                   '}' +                   '.table_striped thead th{' +                  'color: #707070;' +
			' background: #f2f2f2;' +
			'background-image: -webkit-gradient(linear,left 0,left 100%,from(#f8f8f8),to(#ececec));' +
			'background-image: -webkit-linear-gradient(top,#f8f8f8,0%,#ececec,100%);' +
			'background-image: -moz-linear-gradient(top,#f8f8f8 0,#ececec 100%);' +
			'background-image: linear-gradient(to bottom,#f8f8f8 0,#ececec 100%);' +
			'background-repeat: repeat-x;' +
			'filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#fff8f8f8",endColorstr="#ffececec",GradientType=0);' +                   ' }' +                   ' .table td{' +                   '  border:thin solid #999;' +                   '  padding:2px 5px;' +                   '  text-align: center;' +                   ' }</style>' +                   '</head><body ><table class="gallery table table_list table_striped table-bordered border">{table}</table></body></html>',
			base64 = function(s) {
				return window.btoa(unescape(encodeURIComponent(s)))
			},
			format = function(s, c) {
				return s.replace(/{(\w+)}/g, function(m, p) {
					return c[p];
				})
			}
		if(!table.nodeType) table = document.getElementById(table)
		var ctx = {
			worksheet: name || 'Worksheet',
			table: html
		}
		window.location.href = uri + base64(format(template, ctx));
		TAB$("Newtable").remove();
	},
	Cleanup: function() {
		window.clearInterval(idTmr);
		CollectGarbage();
	},
	BrowserSpot: function(explorer) {
		var explorer = window.navigator.userAgent;
		//ie
		if(explorer.indexOf("MSIE") >= 0) {
			return 'ie';
		}
		//firefox
		else if(explorer.indexOf("Firefox") >= 0) {
			return 'Firefox';
		}
		//Chrome
		else if(explorer.indexOf("Chrome") >= 0) {
			return 'Chrome';
		}
		//Opera
		else if(explorer.indexOf("Opera") >= 0) {
			return 'Opera';
		}
		//Safari
		else if(explorer.indexOf("Safari") >= 0) {
			return 'Safari';
		}
		return explorer;
	},
	//按钮操作事件方法
	BtnoperationMethod: function(Table, obj, curPage, pageSize) {
		for(var x = 1; x < Table.rows.length; x++) {
			for(var c = 1; c < Table.rows[x].cells.length; c++) {
				var btn = Table.rows[x].cells[c].getElementsByTagName("button") || Table.rows[x].cells[c].getElementsByTagName(
					"a"); //获取按钮
				Table.rows[x].cells[c].onclick = function(e) {
					var evt = e || window.event;
					var tar = evt.target || evt.srcElement;
					if(tar.tagName.toLowerCase() == "button" || tar.tagName.toLowerCase() == "a") {
						var name = tar.name;
						var id = tar.getAttribute("data-id");
						addLoadListener(obj.btnclick);
						obj.btnclick(Table, id, this, name, tar, curPage, pageSize);
					}
				}
			}
		}
	},
	//执行事件方法
	btnclick: function(Table, id, obj, name, e, curPage, pageSize) {
		var _this = this;
		if(name == 'deleteEvent') {
			_this.par.DeleteEvent(obj, _this, id, curPage, pageSize); //删除操作	
			return;
		} else if(name == 'modifyEvent') {
			_this.ModifyMethod(Table, id, obj, name, e);
			_this.par.ModifyEvent(obj, _this, id); //修改操作
			return;
		} else if(name == 'detailedEvent') {
			_this.par.DetailedEvent(obj, _this, id); //详细操作
			return;
		} else if(name == 'SaveEvent') {
			_this.SaveMethod(Table, id, obj, _this, e);
		}
	},
	//执行修改信息操作方法
	ModifyMethod: function(Table, id, obj, name, e) {
		var _this = this; //声明调用数组集合
		var edit = _this.getByClass(obj.parentNode, 'table-edit');
		if(edit != 0) {
			for(var i = 0; i < edit.length; i++) {
				var keyvalue = edit[i].getAttribute("data-value");
				var keyname = edit[i].getAttribute("data-name");
				var ArrayString = edit[i].getAttribute("data-Array");
				var text = edit[i].innerText;
				if(keyname == "checkbox") {
					edit[i].innerHTML = ""; //清除内容
					var result = ArrayString.split(",");
					var newarr = []; //声明一个数组
					for(var n = 0; n < result.length; n++) {
						var newgroup = {
							id: n,
							name: result[n]
						};
						newarr.push(newgroup); //从新整合数组 
					} //对数组进行判断
					for(var c = 0; c < newarr.length; c++) {
						if(text == newarr[c].name) {
							edit[i].innerHTML += "<label class='radio'><input name='" + keyvalue +
								"' type='radio' checked='checked' data-name='" + newarr[c].name + "' value='" + c + "' class='ace'><span class='lbl'>" + newarr[c].name +
								"</span></label>"
						} else {
							edit[i].innerHTML += "<label class='radio'><input name='" + keyvalue + "' data-name='" + newarr[c].name + "'  type='radio' value='" + c +
								"' class='ace'><span class='lbl'>" + newarr[c].name + "</span></label>"
						}
					}
				} else {
					edit[i].innerHTML = "<input type='text' class='edit-text' value='" + text + "' name='" + keyvalue + "' />";
				}
			}
			e.innerText = "保存";
			e.name = 'SaveEvent';
		} else {
			_this.PromptBox("抱歉，不支持直接修改信息，请点击详细进行操作", 2, false);
		}
	},
	//执行保存的事件方法
	SaveMethod: function(Table, id, obj, _this, e) {
		var formData = "";
		var m = obj.parentNode.getElementsByTagName('td');
		for(var i = 0; i < m.length; i++) {
			var edit = _this.hasClass(m[i], 'table-edit');
			if(edit) {
				var keyvalue = m[i].getAttribute("data-value");
				var keyname = m[i].getElementsByTagName("input")[0].name;
				var muster = _this.getByClass(m[i], 'radio');
				if(muster != 0) {
					for(var c = 0; c < muster.length; c++) {
						var checkedname = name$(keyvalue)[c];
						if(checkedname.checked == true) {
							var text = name$(keyvalue)[c].value;
						}
					}
				} else {
					var text = m[i].getElementsByTagName("input")[0].value;
				}
				formData += keyname + "=" + text + "&";
				if(text == "") {
					_this.PromptBox("修改信息内容不能为空", 2, false);
					return false;
				}
			}
		}
		_this.par.SaveEvent(obj, _this, id, formData, e); //保存操作
	},
	//分页table
	pageTableMethod: function(html, curPage, pageTotal, pageSize, total) {
		var that = this;
		var Table = TAB$(that.par.TableName);
		var amount = that.par.btnpageing;
		var pagination = TAB$(that.par.paginName);
		pageTotal == 0 ? pageTotal = 1 : ''; //默认数据为0时执行该方法
		if(pagination) {
			//分页
			var number = name$('page-number')[0];
			if(number) {
				var ul = number.parentNode;
				var pag = [];
				var modern = [];
				var pagset = [];
				var number = name$('page-number');
				var sets = that.par.pageSize;
				for(var i = 0; i < number.length; i++) {
					var pages = parseInt(number[i].getAttribute("data-pages"));
					modern.push(pages);
				}
				if(curPage < pageSize) {
					var ellipsis = number[0].parentNode.getElementsByTagName('span')[0];
					var jh = Math.min(pageSize, pageTotal);
					while(jh) {
						pag.unshift(jh--);
					}
					for(var s = 0; s < sets.length; s++) {
						var current;
						total == 0 ? current = 1 : current = 0;
						set = Math.ceil((total + current) / sets[s]);
						if(pageTotal <= set) {
							ellipsis ? ellipsis.remove() : '';
							for(var i = number.length - 1; i >= 0; i--) {
								pag[i] != modern[i] ? number[i].remove() : '';
							}
							var next = name$('Next-page')[0];
							that.nextPage(ul, curPage, pageTotal, html, next);
						}
					}
					for(var i = 0; i < pag.length; i++) {
						if(number.length <= amount) {
							if(pag[i] == modern[i]) {
								number[i].setAttribute("data-pages", pag[i]);
								number[i].innerHTML = pag[i];
								var ys = parseInt(number[i].innerHTML);
								if(ys == curPage) {
									that.addClass(number[i], 'active');
								} else {
									that.removeClass(number[i], 'active');
								}
							} else {
								var li = TABLAYER$('li');
								var atr = document.createAttribute("name");
								atr.nodeValue = "page-number";
								li.setAttributeNode(atr);
								var pages = document.createAttribute("data-pages");
								pages.nodeValue = pag[i];
								li.setAttributeNode(pages);
								li.innerHTML = pag[i];
								number[0].parentNode.appendChild(li);
							}
						} else {
							number[i].setAttribute("data-pages", pag[i]);
							number[i].innerHTML = pag[i];
							var ys = parseInt(number[i].innerHTML);
							if(ys == curPage) {
								that.addClass(number[i], 'active');
							} else {
								that.removeClass(number[i], 'active');
							}
						}
					}
					if(number.length >= amount) {
						if(!ellipsis) {
							var span = TABLAYER$('span');
							that.addClass(span, 'ellipsis');
							span.innerHTML = '...';
							number[0].parentNode.appendChild(span);
							var next = TABLAYER$('li');
							var atr = document.createAttribute("name");
							atr.nodeValue = "page-number";
							next.setAttributeNode(atr);
							var pages = document.createAttribute("data-pages");
							pages.nodeValue = pageTotal;
							next.setAttributeNode(pages);
							next.innerHTML = pageTotal;
							that.removeClass(next, 'pages');
							that.addClass(next, 'mantissa');
							number[0].parentNode.appendChild(next);
						}
					}
					//对相同页面进行比，并删除其中一个相同值样式
					for(var i = 0; i < number.length - 1; i++) {
						var size = number[i].getAttribute('data-pages');
						for(var j = i + 1; j < number.length; j++) {
							var contrast = number[j].getAttribute('data-pages');
							if(size == contrast) {
								number[i].remove();
							}
						}
					}
				} else {
					if(pageTotal - curPage > 1) {
						var middle = (curPage - 1) - Math.floor(pageSize / 2),
							//从哪里开始
							i = pageSize;
						if(middle > pageTotal - pageSize) {
							middle = pageTotal - pageSize + 1;
						}
						while(i--) {
							pag.push(middle++);
						}
						for(var i = 0; i < number.length - 1; i++) {
							var ellipsis = number[i].parentNode.getElementsByTagName('span')[0];
							ellipsis ? ellipsis.remove() : '';
							var pages = parseInt(number[i].getAttribute("data-pages"));
							number[i].setAttribute("data-pages", pag[i]);
							number[i].innerHTML = pag[i];
							var ys = parseInt(number[i].innerHTML);
							if(ys == curPage) {
								that.addClass(number[i], 'active');
							} else {
								that.removeClass(number[i], 'active');
							}
						}
					} else {
						return;
					}
				}
			} else {
				that.firstPage(ul, curPage, html, pageTotal, pagination, pageSize); //首页
				that.lastPage(ul, curPage, html, null, pagination, pageSize); //上一页
				var ul = pagination.appendChild(TABLAYER$('ul'));
				that.addClass(ul, 'Page-library');
				for(var p = 0; p < pageTotal; p++) {
					var li = TABLAYER$('li');
					var atr = document.createAttribute("name");
					atr.nodeValue = "page-number";
					li.setAttributeNode(atr);
					if(p == curPage - 1) {
						li.className += ' active';
					} else {
						that.addClass(li, 'pages');
						that.getPage(curPage);
					}
					li.innerHTML = p + 1;
					var pages = document.createAttribute("data-pages");
					pages.nodeValue = p + 1;
					li.setAttributeNode(pages);
					ul.appendChild(li);
				};
				var number = name$('page-number');
				for(var i = 0; i < number.length; i++) {
					for(var e = amount; e < number.length; e++) {
						if(number.length == pageTotal) {
							var span = TABLAYER$('span');
							that.addClass(span, 'ellipsis');
							span.innerHTML = '...';
							ul.appendChild(span);
						}
						number[e].remove();
						li.innerHTML = pageTotal;
						that.removeClass(li, 'pages');
						that.addClass(li, 'mantissa');
						ul.appendChild(li);
					}
				};
				//调用下一页
				that.nextPage(ul, curPage, pageTotal, html);
				//调用尾页
				that.finalPage(ul, curPage, pageTotal, html);
			}
			//是否显示总页数,每页个数,数据
			that.showPageTotal(ul, curPage, pageTotal, total, Table);
			//根据点击的页数分页
			for(var i = 0; i < number.length; i++) {
				if(number) {
					number[i].index = i;
					addLoadListener(that.pageonclick(number[i], number, number.parentNode, number[i], curPage, pageTotal, pageSize, that, html, Table));
				}
			}
		}
	},
	//分页点击
	pageonclick: function(event, number, ul, li, curPage, pageTotal, pageSize, obj, html, Table) {
		event.onclick = function(e) {
			for(var n = 0; n < number.length; n++) {
				var classname = obj.hasClass(li, 'mantissa');
				if(classname) {
					var u = parseInt(li.getAttribute("data-pages"));
				}
				index = e.target.index;
				var curPage = parseInt(number[index].getAttribute("data-pages"));
				var ym = parseInt(number[n].getAttribute("data-pages"));
				if(ym == curPage) {
					obj.addClass(number[n], 'active');
				} else {
					obj.removeClass(number[n], 'active');
				}
				if(u - curPage > 1) {
					obj.getPages(ul, curPage, pageTotal, pageSize);
				}
			}
			obj.par.Callback(Table, obj, curPage, pageSize); //执行回调的方法
			var Pre = name$('Pre-page')[0]; //设置
			obj.lastPage(ul, curPage, html, Pre); //上一页
			var next = name$('Next-page')[0];
			obj.nextPage(ul, curPage, pageTotal, html, next); //上一页
		}
	},
	//当前页码数的方法
	getPage: function(page) {
		//暂无
	},
	//首页的方法
	firstPage: function(ul, curPage, html, pageTotal, pagination) {
		var that = this;
		var Table = TAB$(that.par.TableName);
		var span = TABLAYER$('span');
		var size = that.par.pageSize;
		var pageSize = size[0];
		span.innerHTML = '首页';
		pagination.appendChild(span);
		span.onclick = function() {
			var val = parseInt(1);
			curPage = val;
			that.getPage(that.curPage);
			that.par.Callback(Table, that, curPage, pageSize);
			that.addClass(span, 'active');
			var last = name$('last-page')[0]; //设置
			that.removeClass(last, 'active');
			var Pre = name$('Pre-page')[0]; //设置
			that.lastPage(ul, curPage, html, Pre); //上一页
			var next = name$('Next-page')[0];
			that.nextPage(ul, curPage, pageTotal, html, next); //下一页
		};
		var atr = document.createAttribute("name");
		atr.nodeValue = "home-page";
		pagination.setAttributeNode(atr);
	},
	//上一页的方法+
	lastPage: function(ul, curPage, html, obj, pagination) {
		var that = this;
		var size = that.par.pageSize;
		var pageSize = size[0];
		var Table = TAB$(that.par.TableName);
		var number = name$('page-number');
		var span = TABLAYER$('span');
		if(!obj) {
			span.innerHTML = '<';
			if(parseInt(curPage) == 1) {
				span.className = 'disabled';
			}
			var atr = document.createAttribute("name");
			atr.nodeValue = "Pre-page";
			span.setAttributeNode(atr);
			pagination.appendChild(span);
		} else {
			if(parseInt(curPage) > 1) {
				obj.onclick = function() {
					curPage = parseInt(curPage - 1);
					if(curPage > 0) {
						that.par.Callback(Table, that, curPage, pageSize);
						that.getPage(that.curPage);
					}
					if(curPage == 1) {
						that.addClass(obj, 'disabled');
					}
				}
				that.removeClass(obj, 'disabled');
			} else {
				for(var i = 0; i < number.length; i++) {
					var lastm = parseInt(number[i].getAttribute("data-pages"));
					if(curPage != lastm) {
						that.removeClass(number[i], 'active');
					}
				}
				that.addClass(obj, 'disabled');
			}
		}
	},
	//分页判断方法
	getPages: function(ul, curPage, pageTotal, pageSize) {
		var pag = [];
		var that = this;
		if(curPage <= pageTotal) {
			if(curPage < pageSize) {
				//当前页数小于显示条数
				var i = Math.min(pageSize, pageTotal);
				while(i) {
					pag.unshift(i--);
				}
			} else {
				//当前页数大于显示条数
				var middle = curPage - Math.floor(pageSize / 2),
					//从哪里开始
					i = pageSize;
				if(middle > pageTotal - pageSize) {
					middle = pageTotal - pageSize + 1;
				}
				while(i--) {
					pag.push(middle++);
				}
			}
		} else {
			that.PromptBox("当前页数不能大于总页数", 2);
		}
		if(!pageSize) {
			that.PromptBox("显示页数不能为空或者0", 2);
		}
		return pag;
	},
	Pagination: function(ul, pag, pageTotal, that) {
		var number = name$('page-number');
		var pagination = TAB$(that.par.paginName);
		for(var i = 0; i < number.length - 1; i++) {
			var li = TABLAYER$('li');
			number[i].innerHTML = pag[i];
			ul.appendChild(li);
			var m = pageTotal - 1;
			if(pag[i] == m) {}
		}
	},
	//下一页方法
	nextPage: function(ul, curPage, pageTotal, html, obj) {
		var that = this;
		var Table = TAB$(that.par.TableName);
		var span = TABLAYER$('span');
		var number = name$('page-number');
		var size = that.par.pageSize;
		var pageSize = size[0];
		if(!obj) {
			span.innerHTML = '>';
			if(parseInt(curPage) < parseInt(pageTotal)) {
				span.onclick = function() {
					for(var i = 0; i < number.length - 1; i++) {
						var active = that.hasClass(number[i], 'active');
						if(active) {
							var curPage = parseInt(number[i].getAttribute("data-pages"));
						}
					}
					curPage = parseInt(curPage + 1);
					if(curPage >= pageTotal - 1) {
						span.className = 'disabled';
					} else {
						that.par.Callback(Table, that, curPage, pageSize);
						that.getPage(that.curPage);
						var Pre = name$('Pre-page')[0];
						that.removeClass(Pre, 'disabled');
					}
				};
			} else {
				span.className = 'disabled';
			}
			var atr = document.createAttribute("name");
			atr.nodeValue = "Next-page";
			span.setAttributeNode(atr);
			ul.parentNode.appendChild(span);
		} else {
			if(parseInt(curPage + 1) <= parseInt(pageTotal)) {
				that.removeClass(obj, 'disabled');

			} else {
				for(var i = 0; i < number.length; i++) {
					var lastm = parseInt(number[i].getAttribute("data-pages"));
					if(curPage == lastm) {
						that.addClass(number[i], 'active');
					}
				}
				that.addClass(obj, 'disabled');
			}
		}
	},
	//是否显示总页数,每页个数,数据
	showPageTotal: function(ul, curPage, pageTotal, total, Table) {
		var that = this;
		var totalPage = that.getByClass(ul.parentNode, 'totalPage');
		if(totalPage == 0) {
			var span1 = TABLAYER$('span');
			span1.innerHTML = '每页：<select class="select-page" name="SelectPage"></select> 条';
			span1.className = 'select-page';
			ul.parentNode.appendChild(span1);
			var span2 = TABLAYER$('span');
			span2.innerHTML = '共&nbsp' + pageTotal + '&nbsp页';
			span2.className = 'totalPage';
			var pages = document.createAttribute("name");
			pages.nodeValue = 'pageTotal';
			span2.setAttributeNode(pages);
			ul.parentNode.appendChild(span2);
			var span3 = TABLAYER$('span');
			span3.innerHTML = '合计&nbsp' + total + '&nbsp条';
			span3.className = 'totalPage';
			var pages1 = document.createAttribute("name");
			pages1.nodeValue = 'total';
			span3.setAttributeNode(pages1);
			ul.parentNode.appendChild(span3);
			that.selectPage(curPage, pageTotal, total, Table);
		} else {
			for(var i = 0; i < totalPage.length; i++) {
				var num = totalPage[i].getAttribute('name');
				//var num =parseInt(totalPage[i].innerText.replace(/[^0-9]/ig,""));
				if(num == 'pageTotal') {
					totalPage[i].innerHTML = '共&nbsp' + pageTotal + '&nbsp页';
				}
				if(num == 'total') {
					totalPage[i].innerHTML = '合计&nbsp' + total + '&nbsp条';
				}
			}

		}
	},
	//下拉选择数据显示条数
	selectPage: function(curPage, pageTotal, total, Table) {
		var that = this;
		var name = name$('SelectPage')[0];
		var size = that.par.pageSize;
		for(var i = 0; i < size.length; i++) {
			name.innerHTML += "<option value=" + size[i] + ">" + size[i] + "</option>";
		}
		var pageSize = size[0];
		name.onchange = function() {
			var pageSize = parseInt(name.options[name.selectedIndex].value);
			that.par.Callback(Table, that, curPage, pageSize);
		};
	},
	//尾页方法
	finalPage: function(ul, curPage, pageTotal, html) {
		var that = this;
		var Table = TAB$(that.par.TableName);
		var span = TABLAYER$('span');
		var number = name$('page-number');
		var size = that.par.pageSize;
		var pageSize = size[0];
		span.innerHTML = '尾页';
		ul.parentNode.appendChild(span);
		var pagination = TAB$(that.par.paginName);
		span.onclick = function() {
			var curPage = parseInt(pageTotal);
			that.getPage(curPage);
			that.par.Callback(Table, that, curPage, pageSize);
			that.addClass(span, 'active');
			for(var i = 0; i < number.length; i++) {
				that.removeClass(number[i], 'active');
			}
			var Pre = name$('Pre-page')[0]; //设置
			that.lastPage(ul, curPage, html, Pre); //上一页
			var next = name$('Next-page')[0];
			that.nextPage(ul, curPage, pageTotal, html, next); //下一页
		};
		var atr = document.createAttribute("name");
		atr.nodeValue = "last-page";
		span.setAttributeNode(atr);
	},
	onSequence: function(Table, col) {
		var _this = this;
		// 定义判断排序字段的一个标志位，数字排序(自己写)和字符排序(JavaScript内置函数) 
		var SortAsNumber = true;
		// 定义放置需要排序的行数组 
		var Sorter = [];
		for(var x = 1; x < Table.rows.length; x++) {
			Sorter[x - 1] = [Table.rows[x].cells[col].innerHTML, x];
			// 判断需要排序字段的类型，分为数字型和非数字型 
			SortAsNumber = SortAsNumber && _this.IsNumeric(Sorter[x - 1][0]);
		}
		// 如果是数字型采用下面的方法排序 
		if(SortAsNumber) {
			for(var x = 0; x < Sorter.length; x++) {
				for(var y = x + 1; y < Sorter.length; y++) {
					if(parseFloat(Sorter[y][0]) < parseFloat(Sorter[x][0])) {
						var tmp = Sorter[x];
						Sorter[x] = Sorter[y];
						Sorter[y] = tmp;
					}
				}
			}
		}
		// 如果是非数字型的可以采用内置方法sort()排序 
		else {
			Sorter.sort();
		}
		if(_this.par.ViewState[col]) {
			// JavaScript内置函数，用于颠倒数组中元素的顺序。 
			Sorter.reverse();
			_this.par.ViewState[col] = false;
			_this.addClass(Table.rows[0].cells[col].lastChild, 'SortDescCss');
		} else {
			_this.par.ViewState[col] = true;
			_this.removeClass(Table.rows[0].cells[col].lastChild, 'SortAscCss');
		}
		var Rank = [];
		for(var x = 0; x < Sorter.length; x++) {
			Rank[x] = _this.GetRowHtml(Table.rows[Sorter[x][1]]);
		}
		for(var x = 1; x < Table.rows.length; x++) {
			for(var y = 0; y < Table.rows[x].cells.length; y++) {
				Table.rows[x].cells[y].innerHTML = Rank[x - 1][y];
			}
		}
		_this.OnSorted(Table.rows[0].cells[col], _this.par.ViewState[col]);
	},
	onlikecheck: function(Table, col) {
		var table = this;
		for(var x = 0; x < Table.rows[0].cells.length; x++) {
			var checkbox = Table.rows[0].cells[x].getElementsByTagName('input')[x];
			if(checkbox) {
				if(checkbox.checked == true) {
					checkbox ? checkbox.checked = false : '';
				}
			}
			var zcheckbox = Table.rows[col].cells[0].getElementsByTagName('input')[x];
			if(zcheckbox) {
				if(zcheckbox.checked == true) {
					table.addClass(Table.rows[col], 'active');
					//Table.rows[col].className = "active";

				} else {
					Table.rows[col].className = "";
				}
				for(var x = 1; x < Table.rows.length; x++) {
					var n = Table.querySelectorAll(".active").length;
					var t = Table.rows.length - 1;
					if(n == t) {
						checkbox ? checkbox.checked = true : '';
					}
				}
			}
		}
	},
	oncheckbox: function(Table, col) {
		for(var x = 1; x < Table.rows.length; x++) {
			var checkbox = Table.rows[x].cells[col].getElementsByTagName('input')[col];
			for(var y = 0; y < Table.rows[0].cells.length; y++) {
				var checkboxs = Table.rows[0].cells[y].getElementsByTagName('input')[y];
				if(checkboxs) {
					if(checkboxs.checked == false) {
						checkbox ? checkbox.checked = false : '';
						Table.rows[x].className = "";
					} else {
						checkbox.checked = true;
						Table.rows[x].className = "active";
					}
				}
			}
		}
	},
	//表格拖拽鼠标指针点击时发生
	Dragdrop: function(e, Table, tTD, obj) {
		var col = obj.cellIndex;
		var tTD = Table.rows[0].cells[col];
		if(e.offsetX > tTD.offsetWidth - 10) {
			tTD.mouseDown = true;
			tTD.oldX = e.x;
			tTD.oldWidth = tTD.offsetWidth;
		}
	},
	//表格拖拽鼠标按键被松开时发生
	onmouseupDrop: function(e, Table, tTD, obj) {
		var col = obj.cellIndex;
		if(tTD == undefined) tTD = Table.rows[0].cells[col];
		tTD.mouseDown = false;
		tTD.style.cursor = 'default';
	},
	//表格拖拽鼠标指针移动时发生
	onmousemoveDrop: function(e, Table, tTD, obj) {
		var col = obj.cellIndex;
		//更改鼠标样式
		if(e.offsetX > Table.rows[0].cells[col].offsetWidth - 5) {
			Table.rows[0].cells[col].style.cursor = 'e-resize';
		} else {
			Table.rows[0].cells[col].style.cursor = 'default';
		}
		//取出暂存的Table Cell
		if(tTD == undefined) tTD = Table.rows[0].cells[col];
		//调整宽度
		if(tTD.mouseDown != null && tTD.mouseDown == true) {
			tTD.style.cursor = 'default';
			if(tTD.oldWidth + (e.x - tTD.oldX) > 0)
				tTD.width = tTD.oldWidth + (e.x - tTD.oldX);
			//调整列宽
			tTD.style.width = tTD.width;
			tTD.style.cursor = 'e-resize';
			//调整该列中的每个Cell
			table = tTD;
			while(table.tagName != 'TABLE') table = table.parentElement;
			for(j = 0; j < table.rows.length; j++) {
				table.rows[j].cells[tTD.cellIndex].width = tTD.width;
			}
		}
	},
	// 取得指定行的内容. 
	GetRowHtml: function(row) {
		var result = [];
		for(var x = 0; x < row.cells.length; x++) {
			result[x] = row.cells[x].innerHTML;
		}
		return result;
	},
	OnSorted: function(cell, IsAsc) {
		return;
	},
	IsNumeric: function(num) {
		return /^\d+(\.\d+)?$/.test(num);
	}
};