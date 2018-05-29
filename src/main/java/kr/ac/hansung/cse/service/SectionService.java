package kr.ac.hansung.cse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.SectionDao;
import kr.ac.hansung.cse.model.Section;

@Service
public class SectionService {

	@Autowired
	SectionDao sectionDao;

	public List<Section> getSections() {
		return sectionDao.getSections();
	}
	
	public Section getSectionById(int sectionId) {
		return sectionDao.getSectionById(sectionId);
	}

	public void saveOrUpdateSection(Section section) {
		sectionDao.saveOrUpdateSection(section);
	}
	
	public void clearSections() {
		sectionDao.clearSections();
	}

	public void deleteSection(Section section) {
		sectionDao.deleteSection(section);
	}

}
