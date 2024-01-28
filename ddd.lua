  while  true do wait()
      
      if game:GetService("Players").LocalPlayer.CharacterSkillTree["Worthiness I"].Value == false then

          local args = {
              [1] = "LearnSkill",
              [2] = {
                  ["Skill"] = "Worthiness I",
                  ["SkillTreeType"] = "Character"
              }
          }

          game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
      end
  end
