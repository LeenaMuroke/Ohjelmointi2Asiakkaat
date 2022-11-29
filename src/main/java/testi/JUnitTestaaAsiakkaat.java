package testi;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import model.Asiakas;
import model.dao.Dao;


@TestMethodOrder(OrderAnnotation.class)
class JUnitTestaaAsiakkaat {

	@Test
	@Order(1) 
	public void testiPoistaKaikkiAsiakkaat() {
		Dao dao = new Dao();
		dao.removeAllItems("Makaroonilaatikko123");
		ArrayList<Asiakas> asiakkaat = dao.getAllItems();
		assertEquals(0, asiakkaat.size());		
	}
	
	@Test
	@Order(2) 
	public void testiLisaaAsiakkaat() {
		Dao dao = new Dao();
		Asiakas asiakas1 = new Asiakas("Ville", "Virtanen", "04539432", "ville@posti.fi");
		Asiakas asiakas2 = new Asiakas("Mirja", "Myllylä", "05023523", "mimmi@posti.fi");
		Asiakas asiakas3 = new Asiakas("Paavo", "Heino", "040345345", "paavo@posti.fi");
		Asiakas asiakas4 = new Asiakas("Minna", "Mallikas", "04589742", "minski@posti.fi");
		System.out.println(asiakas2);
		assertTrue(dao.addItem(asiakas1));
		assertTrue(dao.addItem(asiakas2));
		assertTrue(dao.addItem(asiakas3));
		assertTrue(dao.addItem(asiakas4));
		ArrayList<Asiakas> asiakkaat = dao.getAllItems();
		assertEquals(4, asiakkaat.size());		
	}

	@Test
	@Order(3) 
	public void testiMuutaAsiakas() {
		//muutetaan Ville Virtasen puhelin
		Dao dao = new Dao();		
		ArrayList<Asiakas> asiakkaat = dao.getAllItems("Ville");	
		System.out.println(asiakkaat);
		asiakkaat.get(0).setPuhelin("050123456");		
		dao.changeItem(asiakkaat.get(0));
		asiakkaat = dao.getAllItems("050123456");
		assertEquals("Ville", asiakkaat.get(0).getEtunimi());
		assertEquals("Virtanen", asiakkaat.get(0).getSukunimi());
		assertEquals("ville@posti.fi", asiakkaat.get(0).getSposti());		
	}
	
	@Test
	@Order(4) 
	public void testiPoistaAsiakas() {
		//Poistetaan asiakas Ville Virtanen
		Dao dao = new Dao();
		ArrayList<Asiakas> asiakkaat = dao.getAllItems("Ville");
		dao.removeItem(asiakkaat.get(0).getAsiakas_id());
		assertEquals(0, dao.getAllItems("Ville").size());					
	}
	
	@Test
	@Order(5) 
	public void testiHaeOlematonAsiakas() {
		//Haetaan asiakas,jonka id on -1
		Dao dao = new Dao();
		assertNull(dao.getItem(-1));
	}
}
