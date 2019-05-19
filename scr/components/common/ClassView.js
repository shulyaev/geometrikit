import React from 'react';
import { View, TouchableOpacity, Text } from 'react-native';

const ClassView = (props) => {
    return (
            <View style={styles.containerStyle}>
                <TouchableOpacity onPress={()=>props.onPress(props.gid)}><Text>X</Text></TouchableOpacity>
                <Text style={styles.textStyle}> 
                    כיתה {props.grade}', {props.questionnaire} יח"ל, {props.schoolName}, תשע"ט
                </Text>
            </View>
    );
};

const styles = {
    containerStyle: {
        borderWidth: 2,
        padding: 5,
        backgroundColor: 'grey',
        borderColor: 'grey',
        flexDirection: 'row',
        borderRadius: 10,
        margin: 5,
        alignContent: 'center'
    },
    textStyle: {
        fontSize: 20,
        color: '#fff'
    },

};

export { ClassView };