FactoryBot.define do
  factory :post do
    university "大阪大学"
    department "工学部"
    major "電子情報工学科"
    professor "舟木剛"
    detail "教授はひねくれてます"
    association :user

    factory :university_is_nil do
      university nil
    end

    factory :department_is_nil do
      department nil
    end

    factory :major_is_nil do
      major nil
    end

    factory :professor_is_nil do
      professor nil
    end

    factory :detail_is_nil do
      detail nil
    end


    factory :hunaki_labo2 do
      detail "朝から晩まで研究しないと卒業させてもらえません。"
    end

    factory :hunaki_labo3 do
      detail "教授が他の研究室の教授よりとにかく厳しいです"
    end

    factory :hunaki_labo4 do
      detail "隔週土曜日に研究会という名の進捗発表会があります。"
    end

    factory :takai_labo do
      university "早稲田大学"
      department "理工学部"
      major "機械工学科"
      professor "橘"
      detail "教授がとても優しくホワイト研究室です"
      association :user
    end

    factory :takai_labo2 do
      university "早稲田大学"
      department "理工学部"
      major "機械工学科"
      professor "橘"
      detail "教授が結構放置気味なので、そんなに研究しなくても卒業できます"
      association :user
    end

  end
end
