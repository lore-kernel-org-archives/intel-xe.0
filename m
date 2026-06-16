Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20E4CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 20:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DEC10EB05;
	Tue, 16 Jun 2026 20:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrRhEZ+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2AF10EB05
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781640485; x=1813176485;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=fJ2jjAfMGTzpPR5DEIMDIVYYGtEdYLq7II1lcmN2F2Q=;
 b=LrRhEZ+hj8N8EIwID0UcvtZPwPzFq7RRFFnA+JyQXLEJI29s5GeRo5Jw
 /b22FjO0fXti44KFF1XHVIG0uRplxRCxoF6pdgLQxUVPidKogglfCqG9G
 KZFddONnh6BOTiaWeN3iaqHWSqKxpHHjz2SRr1V9Wjn5vdTwl73V5YGDW
 s1cFMdrWM1IgQAzhbS6w6gJfF0GXzedk73/srGLjAA86DPHMw9K33s4R2
 KenAvv+LvVAAYTilDX4FoO4XYhx4VT+1qI35w7ZTiG/FjM5Yq7//FRyDx
 2kyzWod56nqTy1IDSXW2kguAqwivIJMY2VEsZ0ObyNlGKEKGkGWuH1QGK Q==;
X-CSE-ConnectionGUID: uGDRErr2TLiEmHN61KNk0w==
X-CSE-MsgGUID: ge+Q830mTCeEGienXk4N6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93089163"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93089163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:08:04 -0700
X-CSE-ConnectionGUID: svQmTYLdSYO+16sLzugsbA==
X-CSE-MsgGUID: hnn5PjMCTIemFgf9cHMm+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="271943860"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:08:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:08:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 13:08:04 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFzyBkatFy3JTdTdrbog6nbb4Nqfn7l/Wranu9TYkPDqWcW/vZ2VkXytdhIjaSFf1qIU4o28fPEU1Cykaph0mEmDP7g2vDj2gPQbNjoY2u8k3vwfTGQ7jBAfnQBXKUfeAbQbnF5tj6W3Wu/M7gWW6Bp7VDP6RSC5OfK4GkO3l7KOMBaiC4WMyoA/mbSNzxaKi86BHaayAYJwMt8Cxx5I80asyVyYdSt7YxTITngyhSJz98CbM3aVTjYcgg7pvPaVD9RnHcRIs6CH4eo3AksRc4/K2DLkjMOq41XQCxr2oDC6/IPXKzU7/K/NjUF14qLUTD4Mt2zJ5/R8xUtHCE/3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ2jjAfMGTzpPR5DEIMDIVYYGtEdYLq7II1lcmN2F2Q=;
 b=frZIYDwQgKW7+IPsn/sA1TTcgacGkWi4SSrorI9rFQwYxytbOfs/FNTqBX5PY1CaCicQYgWekDhb7vn9wyfhOnfWQjXMx+2ItRb5dEJeqWwXAgU82iXNDgUaLPKF+VMXGvqnziF+PDIe0I+3LAMNNJ0ZFShAknOsQasYjcqRS0LIeLcuSa1xbuJON7VmQzUJZv40jPQYaWqiSkaesRq7E0ezqvtNkZariw2x7mrWCLa7nnjk0MmN6WFQv50zVz3FnkcNdzYq0U3kv4dNMe3ggx/yWibuxDLKzS8Fc+5ViqKDIW+gNttbUH/YCoZgCs0FAVGtIlnn90AnLtABZJkMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by PH8PR11MB6902.namprd11.prod.outlook.com (2603:10b6:510:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Tue, 16 Jun
 2026 20:08:00 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 20:08:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Topic: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Thread-Index: AQHc+tWErF+rWhcoUEOvH5N6PzSbwbZBofsA
Date: Tue, 16 Jun 2026 20:08:00 +0000
Message-ID: <21184f8c769545e6e077e17985f858dfe9b7ea64.camel@intel.com>
References: <20260613013859.3886196-1-matthew.brost@intel.com>
In-Reply-To: <20260613013859.3886196-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|PH8PR11MB6902:EE_
x-ms-office365-filtering-correlation-id: 057a31db-f7e1-4846-256e-08decbe2f727
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|11063799006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: OR0CuwGQnc4b+HcDsM2kN4ziENWMmy90ofjqBnibIl0XVgb5qQfMuqCUcvkS6+FiXF1Y95zNfbuxy3F+9QbCeIFXugnHdMv0cu9oZ3KoGsP0d8eI4IydhdlsohfjvUNeuSzXaZ1zT0lNxA27gKRxQEX7OpSD9u+fb3H415oXdAQw3t/r5ZDRTr57JjflOWDG/jALBQr857aQBSCu5KQxu3b9g1WVHOWnEW9U4c/OIC3CwyOXHfLG6WGIXyt72RCaAUloAf9dvEeMswm0YTJsp1r9MFGyPRlj5+0ttn+0TMNCl1+TmGyqxsPBLDcKmGpsrfZfC1/hxpKGgPnr3ZpQY7Xo+O0JsXSKnSmrOrKKM5LVDmEpv/4aK6vEZfjSGR+CCzxzxQj7l7yVMbh/Ijv2yOCRU/0Y0UyQmmNVgM8BGVoXfEcI7BleraVnh13KXujq6pqFSbRJfMkncTlDWD0MTMXNlgtY6OI46caVQN5yUzoc3xI1+pVXPJgXsTiWseVWTQiWhCHUCN4vSMEmbl9EracUe0IA9pNFiO2aeDFezrQoGWRI/IZgjhRIOf7E5R9GuckjOX50sVRoNjl5Jmga2SyDMSGLwPgAc/FCzRIjQ3H5FUKtCiJkbpKGlA+NluVpLPi2ULZMS2j4flDTCgyob8XxtBEwgs47NhpNEtz9PLkTt2DD2/QXn/RNU0KpEqxgoj2Q8gM7XfvAcxLS2q0z4geosYDwO/oph5aYlYbSWY7fgR0ZrBfwoBbZHQHDOQPI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(11063799006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWJVY0UrYy9udHFQdW1vSC84TTBZaFUwdWcyTTlHV0ZyMk11Uks4SFZQYXl5?=
 =?utf-8?B?SExkTjVRUE1zTHg1L1hQQVpMakV0VlljQjcwcjBwdnNYbldwRENUMHlFZjlM?=
 =?utf-8?B?b2l1Y2QvRnlLaVJyNjZ0OCtYMWtvQlRtNlRkcS9MYmhzSk4xcFpsa2t0U1NH?=
 =?utf-8?B?bTd0NStLeG9EbTBmTjhVWHVlS3dPaTJQVldwd1o4ZytVY0ZEc0EzVmZwclBQ?=
 =?utf-8?B?RG5rV0FrNVJFZ01SU3VEMURaM3U3bDQ2WW5tNjBpWi9mazFmU3M1bWo0Mk4r?=
 =?utf-8?B?am9WY3JwN1ZUcWU5eDhFVHg3dks5Q2pSUDRxbW5VZmk4QUIxaUFLbytQamZR?=
 =?utf-8?B?S3hRMUhvdWhkbWsvREpPMXg4N0U0dWRraWpUOFA5UU96OE5ieFBTU2M3YzZD?=
 =?utf-8?B?RzZJTUxwUXUvNVJLb0ZKWkVhOXVjNCtMUHI3YXlPUGZ2UnowSDdjZUYwMUt1?=
 =?utf-8?B?TTFoZllaamRra1lnMnlkRlo2TFdYNWdlVEkyM0Zuazg4WDVqOXVCbnRwYStS?=
 =?utf-8?B?WVZHa09aRUM2empldXdiQ1lta1oyeHNodDZhckh0alFHMHpSQlNvQU5JY1B3?=
 =?utf-8?B?dUhta3pOTEt2bDJzV050NEtMdExNU3dkNXZTWjZrWlNJSzdld3B0SnM2SURm?=
 =?utf-8?B?cGd1b2JWMWR5NU16SDh6MDNaVVY2MGM5UVpjRHQyR1A5QnZzUk1nTGVid1ZS?=
 =?utf-8?B?NHpJTmg0bHBZSzZsMmxmczdVaTYrM2NadktNM1dyb0QwZENlQ2xkTGptODdI?=
 =?utf-8?B?b2NldUdrRDNhTTMvQ0FtMUxmKzdwekRyU1NWZHVNcGdGV3drMzdaZkZnOW9l?=
 =?utf-8?B?UjhvU0M3d2JRQXp0UnVFSTZHZHlHRU1RNlp3VTZmUmhva1M2b1lXLzNzVjVU?=
 =?utf-8?B?RWpLN3g4Rno1SG9BMllaWmNaTnNBaWszSElLc0FranV2cG1CY0xUVmdhdUpt?=
 =?utf-8?B?ZnUxREpxUzM0TjFYVElWdXh4Z0s2Z2NpOGl6STVlMUErQTRGQnplbW8wNUNT?=
 =?utf-8?B?STc4aEJwTkJuQ1pOb0lxTm5DR0JMRmZTbTN4YTl2RERiOVpjNVBJamNnUS9Z?=
 =?utf-8?B?SlVUKzJZWVRBaEpTK0ZjY3R5V2RFRHhYbGZkM0htVDB2WGJ5SHZHalZIam8z?=
 =?utf-8?B?TVlTRDkvUTdWc1Ezc2F2anhCL0N4RFlSR043cDVpMk1ta1RzUFdITnJZUm9y?=
 =?utf-8?B?WjczQk53dC93KzliN0F5TURsWmh1OTRqRnJmcEdCQmxBRDFVWUJmNlFLN0JY?=
 =?utf-8?B?bHpOVDFkaTh0ZTcveCtqbFFmajlsM1JpR21td0hhK09DS1VWNTd2OWRNK1NC?=
 =?utf-8?B?RkJURDNGOEV5cjlmVEJDenQxakZqQ2hRaXN4Z1VIcEZwbkkzSWRKL1lVQkw0?=
 =?utf-8?B?cUZpd1E0UjYrckdoNHlBYk4yVmpESS9SYzVqMEFZOVU5ZG5sU1RUQ1ZCc3dw?=
 =?utf-8?B?Y2VKc1R0VlpBU1N2Wjh6NmxESlY2VlE1b2pBdG1jeVkvbHcwWW55eXZQSGdE?=
 =?utf-8?B?UnZIemJuV3FWYkJnREpLQTFiSVBKZ3NGSitQMUVSakpEMGRJeHRTOE92Vkhs?=
 =?utf-8?B?c2tRcDZEVFZYSCtlNWpxR3RTMDZ3UmYvd2JtSklZRGpRMUVsSmFzVmhLMTZu?=
 =?utf-8?B?M3pUNURXaWIzREJXakxYMmZZY2g3QnNndUhlejJ2VjltWi9HMW4yUHByTDJl?=
 =?utf-8?B?SFhHY3hYbitGeVFKTlVkOVVoQWVLUTdVWTNpZW9Hd0NLTWVuOEl6S095aHFD?=
 =?utf-8?B?TGtJUHZ4dHhqOWJmMGZTSERtUU5jS3o5L2J1V3BDT081OWZxc0M5Y25DNXU1?=
 =?utf-8?B?MXIyb3FvV1FlelpQU0t3eE04c2RHakxXcnJRYlo0UFlRMWZTamY3RUFpM1JI?=
 =?utf-8?B?V0FyRExKbkdIci9HQUJIZVNZaEFMWFFEanlFV3F3YmhPTGJjOGlXWDlBQ2Jp?=
 =?utf-8?B?Tk1wK1l5eXRIQ3hVYk5XTDkzK3NLc3RhYjRvVmZ0MGZTWnBqY05GbDBZZDB2?=
 =?utf-8?B?bzEveDd1ZlVvczZsZURRSHYzUXV2elU4S2d2OHRZN2hRYmEwWVVyVW02a2o3?=
 =?utf-8?B?aDd3VUpyYzh2VU5BYUNHREdZRnpGL0lMeDNiZjZ1ZVFvMnY1TUxqRE5EUG5G?=
 =?utf-8?B?SDZLR09YOGtWSU1sd0prZi9vVm0zS3ZzNWNkOExtanB2ZDZVb1F5a3lnRTJD?=
 =?utf-8?B?bW1jVWV1Q2JCYTVaYUJGdGZpVVZza2dlU1UwZjBDOU9sWHFUWTVGUHpIK0dP?=
 =?utf-8?B?KzVwTnNVK0VybFQ0eHl3QjBmYWdrekF0SUh5dE1DQ2ZjQmphakpoME1BYUx5?=
 =?utf-8?B?NG5vQUdwNkxVeU1aSEMvZFdMUXNpR2c0UXB6U2dlMGFVS1RXc0U3cGNNa3Jq?=
 =?utf-8?Q?Z1Csr4ZWm5U86jIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB33DC1B43986148A2766B7B70487160@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XpUPBB7tF9Dqpj0QGXxRCbQJHCbXlItTNS7ivxFk58FeVbDhz/ZIHRDb9OYXZPMVTrFkRdlgi0yd4EhCD6aZ/3xqIif0GIm75NNGg3Q0ud2MHU5Dux9yL9F++120bimqKikIK4PTD8uOKGSBOeRibgOQ6Z0BhRJkuhX5ZT27/I8czm4kxSZOxqFsPoWXrqR4oghs/LEi9GGpQAVS2AaWLxC4WQ5DKAuCY+i3C/+w2adOJ+aU5sUWSIDYaX4k3eOUaI8QRUG2mcUH2ZaZw7acDikkpQRFrkFWdNAKfdvRb/X/mUfMv5SPBB1HWvr7UzHAqG84yfED2jSs3uWdLU7eng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057a31db-f7e1-4846-256e-08decbe2f727
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 20:08:00.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/xsU6MPWKiuN0KK860piKht07sKf5JXjjtgqlOV2LK0XowTLtYvCMPuAjZZlq2sPmA2raXhepYjbhGqMZPbPc+OFKjA/8wx33OQww02JK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6902
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI2LTA2LTEyIGF0IDE4OjM4IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFdoZW4gYW4gRkQgaXMgY2xvc2VkIHdpdGggbWFueSBleGVjIHF1ZXVlcywgdGVhcmRvd24gcmVs
aWVzIG9uIHRoZQo+IFREUgo+IHBhdGggdG8gY2xlYW4gdXAgc2NoZWR1bGluZy4gSG93ZXZlciwg
dGhlIFREUiBoYW5kbGluZyBpcyBzZXJpYWxpemVkCj4gKGkuZS4sIG9ubHkgb25lIGV4ZWMgcXVl
dWUgaXMgcHJvY2Vzc2VkIGF0IGEgdGltZSksIHdoaWNoIGNhbiBtYWtlIGl0Cj4gdG9vIHNsb3cg
Y29tcGFyZWQgdG8gR3VDIHNjaGVkdWxpbmcgYWN0aXZpdHkuCj4gCj4gSW4gdGhpcyB3aW5kb3cs
IEd1QyBtYXkgY29udGludWUgdG8gc2NoZWR1bGUgY29udGV4dHMgYmFja2VkIGJ5Cj4gaW52YWxp
ZCBwYWdlIHRhYmxlcywgbGVhZGluZyB0byBhIGNhc2NhZGUgb2YgQ0FUIGVycm9ycyBhbmQgcmVw
ZWF0ZWQKPiBlbmdpbmUgcmVzZXRzLiBUaGlzIHNpZ25pZmljYW50bHkgaW5jcmVhc2VzIHJlY292
ZXJ5IHRpbWUgYW5kIGNhbgo+IGRlZ3JhZGUgc3lzdGVtIHN0YWJpbGl0eS4KPiAKPiBUbyBtaXRp
Z2F0ZSB0aGlzLCBlYWdlcmx5IGRpc2FibGUgc2NoZWR1bGluZyBieSBzZW5kaW5nIGEgc2VsZi0K
PiBtZXNzYWdlCj4gb3V0c2lkZSBvZiB0aGUgVERSIHBhdGguIFRoaXMgcHJldmVudHMgZnVydGhl
ciBzY2hlZHVsaW5nIG9mIGludmFsaWQKPiBjb250ZXh0cyBhbmQgYXZvaWRzIHRoZSBDQVQgZXJy
b3IvcmVzZXQgY2FzY2FkZS4KPiAKPiBUaGlzIGNoYW5nZSBpbXByb3ZlcyByb2J1c3RuZXNzIGFu
ZCByZWR1Y2VzIHJlY292ZXJ5IGxhdGVuY3kgaW4KPiBtdWx0aXBsZSBxdWV1ZSB0ZWFyZG93biBz
Y2VuYXJpb3MuCj4gCj4gQ2M6IFdhbmcgWGluIDx4LndhbmdAaW50ZWwuY29tPgo+IENjOiBKaWEg
WWFvIDxqaWEueWFvQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxt
YXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiBUZXN0ZWQtYnk6IEppYSBZYW8gPGppYS55YW9AaW50
ZWwuY29tPgo+IAo+IC0tLQo+IHYzOgo+IMKgLSBNYWtlIGtpbGwgbWVzc2FnZSBzdGF0aWMgdG9t
YWtlIHJlY2xhaW0gc2FmZSAoQ0kpCj4gwqAtIERvIG5vdCBpc3N1ZSBraWxsIG1lc3NhZ2VzIGZv
ciBxdWV1ZSB3aGljaCBieXBhc3MgY2xlYW51cCBtZXNzYWdlcwo+IMKgwqAgKHNhc2hpa28pCj4g
djQ6Cj4gwqAtIEFkZCBtaXNzaW5nIG1lc3NhZ2UgbG9jawo+IC0tLQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmggfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQ0Cj4gKysrKysr
KysrKysrKysrKysrLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19l
eGVjX3F1ZXVlX3R5cGVzLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZXhlY19xdWV1
ZV90eXBlcy5oCj4gaW5kZXggZTVlNTNiNDIxZjI5Li4yNDc5NDdmZDM1N2YgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2V4ZWNfcXVldWVfdHlwZXMuaAo+IEBAIC0zMSw3ICsz
MSw3IEBAIHN0cnVjdCB4ZV9ndWNfZXhlY19xdWV1ZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIGEg
bWVzc2FnZSBuZWVkcyB0byBzZW50IHRocm91Z2ggdGhlIEdQVSBzY2hlZHVsZXIgYnV0Cj4gbWVt
b3J5Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIGFsbG9jYXRpb25zIGFyZSBub3QgYWxsb3dlZC4KPiDC
oMKgwqDCoMKgwqDCoMKgICovCj4gLSNkZWZpbmUgTUFYX1NUQVRJQ19NU0dfVFlQRcKgwqDCoMKg
Mwo+ICsjZGVmaW5lIE1BWF9TVEFUSUNfTVNHX1RZUEXCoMKgwqDCoDQKPiDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IHhlX3NjaGVkX21zZyBzdGF0aWNfbXNnc1tNQVhfU1RBVElDX01TR19UWVBFXTsK
PiDCoMKgwqDCoMKgwqDCoMKgLyoqIEBkZXN0cm95X2FzeW5jOiBkbyBmaW5hbCBkZXN0cm95IGFz
eW5jIGZyb20gdGhpcyB3b3JrZXIKPiAqLwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgd29ya19z
dHJ1Y3QgZGVzdHJveV9hc3luYzsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+IGlu
ZGV4IGFmZTVkOTljZGQ4Yi4uNWVjMWRjYTAzMjRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jCj4gQEAgLTE4NzUsMTEgKzE4NzUsMjEgQEAgc3RhdGljIHZvaWQKPiBfX2d1Y19l
eGVjX3F1ZXVlX3Byb2Nlc3NfbXNnX3NldF9tdWx0aV9xdWV1ZV9wcmlvcml0eShzdHJ1Y3QgeGVf
c2NoZQo+IMKgwqDCoMKgwqDCoMKgwqBrZnJlZShtc2cpOwo+IMKgfQo+IMKgCj4gK3N0YXRpYyB2
b2lkIF9fZ3VjX2V4ZWNfcXVldWVfcHJvY2Vzc19tc2dfa2lsbChzdHJ1Y3QgeGVfc2NoZWRfbXNn
Cj4gKm1zZykKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxID0g
bXNnLT5wcml2YXRlX2RhdGE7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2V4ZWNfcXVldWUg
KnByaW1hcnkgPQo+IHhlX2V4ZWNfcXVldWVfbXVsdGlfcXVldWVfcHJpbWFyeShxKTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgaWYgKGV4ZWNfcXVldWVfZW5hYmxlZChwcmltYXJ5KSkKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGlzYWJsZV9zY2hlZHVsaW5nKHByaW1hcnksIHRydWUp
Owo+ICt9Cj4gKwo+IMKgI2RlZmluZSBDTEVBTlVQwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDHCoMKgwqDCoMKgwqDCoC8qIE5v
bi16ZXJvCj4gdmFsdWVzIHRvIGNhdGNoIHVuaW5pdGlhbGl6ZWQgbXNnICovCj4gwqAjZGVmaW5l
IFNFVF9TQ0hFRF9QUk9QU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoDIKPiDCoCNkZWZpbmUgU1VTUEVORMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAzCj4gwqAjZGVmaW5lIFJFU1VNRcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgNAo+IMKgI2Rl
ZmluZSBTRVRfTVVMVElfUVVFVUVfUFJJT1JJVFnCoMKgwqDCoMKgwqDCoDUKPiArI2RlZmluZSBL
SUxMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Ngo+IMKgI2RlZmluZSBPUENPREVfTUFTS8KgwqDCoMKgMHhmCj4gwqAjZGVmaW5lIE1TR19MT0NL
RUTCoMKgwqDCoMKgQklUKDgpCj4gwqAjZGVmaW5lIE1TR19IRUFEwqDCoMKgwqDCoMKgwqBCSVQo
OSkKPiBAQCAtMTkwNiw2ICsxOTE2LDkgQEAgc3RhdGljIHZvaWQgZ3VjX2V4ZWNfcXVldWVfcHJv
Y2Vzc19tc2coc3RydWN0Cj4geGVfc2NoZWRfbXNnICptc2cpCj4gwqDCoMKgwqDCoMKgwqDCoGNh
c2UgU0VUX01VTFRJX1FVRVVFX1BSSU9SSVRZOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgX19ndWNfZXhlY19xdWV1ZV9wcm9jZXNzX21zZ19zZXRfbXVsdGlfcXVldWVfcHJpb3Jp
dHkKPiAobXNnKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgS0lMTDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
X19ndWNfZXhlY19xdWV1ZV9wcm9jZXNzX21zZ19raWxsKG1zZyk7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgWEVfV0FSTl9PTigiVW5rbm93biBtZXNzYWdlIHR5
cGUiKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IEBAIC0yMDE4LDExICsyMDMxLDM5IEBAIHN0YXRp
YyBpbnQgZ3VjX2V4ZWNfcXVldWVfaW5pdChzdHJ1Y3QKPiB4ZV9leGVjX3F1ZXVlICpxKQo+IMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgfQo+IMKgCj4gK3N0YXRpYyBib29sIGd1Y19l
eGVjX3F1ZXVlX3RyeV9hZGRfbXNnKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgeGVfc2NoZWRfbXNnICptc2csCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHUzMiBvcGNvZGUpOwo+ICsKPiArI2RlZmluZSBTVEFUSUNfTVNHX0NMRUFOVVDCoMKgwqDCoMKg
MAo+ICsjZGVmaW5lIFNUQVRJQ19NU0dfU1VTUEVORMKgwqDCoMKgwqAxCj4gKyNkZWZpbmUgU1RB
VElDX01TR19SRVNVTUXCoMKgwqDCoMKgwqAyCj4gKyNkZWZpbmUgU1RBVElDX01TR19LSUxMwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAzCgpUaGlzIGlzbid0IHJlbGF0ZWQgdG8gdGhp
cyBzZXJpZXMuLi4gYnV0IGNhbiB5b3UgZXhwbGFpbiB0aGVzZSBzdGF0aWMKbWVzc2FnZXMgYSBi
aXQ/IFdlJ3JlIGFkZGluZyBvdmVyIGFuZCBvdmVyIHRvIHRoZSBzdGF0aWNfbXNncyBsaW5rZWQK
bGlzdC4gSSBkb24ndCBzZWUgdGhhdCB3ZSdyZSBhY3R1YWxseSBkb2luZyBhbnl0aGluZyB3aXRo
IHRoaXMgYWZ0ZXIKYWRkaW5nIHRob3VnaCwgc28gdGhlIGxpc3QganVzdCBncm93cyBpbmRlZmlu
aXRlbHk/IE9yIG1heWJlIEknbQptaXNzaW5nIHNvbWV0aGluZyBpbiB0aGUgdGVhcmRvd24gaGVy
ZS4uLgoKPiDCoHN0YXRpYyB2b2lkIGd1Y19leGVjX3F1ZXVlX2tpbGwoc3RydWN0IHhlX2V4ZWNf
cXVldWUgKnEpCj4gwqB7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3NjaGVkX21zZyAqbXNn
ID0gcS0+Z3VjLT5zdGF0aWNfbXNncyArCj4gU1RBVElDX01TR19LSUxMOwo+ICsKPiDCoMKgwqDC
oMKgwqDCoMKgdHJhY2VfeGVfZXhlY19xdWV1ZV9raWxsKHEpOwo+IMKgwqDCoMKgwqDCoMKgwqBz
ZXRfZXhlY19xdWV1ZV9raWxsZWQocSk7Cj4gwqDCoMKgwqDCoMKgwqDCoF9fc3VzcGVuZF9mZW5j
ZV9zaWduYWwocSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgICog
V2UgZWFnZXJseSBzZW5kIGEgbWVzc2FnZSB0byBvdXJzZWx2ZXMgdG8gZGlzYWJsZQo+IHNjaGVk
dWxpbmcsIGFzIHRoZQo+ICvCoMKgwqDCoMKgwqDCoCAqIFREUiBpcyBzZXJpYWxpemVkIChpLmUu
LCBvbmx5IG9uZSBleGVjIHF1ZXVlIGlzIHByb2Nlc3NlZAo+IGF0IGEgdGltZSkuCj4gK8KgwqDC
oMKgwqDCoMKgICogSWYgYW4gRkQgaXMgY2xvc2VkIHdpdGggbWFueSBleGVjIHF1ZXVlcywgdGhl
IFREUiBjYW4gYmUKPiBzbG93ZXIgdGhhbgo+ICvCoMKgwqDCoMKgwqDCoCAqIHRoZSBHdUMgc2No
ZWR1bGluZyBjb250ZXh0cyB3aXRoIGludmFsaWQgcGFnZSB0YWJsZXMsCj4gY3JlYXRpbmcgYQo+
ICvCoMKgwqDCoMKgwqDCoCAqIGNhc2NhZGUgb2YgQ0FUIGVycm9ycyBhbmQgZW5naW5lIHJlc2V0
cywgd2hpY2ggaXMgcXVpdGUKPiBzbG93LiBBdm9pZAo+ICvCoMKgwqDCoMKgwqDCoCAqIHRoaXMg
YnkgaW1tZWRpYXRlbHkgZGlzYWJsaW5nIHNjaGVkdWxpbmcgb3V0c2lkZSBvZiB0aGUKPiBURFIu
Cj4gK8KgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCEocS0+ZmxhZ3MgJiBF
WEVDX1FVRVVFX0ZMQUdfUEVSTUFORU5UKSAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBrcmVm
X3JlYWQoJnEtPnJlZmNvdW50KSAmJiAhZXhlY19xdWV1ZV93ZWRnZWQocSkpIHsKClNob3VsZCB3
ZSBjaGVjayBwZW5kaW5nIGRpc2FibGUgaGVyZSB0b28/CgpUaGFua3MsClN0dWFydAoKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2dwdV9zY2hlZHVsZXIgKnNjaGVk
ID0gJnEtPmd1Yy0+c2NoZWQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9zY2hlZF9tc2dfbG9jayhzY2hlZCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGd1Y19leGVjX3F1ZXVlX3RyeV9hZGRfbXNnKHEsIG1zZywgS0lMTCk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NjaGVkX21zZ191bmxvY2soc2NoZWQpOwo+ICvCoMKgwqDC
oMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2d1Y19leGVjX3F1ZXVlX3RyaWdnZXJf
Y2xlYW51cChxKTsKPiDCoH0KPiDCoAo+IEBAIC0yMDY2LDkgKzIxMDcsNiBAQCBzdGF0aWMgYm9v
bCBndWNfZXhlY19xdWV1ZV90cnlfYWRkX21zZyhzdHJ1Y3QKPiB4ZV9leGVjX3F1ZXVlICpxLAo+
IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsKPiDCoH0KPiDCoAo+IC0jZGVmaW5lIFNUQVRJ
Q19NU0dfQ0xFQU5VUMKgwqDCoMKgwqAwCj4gLSNkZWZpbmUgU1RBVElDX01TR19TVVNQRU5EwqDC
oMKgwqDCoDEKPiAtI2RlZmluZSBTVEFUSUNfTVNHX1JFU1VNRcKgwqDCoMKgwqDCoDIKPiDCoHN0
YXRpYyB2b2lkIGd1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEp
Cj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9zY2hlZF9tc2cgKm1zZyA9IHEtPmd1
Yy0+c3RhdGljX21zZ3MgKwo+IFNUQVRJQ19NU0dfQ0xFQU5VUDsKCg==
