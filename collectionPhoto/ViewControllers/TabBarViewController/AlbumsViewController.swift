//
//  AlbumsViewController.swift
//  collectionPhoto
//
//  Created by Роман Назаров on 30.07.2022.
//

import UIKit

extension AlbumsViewController {
    func appendItems() {
        myAlbums.append(Albums(section: .myAlbums, album: [Album(image: UIImage(named: "image1")),
                                                           Album(image: UIImage(named: "image1")),
                                                           Album(image: UIImage(named: "image1")),
                                                           Album(image: UIImage(named: "image1"))
                                                          ], name: "Whatsapp"))
        
        myAlbums.append(Albums(section: .myAlbums, album: [Album(image: UIImage(named: "image2")),
                                                           Album(image: UIImage(named: "image2")),
                                                          ], name: "Избранное"))
        
        myAlbums.append(Albums(section: .myAlbums, album: [Album(image: UIImage(named: "image3")),
                                                           Album(image: UIImage(named: "image3")),
                                                           Album(image: UIImage(named: "image3")),
                                                          ], name: "Недавние"))
        
        myAlbums.append(Albums(section: .myAlbums, album: [Album(image: UIImage(named: "image4")),
                                                           Album(image: UIImage(named: "image4")),
                                                          ], name: "Документы"))
        
        myAlbums.append(Albums(section: .myAlbums, album: [Album(image: UIImage(named: "image5")),
                                                           Album(image: UIImage(named: "image5")),
                                                           Album(image: UIImage(named: "image5")),
                                                           Album(image: UIImage(named: "image5")),
                                                           Album(image: UIImage(named: "image5")),
                                                           Album(image: UIImage(named: "image11")),
                                                          ], name: "Путешествие"))
        
        myAlbums.append(Albums(section: .myAlbums, album: [Album(image: UIImage(named: "image3")),
                                                           Album(image: UIImage(named: "image3")),
                                                           Album(image: UIImage(named: "image12")),
                                                          ], name: "Отпуск"))
        
        peopleAndPlacesAlbums.append(Albums(section: .peopleAndPlacesAlbums, album: [Album(image: UIImage(named: "image6")),
                                                                                     Album(image: UIImage(named: "image6")),
                                                                                     Album(image: UIImage(named: "image6")),
                                                                                    ], name: "VK"))
        
        peopleAndPlacesAlbums.append(Albums(section: .peopleAndPlacesAlbums, album: [Album(image: UIImage(named: "image7")),
                                                                                     Album(image: UIImage(named: "image7")),
                                                                                     Album(image: UIImage(named: "image7")),
                                                                                    ], name: "Facebook"))
        
        peopleAndPlacesAlbums.append(Albums(section: .peopleAndPlacesAlbums, album: [Album(image: UIImage(named: "image8"))
                                                                                    ], name: "Twitter"))
        
        peopleAndPlacesAlbums.append(Albums(section: .peopleAndPlacesAlbums, album: [Album(image: UIImage(named: "image9"))
                                                                                    ], name: "Telegram"))
        
        peopleAndPlacesAlbums.append(Albums(section: .peopleAndPlacesAlbums, album: [Album(image: UIImage(named: "image10")),
                                                                                     Album(image: UIImage(named: "image10")),
                                                                                    ], name: "Одноклассники"))
        
        mediaTypes.append(Albums(section: .mediaTypes, album: [Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image2")),
                                                               Album(image: UIImage(named: "image4")),
                                                               Album(image: UIImage(named: "image6")),
                                                               Album(image: UIImage(named: "image8"))
                                                              ], name: "Видео", icon: UIImage(systemName: "video")))
        mediaTypes.append(Albums(section: .mediaTypes, album: [Album(image: UIImage(named: "image12")),
                                                               Album(image: UIImage(named: "image12")),
                                                               Album(image: UIImage(named: "image11")),
                                                              ], name: "Селфи", icon: UIImage(systemName: "person.crop.rectangle")))
        mediaTypes.append(Albums(section: .mediaTypes, album: [Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image1")),
                                                              ], name: "Фото Live Photos", icon: UIImage(systemName: "photo")))
        mediaTypes.append(Albums(section: .mediaTypes, album: [Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image1")),
                                                              ], name: "Портреты", icon: UIImage(systemName: "cube")))
        mediaTypes.append(Albums(section: .mediaTypes, album: [Album(image: UIImage(named: "image12")),
                                                               Album(image: UIImage(named: "image12")),
                                                               Album(image: UIImage(named: "image1")),
                                                              ], name: "Панорамы", icon: UIImage(systemName: "pano")))
        mediaTypes.append(Albums(section: .mediaTypes, album: [Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image1")),
                                                               Album(image: UIImage(named: "image1")),
                                                              ], name: "Скриншоты", icon: UIImage(systemName: "camera.viewfinder")))
        
        other.append(Albums(section: .other, album: [Album(image: UIImage(named: "image7")),
                                                     Album(image: UIImage(named: "image2")),
                                                     Album(image: UIImage(named: "image2")),
                                                    ], name: "Импортированные", icon: UIImage(systemName: "square.and.arrow.down")))
        other.append(Albums(section: .other, album: [Album(image: UIImage(named: "image6")),
                                                     Album(image: UIImage(named: "image2")),
                                                     Album(image: UIImage(named: "image3")),
                                                    ], name: "Скрытые", icon: UIImage(systemName: "eye.slash")))
        other.append(Albums(section: .other, album: [Album(image: UIImage(named: "image1")),
                                                     Album(image: UIImage(named: "image3")),
                                                     Album(image: UIImage(named: "image5")),
                                                    ], name: "Недавно удаленные", icon: UIImage(systemName: "trash")))
        
    }
}


