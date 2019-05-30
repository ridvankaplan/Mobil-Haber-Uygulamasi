import React, {Component} from 'react';
import { createStackNavigator, createAppContainer } from 'react-navigation';
import { Title } from 'native-base';
import BackgroundTimer from 'react-native-background-timer';
import RNFetchBlob from 'react-native-fetch-blob';
import {
  Alert,
  StyleSheet, 
  Text, 
  View,
  ScrollView,
  ActivityIndicator,
  FlatList,
  Image,
  Button,
  RefreshControl
} from 'react-native';

//Secilen haberin bilgilerinin icinde bulunacagi degiskenler
global.id;
global.haber;
global.baslik;
global.resim;
global.like;
global.dislike;
global.view;
global.date;
global.kategori = "1"; //Defaultta 1 atarak tum haberleri listelenir
global.kontrol=0;
global.butonKontrol; // Butonun tiklanip tiklanmadigi kontrolu icin


//Arkaplanda her 1 saniyede icerisindeki islemleri yaptirir. 1000 milisaniye == 3 saniye
const intervalId = BackgroundTimer.setInterval(() => {

  RNFetchBlob.fetch('GET', 'http://192.168.43.25/haber/json.php?notification')
  .then((res) => {
    if(res.json()["bildirim"] === "true" ){
      Alert.alert('Yeni Haber Eklendi')
  }
})
  // Status code is not 200
  .catch((errorMessage) => {
    console.log(errorMessage)
}) 
}, 1000);


export default class App extends Component<{}> {
     render(){
        return(
        <AppContainer />
          )
          }
}

class HomeScreen extends React.Component {

    constructor(props){
      super(props);
      this.state = {
      loading: true,
      dataSource:[],
      refreshing:false,
      };

    }

    //Json dosyasında veriler alinip decode edilip dataSource dizisine atilir
    componentDidMount(){
      RNFetchBlob.fetch('GET', 'http://192.168.43.25/haber/json.php?json')
      .then((res) => {
        this.setState({
          loading: false,
          dataSource: res.json()
         })

  })
      // Status code is not 200
      .catch((errorMessage) => {
        console.log(errorMessage)
  }) 

  }
    


  render() {

      if( this.state.loading ){
          return( 
            <View style={styles.loader}> 
              <ActivityIndicator size="large" color="#0000ff"/>
            </View>
        )}

    return (

      // Ilk anasayfa da gösterilen ekran. Istenilen kategoriye tiklandiginde secilen kategoriyi degiskenine atip alt class'ina gider ve kontrolleri yaptiktan 
      // sonra o kategoriye ait haberleri listeler
      
      <View style={ styles.container }>
          {this.componentDidMount()}
          <View style= { { borderRadius: 12 , borderColor: 'black', borderWidth:1, alignItems:'center'} } >
                      <Text onPress={ () => this.selectCategory("1" ) } style= {{fontSize: 24 , color: 'red' , fontWeight:'bold' }}>Türkiye Haberleri</Text>
          </View>

          <View style= {{ backgroundColor: 'white', height: 50, alignItems: 'center', flexDirection: 'row', marginLeft:15 }}>
                <Text onPress={ () => this.selectCategory("Gundem" ) }  style= {{flex:1}}>Gündem</Text>
                <Text onPress={ () => this.selectCategory("Spor" ) } style= {{flex:1}}>Spor</Text>
                <Text onPress={ () => this.selectCategory("Egitim" ) } style= {{flex:1}}>Eğitim</Text>
                <Text onPress={ () => this.selectCategory("Ekonomi" ) } style= {{flex:1}}>Ekonomi</Text>
          </View>
          
          <FlatList
              //Gelen haberleri diziden flatlist e atip renderItem ile parcaliyoruz
              data= {this.state.dataSource}
              keyExtractor={(item, index) => index.toString()} 
              ItemSeparatorComponent = {this.FlatListItemSeparator}
              renderItem= {item => this.renderItem(item)}
              refreshControl={
                <RefreshControl
                  refreshing= {this.state.refreshing}
                  onRefresh= {this.handleRefresh.bind(this)}
                  />
              }
             
          />
          
      </View>
      
    ); 
  }

  handleRefresh(){
    this.setState({refreshing: true});
    this.componentDidMount();
    this.setState({refreshing: false})

  }

  
  renderItem=(data)=>
<ScrollView>

  <View style={{flex: 4, height: 100, flexDirection: 'row'}}>
    
      <Image 
       style={styles.resim}
      source={{uri: data.item.Resim}}
      />
       
       <View style= {{flex:4, backgroundColor: 'white', margin: 5}}>

             <View style= {{flex:1.8, backgroundColor: 'white' ,borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                 <Text onPress={ () => this.setVariable(data.item.id, data.item.Icerik, data.item.Baslik, data.item.Resim, data.item.Begenme, data.item.Begenmeme, data.item.Goruntulenme, data.item.Tarih, data.item.ButonKontrol) } style= {{ fontWeight: 'bold', color: 'blue', fontSize: 16 }}>{data.item.Baslik}</Text>
             </View>

             <View style= {{flex:5, backgroundColor: 'white' ,borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                 <Text onPress={ () => this.setVariable(data.item.id, data.item.Icerik, data.item.Baslik, data.item.Resim, data.item.Begenme, data.item.Begenmeme, data.item.Goruntulenme, data.item.Tarih, data.item.ButonKontrol) } style= {{ color: 'black', fontSize: 12 }}>{data.item.Icerik}</Text>
             </View>

        </View>

   </View>

</ScrollView>


    // Ayrıntılı okunmak istenen haberin bilgilerini degiskenlere atiyoruz
    // Sonrasinda haber class'ina gidip secilen haberi ekrana getiriyor
    setVariable(id, haber, baslik, resim, like, dislike, view, date, butonKontrol)
    {
        global.id = id;
        global.haber = haber;
        global.baslik = baslik;
        global.resim = resim;
        global.like = like;
        global.dislike = dislike;
        view++;
        global.view = view ;
        global.date = date;
        global.butonKontrol = butonKontrol;
        this.props.navigation.navigate('News')
    }

  // Kategori secildiginde kategorinin ismi degiskene atilip kategori islemlerinin yapildigi kisma gidiyor
  selectCategory(index)
    {
        global.kategori = index;
        this.props.navigation.navigate('Category')

    }
}



// Secilen haberin ayrintlarinin gosterildigi class
class icerikHaber extends HomeScreen {

  render() {

    return (

     <View style={{ flex: 2, height: 100 }}>

        <View style= { { borderRadius: 12 , borderColor: 'black', borderWidth:1, alignItems:'center'} } >
              <Text onPress={ () => this.selectCategory("1" ) } style= {{fontSize: 24 , color: 'red' , fontWeight:'bold' }}>Türkiye Haberleri</Text>
        </View>

         <Image 
          style={{
          flex:2, 
          backgroundColor: 'powderblue', 
          marginTop: 5, 
          borderRadius: 40}} 
          source={{uri: global.resim }}
         />
        
          <View  style= {{flex:4, margin: 5, borderRadius: 16}}>                  
                  <ScrollView>

                      <View style= {{flex:1, backgroundColor: 'teal' ,borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                            <Title>{global.baslik}</Title>
                      </View>

                      <View style= {{flex:8, backgroundColor: 'gray' ,borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                            <Text style= {{color: 'white', fontSize: 12 }}>{global.haber}</Text>
                      </View>

                      <View style= {{ margin: 5}}>
                          <Button disabled={this.disabledControl()} color='blue' onPress={ () => this.incLike() } title= 'İYİ'></Button>
                          <Button disabled={this.disabledControl()} color= 'red' onPress={ () => this.incDislike() } title= 'KÖTÜ'></Button>
                      </View>

                      <View style= {{flex:8, backgroundColor: 'blue', flexDirection: 'row', borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10}} >
                            <Text style= {{flex :1, color: 'white', fontSize: 14 }}>İyi : {global.like}</Text>
                            <Text style= {{flex :1, color: 'white', fontSize: 14 }}>Kötü : {global.dislike}</Text>                  
                            <Text style= {{flex :1, color: 'white', fontSize: 14 }}>Görüntülenme : {global.view}</Text>
                      </View>
                      
                      <View style= {{flex:8, backgroundColor: 'red', borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                            <Text style= {{flex :1, color: 'white', fontSize: 14 }}>Yayınlanma Tarihi : {global.date}</Text>
                      </View>

                  </ScrollView>
            </View>
           
            {this.incView()}

      </View>

    );
  }

  incView(){
   kontrol++;
   if(kontrol%2){
      RNFetchBlob.fetch('GET', "http://192.168.43.25/haber/json.php?view&id=" + global.id)
      .catch((errorMessage) => {
        console.log(errorMessage)
      })
    }    
  }

  incLike(){
    RNFetchBlob.fetch('GET', "http://192.168.43.25/haber/json.php?like&id=" + global.id)
    .catch((errorMessage) => {
      console.log(errorMessage)
    })

    global.butonKontrol = "1"
    global.like++;
    this.props.navigation.navigate('News1')
  }  

   incDislike(){
    RNFetchBlob.fetch('GET', "http://192.168.43.25/haber/json.php?dislike&id=" + global.id)
    .catch((errorMessage) => {
      console.log(errorMessage)
    })

    global.butonKontrol = "1"
    global.dislike++;
    this.props.navigation.navigate('News1')

}

disabledControl(){
  if(global.butonKontrol === "1"){
    return true;
  }
  return false;

  }

}


class filterCategory extends HomeScreen {

  // Ilk calisan render fonksiyonunda ekrana header kisimlarini bastiktan sonra asil verilerin ekrana basilacagi kisma gidiyor
  render() {

    if( this.state.loading ){
      return( 
        <View style={styles.loader}> 
          <ActivityIndicator size="large" color="#0c9"/>
        </View>
    )}

return (

  <View style={ styles.container }>
  
      <View style= { { borderRadius: 12 , borderColor: 'black', borderWidth:1, alignItems:'center'} } >
                  <Text onPress={ () => this.selectCategory("1" ) } style= {{fontSize: 24 , color: 'red' , fontWeight:'bold' }}>Türkiye Haberleri</Text>
      </View>

      <FlatList
          data= {this.state.dataSource}
          keyExtractor={(item, index) => index.toString()} 
          ItemSeparatorComponent = {this.FlatListItemSeparator}
          renderItem= {item => this.renderItem(item)}
          refreshControl={
            <RefreshControl
              refreshing= {this.state.refreshing}
              onRefresh= {this.handleRefresh.bind(this)}
              />
          }
      />
      
  </View>
    );
  }

  // Secilmis olan kategori turune gore verileri ilgili fonksiyona gonderip ve dondurdukten sonra kendisi de return ettirerek ekrana bastiriyor
  renderItem=(data)=>{
      // Eger 1 ise tum haberleri listele
      // Digerleri de secilen kategori ve o an gelen haberin kategorisiyle ayni ise listele

      if(global.kategori ==="1")
           return ( this.displayCategory(data) );
      else if(global.kategori === "Gundem" && data.item.Tur === "Gundem")
           return ( this.displayCategory(data) );
     else if(global.kategori === "Spor" && data.item.Tur === "Spor")
           return ( this.displayCategory(data) );
     else if(global.kategori === "Egitim" && data.item.Tur === "Egitim")
           return ( this.displayCategory(data) );
     else if(global.kategori === "Ekonomi" && data.item.Tur === "Ekonomi")
           return ( this.displayCategory(data) );  
  }


  displayCategory(data){
  
     return (
      <View style={{flex: 4, height: 100, flexDirection: 'row'}}>
 
      <Image 
       style={styles.resim}
      source={{uri: data.item.Resim}}
      />
       
       <View style= {{flex:4, backgroundColor: 'white', margin: 5}}>

             <View style= {{flex:1.8, backgroundColor: 'white' ,borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                 <Text onPress={ () => this.setVariable(data.item.id, data.item.Icerik, data.item.Baslik, data.item.Resim, data.item.Begenme, data.item.Begenmeme, data.item.Goruntulenme, data.item.Tarih, data.item.ButonKontrol) } style= {{ fontWeight: 'bold', color: 'blue', fontSize: 16 }}>{data.item.Baslik}</Text>
             </View>

             <View style= {{flex:5, backgroundColor: 'white' ,borderRadius: 12 , borderColor: 'black', borderWidth:1, paddingLeft: 10 }} >
                 <Text onPress={ () => this.setVariable(data.item.id, data.item.Icerik, data.item.Baslik, data.item.Resim, data.item.Begenme, data.item.Begenmeme, data.item.Goruntulenme, data.item.Tarih, data.item.ButonKontrol) } style= {{ color: 'black', fontSize: 12 }}>{data.item.Icerik}</Text>
             </View>

        </View>
        
   </View>
    );
  }

}


const RootStack = createStackNavigator(
  {
    Home: {
      screen: HomeScreen,
    },
    News: {
      screen: icerikHaber,
    },
    Category: {
      screen: filterCategory,
    },
    News1: {
      screen: icerikHaber,
    },
  },
  {
    initialRouteName: 'Home',
  }
);

// Sayfalar arasinda gezinmede kullanılir 
const AppContainer = createAppContainer(RootStack);

// Ekranda gosterilen view, text vs. stillerinin kisacasi fonsiyon sekilde tanimlanip cagrildi kisimdir
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "white"
     },
    loader:{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "#fff"
     },
    list:{
        paddingVertical: 4,
        margin: 5,
        backgroundColor: "#fff"
     },
    resim: {
      flex:1, 
      backgroundColor: 'powderblue', 
      marginTop: 5, 
      borderRadius: 40
     },
    baslik: {
      backgroundColor: 'red', 
      height: 30, 
      justifyContent: 'center', 
      alignItems: 'center'
           },
   }
 );

