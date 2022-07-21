<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="edu.booking.booking.entity.Flight" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Flight</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous"/>
</head>
<body>
<div class="card">
    <h3 class="card-header text-center font-weight-bold text-uppercase py-4">
        Create a flight
    </h3>
    <div style="padding: 20px">
        <%
            Flight editFlight = (Flight) request.getAttribute("editFlight");
            String action = editFlight == null ? "addFlight" : "updateFlight";
            String departureDate = "";
            if (editFlight != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                departureDate = dateFormat.format(editFlight.getDateOfFlight());
            }
            String buttonText = editFlight == null ? "Add flight" : "Edit flight";
            List<Flight> flights = (List<Flight>) request.getAttribute("flights");
        %>
        <form action="<%=action%>" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-md-4">
                <div class="form-outline">
                    <label class="form-label" for="departureAirport">Departure airport</label>
                    <input id="departureAirport" type="text"
                           class="form-control" name="departureAirport"
                           value="<%=editFlight != null ? editFlight.getFrom() : ""%>"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-outline">
                    <label class="form-label" for="arrivalAirport">Arrival airport</label>
                    <input id="arrivalAirport" type="text"
                           class="form-control" name="arrivalAirport"
                           value="<%=editFlight != null ? editFlight.getTo() : ""%>"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-outline">
                    <label class="form-label" for="departureDate">Date of celebration</label>
                    <input id="departureDate" type="date"
                           class="form-control" name="departureDate"
                           value="<%=departureDate%>"/>
                </div>
            </div>

            <input name="celebrationId" type="hidden" value="<%=editFlight != null ? editFlight.getId() : ""%>" />
            <div class="col-8" style="padding: 20px;">
                <button class="btn btn-primary" type="submit"><%=buttonText%></button>
                <button class="btn btn-link" type="button" onclick="location.href = '${pageContext.request.contextPath}/dashboardAccess';">Back to homepage</button>
            </div>
        </form>
    </div>



    <div class="card-body" style="padding: 20px;">
        <div id="table" class="table-editable">
                    <span class="table-add float-right mb-3 mr-2">
                        <a href="#!" class="text-success"><i class="fas fa-plus fa-2x" aria-hidden="true"></i></a>
                    </span>
            <table class="table table-bordered table-responsive-md table-striped text-center">
                <thead>
                <tr>
                    <th class="text-center">Edit</th>
                    <th class="text-center">Delete</th>
                    <th class="text-center">Celebration name</th>
                    <th class="text-center">Celebration date</th>
                    <th class="text-center">User creator</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Flight flight : flights) {
                %>
                <tr>
                    <td>
                                    <span class="table-remove">
                                        <form action="editFlight" method="POST">
                                            <button type="submit" class="btn btn-primary btn-rounded btn-sm my-0">
                                                Change
                                            </button>
                                            <input name="flightId" type="hidden" value="<%=flight.getId()%>"/>
                                        </form>

                                    </span>
                    </td>
                    <td>
<%--                        <%--%>
<%--                            if (celebration.getCelebrationCostList().isEmpty()) {--%>
<%--                        %>--%>
                        <span class="table-remove">
                                        <form action="deleteFlight" method="POST">
                                            <button type="submit" class="btn btn-danger btn-rounded btn-sm my-0">
                                                Delete
                                            </button>
                                            <input name="flightId" type="hidden" value="<%=flight.getId()%>"/>
                                        </form>
                                    </span>

                    </td>
                    <td contenteditable="true"><%=flight.getFrom()%></td>
                    <td contenteditable="true"><%=flight.getTo()%></td>
                    <td contenteditable="true"><%=flight.getDateOfFlight()%></td>
                    <td contenteditable="true"><%=flight.getUserCreatorId()%></td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
