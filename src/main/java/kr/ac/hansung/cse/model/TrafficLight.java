package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TrafficLight {
	private String image;
	private String timeLabel;
	private String directLabel;
	private String light;
}
