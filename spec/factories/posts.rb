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

  end
end
