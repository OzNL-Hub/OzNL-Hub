game.StarterGui:SetCore("SendNotification", {
    Title = "OzNL Hub";
    Text = 'Script Executed!';
    Icon = "";
    Duration = 4;
})

wait(1)

game.StarterGui:SetCore("SendNotification", {
    Title = "OzNL Hub (Maintenance System)";
    Text = 'Script is unavailable!\nPlease ask the devs for update the script!';
    Icon = "";
    Duration = 4;
})
