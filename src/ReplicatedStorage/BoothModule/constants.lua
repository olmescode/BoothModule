local constants = {
	Springs = {
		Default = {
			frequency = 1,
			dampingRatio = 1,
		},

		Bouncy = {
			frequency = 2.5,
			dampingRatio = 0.65,
		},

		Zippy = {
			frequency = 3,
			dampingRatio = 1,
		},
	},

	Instances = {
		AssetsFolder = {
			name = "BoothModuleAssets",
			instanceType = "Folder",
		},
		BoothPromtApp = {
			name = "BoothPromtApp",
			instanceType = "ScreenGui",
		},
	},

	DeviceInputTypePatterns = {
		Computer = {
			"Mouse*",
			"Keyboard",
		},
		Mobile = {
			"Touch",
		},
		Gamepad = {
			"Gamepad*",
		},
	},

	Tags = {
		DummyTag = "BoothDummy",
	},
}

return constants
