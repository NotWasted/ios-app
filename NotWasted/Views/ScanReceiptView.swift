//
//  ScanReceiptView.swift
//  NotWasted
//
//  Created by admin on 29/06/21.
//

import SwiftUI

struct ScanReceiptView: View {
    
    @State var isShowingImagePicker = false
    
    @State var receiptImage = UIImage()
    
    @StateObject private var scanReceiptVM = ScanReceiptViewModel()
    
    var body: some View {
        NavigationView {
//            Text("Upload Receipt")
//                .navigationTitle("Scan Receipt")
//
            VStack {
                Button(action: {
                    self.isShowingImagePicker.toggle()
                    self.scanReceiptVM.uploadStatus = 0
                }, label:  {
                    VStack {
                        Image(systemName: "camera")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 120, height: 90)
                            .padding()
                        Text("Upload a Receipt!")
                    }
                    
                })
                .sheet(isPresented: $isShowingImagePicker, content: {
                    ImagePickerView(isPresented: self.$isShowingImagePicker,
                                    selectedImage: self.$receiptImage)
                })
                
                if self.scanReceiptVM.uploadStatus == 1 {
                    Text("Image selected")
                        .foregroundColor(Color.green)
                }
                
                if self.scanReceiptVM.uploadStatus == 2 {
                    Text("Image uploaded")
                        .foregroundColor(.yellow)
                }
                
                if self.scanReceiptVM.uploadStatus == 3 {
                    Text("Pantry updated successfully!")
                        .foregroundColor(.purple)
                }
                
                
            }
        }.navigationTitle("Scan Receipt")
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    
    @Binding var selectedImage: UIImage
    
    //@Binding var scanReceiptVM: ScanReceiptViewModel
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // coordinater handles the selection of the image
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                print(selectedImage)
                self.parent.selectedImage = selectedImage
                //self.parent.scanReceiptVM.receiptImage = selectedImage
//                self.parent.scanReceiptVM.uploadImage()
            }
            self.parent.isPresented = false
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
}


struct ScanReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ScanReceiptView()
    }
}
