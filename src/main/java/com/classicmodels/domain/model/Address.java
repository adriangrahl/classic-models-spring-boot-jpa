package com.classicmodels.domain.model;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Embeddable
public class Address {

	private String addressLine1;
	
	private String addressLine2;
	
	private String postalCode;
	
	@ManyToOne
	@JoinColumn(name = "cityCode")
	private City city;
	
}
