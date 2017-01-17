package com.pxy.service.impl;

import com.pxy.dao.TempIndexDao;
import com.pxy.dao.impl.TempIndexDaoImpl;
import com.pxy.model.IndexField;
import com.pxy.service.IndexService;

public class IndexServiceImpl implements IndexService{
	
	private TempIndexDao tempIndexDao = new TempIndexDaoImpl();
	
	
	public void setTempIndexDao(TempIndexDao tempIndexDao) {
		this.tempIndexDao = tempIndexDao;
	}

	@Override
	public void addIndex(IndexField fields) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteIndex(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateIndex(IndexField fields) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCommitIndex() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReconstructorIndex() {
		// TODO Auto-generated method stub
		
	}

}
