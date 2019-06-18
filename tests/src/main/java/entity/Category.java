package entity;

public class Category {
    private String name;
    private double startLevel;
    private double endLevel;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getStartLevel() {
        return startLevel;
    }

    public void setStartLevel(double startLevel) {
        this.startLevel = startLevel;
    }

    public double getEndLevel() {
        return endLevel;
    }

    public void setEndLevel(double endLevel) {
        this.endLevel = endLevel;
    }

    public Category(String name, double startLevel, double endLevel) {
        this.name = name;
        this.startLevel = startLevel;
        this.endLevel = endLevel;
    }
}
