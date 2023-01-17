require 'rails_helper'

RSpec.describe Unsplash do
  let!(:photo_data) do
    { id: 'nKY59_d9FlA',
      created_at: '2018-08-15T22:12:51Z',
      updated_at: '2023-01-17T02:04:53Z',
      promoted_at: nil,
      width: 4406,
      height: 2938,
      color: '#26260c',
      blur_hash: 'LxEy}Cxuoct7.At7odogXVobjboe',
      description: 'During our road trip we decided to visit Brasov city and near Castle Peles, unfortunately it was closed that day and we didn’t make it inside - but still, it’s a wonderful place.',
      alt_description: 'white and brown concrete structure',
      urls: { raw: 'https://images.unsplash.com/photo-1534371020656-6b85825f2b1a?ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA&ixlib=rb-4.0.3',
              full: 'https://images.unsplash.com/photo-1534371020656-6b85825f2b1a?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA&ixlib=rb-4.0.3&q=80',
              regular: 'https://images.unsplash.com/photo-1534371020656-6b85825f2b1a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA&ixlib=rb-4.0.3&q=80&w=1080',
              small: 'https://images.unsplash.com/photo-1534371020656-6b85825f2b1a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA&ixlib=rb-4.0.3&q=80&w=400',
              thumb: 'https://images.unsplash.com/photo-1534371020656-6b85825f2b1a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA&ixlib=rb-4.0.3&q=80&w=200',
              small_s3: 'https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1534371020656-6b85825f2b1a' },
      links: { self: 'https://api.unsplash.com/photos/nKY59_d9FlA',
               html: 'https://unsplash.com/photos/nKY59_d9FlA',
               download: 'https://unsplash.com/photos/nKY59_d9FlA/download?ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA',
               download_location: 'https://api.unsplash.com/photos/nKY59_d9FlA/download?ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA' },
      likes: 221,
      liked_by_user: false,
      current_user_collections: [],
      sponsorship: nil,
      topic_submissions: {},
      user: { id: '8gnRJPeJrPw',
              updated_at: '2023-01-13T14:28:45Z',
              username: 'majklvelner',
              name: 'Majkl Velner',
              first_name: 'Majkl',
              last_name: 'Velner',
              twitter_username: nil,
              portfolio_url: nil,
              bio: 'Live long and prosper',
              location: 'Slovakia',
              links: { self: 'https://api.unsplash.com/users/majklvelner',
                       html: 'https://unsplash.com/ko/@majklvelner',
                       photos: 'https://api.unsplash.com/users/majklvelner/photos',
                       likes: 'https://api.unsplash.com/users/majklvelner/likes',
                       portfolio: 'https://api.unsplash.com/users/majklvelner/portfolio',
                       following: 'https://api.unsplash.com/users/majklvelner/following',
                       followers: 'https://api.unsplash.com/users/majklvelner/followers' },
              profile_image: { small: 'https://images.unsplash.com/profile-1508313803943-9a5a74cee9a0?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32',
                               medium: 'https://images.unsplash.com/profile-1508313803943-9a5a74cee9a0?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64',
                               large: 'https://images.unsplash.com/profile-1508313803943-9a5a74cee9a0?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128' },
              instagram_username: 'majklvelner',
              total_collections: 0,
              total_likes: 2,
              total_photos: 40,
              accepted_tos: true,
              for_hire: true,
              social: { instagram_username: 'majklvelner', portfolio_url: nil, twitter_username: nil, paypal_email: nil } },
      tags: [{ type: 'search', title: 'romania' }, { type: 'search', title: 'peles castle' }, { type: 'search', title: 'architecture' }] }
  end
  let!(:photo) { Unsplash.new(photo_data) }

  it 'exists and has attributes' do
    expect(photo).to be_an_instance_of(Unsplash)
    expect(photo.alt_tag).to eq('white and brown concrete structure')
    expect(photo.url).to eq('https://images.unsplash.com/photo-1534371020656-6b85825f2b1a?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MDAxNzd8MHwxfHNlYXJjaHwxfHxSb21hbmlhfGVufDB8fHx8MTY3Mzk4MDYxOA&ixlib=rb-4.0.3&q=80')
  end
end
