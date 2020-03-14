package com.classicmodels.demo;

import static io.restassured.RestAssured.enableLoggingOfRequestAndResponseIfValidationFails;
import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;

import com.classicmodels.domain.model.Customer;
import com.classicmodels.domain.model.CustomerRepository;

import io.restassured.RestAssured;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class CustomerRepositoryIT {

	@LocalServerPort
	private int port;
	
	@Autowired
	private CustomerRepository repository;
	
	@Before
	public void setUp() {
		
		enableLoggingOfRequestAndResponseIfValidationFails();
		RestAssured.port = port;
	}
	
	@Test
	public void whenFindAllThenSuccess() {		
		List<Customer> customers = repository.findAll();		
		assertThat(customers)
				.isNotEmpty()
				.first()
				.satisfies(customer -> {
					assertThat(customer.getAddress()).isNotNull();
				});
	}
	
}
