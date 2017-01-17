package com.pxy.service;

import com.pxy.model.IndexField;

public interface IndexService {
	public void addIndex(IndexField fields);
	public void deleteIndex(String id);
	public void updateIndex(IndexField fields);
	//分页
	//public PageObject<Index> findByIndex(String condition);
	//提交索引
	public void updateCommitIndex();
	//重构索引
	public void updateReconstructorIndex();
	
}
