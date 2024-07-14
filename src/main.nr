global N: u8 = 9;
global N2: u32 = 81;

fn check_line(a: [u8; N2]) -> bool {
    for i in 0..N {
        let mut line = [0; N];
        for j in 0..N {
            line[j] = a[N*i+j];
        }
        check_cards(line);
    }
    true
}

fn check_column(a: [u8; N2]) -> bool {
    for j in 0..9 {
        let mut col = [0; N];
        for i in 0..N {
            col[i] = a[N*i+j];
        }
        check_cards(col);
    }
    true
}

fn check_square(a: [u8; N2]) -> bool {
    let N3 = N / 3;
    for i in 0..N3 {
        for j in 0..N3 {
            let mut square = [0; N];
            for u in 0..N3 {
                for v in 0..N3 {
                    square[N3*u+v] =a[N*(N3*i+u)+N3*j+v];
                }
            }
            check_cards(square);
        }
    }
    true
}

fn check_puzzle(solution: [u8; N2], puzzle: [u8; N2]) -> bool {
    for i in 0..N {
        for j in 0..N {
            assert((puzzle[N * i + j] == 0) | (puzzle[N * i + j] == solution[N * i + j]));
        }
    }
    true
}

fn check_cards(a: [u8; N]) {
    check_cards_best(a);
}

fn check_cards_best(a: [u8; N]) {
    let mut s : Field = 0;
    for k in 1..N + 1 {
        let mut p : Field = 1;
        for j in 0..N {
            p = p * (k -  a[j]) as Field;
        }
        s = s + p;
    }

    let mut p : Field = 1;
    for j in 0..N - 1 {
        p = p * (a[j] as Field);
    }
    assert(p != 0);
    assert(s == 0);
}

fn check_cards_base(a: [u8; 9]) {
    for i in 0..9 {
        assert(!((a[i] < 1) | (a[i] > 9)));
        for k in 0..i {
            assert(a[k] != a[i]);
        }
    }
}

fn check_cards_sort(a: [u8; 9]) {
    assert(sort(a) == [1, 2, 3, 4, 5, 6, 7, 8, 9]);
}

fn check_cards_plus(a: [u8; N]) {
    let mut s = 0 as Field;
    for i in 0..N {
        assert(a[i] != 0);
        for k in 0..i {
            assert(a[k] != a[i]);
        }
        s = s + a[i] as Field;
    }
    assert(s == 45);
}

fn check_cards_sc(a: [u8; 9]) {
    let mut s : Field = 0;
    for k in 1..10 {
        let mut p : Field = 1;
        for j in 0..9 {
            p = p * (k -  a[j])  as Field;
        }
        s = s + p;
    }
    for j in 0..9 {
        assert(a[j] != 10);
    }
    assert(s == 0);
}

fn sort(mut a: [u8; 9]) -> [u8; 9] {
    //std::array::sort(a)
    for i in 1..N {
        for j in 0..i {
            if (a[i] < a[j]) {
                let c = a[j];
                a[j] = a[i];
                a[i]= c;
            }
        }
    }
    a
}

fn main(solution: [u8; 81], puzzle: pub [u8; 81]) -> pub bool {
    check_puzzle(solution, puzzle)
        & check_line(solution)
        & check_square(solution)
        & check_column(solution)
}