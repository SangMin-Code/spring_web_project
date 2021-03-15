package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO>getList();
	
	public void insert(BoardVO board); //PK가 필요없는경우
	
	public void insertSelectKey(BoardVO board); //PK가 필요없는경우
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
}
