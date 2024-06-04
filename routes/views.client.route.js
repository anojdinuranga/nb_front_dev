const express = require("express");
const router = express.Router();
const {render_data, render_data_post} = require("./../services/render");
const httpReq = require("./../services/httpRequest");

/*******************
* Global variables 
********************/
var client = __dirname + "/../views/client/"; // global folder path

//client Panel variables
const { header_tags } = require("../views/components/header_tags");
const { script_tags } = require("../views/components/script_tags");
const { sidebar } = require("../views/components/sidebar");
const { sidebar_3d } = require("../views/components/sidebar_3d");
const { web_footer } = require("../views/components/footer");

const dotenv = require('dotenv');
const { authorize2, authorize } = require("../services/authorize");
dotenv.config({ path: '.env/config.env' });

/**
 * @Details
 * client Routes 
 */

router.get("/access", authorize, async (req, res) => {

    try {
        let response = await render_data_post('/api/v1/user/temp-access', "", {
            tempKey: req.query.temp_key || "",
            id: req.query.id || ""
        });
        console.log(response);
        if(!response.status){
            res.redirect("/login");
            return;
        } else {
            res.cookie("auth", response.data.accessToken, {
                httpOnly: true,
                maxAge: process.env.JWTAMAXAGE,
            });
            res.redirect(req.query.redirect || "/profile");
            return;
        }

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.get("/", authorize, async (req, res) => {

    try {

        let sliders = await render_data('/api/v1/slider/list', "");
        if(!sliders.status){
            res.send("500 | Internal Server Error");
            return;
        }

        let contents = await render_data('/api/v1/content/all', "");
        if(!contents.status){
            res.send("500 | Internal Server Error");
            return;
        }

        res.render(
            client + "index.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                contents: contents.data,
                sidebar: sidebar(req.authToken),
                sliders:sliders.data,
                web_footer: web_footer
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.get("/payment-success", async (req, res) => {

    try {

        res.render(
            client + "payment-success.html",
            {
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.get("/payment-failed", async (req, res) => {

    try {

        res.render(
            client + "payment-failed.html",
            {
                message: req.query.error || ""
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.post("/payment/status", authorize, async (req, res) => {

    try {

        let req_reference_number = "";
        let decision = "";
        let message = "";
        if(req.body){
            
            if(req.body.item) {
                if(req.body.item.decision) {
                    if(req.body.item.decision === "ACCEPT") {
                        req_reference_number = req.body.item.req_reference_number;
                    }
                    decision = "ACCEPT";
                }
            } else {
                if(req.body.decision){
                    decision = req.body.decision;
                }
                if(req.body.message){
                    message = req.body.message;
                }
                
                if(req.body.req_reference_number){
                    req_reference_number = req.body.req_reference_number;
                }
            }
            let item = {
                decision: decision,
                message: message,
                req_reference_number: req_reference_number
            }
            if(decision === "ACCEPT") {
                // Payment success
                let url = process.env.BACKEND_DOMAIN + "/api/v1/order_bill/payed";
                let data = await httpReq.post(url, {
                    "id": req_reference_number,
                    "code": "089sdu8huYhyUYG"
                });
                
                // res.send({
                //     data: data,
                //     url: url,
                //     item: item
                // });
                if(data.status) {
                    res.redirect("/payment-success");
                    return;
                } else {
                    res.send({
                        item: item,
                        data: data
                    });
                }
            } else {
                // Payment failed
                res.redirect("/payment-failed?error="+item.message);
                return;
            }
            return;
        }

        res.send({});

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.get("/payment/amex/status", async (req, res) => {

    try {

        if(!req.query.resultIndicator) {
            res.redirect("/");
            return;
        }

        let url = process.env.BACKEND_DOMAIN + "/api/v1/order_bill/payed";
        let data = await httpReq.post(url, {
            "id": 0,
            "code": req.query.resultIndicator
        });
        if(data.status) {
            res.redirect("/payment-success");
            return;
        } else {
            res.redirect("/");
        }

        res.send({});

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.post("/payment/cancel", authorize, async (req, res) => {

    try {

        console.log(req.body);

        res.send(req.body);

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.post("/payment/response", authorize, async (req, res) => {

    try {

        console.log(req.body);

        res.send(req.body);

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/login", authorize, async (req, res) => {

    try {

        res.render(
            client + "login.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});
router.get("/set-new-password/:id/:key", authorize, async (req, res) => {

    try {

        res.render(
            client + "set-new-password.html",
            {
                id: req.params.id,
                key: req.params.key,
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/register", authorize, async (req, res) => {

    try {

        res.render(
            client + "register.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/password-reset", authorize, async (req, res) => {

    try {

        res.render(
            client + "password-reset.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/appointment-calendars", authorize, async (req, res) => {

    try {

        let notAvailableDates = await render_data('/api/v1/holidays/list', "");
        if(!notAvailableDates.status){
            res.send("500 | Internal Server Error");
            return;
        }

        res.render(
            client + "appointment-calendar.html",
            {
                notAvailableDates: JSON.stringify(notAvailableDates.data),
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/appointment-confrtmation", authorize, async (req, res) => {

    try {

        res.render(
            client + "appointment-confrtmation.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/contact-us", authorize, async (req, res) => {

    try {

        res.render(
            client + "contact-us.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/gift-voucher-purchase/:id", authorize, async (req, res) => {

    try {

        res.render(
            client + "gift-voucher-purchase.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/gift-voucher/", authorize, async (req, res) => {

    try {

        res.render(
            client + "gift-voucher.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/about-us", authorize, async (req, res) => {

    try {

        res.render(
            client + "about-us.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/new-arrivals", authorize, async (req, res) => {

    try {

        res.render(
            client + "new-arrivals.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/gents-wear", authorize, async (req, res) => {

    try {

        res.render(
            client + "gents-wear.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/ladies-wear", authorize, async (req, res) => {

    try {

        res.render(
            client + "ladies-wear.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/news-and-events", authorize, async (req, res) => {

    try {

        res.render(
            client + "news-and-events.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/product-configurator-national", authorize, async (req, res) => {

    try {

        res.render(
            client + "product-configurator-national.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/product-configurator-suit", authorize, async (req, res) => {

    try {

        res.render(
            client + "product-configurator-suit.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar_3d: sidebar_3d(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/product-configurator-trouser", authorize, async (req, res) => {

    try {

        res.render(
            client + "product-configurator-trouser.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar_3d: sidebar_3d(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/product-configurator-waistcoat", authorize, async (req, res) => {

    try {

        res.render(
            client + "product-configurator-waistcoat.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar_3d: sidebar_3d(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/product-configurator", authorize, async (req, res) => {

    try {

        res.render(
            client + "product-configurator.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar_3d: sidebar_3d(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/ready-made-single-product/:id", authorize, async (req, res) => {

    try {

        res.render(
            client + "ready-made-single-product.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/ready-made-single-product-admin-view/:id", authorize, async (req, res) => {

    try {

        res.render(
            client + "ready-made-single-product-admin-view.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/thank-you", authorize, async (req, res) => {

    try {

        res.render(
            client + "thank-you.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/thank-you-page", authorize, async (req, res) => {

    try {

        res.render(
            client + "thank-you-page.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/ticket-booking-payment-proceed", authorize, async (req, res) => {

    try {

        res.render(
            client + "ticket-booking-payment-proceed.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/voucher-booking-payment-proceed", authorize, async (req, res) => {

    try {

        res.render(
            client + "voucher-booking-payment-proceed.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/ticket-booking", authorize, async (req, res) => {

    try {

        res.render(
            client + "ticket-booking.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/view-bag", authorize, async (req, res) => {

    try {

        let loggedIn = false;
        if(req.authToken !== "") {
            loggedIn = true;
        } else {
            res.redirect("/login?redirect=/view-bag");
            return;
        }

        res.render(
            client + "view-bag.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
                first_name: req.data.first_name,
                last_name: req.data.last_name,
                email: req.data.email,
                address: req.data.address,
                mobile: req.data.mobile,
                loggedIn: loggedIn
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/view-bag-custom", authorize, async (req, res) => {

    try {

        let loggedIn = false;
        if(req.authToken !== "") {
            loggedIn = true;
        } else {
            res.redirect("/login?redirect=/view-bag-custom");
            return;
        }

        res.render(
            client + "view-bag-custom.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
                first_name: req.data.first_name,
                last_name: req.data.last_name,
                email: req.data.email,
                address: req.data.address,
                mobile: req.data.mobile,
                loggedIn: loggedIn
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/privacy-policy", authorize, async (req, res) => {

    try {

        res.render(
            client + "privacy-policy.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});


router.get("/terms-conditions", authorize, async (req, res) => {

    try {

        res.render(
            client + "terms-conditions.html",
            {
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});

router.get("/profile", authorize2, async (req, res) => {

    try {

        let orders = await render_data('/api/v1/order_bill/my/list', req.authToken);
        if(!orders.status){
            res.redirect("/login");
            return;
        }
        
        let customOrders = await render_data('/api/v1/order_bill_custom/my/list', req.authToken);
        console.log(customOrders)
        if(!customOrders.status){
            res.redirect("/login");
            return;
        }

        res.render(
            client + "profile.html",
            {
                orders:orders.data,
                customOrders:customOrders.data,
                header_tags: header_tags,
                script_tags: script_tags,
                sidebar: sidebar(req.authToken),
                web_footer: web_footer,
                first_name: req.data.first_name,
                last_name: req.data.last_name,
                email: req.data.email,
                company: req.data.company,
                address: req.data.address,
                mobile: req.data.mobile
            }
        );

    } catch (err) {
        console.log(err);
        res.render(
            global + "500.html"
        );
    }

});



module.exports = router;