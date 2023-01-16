require 'rails_helper'

RSpec.describe Country do
  let!(:country_data) do
    { name: { common: 'Grenada', official: 'Grenada', nativeName: { eng: { official: 'Grenada', common: 'Grenada' } } },
      por: { official: 'Grenada', common: 'Granada' },
      rus: { official: 'Гренада', common: 'Гренада' },
      slk: { official: 'Grenada', common: 'Grenada' },
      spa: { official: 'Granada', common: 'Grenada' },
      swe: { official: 'Grenada', common: 'Grenada' },
      tur: { official: 'Grenada', common: 'Grenada' },
      urd: { official: 'گریناڈا', common: 'گریناڈا' },
      zho: { official: '格林纳达', common: '格林纳达' },
      latlng: [12.11666666, -61.66666666],
      por: { official: 'Grenada', common: 'Granada' },
      rus: { official: 'Гренада', common: 'Гренада' },
      slk: { official: 'Grenada', common: 'Grenada' },
      spa: { official: 'Granada', common: 'Grenada' },
      swe: { official: 'Grenada', common: 'Grenada' },
      tur: { official: 'Grenada', common: 'Grenada' },
      urd: { official: 'گریناڈا', common: 'گریناڈا' },
      zho: { official: '格林纳达', common: '格林纳达' },
      latlng: [12.11666666, -61.66666666],
      landlocked: false,
      por: { official: 'Grenada', common: 'Granada' },
      rus: { official: 'Гренада', common: 'Гренада' },
      slk: { official: 'Grenada', common: 'Grenada' },
      spa: { official: 'Granada', common: 'Grenada' },
      swe: { official: 'Grenada', common: 'Grenada' },
      tur: { official: 'Grenada', common: 'Grenada' },
      urd: { official: 'گریناڈا', common: 'گریناڈا' },
      zho: { official: '格林纳达', common: '格林纳达' },
      latlng: [12.11666666, -61.66666666],
      landlocked: false,
      area: 344.0,
      demonyms: { eng: { f: 'Grenadian', m: 'Grenadian' }, fra: { f: 'Grenadienne', m: 'Grenadien' } },
      flag: '🇬🇩',
      maps: { googleMaps: 'https://goo.gl/maps/rqWyfUAt4xhvk1Zy9', openStreetMaps: 'https://www.openstreetmap.org/relation/550727' },
      population: 112519,
      fifa: 'GRN',
      car: { signs: ['WG'], side: 'left' },
      timezones: ['UTC-04:00'],
      continents: ['North America'],
      flags: { png: 'https://flagcdn.com/w320/gd.png', svg: 'https://flagcdn.com/gd.svg' },
      coatOfArms: { png: 'https://mainfacts.com/media/images/coats_of_arms/gd.png', svg: 'https://mainfacts.com/media/images/coats_of_arms/gd.svg' },
      startOfWeek: 'monday',
      capitalInfo: { latlng: [32.38, -64.68] } }
  end

  let!(:country) { Country.new(country_data) }

  it 'exists and has attributes' do
    expect(country).to be_an_instance_of(Country)
    expect(country.name).to eq('Grenada')
  end
end
