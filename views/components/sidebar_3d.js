const sidebar_3d = (authToken = "") => {
    let user = "/login";
    let logout = ``;
    if(authToken!== "") {
        user = "/profile";
        logout = `<a href="/logout"><img src="/assets/images/Navbar/logout.svg" class="img-fluid me-3" alt=""></a>`;
    }
    return `
    <div class="div-nav">
    
        <!----------------main navbar start----------->
        <nav class="navbar border-bottom border-secondary py-3">
            <div class="container-fluid">
                <a class="p-2 navbar-toggler" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExamplenavbar"
                    aria-controls="offcanvasExamplenavbar">
                    <span class="visually-hidden">Toggle navigation</span>
                    <img src="/assets/images/Navbar/Group1.svg" alt="">
                </a>
                <a class="navbar-brand d-flex align-items-center justify-content-center" href="/">
                    <span class="d-flex justify-content-center text-black" style="margin-left:45px;"><img src="/assets/images/Navbar/qk-logo-head2.svg"
                            class="img-fluid navbar-logo navbar-logo2 text-black" alt=""></span>
                </a>
                <div class="d-flex">
                    <a href="${user}"><img src="/assets/images/Navbar/user-dark.svg" class="img-fluid me-3" alt=""></a>
                    <a href="/view-bag"><img src="/assets/images/Navbar/cart-dark.svg" class="img-fluid me-3" alt=""></a>
                    ${logout}
                </div>
                <div id="navcol-4" class="collapse navbar-collapse flex-grow-0 mt-2">
    
                </div>
            </div>
        </nav>
        <!----------------main navbar end----------->
    
        <!----------- navbar offcanvas----------->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExamplenavbar"
            aria-labelledby="offcanvasExampleLabelnavbar">
            <div class="offcanvas-header d-flex justify-content-end">
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div>
                <div class="mt-4 mb-5 pt-4 d-flex justify-content-center">
    
                    <img src="/assets/images/Navbar/qk-left-logo.svg" class="img-fluid" alt="" style="width: 165px;">
                </div>
                <div class="navbar-offcanvas-height-mq">
                    <div class="overflow-y-scroll select-fabric-scrollbar navbar-offcanvas-height">
                        <div>
                            <div class="my-3 py-3 ms-5">
                                <a href="/new-arrivals" class="list-group-item list-group-item-action navbar-offcanvas mb-2">New Arrivals</a>
                                <a href="/gents-wear" class="list-group-item list-group-item-action navbar-offcanvas mb-2">Gents Wear</a>
                                <a href="/ladies-wear" class="list-group-item list-group-item-action navbar-offcanvas mb-2">Ladies Wear</a>
                            </div>
    
                            <div class="ms-5">
                                <a href="/gift-voucher/" class="list-group-item list-group-item-action navbar-offcanvas mb-2">Gift Voucher</a>
                            </div>
    
    
                            <div class="ms-5 mt-3 pt-3">
                                <a href="#!"
                                    class="list-group-item list-group-item-action navbar-offcanvas mb-2 text-muted">Custom Suit</a>
                                <a href="#!"
                                    class="list-group-item list-group-item-action navbar-offcanvas mb-2 text-muted">Custom Trouser</a>
                                <a href="#!"
                                    class="list-group-item list-group-item-action navbar-offcanvas mb-2 text-muted">Custom Waistcoat</a>
                                <a href="#!"
                                    class="list-group-item list-group-item-action navbar-offcanvas mb-2 text-muted">Custom Arya Sinhala</a>
                            </div>
    
                            <div class="ms-5 mt-3 pt-3">
                                <a href="/appointment-calendars"
                                    class="list-group-item list-group-item-action navbar-offcanvas mb-2">Book your
                                    Appointment</a>
                            </div>
                        </div>
    
                        
                    </div>
                </div>
            </div>
        </div>
        <!----------- navbar offcanvas end----------->
    
    </div>`;
}



module.exports = { sidebar_3d };