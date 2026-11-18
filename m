Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B080F606A33D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HDfLp4Z0;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jqIRsn6Q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A57112091;
	Wed, 18 Nov 2026 22:22:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7085112091
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795040531; x=1826576531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3aenu4tKDef06I22A4vXTclS1Bl2//t2nUn5wx8P9V8=;
 b=HDfLp4Z0jbwIbG7zyoVsZrxcLRDb2GBPZeIUNm0VnlAcoWDm8loBcZ6S
 QlBQvWkTtv64o821ju9W1qOS+OQQaYAE4b5KY6uaHtcN9yMaYhGcuTsdm
 pxJYIhrCAXT6/V9eJUnjwtcFP8qTHrNJFo2H9iNebsJp+AOkDzBPKATTI
 MenBEhs6vOFUCIAwRcBIB+iB/O3O0sVUa8u5yjMwyU9Ni68FwvCFLoPRg
 rRam0dTMv/j8/bSDOewR+BNnbGs422mokA3JbsTblb44Mt0iswxU+DZfW
 ijplUsFL5lKHZa9Co3RoeKSVk0kV8fzqFZf/3OwPLW7/AweiH/f39zcmP Q==;
X-CSE-ConnectionGUID: w8mYhVLUShu8sfNzzhdDsw==
X-CSE-MsgGUID: lqKPLdeRQI+h8F/VZlYB3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3772347"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3772347"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:22:10 -0800
X-CSE-ConnectionGUID: lqgH6bYyQx2NdsYzW8eZaA==
X-CSE-MsgGUID: Vz26BhCDRZGlqd5wUlzydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10348289"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:22:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:22:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 14:22:09 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:22:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAhN9u8+wIJ3Q6tSNC0uRkvzBQku1a2lF9HQh8pwIF3uZW4P/B8F6j7DkcBCWl12RRODjTSzK0v1hkgq9xwqHGte4tBYrS9tjLdhOigMJ0fU9h6xka9tAuvxGkHoEavn6BUpAZ6ZJsQjXDxweWsn4kDOJC963g6DMtJUzCF4nxatn73broAaI2igE5xSlKQPj1ox30+dEALCZ+LGQhZuv0Qy+ApZeI5vP8LBLSLopRqY6cUA8QIQ7ddm7de9p8xelU0oBEuv1x25WuOfggozTf6ajhmS6fA1/60RvKGjWIKxaVC6GXlJwjHcTDUJNGZkjo92iQmhlb6DBPygtva1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aenu4tKDef06I22A4vXTclS1Bl2//t2nUn5wx8P9V8=;
 b=YFhWG6dy+2szWTtjCSZ5U1luV6cpfoeaPWX7ok29iRj1S+KQGILyRw5Xjor0h/8y+23sdVuRBeKrjf6535w27Hi7bqE9CXsFMa1tr8BKrVoQI+eratiGSa7v1IF+m9XkrK7W6ewyO75WKZQaJuvyyhH6IYQqHUFMWK20no/oYuVcHgSuRZtn/nta9ecNV+bKqTKpNpz+wt5xbLn//JI73+N4ZORwgnmu1KoeK/GKaukCLggaTVsRU8lECYtngeItq67tinacrP8KbrbfJu1pXuuNWkCp4ooJXgVO8yJpsAfs1b4rmB2JpNmgkT/+V72habqiYcctSpPVVAainEosrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aenu4tKDef06I22A4vXTclS1Bl2//t2nUn5wx8P9V8=;
 b=jqIRsn6Qe1TISbo/Oqrg8GlCa69A6y/+BPHAPZhUKoPbCiT4mxnm981zXh9B6qdc5qd6RB5DvG/35YxxW87dKLTw/ZQPWRqydZ1uiJbe1j2TBVHlIXgCByj3UUXUsbeYOAGPbG9ao94gFtVll3ObaXQ7c+ZnvjvDUJRO48Nj8gw=
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 22:22:01 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 22:21:57 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_late_bind_fw: Skip OCODE late bind if
 already running
Thread-Topic: [PATCH v2] drm/xe/xe_late_bind_fw: Skip OCODE late bind if
 already running
Thread-Index: AQHdd5lBQ/WtXtfp6E2uUN181SQnl7c0ZzqA
Date: Wed, 18 Nov 2026 22:21:57 +0000
Message-ID: <0b6959abf3f037aa28da11aa90bd9dc893eb0b49.camel@intel.com>
References: <20261118195705.3231462-2-sk.anirban@intel.com>
In-Reply-To: <20261118195705.3231462-2-sk.anirban@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7187:EE_|PH7PR11MB6008:EE_
x-ms-office365-filtering-correlation-id: 6c416d51-6588-47c0-1c48-08df45c25b99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: /s+quFpxRrtaqyuNAr4blpUOz8s2EIGT0EkmJeEiFHizG70QTHrR2IiUiiQ6x4g7LAIZznZYvYvzmSNSyOebbm+tm2epT2ouIwk0vg0kiXjJLZTZ9Ldsdbj4YXwlzl3281DgQrm5aZz0gyxhTyHaR3EENL58wR1qRSADhmRnhG/E/zHoNyPS1MgGqekZyFSepQTk3/lnF6YdnSCnBUBn+ark7nQT5j+d6cl2WcvglHpD/4Ze+ts28h03hkmo52IieG07j79jV+HT1sFKzBkT3zsUCdWVsYW7GzJQw/qkaBzASe9TIxvJAtRg1Of6p7bpclMDuuPNpihxeixuGRAJosEjmkYCmvgfEdFB/T7E38eVnKmQLptbv24optzwWkdqXqwDMe7+OoGSj8D91DjAofAtMqlt8A6hW+S+LZXEEQncqmVzGWWCMDuZPl0k1jiKhC+LpwJ7qz00yWfJ1fTTCluFE+SNHckV6w2uCqnqJvAdMg+BWDXsRvds+ZTk8ZArF59+6EAuEk3+faIf3qD7pcAbmHYUgLIx/d0Yt4QebiMYutiaOzD2NGQlYgni2mqOc4EoVZSP/90gwqHDliSB0tE4NKYgT6spAvRreGasBH7J8/5tWeZO0kwSzeJQbmqUZM9FBtgDV7xNV8FpqOMvw67rHAwlC3sYOeD0ixnQwzILuVZJ5xNG5xkwD+Y8O/vMxVTlPvRW9OkXGI+WIxUKVG83ASPoqMa5uaXIGhh6gS0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlI1NUQzQkRnSFZNWlMxVWxyRzRWeklpME9DNzRvSlh0TjFud2VJeWZLMWxp?=
 =?utf-8?B?VjJHTEExbG80ckphd1R6aTZ1cTRWakNqZDBTNnUyajR3a2QxclZQR2p1Tm1H?=
 =?utf-8?B?RGtWWU51VjJlblQ2OGNnb3FEeUtGbEEydEFNN09DZ0U2azNHdVdiS29ZWVl4?=
 =?utf-8?B?TXFLSXU1M05GT0ZyVFl1ZnBsN2dTZU9uTUpGLytjV05hc0tXZjlxVUFkZkRB?=
 =?utf-8?B?UENRTnZXZlRnRitDU2Z0VUdLd0hkM3ZSR0dreXhObUVCOFFKU0FaOWhvcmxj?=
 =?utf-8?B?QkFjUi9jdlB0dmZCTi9qSTlDN1FkcGd2ajBXOC9xaW5iZWhUTTBPT1QzQnUw?=
 =?utf-8?B?MmxOdndQK1d5eGh0cnNxc01vRGpLN0JjeEtsMDRJamFpeDNkeHAxMlZobmdN?=
 =?utf-8?B?VWJXOUFkNEFyK1ZjdmxCSEFBQ25GTzVUYU5oWHVTc0tVYzRXQ2tSRTFBNGg4?=
 =?utf-8?B?VjR0SFB3azU5eDhVMHhVcFA0UnFyeXZQK05XMlZhcTRscjBpMWVRL0hZR1NP?=
 =?utf-8?B?RWJCVXpXU2FOaGNPMEhrZHFnbXJ2R0FKMjFtajhJVThxbnVvNmJkSlZvZVgx?=
 =?utf-8?B?eFUvdWVuWitVTWpwd1JJY3dVNnRkMkVYQmYyc0xUOU9URy9HbUpNRTNZazhi?=
 =?utf-8?B?RXdOT2NhQ2I2NE5hWFJ1NkFzZkZVMWJzVjJieGprV0cyZi9Bb2RBWTR4S0hV?=
 =?utf-8?B?allzalBscFdjSVlXQStaZnVLOThsTnFnc2ZydTAvYmVnRy9YRDR4ZjJyWTA1?=
 =?utf-8?B?SytuRHZuZ01MYTlwc2FOTTZaZkpuRTQ5NWNLUElQalVveFh0NkRtQTdRMHFn?=
 =?utf-8?B?bTR6bzBMa2pCWHI0K0tWZmdiWTdXc3pUbXhQYzg5OWVKL1RNc1lyWHpZM0tl?=
 =?utf-8?B?Y0RRUzlUd2NuTUt4RXhrOXZzclpobnN0Mlh0SlA3QlFndnZpZHZUQ0ZmWkZE?=
 =?utf-8?B?MGdxOFRnRjlCQnlCMmtuTkxDK1hId1MzNHRQOFZla3M1Qk9SMXhHOC9rWm9w?=
 =?utf-8?B?dEdvdnQ2TGMxK0x4aTZrcVJzdkxISEtSTWhSbytpMHg4Rnd3M21lWjBTWnBr?=
 =?utf-8?B?aDNrSTdtbGNJejZ1ZmoyZWIydHQxa3RSYnl3WHhWSzhDTUtRR3dyKzhQQVhY?=
 =?utf-8?B?Zld4SW9MelpHV3hYNWJyOEc4SUQ0MFkwQ09vTlhBZHBpbk52Y2xxekdhMy9m?=
 =?utf-8?B?bEhWM24zSy91RjdSREhOZWJTeUQ0L3JndVUxcmdWbUVKbUx2WlRoYzN2SUgw?=
 =?utf-8?B?OW50NmFDbGxsUGxoanJEc3Q5T0ExZG1nbkN4NklHZm5CUngzMG5qUWgvanhw?=
 =?utf-8?B?Q2xNc1ljNGdXWlZsRENuVWQ1MC8rbnZzM0JkVEhYTUh3UE81d3hqakRPUjJI?=
 =?utf-8?B?OHpYMUE4azdHNkdBcTd1TXI3VVVoRFpwUDJnZ1FMS1c2UDc3ZnVPQmo1RjNX?=
 =?utf-8?B?MlZlbGliNnpSWnZLSWdpQ05ScVU4VmEwaTQyZGZOU2kxbk4zQlV3eHJQU3Br?=
 =?utf-8?B?QkZhdHcza1ZqeldHakJtdHpod0ZCWnA0bEpQSEdIVzlIZHZ2d3VuL2o3UWdB?=
 =?utf-8?B?SDluV3lCMjBnTmlZSUVzSFA1dTNHODZOaElpTTJnYlpGUzRhZkNGZGlPMUt3?=
 =?utf-8?B?L21BWHMwTWtuQyt1cEFPUnl3bEduUTdEL2Z4UThwM2RGdFByR3ZPUHFrUERx?=
 =?utf-8?B?Y3Q4T0tveWUyRGI2MTBCWThFcDVjbkVxR0paN0R6OGlhZWlDOUZBMTdzUURN?=
 =?utf-8?B?aWVxZWlNRWdnRzJDeTZVSlFSWHFESktiUnRxNEZKelNSL3h5Mk9jdklTS1RP?=
 =?utf-8?B?Vlg0T2JFYnlFMEYzQUd4cDBHYmk2cTBuN1ZtVHZzUUZwdnd5UzBvM1dBZnpX?=
 =?utf-8?B?SGtlbENDTUtQYXpwREJNU0V3S2VUY0xrVUlpeGwwS3NYSDVDSTFaNU1LejRL?=
 =?utf-8?B?NEp4KzdMd05LVTBVUmVYb3FVL056M3cxQm9UeEJpbVMyd3liTEFTV2xPU0Er?=
 =?utf-8?B?cGZTdzM4a1NQd0NtQmhWVnJ1ZkwyNUdnbjFWUVJWMzJOZGdGTDBiM3hKaE4x?=
 =?utf-8?B?WG45ZHRvZ0xhK2VQNlovdnczZjhqVzR5ME01R1NiUXNHL0pIR2wyaXd2cFlQ?=
 =?utf-8?B?TWZYWm5mWG1KckQ3dkRWNndRZ1RwVE8vRGJ5b2NJQ2VEZzBWd2FycVBuS2pD?=
 =?utf-8?B?aFB6VUYvRCtpZzkvRTRJRkRYS3RZNDluLzNkTmYxMzM4cStMcWU4OHdrZDVK?=
 =?utf-8?B?ZlM0U3lEaG91S3llNUE2bkFWMzlPQUF5Z09hSWplRWp4bjlTK1JxVVNLUHpi?=
 =?utf-8?B?Vis2ajQvMFZhSTZ5cnYyZ0xDNldXSXZ1UnFrOWh2Z0wweHJxSmx6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAC68943D1A3F549B6C9E99F65D3E7CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lu2q+xWVVqBX9+ddRnyTuIXFcbwd71b3CgFPVakIUMofN2yssmz5LwSXhC/dSHgyTQ6Xhpk+ufNe+0aBDqClJMIvUF/CcNgTfznECO8S2vbAQYY/emNJc5OLmegU1kSkEPDXQ/KabSRNtAV9++85svVgahND7D7NKGFv0c5ko8QR3pxxJOjmyvfriv7F1DJZHM9Agh6ZD6L77dT3g+rgAlI5jumF0HPoSrNHEpd0GlV83mbCZTnDtP5qGnFwje8hPiwJW3joCz+YuI5VSIMH30vxPJT7jiUmlgaiFmBEQzEUrgeouXY2xrj9NcqR8c/tODm57RbGgm0Stp5Gc6Vuwg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c416d51-6588-47c0-1c48-08df45c25b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 22:21:57.1653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J20Lq0nJ4Rs9ywGiM49AHMIyvXfZqMgOXraC4KYx8AkaZIcqkI/Ml4HB7/I8xLQek3M1/Xz+n6DGydDrnVecw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTExLTE5IGF0IDAxOjI3ICswNTMwLCBTayBBbmlyYmFuIHdyb3RlOg0KPiBP
biByZXN1bWUsIHNraXAgdGhlIE9DT0RFIHB1c2ggaWYgT0NPREUgaXMgYWxyZWFkeSBydW5uaW5n
Lg0KPiBBIG5ldyBibG9iIHRha2VzIGVmZmVjdCBhdCB0aGUgbmV4dCBkZXZpY2UgcmVzZXQuIFBy
b2JlIHN0aWxsDQo+IHB1c2hlcyB1bmNvbmRpdGlvbmFsbHksIHZlcnNpb24tYmFzZWQgc2tpcHBp
bmcgb24gcHJvYmUgd2lsbA0KPiBmb2xsb3cgb25jZSBhIHJ1bm5pbmctdmVyc2lvbiBtYWlsYm94
IGlzIGF2YWlsYWJsZS4NCj4gDQo+IHYyOiBTcGxpdCBwYXRjaGVzIChCYWRhbCkNCj4gwqDCoMKg
IE1vZGlmeSB0aGUgc3ViamVjdCBhbmQgY29tbWl0IG1lc3NhZ2UgKFJvZHJpZ28pDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBTayBBbmlyYmFuIDxzay5hbmlyYmFuQGludGVsLmNvbT4NCj4gLS0tDQo+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jIHwgMjEgKysrKysrKysrKysr
KysrKysrLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmlu
ZF9mdy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+IGluZGV4
IDM1NWQ3Yzg0MTg3MS4uMzZlOGU3MmMwM2EyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbGF0ZV9iaW5kX2Z3LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xh
dGVfYmluZF9mdy5jDQo+IEBAIC0zMDYsNyArMzA2LDE3IEBAIHN0YXRpYyB2b2lkIHhlX2xhdGVf
YmluZF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdA0KPiAqd29yaykNCj4gwqAJeGVfcG1fcnVudGlt
ZV9wdXQoeGUpOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyB2b2lkIHhlX2xhdGVfYmluZF9md19s
b2FkKHN0cnVjdCB4ZV9sYXRlX2JpbmQgKmxhdGVfYmluZCkNCj4gK3N0YXRpYyBib29sIHhlX2xh
dGVfYmluZF9vY29kZV9pc19sb2FkZWQoc3RydWN0IHhlX2xhdGVfYmluZF9mdw0KPiAqbGJmdykN
Cj4gK3sNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGxhdGVfYmluZF9md190b194ZShsYmZ3
KTsNCj4gKw0KPiArCWlmIChsYmZ3LT50eXBlICE9IElOVEVMX0xCX1RZUEVfT0NPREUgfHwgIXhl
LQ0KPiA+aW5mby5oYXNfc3lzY3RybCkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJcmV0
dXJuIHhlX3N5c2N0cmxfaXNfb29ibXNtX2Z3X3JlYWR5KHhlKTsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHZvaWQgeGVfbGF0ZV9iaW5kX2Z3X2xvYWQoc3RydWN0IHhlX2xhdGVfYmluZCAqbGF0ZV9i
aW5kLA0KPiBib29sIHJlc3VtZSkNCj4gwqB7DQo+IMKgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
bGF0ZV9iaW5kX3RvX3hlKGxhdGVfYmluZCk7DQo+IMKgCXN0cnVjdCB4ZV9sYXRlX2JpbmRfZncg
KmxiZnc7DQo+IEBAIC0zMTQsNiArMzI0LDExIEBAIHN0YXRpYyB2b2lkIHhlX2xhdGVfYmluZF9m
d19sb2FkKHN0cnVjdA0KPiB4ZV9sYXRlX2JpbmQgKmxhdGVfYmluZCkNCj4gwqANCj4gwqAJZm9y
IChmd19pZCA9IDA7IGZ3X2lkIDwgWEVfTEJfRldfTUFYX0lEOyBmd19pZCsrKSB7DQo+IMKgCQls
YmZ3ID0gJmxhdGVfYmluZC0+bGF0ZV9iaW5kX2Z3W2Z3X2lkXTsNCj4gKwkJaWYgKHJlc3VtZSAm
JiBsYmZ3LT5wYXlsb2FkICYmDQo+IHhlX2xhdGVfYmluZF9vY29kZV9pc19sb2FkZWQobGJmdykp
DQoNClRoaXMgbm93IHNlbmRzIGEgU3lzQ3RybCBtYWlsYm94IGNvbW1hbmQgc3luY2hyb25vdXNs
eSBpbiB0aGUgcmVzdW1lDQpwYXRoLCB3aXRoIGEgNTAwIG1zIHRpbWVvdXQgcGVyIHdhaXQuIElm
IFN5c0N0cmwgaXMgYnVzeSAodGhlIHZlcnkNCmJsYWNrb3V0IHdlJ3JlIHRyeWluZyB0byBhdm9p
ZCksIHJlc3VtZSBzdGFsbHMuIHYxIGRpZCB0aGUgY2hlY2sgaW4gdGhlDQp3b3JrZXIuDQoNCkFs
c28sIHBsZWFzZSBjaGVjayBteSByZXNwb25zZSB0byB0aGUgb3RoZXIgdGhyZWFkLiBMZXQncyBh
dm9pZCBldmVuDQppbiB0aGUgcHJvYmUgYW5kIG9ubHkgYWRkIHRoZSB2ZXJzaW9uIGNoZWNrIGlm
L2FmdGVyIEZXIGdpdmVzIHVzIGENCnJlbGlhYmxlIHdheS4NCg0KQW5kIHBlcmhhcHMgdGhhdCBj
b25maWdmcyB0byBhbGxvdyBmb3JjZSB0aGUgcmVsb2FkIGZvciBkZWJ1ZyBhbmQNCmRldmVsb3Bt
ZW50IGNhc2VzLg0KDQo+IHsNCj4gKwkJCWRybV9kYmcoJnhlLT5kcm0sICIlcyBmaXJtd2FyZSBh
bHJlYWR5DQo+IGxvYWRlZCwgc2tpcHBpbmdcbiIsDQo+ICsJCQkJZndfaWRfdG9fbmFtZVtsYmZ3
LT5pZF0pOw0KPiArCQkJY29udGludWU7DQo+ICsJCX0NCj4gwqAJCWlmIChsYmZ3LT5wYXlsb2Fk
KSB7DQo+IMKgCQkJeGVfcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoeGUpOw0KPiDCoAkJCXF1ZXVl
X3dvcmsobGF0ZV9iaW5kLT53cSwgJmxiZnctPndvcmspOw0KPiBAQCAtNTExLDcgKzUyNiw3IEBA
IHZvaWQgeGVfbGF0ZV9iaW5kX3BtX3Jlc3VtZShzdHJ1Y3QgeGVfbGF0ZV9iaW5kDQo+ICpsYXRl
X2JpbmQpDQo+IMKgCWlmICghbGF0ZV9iaW5kLT5jb21wb25lbnRfYWRkZWQgfHwgbGF0ZV9iaW5k
LT5kaXNhYmxlKQ0KPiDCoAkJcmV0dXJuOw0KPiDCoA0KPiAtCXhlX2xhdGVfYmluZF9md19sb2Fk
KGxhdGVfYmluZCk7DQo+ICsJeGVfbGF0ZV9iaW5kX2Z3X2xvYWQobGF0ZV9iaW5kLCB0cnVlKTsN
Cj4gwqB9DQo+IMKgDQo+IMKgLyoqDQo+IEBAIC01NTAsNyArNTY1LDcgQEAgaW50IHhlX2xhdGVf
YmluZF9pbml0KHN0cnVjdCB4ZV9sYXRlX2JpbmQNCj4gKmxhdGVfYmluZCkNCj4gwqAJaWYgKGVy
cikNCj4gwqAJCXJldHVybiBlcnI7DQo+IMKgDQo+IC0JeGVfbGF0ZV9iaW5kX2Z3X2xvYWQobGF0
ZV9iaW5kKTsNCj4gKwl4ZV9sYXRlX2JpbmRfZndfbG9hZChsYXRlX2JpbmQsIGZhbHNlKTsNCj4g
wqANCj4gwqAJcmV0dXJuIDA7DQo+IMKgfQ0K
