package controller.users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.*;
import controller.*;

@SuppressWarnings("serial")
public class UsersControllerTest<E> extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		final PersistenceManager pm = PMF.get().getPersistenceManager();
	/*	
	try{
		Query r = pm.newQuery(model.entity.Resource.class);
		Query r2 = pm.newQuery(model.entity.Role.class);
		Query r3 = pm.newQuery(model.entity.Access.class);
		Query r4 = pm.newQuery(model.entity.User.class);
		List<Resource> r1 = (List<Resource>) r.execute();
		List<Role> r21 = (List<Role>) r2.execute();
		List<Access> r31 = (List<Access>) r3.execute();
		List<model.entity.User> r41 = (List<model.entity.User>) r4.execute();
		for(Resource a: r1) pm.deletePersistent(a);
		for(Role a: r21) pm.deletePersistent(a);
		for(Access a: r31) pm.deletePersistent(a);
		for(model.entity.User a: r41) pm.deletePersistent(a);
		
	}catch(Exception e){
		System.out.println("Error en eliminar "+e);
	}
	*/
	try{
		// construyendo los roles
		Role role = new Role("Administrador");
		
		// construyendo los recursos
		ArrayList<Resource> resources = new ArrayList<Resource>();
		resources.add(new Resource("/users"));
		resources.add(new Resource("/users/add"));
		resources.add(new Resource("/users/edit"));
		resources.add(new Resource("/users/view"));
		resources.add(new Resource("/users/delete"));
		resources.add(new Resource("/providers"));
		resources.add(new Resource("/providers/add"));
		resources.add(new Resource("/providers/edit"));
		resources.add(new Resource("/providers/view"));
		resources.add(new Resource("/providers/delete"));
		resources.add(new Resource("/access"));
		resources.add(new Resource("/access/add"));
		resources.add(new Resource("/access/edit"));
		resources.add(new Resource("/access/view"));
		resources.add(new Resource("/access/delete"));
		resources.add(new Resource("/roles"));
		resources.add(new Resource("/roles/add"));
		resources.add(new Resource("/roles/edit"));
		resources.add(new Resource("/roles/view"));
		resources.add(new Resource("/roles/delete"));
		resources.add(new Resource("/resources"));
		resources.add(new Resource("/resources/add"));
		resources.add(new Resource("/resources/edit"));
		resources.add(new Resource("/resources/view"));
		resources.add(new Resource("/resources/delete"));
		
		
			pm.makePersistent(role);
		for(Resource resource:resources)
			pm.makePersistent(resource);
		
		try{ // creando usuarios administradores
			// User(String email, Long role, Date birth, boolean gender )
			Date date = new Date();
			User admin = new User("richarteq@gmail.com",role.getRoleId(),date,false);
			User alumn = new User("fanny.llq@gmail.com",role.getRoleId(),date,true);
			pm.makePersistent(admin);
			pm.makePersistent(alumn);
		}catch(Exception e){
			System.out.println("Error en creacion de usuario "+e);
		}
		
		// creando los accesos
		Query re = pm.newQuery(model.entity.Resource.class); // es estooo
		Query ro = pm.newQuery(model.entity.Role.class);
		List<Resource> recursosAñadidos = (List<Resource>) re.execute();
		List<Role> rolesAñadidos = (List<Role>) ro.execute();
		try{
		// creando los accesos necesarios
		// ArrayList<Access> accesos = new ArrayList<Access>();
		
			for(Resource a: recursosAñadidos)
				pm.makePersistent(new Access(rolesAñadidos.get(0).getRoleId(),a.getResourceId()));
		
		}catch(Exception e){
			System.out.println("erro en creacion de accesos" + e);
		}
			
	}catch(Exception e)
    {
   	 System.out.println("Error de constructor");
    }
   // finally {
   	   pm.close();
   	  resp.sendRedirect("/index.html");
    //}
		
	}
}
