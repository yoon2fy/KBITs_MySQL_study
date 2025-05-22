package org.scoula.travel;
// travel.csv를 읽어 TravelVO 객체로 변환하여 다음과 같이 출력하세요

import java.awt.*;
import java.io.FileReader;

import com.opencsv.bean.CsvToBeanBuilder;
import org.scoula.travel.domain.TravelVO;

import java.io.InputStreamReader;
import java.io.InputStream;
import java.util.List;

public class CSVTest2 {
    public static void main(String[] args) {
        try {
            InputStream is = CSVTest2.class.getClassLoader().getResourceAsStream("travel.csv");
            if (is == null) {
                System.err.println("리소스 travel.csv 를 찾을 수 없습니다.");
                return;
            }

            List<TravelVO> travels = new CsvToBeanBuilder<TravelVO>(new InputStreamReader(is))
                    .withType(TravelVO.class)
                    .build()
                    .parse();

            travels.forEach(System.out::println);
        } catch (Exception e) {
            e.printStackTrace(); // 에러 디버깅용
        }
    }
}
