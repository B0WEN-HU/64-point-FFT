#include <algorithm>
#include <cstring>
#include <complex>
#include <cmath>
#include <iostream>
#include <fstream>

using namespace std;
#define PI 3.14159265

complex<double> BU0(complex<double> X0, complex<double> X1, complex<double> W)
{
    return X0 + X1;
}

complex<double> BU1(complex<double> X0, complex<double> X1, complex<double> W)
{
    return W * (X0 - X1);
}

complex<double> W_value(int num_point, int num_N)
{
    complex<double> W(cos(2 * PI * (double)num_N / num_point), -sin(2 * PI * (double)num_N / num_point));
    return W;
}

int bit_reverse(int num, int num_point)
{
    int num_point_mask = num_point - 1;
    int rev_ans = 0;
    while (num_point_mask > 0)
    {
        rev_ans <<= 1;
        rev_ans += num & 1;
        num >>= 1;
        num_point_mask >>= 1;
    }
    return rev_ans;
}

void FFT_shift(complex<double> *x, complex<double> *X, int num_point)
{
    for (int i = 0; i < num_point; ++i)
        X[i] = x[bit_reverse(i, num_point)];
}

void FFT_Radix2_64points(complex<double> *x, complex<double> *X)
{
    int num_point = 64;
    int cur_num_point;
    int half_N;
    int loop;
    complex<double> W;

    cout << "FFT_Radix2_64points START" << endl;
    //Stage0
    complex<double> *x1 = new complex<double>[num_point];
    cur_num_point = num_point;
    half_N = cur_num_point / 2;
    for (int i = 0; i < cur_num_point / 2; ++i)
    {
        W = W_value(cur_num_point, i);
        x1[i] = BU0(x[i], x[i + half_N], W);
        x1[i + half_N] = BU1(x[i], x[i + half_N], W);
    }

    //Stage1
    complex<double> *x2 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = W_value(cur_num_point, i);
            int index = i + l * cur_num_point;
            x2[index] = BU0(x1[index], x1[index + half_N], W);
            x2[index + half_N] = BU1(x1[index], x1[index + half_N], W);
        }
    delete x1;

    //Stage2
    complex<double> *x3 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = W_value(cur_num_point, i);
            int index = i + l * cur_num_point;
            x3[index] = BU0(x2[index], x2[index + half_N], W);
            x3[index + half_N] = BU1(x2[index], x2[index + half_N], W);
        }
    delete x2;

    //Stage3
    complex<double> *x4 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = W_value(cur_num_point, i);
            int index = i + l * cur_num_point;
            x4[index] = BU0(x3[index], x3[index + half_N], W);
            x4[index + half_N] = BU1(x3[index], x3[index + half_N], W);
        }
    delete x3;

    //Stage4
    complex<double> *x5 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = W_value(cur_num_point, i);
            int index = i + l * cur_num_point;
            x5[index] = BU0(x4[index], x4[index + half_N], W);
            x5[index + half_N] = BU1(x4[index], x4[index + half_N], W);
        }
    delete x4;

    //Stage5
    complex<double> *x6 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = W_value(cur_num_point, i);
            int index = i + l * cur_num_point;
            x6[index] = BU0(x5[index], x5[index + half_N], W);
            x6[index + half_N] = BU1(x5[index], x5[index + half_N], W);
        }
    delete x5;

    //FFT_shift
    FFT_shift(x6, X, num_point);
    delete x6;
}

void FFT_Radix4_64points(complex<double> *x, complex<double> *X)
{
    int num_point = 64;
    int cur_num_point;
    int half_N;
    int quarter_N;
    int loop;
    complex<double> W;

    cout << "FFT_Radix4_64points START" << endl;
    //Stage 0
    complex<double> *x1 = new complex<double>[num_point];
    cur_num_point = num_point;
    half_N = cur_num_point / 2;
    quarter_N = cur_num_point / 4;
    for (int i = 0; i < cur_num_point / 2; ++i)
    {
        if (i < quarter_N)
        {
            W = 1;
        }
        else
        {
            W.real(0);
            W.imag(-1);
        }
        x1[i] = BU0(x[i], x[i + half_N], W);
        x1[i + half_N] = BU1(x[i], x[i + half_N], W);
    }

    //Stage1
    complex<double> *x2 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = 1;
            int index = i + l * cur_num_point;
            x2[index] = BU0(x1[index], x1[index + half_N], W);
            x2[index + half_N] = BU1(x1[index], x1[index + half_N], W);
        }
    delete x1;

    //Rotation0
    quarter_N = num_point / 4;
    for (int i = 0; i < quarter_N; ++i)
    {
        //x2[i] *= 1;
        x2[i + quarter_N] *= W_value(num_point, 2 * i);
        x2[i + 2 * quarter_N] *= W_value(num_point, i);
        x2[i + 3 * quarter_N] *= W_value(num_point, 3 * i);
    }

    //Stage2
    complex<double> *x3 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    quarter_N = cur_num_point / 4;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            //W = W_value(cur_num_point, i);
            if (i < quarter_N)
            {
                W = 1;
            }
            else
            {
                W.real(0);
                W.imag(-1);
            }
            int index = i + l * cur_num_point;
            x3[index] = BU0(x2[index], x2[index + half_N], W);
            x3[index + half_N] = BU1(x2[index], x2[index + half_N], W);
        }
    delete x2;

    //Stage3
    complex<double> *x4 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = 1;
            int index = i + l * cur_num_point;
            x4[index] = BU0(x3[index], x3[index + half_N], W);
            x4[index + half_N] = BU1(x3[index], x3[index + half_N], W);
        }
    delete x3;

    //Rotation1
    quarter_N = num_point / 4 / 4;
    loop = num_point / (4*quarter_N);
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < quarter_N; ++i)
        {
            int index = i + l * quarter_N * 4;
            //x4[i] *= 1;
            x4[index + quarter_N] *= W_value(num_point/4, 2 * i);
            x4[index + 2 * quarter_N] *= W_value(num_point/4, i);
            x4[index + 3 * quarter_N] *= W_value(num_point/4, 3 * i);
        }

    //Stage4
    complex<double> *x5 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    quarter_N = cur_num_point / 4;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            //W = W_value(cur_num_point, i);
            if (i < quarter_N)
            {
                W = 1;
            }
            else
            {
                W.real(0);
                W.imag(-1);
            }
            int index = i + l * cur_num_point;
            x5[index] = BU0(x4[index], x4[index + half_N], W);
            x5[index + half_N] = BU1(x4[index], x4[index + half_N], W);
        }
    delete x4;

    //Stage5
    complex<double> *x6 = new complex<double>[num_point];
    cur_num_point /= 2;
    half_N = cur_num_point / 2;
    loop = num_point / cur_num_point;
    for (int l = 0; l < loop; ++l)
        for (int i = 0; i < cur_num_point / 2; ++i)
        {
            W = 1;
            int index = i + l * cur_num_point;
            x6[index] = BU0(x5[index], x5[index + half_N], W);
            x6[index + half_N] = BU1(x5[index], x5[index + half_N], W);
        }
    delete x5;

    //FFT_shift
    FFT_shift(x6, X, num_point);
    delete x6;
}

int main()
{
    cout << "START:" << endl;
    ifstream fin;
    ofstream fout;
    fin.open("x_data");
    fout.open("X_data");
    complex<double> x[64];
    complex<double> X[64];

    int a, b;
    for (int i = 0; i < 64; ++i)
    {
        fin >> a >> b;
        complex<double> temp((double)a, (double)b);
        x[i] = temp;
    }
    FFT_Radix4_64points(x, X);
    fout << "FFT_Radix4_64points" << endl;
    for (int i = 0; i < 64; ++i)
    {
        fout << "X["<< i + 1 <<"]:" << X[i] << endl;
    }
    fin.close();
    fout.close();
    return 0;
}
