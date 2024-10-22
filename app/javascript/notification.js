// 提醒視窗叉叉功能

// Step 1: Select all the delete buttons which are inside notification element  
// and loop over them using forEach 
document.querySelectorAll(".notification .delete") 
    .forEach(function ($deleteButton) { 

        // Step 2: Get the parent notification of the delete button 
        const parentNotification = $deleteButton.parentNode; 

        // Add click event listener on delete button and when the button get clicked 
        // remove the parent notification 
        $deleteButton.addEventListener('click', function () { 
            parentNotification.parentNode 
                .removeChild(parentNotification); 
        }); 
    }); 