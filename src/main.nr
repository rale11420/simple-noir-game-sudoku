fn main(solution: [[u8; 9]; 9], solved: pub [[u8; 9]; 9]) {
    assert(check_row(solution) & check_column(solution) & check_square(solution));
}

fn check_row(solution: [[u8; 9]; 9]) -> bool {
    for i in 0..9 {
        assert(solution[i].sort() == [1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }
    true
}

fn check_column(solution: [[u8; 9]; 9]) -> bool {
    for i in 0..9 {
        let mut column: [u8; 9]= [
            solution[0][i], 
            solution[1][i], 
            solution[2][i], 
            solution[3][i], 
            solution[4][i], 
            solution[5][i], 
            solution[6][i], 
            solution[7][i], 
            solution[8][i]
        ];

        assert(column.sort() == [1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }
    true
}

fn check_square(solution: [[u8; 9]; 9]) -> bool {
    true
}

// #[test]
// fn test_main() {
//     main(1, 2);

//     // Uncomment to make test fail
//     // main(1, 1);
// }