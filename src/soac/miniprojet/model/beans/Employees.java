package soac.miniprojet.model.beans;
// Generated 7 janv. 2020 11:56:55 by Hibernate Tools 5.4.7.Final

/**
 * Employees generated by hbm2java
 */
public class Employees implements java.io.Serializable {

	private Integer id;
	private String nom;
	private String prenom;
	private String role;
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String password;

	public Employees() {
	}

	public Employees(String nom, String prenom, String role) {
		this.nom = nom;
		this.prenom = prenom;
		this.role = role;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
