package com.classicmodels.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "productlines")
public class ProductLine {

	@Id
	@EqualsAndHashCode.Include
	private String id;
	
	@Column(columnDefinition = "VARCHAR(2000)")
	private String textDescription;
	
	@Column(columnDefinition = "VARCHAR(2000)")
	private String htmlDescription;
	
	private byte[] image;
}
