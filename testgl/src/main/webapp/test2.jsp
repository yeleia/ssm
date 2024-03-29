<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>jquery datatables</title>

	<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/jquery.dataTables.min.css">
    <link type="text/css" rel="stylesheet" href="static/css/dataTables.tableTools.css" />
    <link type="text/css" rel="stylesheet" href="static/css/dataTables.bootstrap.css" />
    
    
    <script type="text/javascript" src="static/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    
    <style>
.selected {
	background-color: #DFF0D8;
}

#example_length {
	float: left;
}

.odd td strong {
	color: red;
}

#deleteButton {
	float: left;
}

#addButton {
	float: left;
}

#topPlugin {
	float: left;
	margin-left: 10px;
}

.modal-footer span {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	float: left;
	font-size: 16px;
}

div.dataTables_paginate {
	margin: 0;
	white-space: nowrap;
	text-align: right;
	margin-top: 5px;
}

.table th, .table td { 
	text-align: center; 
	height:25px;
}
</style>
    
</head>
<body>

<div style="height:20px;"></div>

<!-- 显示表格边框table-bordered  缩小表格间距table-condensed -->
	<table id="example" class="table table-bordered table-condensed">
		<thead>
		<tr>
		<th><input type="checkbox" name="allChecked" /></th>
	  	<th>id</th>
	  	<th>部门名称</th>
	  	<th>操作</th>
	  </tr>
	  </thead>
	</table>



<!--单个删除确认对话框-->
<div class="modal fade" id="deleteOneModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" > <!-- data-backdrop="static" 禁止点击弹框后面内容 -->
    <form class="form-horizontal" role="form">
        <div class="modal-dialog modal-sm " > <!-- modal-sm 小的  modal-lg 大的 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        提示信息
                    </h4>
                </div>
                <div class="modal-body" style="text-align: left;">
                    <h5>您确定要删除当前信息吗？</h5>
                </div>
                <div class="modal-footer">
                <!-- 
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">取消
                    </button>
                     -->
                    <button type="button" class="btn btn-primary" id="delSubmit">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </form>
</div>


<!--多个删除确认对话框-->
<div class="modal fade" id="deleteAllModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <form class="form-horizontal" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        提示信息
                    </h4>
                </div>
                <div class="modal-body" style="text-align: left;">
                    <h5>您确定要删除选中信息吗？</h5>
                </div>
                <div class="modal-footer">
                <!-- 
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">取消
                    </button>
                     -->
                    <button type="button" class="btn btn-primary" id="delAllSubmit">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </form>
</div>



<!--新增页面开始-->
<div class="modal fade" id="myModal-add-info" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"
                                    data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                新 增
                            </h4>
                        </div>
                        <form class="form-horizontal" role="form" action="/category_add" method="post"  id="category_add">
                            <div class="modal-body">
                            <%-- 
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" >图 片：</label>
                                    <div class="col-sm-5">
                                        <input  type="file" name="img1" class="file" id="img1"  style="width:180px; float: left" />
                                    </div>
                                    <div class="col-sm-3">
                                        <input class="btn btn-sm btn-info" type="button" value="上传" id="uploadimg"/><span id="t"></span>
                                    </div>
                                    <input name="categoryImg" type="hidden" id="imageUrl" />
                                </div>
                                --%>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" >部门名称： </label>

                                    <div class="col-sm-9">
                                        <input type="text"  class="form-control" id="typename"  name="name" style="width: 250px" maxlength="15" placeholder="10个汉字以内" />

                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" >备注： </label>

                                    <div class="col-sm-9">
                                        <input type="text"   class=" sortNumber form-control"  name="sortNumber" id="sortNumber" style="width: 250px" maxlength="3"/>
                                    </div>
                                </div>
                   
                         
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" >状态：</label>
                                    <div class="control-group">
                                        <div class="radio col-sm-3" style="float: left">
                                            <label>
                                                <input  type="radio" class=" yn1" name="isYn"  value="1"  checked/>
                                                <span class="lbl">有效</span>
                                            </label>
                                        </div>
                                        <div class="radio col-sm-3" style="float: left">
                                            <label>
                                                <input  type="radio" class=" yn1" name="isYn"  value="0"/>
                                                <span class="lbl">无效</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <button type="button" class="btn btn-primary" id="btnsubmit">提交
                                </button>
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div>
            </div>

<script>

$(function() {
	var table = $("#example").DataTable({
		"aLengthMenu":[10,20,40,60], //动态指定分页后每页显示的记录数。
		"searching":false,//禁用搜索
		"lengthChange":true, //是否启用改变每页显示多少条数据的控件
		"sort" : "position",  //是否开启列排序，对单独列的设置在每一列的bSortable选项中指定
		"deferRender":true,//延迟渲染
		"bStateSave" : false, //在第三页刷新页面，会自动到第一页
		"iDisplayLength" : 10,  //默认每页显示多少条记录
		"iDisplayStart" : 0,
		"ordering": false,//全局禁用排序
		"dom": '<l<\'#topPlugin\'>f>rt<ip><"clear">',
		"ajax": {
                "type": "POST",
                "url":'<%=request.getContextPath()%>/datatables/listceshi.do',
        },
		"aoColumns" : [{  //aoColumns设置列时，不可以任意指定列，必须列出所有列。
			"mData" : "id",
			"orderable": false , // 禁用排序
			"sDefaultContent" : "",
			"sWidth" : "2%"
        },{
			"mData" : "id",
			"orderable" : false, // 禁用排序
			"sDefaultContent" : "",
			"sWidth" : "6%",
			
		}, {
			"mData" : "username",
			"orderable" : false, // 禁用排序
			"sDefaultContent" : "",
			"sWidth" : "10%"
		},{
			"mData" : "id",
			"orderable" : false, // 禁用排序
			"sDefaultContent" : '',
			"sWidth" : "10%",
		    "render":function(data, type, full, meta){  //render改变该列样式,4个参数，其中参数数量是可变的。
		    return	data='<button id="deleteOne" class="btn btn-danger btn-sm" data-id='+data+'>删 除</button>';
		    
		    }}
			//data指该行获取到的该列数据
			//row指该行，可用row.name或row[2]获取第3列字段名为name的值
			//type调用数据类型，可用类型“filter”,"display","type","sort",具体用法还未研究
			//meta包含请求行索引，列索引，tables各参数等信息
		
		],
		"columnDefs" : 
		[{
			"orderable" : false, // 禁用排序
			"targets" : [0], // 指定的列
			"data" : "id",
			"render" : function(data, type, full, meta) {
				return '<input type="checkbox" value="'+ data + '" name="id"/>';
			}
		}],
		"oLanguage" : { // 国际化配置
			"sProcessing" : "正在获取数据，请稍后...",
			"sLengthMenu" : "显示 _MENU_ 条",
			"sZeroRecords" : "没有找到数据",
			"sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
			"sInfoEmpty" : "记录数为0",
			"sInfoFiltered" : "(全部记录数 _MAX_ 条)",
			"sInfoPostFix" : "",
			"sSearch" : "搜索",
			"sUrl" : "",
			"oPaginate" : {
				"sFirst" : "第一页",
				"sPrevious" : "上一页",
				"sNext" : "下一页",
				"sLast" : "最后一页"
			}
		},
		initComplete:initComplete,
		drawCallback: function( settings ) {
	        $('input[name=allChecked]')[0].checked=false;//取消全选状态
	    }
		
	});
	
	/**
     * 表格加载渲染完毕后执行的方法
     * @param data
     */
    function initComplete(data){

    	//删除用户按钮的HTMLDOM
        var topPlugin='<button   class="btn btn-danger btn-sm" id="deleteAll">删除</button> <button   class="btn btn-primary btn-sm addBtn" >新 增</button>' ;
					       
		$("#topPlugin").append(topPlugin);//在表格上方topPlugin DIV中追加HTML
    
    }
   
	
    /**
	 * 单行删除按钮点击事件响应
	 */

    $(document).delegate('#deleteOne','click',function() {
    	var id=$(this).data("id");
    	$("#delSubmit").val(id);
    	$("#deleteOneModal").modal('show');
 	   });
    
    
    /**
     * 点击确认删除按钮
     */
    $(document).delegate('#delSubmit','click',function(){
        var id=$(this).val();
        $('#deleteOneModal').modal('hide');
        $.ajax({
        	/* 后台未实现 */
        	url:contextPath+"delete.do?id="+id,
            async:true,
            type:"GET",
            dataType:"json",
            cache:false,    //不允许缓存
            success: function(data){
                var obj = eval(data);
                if(obj.code==1)
                {
                 
                    window.location.reload();
                }
                else
                {
                    alert("删除失败");
                }

            },
            error:function(data){
                alert("请求异常");
            }
        });
    });
    

	/**
	 * 多选选中和取消选中,同时选中第一个单元格单选框,并联动全选单选框
	 */
	$('#example tbody').on('click', 'tr', function(event) {
		var allChecked=$('input[name=allChecked]')[0];//关联全选单选框
		$($(this).children()[0]).children().each(function(){
			if(this.type=="checkbox" && (!$(event.target).is(":checkbox") && $(":checkbox",this).trigger("click"))){
				if(!this.checked){
					this.checked = true;
					addValue(this);
					var selected=table.rows('.selected').data().length;//被选中的行数
					console.info(selected+'个数');
					//全选单选框的状态处理
					var recordsDisplay=table.page.info().recordsDisplay;//搜索条件过滤后的总行数
					var iDisplayStart=table.page.info().start;// 起始行数
					if(selected === table.page.len()||selected === recordsDisplay||selected === (recordsDisplay - iDisplayStart)){
						allChecked.checked = true;
					}
				}else{
					this.checked = false;
					cancelValue(this);
					allChecked.checked = false;
				}
			}
		});
		$(this).toggleClass('selected');//放在最后处理，以便给checkbox做检测
	});
	
	

	/**
	 * 全选按钮被点击事件
	 */
	$('input[name=allChecked]').click(function(){
		if(this.checked){
			$('#example tbody tr').each(function(){
				console.info(1);
				if(!$(this).hasClass('selected')){
					$(this).click();
					console.info(2);
				}
			});
		}else{
			$('#example tbody tr').click();
		}
	});
    
	/**
	 * 单选框被选中时将它的value放入隐藏域
	 */
	function addValue(para) {
		var userIds = $("input[name=userIds]");
		if(userIds.val() === ""){
			userIds.val($(para).val());
		}else{
			userIds.val(userIds.val()+","+$(para).val());
		}
	}
	
	/**
	 * 单选框取消选中时将它的value移除隐藏域
	 */
	function cancelValue(para){
		//取消选中checkbox要做的操作
		var userIds = $("input[name=allChecked]");
		var array = userIds.val().split(",");
		userIds.val("");
		for (var i = 0; i < array.length; i++) {
			if (array[i] === $(para).val()) {
				continue;
			}
			if (userIds.val() === "") {
				userIds.val(array[i]);
			} else {
				userIds.val(userIds.val() + "," + array[i]);
			}
		}
	}
	
	
	   /**
	    * 新增
	    */
	   $(document).delegate('.addBtn','click',function() {
			  
			$('#myModal-add-info').modal('show');
		   });
	   
	   
	   /**
	    * 批量删除
	    */
	   $(document).delegate('#deleteAll','click',function() {
		   var theArray=[];
		   $("input[name=id]:checked").each(function() { 
			      theArray.push($(this).val());
			    });
		   if(theArray.length<1){
			   alert("请至少选择一个"); 
		   }else{
			   alert(theArray);
		   }
			 
		   });
	   
	   
	   
	   


});

</script>


</body>
</html>
