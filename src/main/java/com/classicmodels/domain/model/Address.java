package com.classicmodels.domain.model;

import javax.persistence.Embeddable;

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
	
	private String city;
	
	private String state;
	
	private String postalCode;
	
	private String country;
	
}
