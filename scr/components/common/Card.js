import React from 'react';
import { View } from 'react-native';

const Card = (props) => {
    return (
        <View style={styles.containerStyle}>
            {props.children}
        </View>
    );
};

const styles = {
    containerStyle: {
        borderWidth: 1,
        borderRadius: 10,
        borderColor: '#f44444',
        marginLeft: 5, 
        marginRight: 5,
        marginTop: 10,
    }
};

export { Card };
