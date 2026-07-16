Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E86DC43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 04:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24F10E2BC;
	Thu, 16 Jul 2026 04:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVwoA2ZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0F10E2B5;
 Thu, 16 Jul 2026 04:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784174605; x=1815710605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KZIZrn28CzL+TqQZCF7vjDW00++0xKjnJYzF9NtngVw=;
 b=FVwoA2ZMulBD8SDUC95P+3SXtK7udfjljt327WkP6cJPQwi1Me+mXg2S
 ohpPRMuP2mYM2EwAG6v+BGoTYMrFd8/HZqwDGGLDxHkmkGfQ2+XEbHtKA
 c67de5PvLEcPTBYHHe3QF3CcIqga97S8N+f8KH4VQzLtv7FxQLRp7YDoz
 dIba0Tt2sZcSgvUMVpV3clzClrexOvERpRKAT1LHsswaaEMYhJpxgCUF/
 jNkOkblJwwhR86Yb42V/+rj1M5T0K+WIqOh5OB9+MUPoMxKjsorIzCaiw
 xSS/f8M0l7X5bmip2TuUOwNakuTYsby/1rYjRbJ6gfMz/lLiR4wcqNmuq Q==;
X-CSE-ConnectionGUID: VRdygLJrSCClgCQR3UFiNw==
X-CSE-MsgGUID: 9oYO2dbvRjGipZMSh7om2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102376022"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="102376022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 21:03:25 -0700
X-CSE-ConnectionGUID: ksT4Us8RR3+8r7ND35dZQQ==
X-CSE-MsgGUID: 1LrBELgUTJeeIawSdGgdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="252971865"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 21:03:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 21:03:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 21:03:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 21:03:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuJcOjI2TX8ZIn4N7ew0AjOygiOnEM7r1M7AQD+WACC2busocyEKCibJrzPrO1R8qDEn3sqj5U1s86pd4TSHpm3XIHYN1ZdgewlVs0r3UjF9iFmeczRBQkOEi5SoXB2HoFHKSbte/AoujfBgxIVBXBdurUdIYmmBNiwCL3y8jDdrn4GdjFA2XUPwvKrHMAOkcArcwggH8v7G4YYkfGtnnYIZyiQ06IKDoCyFoob7X1vXFZqtGezUJ4s58G+WtsV9emzhQ/X8tBAtLvGlfr/7DARl3wNClQoVUtKefw8newmMNhIZpw5TDDhwzejFJTtItw6PuRJRWxHG+HsIczD0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZIZrn28CzL+TqQZCF7vjDW00++0xKjnJYzF9NtngVw=;
 b=aCd+KcRVqL108kvSILcnC+uL1OrKU8W6I1jGzrz96n+kKxxRszEzomE4AdVwso9JE20lBnMTz6w8LK5K5O37B9GRaDuAL66oilwVoTI/dLy9Jx7ENn5hyu83PROgc09IRAQl0wXSDmpH/wTqm2OPitJ1Y218DJ3VXvmFpH2RgosV0HCTiJlgXxhLJVkC+TSW4jrG289j+czXPnzRyNiKsdKNlYA3pPzJKBtPztEiLopWm3g9adXqHE9vIX+3l8scGkmQTngO1bq3Cc12UIrfFiv6GSKR5NXgxC5/9OW2Qo/qkQuR9Fck6UMsCIQLRfjN8UQ8NAkyWzrP42AgmfEH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 04:03:20 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 04:03:20 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/i915/cdclk: Introduce HAS_2PPC()
Thread-Topic: [PATCH 2/4] drm/i915/cdclk: Introduce HAS_2PPC()
Thread-Index: AQHdFFLZwmUHxo2WEkSesyHRyEGmVLZvh1nQ
Date: Thu, 16 Jul 2026 04:03:20 +0000
Message-ID: <IA1PR11MB64671339D34C8E962092AA76E3C72@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
 <20260715120926.10786-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20260715120926.10786-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA2PR11MB4908:EE_
x-ms-office365-filtering-correlation-id: 69bfa73e-7192-4c43-3d49-08dee2ef2c64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003|38070700021;
x-microsoft-antispam-message-info: YvNGvecdsTyU5pxa67Ex+ki1Z4NtskiOkvP3IQSg9aTo9lw6ASY0zEL3tXGwm67gpwFXMAa8fgc6o5bi8eq6zspuwOaBZYndcqAjShXxVwPoQswiGlNpU8UCfHfK0DvkZ2LFawBDSxFvONtylol5dvYMSCtZq8FBzVlWl3M4/NbARq/xPMmY+c86aThF6puaxjK1tA4FOhk7x5XRCgF8R3eXWUme0pvd15rUIiNuwgOhiB/xNYLk5RU8xhdi1j2orEhGdIG9V4trK3Wd3zBT/wtqMiHEKZrS9qZkOQbkYVTqtTro0l7DFtHVPRn5jfbcXPOJP7749efrmUvwVwEj4ViAf01wEJIuR5o1WTLToRp7AdNcvknrH07v8vYfuJO7ydQpNBalAXa/gN8W9a1HyzeZgzeUEx0u3UmLfIlIQvK0LO7K2UtvQk0ejQnq/8j70FJt51gkVc5xJGq/OI75NrHcvAvyQqCLJCr4E0jTcCrxc7Xnc3LUQdlC1T+0zrIVzdU2sSCQ/FCeajh6bmyORI5P8tj/2RSY2xCYcw0dhL4biigEPurQjxLCqn4h8GGW1th50iWeX3XUpkZYFPjeMa7+2eZl+SYYbABXVibEAn9bPvsbW3p5IqlAUKNqkucle50a7vxjLA9rnvwSlVQ1LEMQXgzX4P6bswufvHAUrwrCLjUR8ViE4ncTKOKfwVjS/ny6SHptkfTeL/2jQWafiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFFrSlhRK2h0TXVUdDUrb241NDR2U3JXYm9iMGRLTmM3b0t5d3dhTi9kcXFJ?=
 =?utf-8?B?UHgzNkZ2REFmRFZwWjlKSzVkcGY5SlQ1YTVYdzZTK1hvdktGK2pkYUdBWmR4?=
 =?utf-8?B?RlVjM1BiVFU4aHFiZStkVExXdEtDRUNsRVZSR3J1T3RpV2FhOG1rSTVOOGZu?=
 =?utf-8?B?K1Q2Z2lYaDd4elMvN2NJZjFheDMvcEZxWUhsankzZFhIaWFMMExHT2VNTS8y?=
 =?utf-8?B?U3YxYjVnaEJreUl3V3VBd2lpTDNBOHpEMmpGM3FpWjRjMU16KzhPV2VkZ3BY?=
 =?utf-8?B?UUk2SVNVU0ZlY1RsR0NwbUg2MmZUSFpJdHhGYVB4MDlQblU4dFlrbUcvNFZt?=
 =?utf-8?B?cTRvWGJ5L2FEcnZEN3lNWktydXBUQzhwaU4yL1AzeG5LbGdJNytxcDJDTGox?=
 =?utf-8?B?TlRnRmxJUkdiaml0YnY5UXVTeHc2UkxQODM0UDRuQWFBSEFFYyt6UDZXbkt0?=
 =?utf-8?B?QUdZWWxtVnJTd2lTS0ZqcnNiallram1QaHFsRkM1WjN1UFY5ZktuS2wvYm54?=
 =?utf-8?B?SDJwMnU3UHBuclFSVE02SFpoaXREMVYxOE44ZjA1a3VSMzcvSGcra3ZoTXJQ?=
 =?utf-8?B?a3piR2hyVHluV25KUGRLWUZsNS9IYkd3bGE0UVJvZENLeGc5ajg2N3lpSk8y?=
 =?utf-8?B?aFY4TjVZTWEyQm5kUlVjUVJUTXRFK1NzcGNXQy9CaEZyQzlnazY5b0FGUjlL?=
 =?utf-8?B?N3dTTDZKd1hoVDdBZXlXNStBQkFZRi9JcGhpUkV2UE9rOHJtNll0RTVjdXF5?=
 =?utf-8?B?L1RTRGxaRWpBcEVSdTFMcmJERlhsMWZHZ0pBb3haazI2VzI1Skhqc1lseXA1?=
 =?utf-8?B?NFdVeGhCamRzcTcyd0huZXNTMERzcXBzVHRnelloMmNDOFpuR29KL3FIcEhm?=
 =?utf-8?B?QWpwUGJoK3lxQTFvQUdSdGM5d0RxWWwrOW1UT3N4bEtSLzVuT3lEZEpEb1U4?=
 =?utf-8?B?RFkyenNkc1VGM2V0R1AvT0FVZjYxZjRQUmFWNzRtM3oxUEJLUVd0L2NUS0Ir?=
 =?utf-8?B?cFVNeGkwRHhKRVZZU2VsS2hNZzJOQlFHYmVHOCtYeDNaUWNTeVhaL1FpTGh1?=
 =?utf-8?B?bnE2Rmc5dVlVTTVGSHBlS21waUc0V2JYSVg5eStMQ0N4aGlTWkhocGNUT2ZD?=
 =?utf-8?B?N3dqb2NnVTUrQ2lkdGxlU0hQckRnZFpRSG5KWkZkbkRCODNqMGdmK204NVZt?=
 =?utf-8?B?TmRKZG91WitXZHE5TEt1Q2s5cCtnT2RrTG5pVDdaTjJzZmNHS1FWSzIzdWZn?=
 =?utf-8?B?OG5XYmFRY1VPbjFNRDNNakkveGdvZlVjczVUK09LMGZaNHdWZHlhRWxXLzNM?=
 =?utf-8?B?bE9ZYUVocXpYNjJSWGNvd1dzMUpqTE1JNzQva3ZycHpmRXVTMjl2TFRVeEd4?=
 =?utf-8?B?cmlPUE5yZDIxK1NWNmlqUnNCdkF3ODlteG9oWlpwNXBjbHdxWU1MWTBYZC9q?=
 =?utf-8?B?a1U3aDNjQmtjZDdmOVRzVkdFOFVGTzFuaEEzNmR0WGZ6SU1ZUGQ4SkZPSHRl?=
 =?utf-8?B?aW4zYUZuSUNSWk4vS0hMcVpBZDJ3LzZGdXRyWEprQlZEa3YzWVpTZEl0eXpF?=
 =?utf-8?B?S01RTUdwdTdIZWlhbjlaUlhFSWU5UkJzM0g3QjZiaUVWOW93SzhsRGZNMlBa?=
 =?utf-8?B?TnhKQUJ5QllnRHlYVUVWbUFzRkpWUktXM2Q1Q2djdFMrS2hXVHBwM3hxaUxF?=
 =?utf-8?B?Z2FyajFsa3g4azhxY3FXZjVEbytEVklMbkNtbGZlK0k4ek9VanZidUZGc1Rw?=
 =?utf-8?B?a3hIM2llSC9sREhhL2l5WjJrV2s3R24zUHd0b2ZjbFRGSEJQMEFCNnQ4aUw3?=
 =?utf-8?B?c1VQWitocHQ3TkMrV0xBREtQRTljQkFSck8zazlyMlNxSEdQVDk0MTdBWlVH?=
 =?utf-8?B?SllkS2pNWC9DZG94Q0dwamVUUGlqNCs3OTVKdU9MTEFidTYvQmpHTHdZcmhX?=
 =?utf-8?B?bEprcTd3L1lhZ0lGSWRHU0pVdlBBUis5U3k4UFhabmwza0VlWjRoTVpBRHF2?=
 =?utf-8?B?cUhZNFVUWVJSeFZZUE1JNFNVck1aVGdOOWs4R2FMOHVGVisyWVM0M0lRNzJV?=
 =?utf-8?B?TEJiYkhLU3Y1Skt2Ulc1SlIxaVBpZnp2TjZBQm9DRS9sNnVYU1NYVDVXdVo3?=
 =?utf-8?B?SHAyOUpnQUVFYmMvK09USFN6UWVITVhhcEFYdVVHTzVZWHJzSk1pdm5UNmw2?=
 =?utf-8?B?TXc5dnUzMWxwdnlNS0dnd2NtTUh6Nm40SUNyemlrL0V2QmFnQ3ZIZkpUR2Vl?=
 =?utf-8?B?dG9oQUdwTkpEZ2N4S1dWK1dwSXQ5NVkrNkhsVDNLTEtLZ0syd1VyNUlRQlFs?=
 =?utf-8?B?QXBYVHhXZzloakNPS3VoV0xLY0orVWw5MW9kMVVUbDNXaG5manpUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DaSwC8kWWrik8XuW/zgEkUSl07VmfLnMem4YJRgAr/uXyQF+Y7665Lf9F4IeU/089dh9iFiVq+9uethE2dE1HaHvq4XcGHZdyUZmhd3LwNqG3J5laelj6GPJ6JkbgigZRh4A5tsxT1GV5Wsz85MDJX3uSGwAkhNaTR2dakUZdhCq4Lo+zcHyLeSs5rGGRb6vHJRWB1xwx48il/M8Lym+uttU5xNZVBuBFIZhrnjaA/mlP0SVsXhWgyDMpXpUdtz2IDeT71uq9uUiRDJDmYp8dnCn1PK0sm41/KQmlAHHBK3dXTK+g35Tsm27mqjuzdDdKpjQcYWNXt9LRYK/xFE0RQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bfa73e-7192-4c43-3d49-08dee2ef2c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 04:03:20.2516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgFtz877Bc81wquwyQQIo2axFWrezIP0L1PYG+1Q3HGKhopxZhtjBIi0EJ5YorGX69QkST4MXfsze9NUHEmSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUNCj4g
U3lyamFsYQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTUsIDIwMjYgNTozOSBQTQ0KPiBUbzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCAyLzRdIGRybS9pOTE1L2NkY2xrOiBJbnRy
b2R1Y2UgSEFTXzJQUEMoKQ0KPiANCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFdlJ2xsIG5lZWQgdG8gY2hlY2sgZm9yIHRoZSAi
ZG9lcyB0aGUgcGxhdGZvcm0gZG8gMiBwaXhlbHMgcGVyIGNsb2NrPyINCj4gdGhpbmcgaW4gYSBm
ZXcgcGxhY2VzLiBBZGQgYSBmZWF0dXJlIG1hY3JvIGZvciBpdC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jICAgICAgICAg
IHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2Rl
dmljZS5oIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfY2RjbGsuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2Rj
bGsuYw0KPiBpbmRleCAxZDdmZjJjYmFlYmIuLjEyYmI2YzQxNDY4MyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiBAQCAtMjkxMCw3ICsyOTEw
LDcgQEAgaW50ZWxfc2V0X2NkY2xrX3Bvc3RfcGxhbmVfdXBkYXRlKHN0cnVjdA0KPiBpbnRlbF9h
dG9taWNfc3RhdGUgKnN0YXRlKQ0KPiAgLyogcGl4ZWxzIHBlciBDRENMSyAqLw0KPiAgaW50IGlu
dGVsX2NkY2xrX3BwYyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwgYm9vbCBkb3VibGVf
d2lkZSkgIHsNCj4gLQlyZXR1cm4gRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTAgfHwgZG91Ymxl
X3dpZGUgPyAyIDogMTsNCj4gKwlyZXR1cm4gSEFTXzJQUEMoZGlzcGxheSkgfHwgZG91YmxlX3dp
ZGUgPyAyIDogMTsNCj4gIH0NCj4gDQo+ICAvKiBtYXggcGl4ZWwgcmF0ZSBhcyAlIG9mIENEQ0xL
IChub3QgYWNjb3VudGluZyBmb3IgUFBDKSAqLyBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RldmljZS5oDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RldmljZS5oDQo+IGluZGV4IDlhZWJhMzI5
YjliZC4uNzEyMWU3Y2Q5NTEyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RldmljZS5oDQo+IEBAIC0xNDYsNiArMTQ2LDcgQEAg
c3RydWN0IGludGVsX2Rpc3BsYXlfcGxhdGZvcm1zIHsNCj4gIAlmdW5jKHN1cHBvcnRzX3R2KTsN
Cj4gDQo+ICAjZGVmaW5lIEhBU18xMjhCX1lfVElMSU5HKF9fZGlzcGxheSkJKCEoX19kaXNwbGF5
KS0+cGxhdGZvcm0uaTkxNWcNCj4gJiYgIShfX2Rpc3BsYXkpLT5wbGF0Zm9ybS5pOTE1Z20pDQo+
ICsjZGVmaW5lIEhBU18yUFBDKF9fZGlzcGxheSkJCShESVNQTEFZX1ZFUihfX2Rpc3BsYXkpID49
IDEwKQ0KPiAgI2RlZmluZSBIQVNfNFRJTEUoX19kaXNwbGF5KQkJKChfX2Rpc3BsYXkpLT5wbGF0
Zm9ybS5kZzIgfHwNCj4gRElTUExBWV9WRVIoX19kaXNwbGF5KSA+PSAxNCkNCj4gICNkZWZpbmUg
SEFTX0FTWU5DX0ZMSVBTKF9fZGlzcGxheSkJKERJU1BMQVlfVkVSKF9fZGlzcGxheSkgPj0gNSkN
Cj4gICNkZWZpbmUgSEFTX0FTX1NEUChfX2Rpc3BsYXkpCQkoRElTUExBWV9WRVIoX19kaXNwbGF5
KSA+PQ0KPiAxMykNCj4gLS0NCkxHVE0sDQpSZXZpZXdlZC1ieTogTmVtZXNhIEdhcmcgPG5lbWVz
YS5nYXJnQGludGVsLmNvbT4NCj4gMi41NC4wDQoNCg==
