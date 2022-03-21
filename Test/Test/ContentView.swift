import SwiftUI

@available(iOS 15.0, *)

struct ContentView: View {
    
    @Namespace var ns
    @State var expanded = false
    @State var opacity = 0.0
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            ZStack {
                if !expanded {
                        HStack {
                            Image("Profile1")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width:60, height:60)
                                .matchedGeometryEffect(id: "profile", in: ns)
                            
                            VStack(alignment:.leading) {
                                Text("Saim Khan")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .matchedGeometryEffect(id: "name", in: ns)
                                Text("Wilmslow, UK")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .matchedGeometryEffect(id: "location", in: ns)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.clear)
                                .background(.ultraThinMaterial)
                                .saturation(2)
                                .cornerRadius(8)
                                .shadow(radius: 8)
                                .matchedGeometryEffect(id: "bg", in: ns)
                        )
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.65, blendDuration: 0.15)){
                                expanded.toggle()
                            }
                        }
                    
                }else {
                    VStack {
                        ZStack(alignment:.top){
                            Image(systemName:"xmark")
                                .padding(2)
                                .foregroundColor(.primary)
                                .background(.black.opacity(0.15))
                                .clipShape(Capsule())
                                .frame(maxWidth:.infinity, alignment:.topTrailing)
                                .opacity(opacity)
                                .onAppear(perform: {
                                    withAnimation(.easeInOut.delay(0.3)){
                                        opacity = 1.0
                                    }
                                })} .onTapGesture {
                                    opacity = 0
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.775, blendDuration: 0.15)) {
                                        expanded.toggle()
                                    }
                                }
                        Image("Profile1")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width:120, height:120)
                            .matchedGeometryEffect(id: "profile", in: ns)
                        
                        VStack {
                            Text("Saim Khan")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .matchedGeometryEffect(id: "name", in: ns)
                            Text("Wilmslow, UK")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .matchedGeometryEffect(id: "location", in: ns)
                                
                            VStack {
                                Text("Sixth Form Student @MGS.")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .opacity(opacity)
                                Text("SwiftUI Developer.")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .opacity(opacity)
                            }.padding()
                            
                            HStack {
                                Text("Follow")
                                    .foregroundColor(.primary)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.clear)
                                            .background(.ultraThinMaterial)
                                            .saturation(3)
                                            .cornerRadius(10)
                                    )
                                Text("Message")
                                    .foregroundColor(.primary)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.clear)
                                            .background(.ultraThinMaterial)
                                            .saturation(3)
                                            .cornerRadius(10)
                                    )
                                Text("Call")
                                    .foregroundColor(.primary)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.clear)
                                            .background(.ultraThinMaterial)
                                            .saturation(3)
                                            .cornerRadius(10)
                                        
                                    )
                            }.opacity(opacity)
                                .onAppear(perform: {
                                    withAnimation(.easeInOut.delay(0.05)){
                                        opacity = 1.0
                                    }
                                }
                            )
                        }
                    }
                    .padding()
                    .frame(width:300)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.clear)
                            .background(.regularMaterial)
                            .saturation(2)
                            .cornerRadius(8)
                            .shadow(radius: 8)
                            .matchedGeometryEffect(id: "bg", in: ns)
                    )
                    .padding()
                    .offset(y:-130)
                }
                    
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView().preferredColorScheme(.dark)
        } else {
            // Fallback on earlier versions
        }
    }
}
