const top_header = `
<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
id="sidenavAccordion">

<!-- Logo Div Start -->
<a class="navbar-brand" href="index.html">
    <img src="/assets/images/logo.svg" />
</a>
<!-- Logo Div End -->

<!-- Sidenav Toggle Button Start-->
<button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle"><i
        data-feather="menu"></i>
</button>
<!-- Sidenav Toggle Button End-->

<!-- Search-Bar Div Start -->
<form class="form-inline mr-auto d-none d-md-block mr-3">
    <div class="input-group input-group-joined input-group-solid">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
        <div class="input-group-append">
            <div class="input-group-text"><i data-feather="search"></i></div>
        </div>
    </div>
</form>
<!-- Search-Bar Div End -->

<!-- Header Option Div Start -->
<ul class="navbar-nav align-items-center ml-auto">
    <!-- * * Note: * * Visible only below the md breakpoint-->

    <!-- Small Device Search Bar Start -->
    <li class="nav-item dropdown no-caret mr-3 d-md-none">
        <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="searchDropdown" href="#" role="button"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="search"></i></a>
        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--fade-in-up"
            aria-labelledby="searchDropdown">
            <form class="form-inline mr-auto w-100">
                <div class="input-group input-group-joined input-group-solid">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search"
                        aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <div class="input-group-text"><i data-feather="search"></i></div>
                    </div>
                </div>
            </form>
        </div>
    </li>
    <!-- Small Device Search Bar End -->

    <!-- Alerts Dropdown-->
    <li class="nav-item dropdown no-caret d-none d-sm-block mr-3 dropdown-notifications">
        <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts"
            href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"><i data-feather="bell"></i></a>
        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up"
            aria-labelledby="navbarDropdownAlerts">
            <h6 class="dropdown-header dropdown-notifications-header">
                <i class="mr-2" data-feather="bell"></i>
                Alerts Center
            </h6>

            <a class="dropdown-item dropdown-notifications-footer" href="#!">View All Alerts</a>
        </div>
    </li>

    <!-- Messages Dropdown-->
    <li class="nav-item dropdown no-caret d-none d-sm-block mr-3 dropdown-notifications">
        <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownMessages"
            href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"><i data-feather="mail"></i></a>
        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up"
            aria-labelledby="navbarDropdownMessages">
            <h6 class="dropdown-header dropdown-notifications-header">
                <i class="mr-2" data-feather="mail"></i>
                Message Center
            </h6>



            <!-- Footer Link-->
            <a class="dropdown-item dropdown-notifications-footer" href="#!">Read All Messages</a>
        </div>
    </li>

    <!-- User Dropdown-->
    <li class="nav-item dropdown no-caret mr-3 mr-lg-0 dropdown-user">
        <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage"
            href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"><img class="img-fluid"
                src="assets/img/illustrations/profiles/profile-1.png" /></a>
        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--fade-in-up"
            aria-labelledby="navbarDropdownUserImage">
            <h6 class="dropdown-header d-flex align-items-center">
                <img class="dropdown-user-img" src="assets/img/illustrations/profiles/profile-1.png" />
                <div class="dropdown-user-details">
                    <div class="dropdown-user-details-name">Valerie Luna</div>
                    <div class="dropdown-user-details-email">vluna@aol.com</div>
                </div>
            </h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#!">
                <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                Account
            </a>
            <a class="dropdown-item" href="#!">
                <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                Logout
            </a>
        </div>
    </li>

</ul>
<!-- Header Option Div Start -->

</nav>`
module.exports = { top_header };