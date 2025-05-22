package org.scoula.travel;
// travel.csv 파일을 읽어 다음과 같이 출력하는 클래스

import com.opencsv.CSVReader;
import java.io.InputStreamReader;
import java.io.InputStream;

public class CSVTest1 {
    public static void main(String[] args) throws Exception {
        InputStream is = CSVTest1.class.getClassLoader().getResourceAsStream("travel.csv");
        if (is == null) {
            System.err.println("파일을 찾을 수 없습니다: travel.csv");
            return;
        }
        CSVReader csvReader = new CSVReader(new InputStreamReader(is));
        String[] line;
        while ((line = csvReader.readNext()) != null) {
            System.out.println(String.join(",", line));
        }
    }
}
