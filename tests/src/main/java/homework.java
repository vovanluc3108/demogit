import com.sun.tools.javadoc.DocImpl;
import entity.Category;
import entity.product;
import entity.margin;


import java.util.ArrayList;
import java.util.Arrays;

public class homework {

    public static void main(String[] args) {
        double g1 = 0, g2 = 0, g3 = 0, c1 = 0, c2 = 0, c3 = 0;

        //input data of 3 tables to objects
        ArrayList<product> products = new ArrayList<product>();
        products.addAll(Arrays.asList(
                new product("A", "G1", 20.1),
                new product("B", "G2", 98.4),
                new product("C", "G1", 49.7),
                new product("D", "G3", 35.8),
                new product("E", "G3", 105.5),
                new product("F", "G1", 55.2),
                new product("G", "G1", 12.7),
                new product("H", "G3", 88.6),
                new product("I", "G1", 5.2),
                new product("J", "G2", 72.4)
        ));
        ArrayList<Category> categories = new ArrayList<Category>();
        categories.addAll(Arrays.asList(
                new Category("C3", 50, 75),
                new Category("C4", 75, 100),
                new Category("C2", 25, 50),
                new Category("C5", 100, -1),//set infinity into -1
                new Category("C1", 0, 25)
        ));
        ArrayList<margin> margins = new ArrayList<margin>();
        margins.addAll(Arrays.asList(
                new margin("C1", 0.2),
                new margin("C2", 0.3),
                new margin("C3", 0.4),
                new margin("C4", 0.5),
                new margin("C5", 0.6)
        ));

        //the price arrays have same definition to margin object so i don't create entity for price
        ArrayList<margin> price = new ArrayList<margin>();

        //compare price with category
        for (int i = 0; i < products.size(); i++) {
            product pr = products.get(i);

            for (int j = 0; j < categories.size(); j++) {
                Category cate = categories.get(j);

                //when the price between 100 and infinity
                if (cate.getEndLevel() < 0) {
                    if (pr.getCost() >= cate.getStartLevel())
                        price.add(new margin(cate.getName(), pr.getCost()));
                }
                //when the price lower than 100
                else if (pr.getCost() >= cate.getStartLevel() && pr.getCost() <= cate.getEndLevel())
                    price.add(new margin(cate.getName(), pr.getCost()));
            }
        }

        // calculate the price without average for each product
        for (int i = 0; i < price.size(); i++) {
            margin p = price.get(i);
            for (int j = 0; j < margins.size(); j++) {
                margin m = margins.get(j);
                if (p.getName().equals(m.getName())) {
                    margin fin = new margin(m.getName(), p.getPercent() * (1 + m.getPercent()));
                    price.set(i, fin);
                }


            }
        }

        // final calculate to each group
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getGroup().equals("G1")) {
                g1 += price.get(i).getPercent();
                c1++;
            } else if (products.get(i).getGroup().equals("G2")) {
                g2 += price.get(i).getPercent();
                c2++;
            } else {
                g3 += price.get(i).getPercent();
                c3++;
            }
        }
        if (c1 != 0) g1 = g1 / c1;
        if (c2 != 0) g2 = g2 / c2;
        if (c3 != 0) g3 = g3 / c3;

        // print answers to console
        System.out.println("G1=" + g1);
        System.out.println("G2=" + g2);
        System.out.println("G3=" + g3);
    }

}
