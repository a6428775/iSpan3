package tw.ispan.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/*/**").addResourceLocations("/WEB-INF/resources/css/");
		registry.addResourceHandler("/js/*/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/images/*/**").addResourceLocations("/WEB-INF/resources/images/");
	}	

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login/page").setViewName("login");
		registry.addViewController("/login/welcome").setViewName("welcome");
		registry.addViewController("/logout").setViewName("login");
		registry.addViewController("/logout/page").setViewName("logout");
		registry.addViewController("/register").setViewName("register");
		registry.addViewController("/403").setViewName("403");

		
	//	registry.addViewController("/register2.controller").setViewName("/register.controller2");
		
	}

}
