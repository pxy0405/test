package com.pxy.model;

public class TempIndex {
	
	public final static int ADD_OP = 1;
	public final static int DEL_OP = 2;
	public final static int UPDATE_OP = 3;

		private int id;
		private int objId;			//要跟新的对象的id
		private String type;		//没有跟新的类型string类型（message 或attachment用反射，也可以将其弄成常量）
		private int operator;		//操作的对象类型

		public void setDelete(){
			operator = DEL_OP;
		}
		public void setAdd(){
			operator = ADD_OP;
		}
		public void setUpdate(){
			operator = UPDATE_OP;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getObjId() {
			return objId;
		}
		public void setObjId(int objId) {
			this.objId = objId;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public int getOperator() {
			return operator;
		}
		public void setOperator(int operator) {
			this.operator = operator;
		}
		
}
