package kr.ac.hansung.cse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.hansung.cse.model.Section;
import kr.ac.hansung.cse.service.SectionService;

@RestController
@RequestMapping("api/sections")
public class SectionRestController {

	@Autowired
	SectionService sectionService;
	
	// CREATE
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<Section> saveSection(@RequestBody() String sectionName) {
		Section section = new Section();
		section.setName(sectionName);
		sectionService.saveOrUpdateSection(section);
		return new ResponseEntity<>(section, HttpStatus.OK);
	}
	
	// READ
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<Section>> getSections() {
		List<Section> sections = sectionService.getSections();
		return new ResponseEntity<>(sections, HttpStatus.OK);
	}
	
	// UPDATE
	@RequestMapping(value = "/{sectionId}/{sectionName}")
	public ResponseEntity<Section> updateSection(@PathVariable("sectionId") int sectionId, @PathVariable("sectionName") String sectionName) {
		Section section = sectionService.getSectionById(sectionId);
		section.setName(sectionName);
		sectionService.saveOrUpdateSection(section);
		return new ResponseEntity<>(section, HttpStatus.OK);
	}
	
	// DELETE
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public ResponseEntity<Void> clearSections() {
		sectionService.clearSections();
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@RequestMapping(value = "/{sectionId}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteSection(@PathVariable("sectionId") int sectionId) {
		Section section = sectionService.getSectionById(sectionId);
		sectionService.deleteSection(section);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
}
