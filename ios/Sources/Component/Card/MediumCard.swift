import Model
import SwiftUI
import Styleguide

public struct MediumCard: View {
    private let title: String
    private let imageURL: URL?
    private let tag: Media
    private let date: Date
    private let isFavorited: Bool
    private let tapAction: () -> Void
    private let tapFavoriteAction: () -> Void

    public init(
        title: String,
        imageURL: URL?,
        tag: Media,
        date: Date,
        isFavorited: Bool,
        tapAction: @escaping () -> Void,
        tapFavoriteAction: @escaping () -> Void
    ) {
        self.title = title
        self.imageURL = imageURL
        self.tag = tag
        self.date = date
        self.isFavorited = isFavorited
        self.tapAction = tapAction
        self.tapFavoriteAction = tapFavoriteAction
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            ImageView(
                imageURL: imageURL,
                placeholder: .noImage,
                placeholderSize: .medium
            )
            .aspectRatio(225/114, contentMode: .fit)
            .layoutPriority(1)

            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(AssetColor.Base.primary.color)
                        .lineLimit(2)
                        .frame(maxHeight: .infinity, alignment: .top)

                    Text(date.formatted)
                        .font(.caption)
                        .foregroundColor(AssetColor.Base.tertiary.color)
                }

                HStack(spacing: 8) {
                    Tag(type: tag) {
                        // do something if needed
                    }

                    Spacer()

                    Button(action: tapFavoriteAction, label: {
                        let image = isFavorited ? AssetImage.iconFavorite.image : AssetImage.iconFavoriteOff.image
                        image
                            .renderingMode(.template)
                            .foregroundColor(AssetColor.primary.color)
                    })
                }
            }
        }
        .padding(16)
        .background(Color.clear)
        .onTapGesture(perform: tapAction)
    }
}

struct MediumCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MediumCard(
                title: "タイトルタイトルタイトルタイトルタイタイトルタイトルタイトルタイトルタイト...",
                imageURL: URL(string: ""),
                tag: .droidKaigiFm,
                date: Date(),
                isFavorited: false,
                tapAction: {},
                tapFavoriteAction: {}
            )
            .frame(width: 257, height: 258)
            .environment(\.colorScheme, .light)

            MediumCard(
                title: "タイトルタイトルタイトルタイトルタイタイトルタイトルタイトルタイトルタイト...",
                imageURL: URL(string: ""),
                tag: .medium,
                date: Date(),
                isFavorited: true,
                tapAction: {},
                tapFavoriteAction: {}
            )
            .frame(width: 257, height: 258)
            .environment(\.colorScheme, .light)

            MediumCard(
                title: "タイトル",
                imageURL: URL(string: ""),
                tag: .youtube,
                date: Date(),
                isFavorited: true,
                tapAction: {},
                tapFavoriteAction: {}
            )
            .frame(width: 257, height: 258)
            .environment(\.colorScheme, .light)

            MediumCard(
                title: "タイトルタイトルタイトルタイトルタイタイトルタイトルタイトルタイトルタイト...",
                imageURL: URL(string: ""),
                tag: .droidKaigiFm,
                date: Date(),
                isFavorited: false,
                tapAction: {},
                tapFavoriteAction: {}
            )
            .frame(width: 257, height: 258)
            .environment(\.colorScheme, .dark)

            MediumCard(
                title: "タイトルタイトルタイトルタイトルタイタイトルタイトルタイトルタイトルタイト...",
                imageURL: URL(string: ""),
                tag: .medium,
                date: Date(),
                isFavorited: true,
                tapAction: {},
                tapFavoriteAction: {}
            )
            .frame(width: 257, height: 258)
            .environment(\.colorScheme, .dark)

            MediumCard(
                title: "タイトル",
                imageURL: URL(string: ""),
                tag: .youtube,
                date: Date(),
                isFavorited: true,
                tapAction: {},
                tapFavoriteAction: {}
            )
            .frame(width: 257, height: 258)
            .environment(\.colorScheme, .dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
