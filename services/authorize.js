
const {render_data} = require("./../services/render");

const authorize = async ( req, res, next ) => {

    
    req.data = {}
    req.authToken =  "";
    req.data.user_name = "";
    req.data.first_name = "";
    req.data.last_name = "";
    req.data.email = "";
    req.data.company = "";
    req.data.address = "";
    req.data.mobile_code = "";
    req.data.mobile = "";
    req.data.image_url = "";

    if ( req.headers.cookie === undefined ) {
        next();
        return;
    }

    let result = getCookie( 'auth', req.headers.cookie );

    if ( !result.status ) {
        next();
        return;
    }

    let check = "";
    if(result.data !== "") {
        check = await render_data('/api/v1/user/check', result.data);
        if(!check.status || check.data.role !== 3){
            next();
            return;
        }
    } else {
        next();
        return;
    }

    req.authToken = result.data;
    req.data.user_name = check.data.user_name;
    req.data.first_name = check.data.first_name;
    req.data.last_name = check.data.last_name;
    req.data.email = check.data.email;
    req.data.company = check.data.company;
    req.data.address = check.data.address;
    req.data.mobile_code = check.data.mobile_code;
    req.data.mobile = check.data.mobile;
    req.data.image_url = check.data.image_url;

    next();

};

const authorize2 = async ( req, res, next ) => {

    if ( req.headers.cookie === undefined ) {
        res.redirect("/login");
        next();
        return;
    }

    let result = getCookie( 'auth', req.headers.cookie );

    if ( !result.status ) {
        res.redirect("/login");
        next();
        return;
    }

    let check = await render_data('/api/v1/user/check', result.data);
    if(!check.status || check.data.role !== 3){
        res.redirect("/login");
        return;
    }

    req.data = {}

    req.authToken = result.data;
    req.data.user_name = check.data.user_name;
    req.data.first_name = check.data.first_name;
    req.data.last_name = check.data.last_name;
    req.data.email = check.data.email;
    req.data.company = check.data.company;
    req.data.address = check.data.address;
    req.data.mobile_code = check.data.mobile_code;
    req.data.mobile = check.data.mobile;
    req.data.image_url = check.data.image_url;

    next();

};

const getCookie = (cookie_name, cookie) => {
    const re = new RegExp(`(?<=${cookie_name}=)[^;]*`);
    try {
        return {
            "status": true,
            "data": cookie.match(re)[0]
        }
    } catch {
        return {
            "status": false
        }
    }
};

module.exports = {
    authorize,
    authorize2
};