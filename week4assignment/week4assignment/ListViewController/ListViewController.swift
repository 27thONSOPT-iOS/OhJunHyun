//
//  ListViewController.swift
//  week4assignment
//
//  Created by 오준현 on 2020/11/08.
//

import UIKit

class ListViewController: UIViewController {

    let naviView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "soptLogo")
        
        return imageView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        
        button.setTitle("프로필 작성하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = UIColor(red: 252/255, green: 205/255, blue: 6/255, alpha: 1)
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    let viview: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView(frame: .zero))
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.scrollIndicatorInsets = .zero
        cv.backgroundColor = .white
        
        return cv
    }()
    
    let image: [String] = ["juhyeok","nayeon","peace","heesoo","saeeun","wool","hansol","minju","younghun","minguru","yeonjeong","junyeop"]
    let name: [String] = ["이주혁","김나연","손평화","유희수","박세은","한울","김한솔","배민주","최영훈","강민구","이정연","홍준엽"]
    let hashtag: [String] = ["#hereis#아요#내꿈은#사과농장#ENFP","#이제막학기#여러분들이랑_친해지고_싶어요#번개스터디환영","#핸드피쓰 #이너피쓰 #배꼽도둑 #헬린이 #sson_peace7","#총무꿈나무 #유총무 #현재_소식중 #풉","#마 #아요는 #처음입니다","#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터","#고객중심#고객행동데이터기반한#UX디자이너#워너비,,","#디팟장 #개자이너 #최종목표는행복","#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI","#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당","#플레이스픽 #ENFJ #기획_디자인_개발_다","#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
    }
    
    func setUpLayout() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 420)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        collectionView.collectionViewLayout = layout
        
        collectionView.register(ListCollectionViewCell.self,
                                forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        collectionView.register(HeaderReuseView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderReuseView.identifier)
        view.addSubview(naviView)
        naviView.addSubview(logoImageView)
        naviView.addSubview(button)
        
        
        naviView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        naviView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        naviView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        naviView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        naviView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        logoImageView.centerYAnchor.constraint(equalTo: naviView.centerYAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: naviView.leftAnchor, constant: 17).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        button.centerYAnchor.constraint(equalTo: naviView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 132).isActive = true
        button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true

        collectionView.topAnchor.constraint(equalTo: naviView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }


}

extension ListViewController: UICollectionViewDelegate { }

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier,
                                                            for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.hashtagLabel.text = hashtag[indexPath.row]
        cell.imageView.image = UIImage(named: image[indexPath.row])
                
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                             withReuseIdentifier: HeaderReuseView.identifier,
                                                                             for: indexPath) as! HeaderReuseView
            headerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 420)
            let bannerImageView = UIImageView()
            let titleLabel: UILabel = {
               let label = UILabel()
                label.font = .systemFont(ofSize: 25, weight: .bold)
                label.text = "SOPT + NETWORKING"
                label.textColor = .white
                label.textAlignment = .center
                return label
            }()
            let label: UILabel = {
               let label = UILabel()
                label.font = .systemFont(ofSize: 10)
                label.text = "대학생 연합 IT 창업 동아리의 네트워킹을 위한 플랫폼입니다."
                label.textColor = .white
                label.textAlignment = .center
                return label
            }()
            let splitView: UIView = {
                let view = UIView()
                view.backgroundColor = UIColor(red: 252/255, green: 205/255, blue: 6/255, alpha: 1)
                return view
            }()
            bannerImageView.contentMode = .scaleAspectFill
            
            headerView.addSubview(bannerImageView)
            headerView.addSubview(titleLabel)
            headerView.addSubview(label)
            headerView.addSubview(splitView)

            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            splitView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
            label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            splitView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
            splitView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
            splitView.heightAnchor.constraint(equalToConstant: 3).isActive = true
            splitView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true

            
            bannerImageView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 420)
            bannerImageView.image = UIImage(named: "banner")

            headerView.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
            
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2, height: 230)
    }
}
