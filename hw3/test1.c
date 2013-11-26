/*
    Alden Quimby
    adq2101
    Problem 1, part c
    test1.c
*/

int main() 
{
    int a[3][2];
    int i, j, sum;
    
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 2; j++)
        {
            sum += a[i][j];
        }
    }
    
    return sum;
}