  while  true do wait()
      
      if game:GetService("Players").LocalPlayer.CharacterSkillTree["Worthiness V"].Value == false then

          local args = {
              [1] = "LearnSkill",
              [2] = {
                  ["Skill"] = "Worthiness V",
                  ["SkillTreeType"] = "Character"
              }
          }

          game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
      end
  end
