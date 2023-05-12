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

	Breakpoints = {
		Mobile = 500,
	},

	Instances = {
		AssetsFolder = {
			name = "MerchBoothAssets",
			instanceType = "Folder",
		},
		AvatarScreenGui = {
			name = "MerchBoothTryOnAvatarGui",
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
		DummyTag = "MerchBoothDummy",
	},
}

return constants
