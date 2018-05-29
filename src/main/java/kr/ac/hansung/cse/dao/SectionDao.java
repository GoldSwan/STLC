package kr.ac.hansung.cse.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.cse.model.Section;

@Repository
@EnableTransactionManagement // TODO xml의 tx:annotation-driven과 중복되는 곳....오류나면 지울 것!
@Transactional
public class SectionDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Section> getSections() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		TypedQuery<Section> query = session.createQuery("FROM Section");
		return query.getResultList();
	}

	public Section getSectionById(int sectionId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Section.class, sectionId);
	}

	public void saveOrUpdateSection(Section section) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(section);
		session.flush();
	}

	public void clearSections() {
		List<Section> sections = getSections();
		for (Section section : sections)
			deleteSection(section);
	}
	
	public void deleteSection(Section section) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(section);
		session.flush();
	}

}
