using System;
using System.Collections.Generic;
using System.Text;

namespace CApp_Exe2_L1
{
    internal class Expressao
    {
        public int A = 0, B = 0, C = 0;

        public void lervalue()
        {
            Console.WriteLine("Digite A");
            this.A = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("digite B");
            this.B = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("digite C");
            this.C = Convert.ToInt32(Console.ReadLine());
        }
        public double CalcR()
        {
            double R = 0;
            R = Math.Pow(this.A + this.B, 2);
            return R;
        }

        public double CalcS()
        {
            double S = 0;
            S = Math.Pow(this.B + this.C, 2);
            return S;
        }
        public double CalcD()
        {
            double D = 0;
            D = (this.CalcR() + this.CalcS()) / 2;
            return D;

            }
        }
    }
