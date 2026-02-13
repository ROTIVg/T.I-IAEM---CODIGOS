using CApp_Exe2_L1;

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
        Expressao ObjCalc1 = new Expressao();
        ObjCalc1.lervalue();
        Console.WriteLine("valor de D =" + Convert.ToString(ObjCalc1.CalcD()));

    }
}