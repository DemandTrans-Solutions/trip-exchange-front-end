#!/bin/bash

# Test script to verify the back button fix implementation
# This script checks that all required changes are in place

echo "🔍 Verifying Trip Ticket Back Button Fix Implementation..."
echo

# Check for required imports
echo "✅ Checking imports..."
if grep -q "HostListener" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ HostListener import found"
else
    echo "   ❌ HostListener import missing"
    exit 1
fi

if grep -q "ActivatedRoute" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ ActivatedRoute import found"
else
    echo "   ❌ ActivatedRoute import missing"
    exit 1
fi

if grep -q "Location.*from '@angular/common'" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ Location import found"
else
    echo "   ❌ Location import missing"
    exit 1
fi

# Check for @HostListener method
echo
echo "✅ Checking @HostListener implementation..."
if grep -q "@HostListener('window:popstate'" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ @HostListener decorator found"
else
    echo "   ❌ @HostListener decorator missing"
    exit 1
fi

if grep -q "onBrowserBackButtonClick" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ onBrowserBackButtonClick method found"
else
    echo "   ❌ onBrowserBackButtonClick method missing"
    exit 1
fi

# Check for URL parameter handling in navigation methods
echo
echo "✅ Checking URL parameter handling..."
if grep -q "queryParams.*view.*detail.*ticketId" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ URL parameter setting in viewTicket found"
else
    echo "   ❌ URL parameter setting in viewTicket missing"
    exit 1
fi

if grep -q "queryParams.*{}" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ URL parameter clearing in backToGrid found"
else
    echo "   ❌ URL parameter clearing in backToGrid missing"
    exit 1
fi

# Check for pending detail view handling
echo
echo "✅ Checking pending detail view handling..."
if grep -q "pendingDetailView" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ pendingDetailView property found"
else
    echo "   ❌ pendingDetailView property missing"
    exit 1
fi

if grep -q "_route.queryParams.pipe" src/app/trip-ticket/trip-ticket.component.ts; then
    echo "   ✓ Query parameter subscription found"
else
    echo "   ❌ Query parameter subscription missing"
    exit 1
fi

# Check that build passes
echo
echo "✅ Checking build status..."
if npm run build --silent > /dev/null 2>&1; then
    echo "   ✓ Build passes successfully"
else
    echo "   ❌ Build fails"
    exit 1
fi

echo
echo "🎉 All checks passed! The back button fix implementation is complete."
echo
echo "📋 Next steps for testing:"
echo "   1. Navigate to trip ticket detail view"
echo "   2. Click browser back button - should return to grid view"
echo "   3. Test URL sharing: /tripTicket?view=detail&ticketId=X"
echo "   4. Test page refresh while in detail view"
echo "   5. Test across different browsers"
echo
