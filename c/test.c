#include <stdio.h>

int main() {
  int a, b, d;
  printf("Enter two integers separated by a space: ");
  scanf("%d %d", &a, &b);

  for ( int i = 1; i <= a && i <= b; ++i ) {
    if( ! ( a % i ) && ! ( b % i ) ) {
      d = i;
    }
  }

  printf ( "%d, %d -> %d\n", a, b, d);
  return 0;
}
