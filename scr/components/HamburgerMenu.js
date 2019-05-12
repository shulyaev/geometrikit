import React, { Component } from 'react';
import { Switch, StyleSheet, View, Text, TouchableOpacity, AsyncStorage, Image } from 'react-native';
import Icon from '@expo/vector-icons/Ionicons';
import avatar from '../images/avatar.png'
import assignToGroup from '../images/assignToGroup.png';
import logout from '../images/logout.png';
import theorems from '../images/theorems.png';

export default class HamburgerMenu extends Component {
    static navigationOptions = ({ navigation }) => {
        return {
            title: '',
            headerRight: (
                <Icon
                    style={{ paddingRight: 15, color: "#fff" }}
                    onPress={() => {navigation.state.params.updateSubjects();navigation.goBack()}}
                    name="ios-arrow-forward"
                    size={30}
                />
            ),
            headerLeft: null
        };
    };

    constructor(props) {
        super(props);
        this.state = {
            firstName: '',
            lastName: '',
            grade: '',
            questionnaire: '',
            schoolName: '',
            studentID: '',
        }
        this._loadInitialState().done();
    }

    _loadInitialState = async () => {
        var value = await AsyncStorage.getItem('userData');
        this.setState({studentID: JSON.parse(value).userID, firstName: JSON.parse(value).firstName, lastName: JSON.parse(value).lastName, schoolName: JSON.parse(value).schoolName});
        // this.setState({grade: JSON.parse(value).grade});
        // this.setState({questionnaire: JSON.parse(value).questionnaire});
    }


    renderSwitch = () => {
        if (this.props.navigation.getParam('groupID', 'X') != '' && this.props.navigation.getParam('groupID', 'X') != 'X'){
            return (
                <View style={{flexDirection: 'row', margin: 30, marginRight: 17}}>
                    <Text style={{fontSize: 15, marginRight: 11}}>סינון שאלות</Text>
                    <Switch
                        onValueChange = {(value) => {this.props.navigation.state.params.onValueChange(value); this.setState({ state: this.state });}}
                        value = {this.props.navigation.state.params.value()}
                    />
                </View>
            )
        }
        
    }

    render() {
        return (
            <View style={styles.container}>
                <View style={{flex:1, backgroundColor: '#f44444', flexDirection: 'row'}}>
                    <View style={{flex: 4, flexDirection: 'column', justifyContent: 'flex-start', alignContent: 'flex-end'}}>
                        <Text style={{fontSize: 30, textAlign: 'right', color: 'white', marginRight: 35, marginTop: 10, fontWeight: 'bold'}}>{this.state.firstName + ' ' + this.state.lastName}</Text>
                        <Text style={{fontSize: 16, textAlign: 'right', color: 'white', marginRight: 35}}>כיתה {this.state.grade}', {this.state.questionnaire} יח"ל, {this.state.schoolName}</Text>
                    </View>
                    <View style={{flex:1.5, justifyContent: 'flex-start', alignContent: 'center'}}>
                        <Image source={avatar} style={{ height: 100, width: 100, borderRadius: 50 }}></Image>
                    </View>
                </View>
                <View style={{flex:5, alignItems: 'flex-end'}}>
                    {this.renderSwitch()}
                    <TouchableOpacity style={{flexDirection: 'row', margin: 30}} onPress={() => { this.props.navigation.navigate('Theorems') }}>                    
                        <Text style={{fontSize: 15}}>משפטים</Text>
                        <Image style={{width: 25, height: 25, marginLeft: 20}} source={theorems}/>
                    </TouchableOpacity>
                    <TouchableOpacity style={{flexDirection: 'row', margin: 30}} onPress={() => { this.props.navigation.navigate('AssignToGroup', {studentID: this.state.studentID}) }}>                    
                        <Text style={{fontSize: 15}}>רישום לקבוצת לימוד</Text>
                        <Image style={{width: 25, height: 25, marginLeft: 20}} source={assignToGroup}/>
                    </TouchableOpacity>
                    <TouchableOpacity style={{flexDirection: 'row', margin: 30}} onPress={() => { AsyncStorage.removeItem('userData'); this.props.navigation.navigate('Auth') }}>                    
                        <Text style={{fontSize: 15}}>התנתק</Text>
                        <Image style={{width: 25, height: 25, marginLeft: 20}} source={logout}/>
                    </TouchableOpacity>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
    }
});