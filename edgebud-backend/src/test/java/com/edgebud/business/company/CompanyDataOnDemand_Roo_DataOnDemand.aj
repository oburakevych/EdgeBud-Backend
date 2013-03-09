// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.company;

import com.edgebud.business.company.Company;
import com.edgebud.business.company.CompanyDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CompanyDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CompanyDataOnDemand: @Component;
    
    private Random CompanyDataOnDemand.rnd = new SecureRandom();
    
    private List<Company> CompanyDataOnDemand.data;
    
    public Company CompanyDataOnDemand.getNewTransientCompany(int index) {
        Company obj = new Company();
        setDescription(obj, index);
        setEmail(obj, index);
        setId(obj, index);
        setName(obj, index);
        setUrl(obj, index);
        return obj;
    }
    
    public void CompanyDataOnDemand.setDescription(Company obj, int index) {
        String description = "description_" + index;
        if (description.length() > 1024) {
            description = description.substring(0, 1024);
        }
        obj.setDescription(description);
    }
    
    public void CompanyDataOnDemand.setEmail(Company obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void CompanyDataOnDemand.setId(Company obj, int index) {
        String id = "id_" + index;
        obj.setId(id);
    }
    
    public void CompanyDataOnDemand.setName(Company obj, int index) {
        String name = "name_" + index;
        if (name.length() > 24) {
            name = name.substring(0, 24);
        }
        obj.setName(name);
    }
    
    public void CompanyDataOnDemand.setUrl(Company obj, int index) {
        String url = "url_" + index;
        obj.setUrl(url);
    }
    
    public Company CompanyDataOnDemand.getSpecificCompany(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Company obj = data.get(index);
        Long id = obj.getId_();
        return Company.findCompany(id);
    }
    
    public Company CompanyDataOnDemand.getRandomCompany() {
        init();
        Company obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId_();
        return Company.findCompany(id);
    }
    
    public boolean CompanyDataOnDemand.modifyCompany(Company obj) {
        return false;
    }
    
    public void CompanyDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Company.findCompanyEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Company' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Company>();
        for (int i = 0; i < 10; i++) {
            Company obj = getNewTransientCompany(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
