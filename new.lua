UI_APP = {
  PAGES = {
    {
      path = '/',
      html = [[
        <div style="background-color: #f0f8ff; padding: 20px; border-radius: 10px; max-width: 400px; margin: auto; text-align: center;">
          <h1 style="color: #2e8b57;">UI Example</h1>
          <p style="color: #4682b4;">Enter your name:</p>
          <ui-input ui-id="name" ui-type="String" ui-required label="Your name" />
          <ui-input
            ui-id="fruit"
            ui-type="Select"
            ui-required
            label="Your fruit"
            :items="['Apple', 'Banana', 'Cherry', 'Mango']"
          />
          <ui-button ui-valid="name, fruit" ui-run="cmdLogin({ name = $name, fruit = $fruit })" style="background-color: #4682b4; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Login</ui-button>
        </div>
      ]]
    },
    {
      path = '/home',
      html = [[
        <div style="background-color: #f0f8ff; padding: 20px; border-radius: 10px; max-width: 400px; margin: auto; text-align: center;">
          <h1 class="mb-2" style="color: #2e8b57;">Welcome, {~name~}!</h1>
          <p class="mb-2" style="color: #4682b4;">What would you like to do with your {~fruit~}?</p>
          <ui-button ui-run="cmdLogout()" style="background-color: #4682b4; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Logout</ui-button>
        </div>
      ]]
    },
  },

  InitState = function (pid)
    return {
      name = "",
      fruit = ""
    }
  end,
}

function cmdLogin(args)
  UI.set({ name = args.name, fruit = args.fruit })
  return UI.page({ path = "/home" }) .. UI.state()
end

function cmdLogout(args)
  UI.set({ name = "" })
  return UI.page({ path = "/" })
end
