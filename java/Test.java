
public class Test {

    class Counter {
        private int value_;
        public Counter(int initialValue) {
            value_ = initialValue;
        }

        public int getValue() {
            return value_;
        }

        public void setValue(int value) {
            value_ = value;
        }
    }
    
    class Mutator implements Runnable {
        private final Counter counter_;
        private final int d_;
        private final int n_;
    
        public Mutator(Counter counter, int d, int n) {
            counter_ = counter;
            d_ = d;
            n_ = n;
        }

        @Override
        public void run() {
            for (int i = 0; i < n_; i++) {
                int value = counter_.getValue();
                value += d_;
                counter_.setValue(value);
            }
        }
    }

    public Test() {
    }

    public void run() throws InterruptedException {
        int n = 1000000;
        Counter counter = new Counter(n);
        Mutator m1 = new Mutator(counter, 1, n);
        Mutator m2 = new Mutator(counter, -1, n);
        Thread t1 = new Thread(m1);
        Thread t2 = new Thread(m2);
        t1.start();
        t2.start();
        t1.join();
        t2.join();
        System.out.println(counter.getValue());
    }
    
    public static void main(String[] args)  throws InterruptedException {
        new Test().run();
    }
}
