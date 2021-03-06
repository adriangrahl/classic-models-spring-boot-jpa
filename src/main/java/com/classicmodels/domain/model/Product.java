package com.classicmodels.domain.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "products")
public class Product {

	@Id
	@EqualsAndHashCode.Include
	private String id;
	
	private String productName;
	
	@ManyToOne
	@JoinColumn(name = "productLine", nullable = false)
	private ProductLine productLine;
	
	private String productScale;
	
	private String productVendor;
	
	@Column(columnDefinition = "VARCHAR(2000)")
	private String productDescription;
	
	private Integer quantityInStock;
	
	private BigDecimal buyPrice;
	
	private Double MSRP;
}
