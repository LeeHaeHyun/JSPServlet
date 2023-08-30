//문제1) 파일명 :  QuConstructorAndSuper.java
//상속관계에 놓여있는 클래스의 생성자 정의 및 호출방식을 
//기본으로 다음 클래스의 적절한 생성자를 삽입해보자. 
//그리고 이의 확인을 위한 main 메소드도 적절히 정의해보자.

package quiz;

class Car
{
    int gasoline;
    public Car(int gasoline)
    {
    	this.gasoline = gasoline;
    }
}
class HybridCar extends Car
{
    int electric;
    public HybridCar(int gas, int ele)
    {
    	super(gas);
    	this.electric = ele;
    }
}
class HybridWaterCar extends HybridCar
{
    int water;
    /*
    생성자: 상속관계의 자식 클래스의 객체를 생성하기 위해서는
    반드시 부모클래스의 객체가 메모리에 먼저 생성되어야 한다.
    따라서 자식 클래스의 생성자에서는 부모의 멤버변수를 초기화 할 수 있는 
    인수까지 전달받아야 하고 이를 super()을 통해 부모클래스의 생성자를 호출해야 한다.
     */
	public HybridWaterCar(int g, int e, int w)
	{
		//3개의 인수중 가솔린과 전기는 부모쪽으로 전달한다
		super(g,e);
		//워터는 멤버변수를 초기화한다.
		this.water = w;
	}


	public void showNowGauge()
   	{
        System.out.println("남은가솔린:"+gasoline);
        System.out.println("남은전기량:"+electric);
        System.out.println("남은워터량:"+water);
    }
}
public class QuConstructorAndSuper 
{
	public static void main(String[] args)
	{
		HybridWaterCar hcar = new HybridWaterCar(10,20,30);
		hcar.showNowGauge();
	}
}
