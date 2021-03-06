import Component
import ComposableArchitecture
import Model
import SwiftUI
import Styleguide

struct MediaSection: View {

    var icon: SwiftUI.Image
    var title: String
    let store: Store<[FeedItem], ViewAction>

    enum ViewAction {
        case showMore
    }

    var body: some View {
        VStack(spacing: 0) {
            WithViewStore(store) { viewStore in
                MediaSectionHeader(
                    icon: icon,
                    title: title,
                    moreAction: { viewStore.send(.showMore) }
                )
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(viewStore.state) { item in
                            MediumCard(
                                title: item.title.get(by: .ja),
                                imageURL: URL(string: item.image.standardURLString),
                                tag: item.media,
                                date: item.publishedAt,
                                isFavorited: false,
                                tapAction: {},
                                tapFavoriteAction: {}
                            )
                            .aspectRatio(257.0 / 258, contentMode: .fit)
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
        }
        .aspectRatio(375.0 / 301, contentMode: .fit)
    }
}

struct MediaSection_Previews: PreviewProvider {

    private static let mockItems: [FeedItem] = [
        .init(
            id: "0",
            image: .init(largeURLString: "", smallURLString: "", standardURLString: ""),
            link: "",
            media: .medium,
            publishedAt: .init(),
            summary: .init(enTitle: "", jaTitle: ""),
            title: .init(enTitle: "", jaTitle: "DroidKaigi 2020でのCodelabsについて")
        ),
        .init(
            id: "1",
            image: .init(largeURLString: "", smallURLString: "", standardURLString: ""),
            link: "",
            media: .medium,
            publishedAt: .init(),
            summary: .init(enTitle: "", jaTitle: ""),
            title: .init(enTitle: "", jaTitle: "DroidKaigi 2020 Codelabs")
        ),
    ]

    static var previews: some View {
        let sizeCategories: [ContentSizeCategory] = [
            .large, // Default
            .extraExtraExtraLarge
        ]
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ForEach(sizeCategories, id: \.self) { sizeCategory in
                MediaSection(
                    icon: AssetImage.iconBlog.image.renderingMode(.template),
                    title: L10n.MediaScreen.Section.Blog.title,
                    store: .init(initialState: mockItems, reducer: .empty, environment: {})
                )
                .background(AssetColor.Background.primary.color)
                .environment(\.sizeCategory, sizeCategory)
                .environment(\.colorScheme, colorScheme)
            }
        }
        .previewLayout(.sizeThatFits)
        .accentColor(AssetColor.primary.color)
    }
}
