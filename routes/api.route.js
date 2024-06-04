const express = require("express");
const router = express.Router();
const dotenv     = require('dotenv');
dotenv.config( {path: '.env/config.env'} );
const response = require('./../services/response');
const httpRequest = require('./../services/httpRequest');
const {authorize} = require('./../services/authorize');
const size_validate      = require('./../validation/size.validate');
const validate      = require('./../validation/api.validate'); // Input validations
const suit_sizes = require('../public/assets/json/size_chart/suit_sizes.json')
const national_sizes = require('../public/assets/json/size_chart/national_sizes.json')
const trouser_sizes = require('../public/assets/json/size_chart/trouser_sizes.json')
const waistcoat_sizes = require('../public/assets/json/size_chart/waistcoat_sizes.json')
var getIP = require('ipware')().get_ip;

router.post("/api/v1/user/login", authorize, async (req, res) => {

    try {

        try {

            const data = await validate.data_validate.validateAsync(req.body);
            
            try{
    
                /**
                 * @detail
                 * Process
                 */
                let url = process.env.BACKEND_DOMAIN + req.path;
                let result = await httpRequest.post(url, data, req.authToken)
                if (!result.status) {
                    res.status(200).send( result );
                } else {
                    if (!result.data.status) {
                        res.status(200).send( result.data );
                    } else {
                        res.cookie("auth", result.data.data.accessToken, { 
                            httpOnly: true,
                            maxAge: process.env.JWTAMAXAGE,
                        });
                        res.status(200).send( response.success( "0200" ) );
                    }
                }
    
            } catch (err){
                res.status(200).send( response.error( "0500" ) );
            }
            
        } catch (err) {
            console.error( err );
            res.status(200).send( response.error( "0000", err.details[0].message ) );
        }

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.post("/api/v1/*", authorize, async (req, res) => {

    try {

        try {

            const data = await validate.data_validate.validateAsync(req.body);
            
            try{
    
                /**
                 * @detail
                 * Process
                */
                let url = process.env.BACKEND_DOMAIN + req.path;
                var ipInfo = getIP(req);
                var ip = "";
                if(ipInfo) {
                    ip = ipInfo.clientIp;
                }
                let result = await httpRequest.post(url, data, req.authToken, ip);
                if (!result.status) {
                    res.status(200).send( result );
                } else {
                    res.status(200).send( result.data );
                }
    
            } catch (err){
                res.status(200).send( response.error( "0500" ) );
            }
            
        } catch (err) {
            console.error( err );
            res.status(200).send( response.error( "0000", err.details[0].message ) );
        }

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/logout", authorize, async (req, res) => {

    try {

        /**
         * @detail
         * Process
         */
        res.cookie("auth", req.authToken, { 
            httpOnly: true,
            maxAge: 0,
        });

        res.redirect("/");
        

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/api/v1/*", authorize, async (req, res) => {

    try {

        /**
         * @detail
         * Process
         */
        let url = process.env.BACKEND_DOMAIN + req.path;
        var ipInfo = getIP(req);
        var ip = "";
        if(ipInfo) {
            ip = ipInfo.clientIp;
        }
        let result = await httpRequest.get(url, req.authToken, ip);
        if (!result.status) {
            res.status(200).send( result );
        } else {
            res.status(200).send( result.data );
        }

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.post("/api/get/suit-size", async (req, res) => {

    try {

        try {

            const data = await size_validate.size_validate.validateAsync(req.body);
            
            try{
    
                /**
                 * @detail
                 * Process
                 */

                let jsonData;

                switch (data.type){
                    case 1:
                        jsonData = suit_sizes[data.key];
                        break;
                    case 2:
                        jsonData = national_sizes[data.key];
                        break;
                    case 3:
                        jsonData = trouser_sizes[data.key];
                        break;
                    default:
                        jsonData = waistcoat_sizes[data.key];
                        break;
                }
            
                
                res.status(200).send( jsonData );
                
    
            } catch (err){
                console.log(err);
                res.status(200).send( response.error( "0500" ) );
            }
            
        } catch (err) {
            console.error( err );
            res.status(200).send( response.error( "0000", err.details[0].message ) );
        }

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

module.exports = router;