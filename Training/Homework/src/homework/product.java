package homework;

public class product {
	public String nameproduct;
	public String groupby;
	public double value;
	public String getNameproduct() {
		return nameproduct;
	}
	public void setNameproduct(String nameproduct) {
		this.nameproduct = nameproduct;
	}
	public String getGroupby() {
		return groupby;
	}
	public void setGroupby(String groupby) {
		this.groupby = groupby;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
	public product(String nameproduct,String groupby, double value) {
		this.nameproduct = nameproduct;
		this.groupby = groupby;
		this.value = value;
	}

}
