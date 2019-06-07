package entity;

public class margin {
    public String name;
    public double percent;

    public margin(String name) {
        this.name = name;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPercent() {
        return percent;
    }

    public void setPercent(double percent) {
        this.percent = percent;
    }

    public margin(String name, double percent) {
        this.name = name;
        this.percent = percent;

    }
}
