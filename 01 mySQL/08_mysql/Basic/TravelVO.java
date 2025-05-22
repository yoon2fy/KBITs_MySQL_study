package org.scoula.travel.domain;
// travel.csv를 읽어 TravelVO 객체로 변환하여 다음과 같이 출력하세요

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.opencsv.bean.CsvBindByName;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class TravelVO {
    @CsvBindByName
    private Long no;

    @CsvBindByName
    private String district;

    @CsvBindByName
    private String title;

    @CsvBindByName
    private String description;

    @CsvBindByName
    private String address;

    @CsvBindByName
    private String phone;

    private List<TravelImageVO> images;
}