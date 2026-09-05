Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED89C624D6
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 03:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6910E0A3;
	Sat,  5 Sep 2026 03:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1Pt2uVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA5D10E0A3
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 03:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788579656; x=1820115656;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mT4pZRXJejHLaoiZ8KOIx2mOtMg0MchyUgO5V38ayrY=;
 b=V1Pt2uVk8h8pvB6EiW41DroRW8RyQSbbikYSEFlPVjgcC96CSf9B3mV+
 ary2aThJsEHXb6KWXwDiFgpghkAWjaWy/eRXCzNG3YNXFh2APR9PxNgrr
 Av2XExsfGlxosMCWDOJ0BZC29BgxeB4gduuCi49spUC1Ov18KNgG1yjYk
 Zccou9cen5qmxdHSlFumkThLSFzru/56HtaVMRDMB5J7/2t5xINdBTfJn
 2gWhxyJcwaI/GL8ZfUJ6fljSAl3Bz/1fy3B5Gvrjx8uvHIVQ3Gm9InH9l
 5uFF/LYVty1EsoxyOvku8csoQ4EbWgpoh5nhcWGqE6Rbz8lqinhxzkoCW w==;
X-CSE-ConnectionGUID: R761UOUrSNqrSalGw3oJBg==
X-CSE-MsgGUID: WWrCw8DkQRSD0JVroTtXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92778559"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="92778559"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 20:40:56 -0700
X-CSE-ConnectionGUID: 0tUD8C9HRICZw3IjJ//JbQ==
X-CSE-MsgGUID: IiAmtheeQLGpmS668yNyMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="266507623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 20:40:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 20:40:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 20:40:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 20:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFhPejPbk9mV1cAkB5vihs5qKf+VToYP7hO0XXN7cTZ36ys2A0hXyQ4RLtCvL3w2Rnd1kQXggbw8Fud6cVt8UuGwsgyOYQGL9beCuAbNbkQtP3JNIbFftVu0h3O0C0xXNbbGF3TswEctwFjl4VTG6bYm5O40hMKdTckhcltGlYHZ0jf1cGVoKuUEuhZt+7BmQXmUcCPe9v3NX1sLoCvwO3dR7xlZXp4GE1PEt6/Kv6XxBsXKatPNoIiMEfuQp/kbylIshUxuzlGIovQihM+6b8YS650x1asUTpDSgwS86S7T2snWAVXZg7eAjgFUVgyHNcMqQB3D8iOifuDnRNtdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT4pZRXJejHLaoiZ8KOIx2mOtMg0MchyUgO5V38ayrY=;
 b=uIE6pbTn/7ikOBPwbcgzPkHAC4AWFKO/5Dgql7VnH0tNXW3ZpUR/8f9exxGpodkR9f3SqYmNfRgwx+c+Hp/uUaMpLHoVARnU9149AcHwHgqUg2h3Aa4ckgqGioO6V9/EPmKuWQZNdS36LAMvS6BBfha9z/2uSWJLi/0uUV2+J7D2z5REcwGSrTP/9mYfdVwcNbeN9fi07zVb/DeO/77KOLD2L9CFhxVYOlxz7ANmas4nM3qvRW6avtRuD6xVKSUZce5q5ohiZopxyv3vYfz7/Nzzu6D7e09JUbHHhUrpbhFpmKflRM0WdGyWMvYNLN1mXf6uQR5w9OnofK6lrF4hoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 03:40:50 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 03:40:50 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is
 0 or 1
Thread-Topic: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is
 0 or 1
Thread-Index: AQHdPJijJN73HM6eyEiaPYY6X7M1F7a+umqAgABHvYCAAFRykA==
Date: Sat, 5 Sep 2026 03:40:50 +0000
Message-ID: <PH8PR11MB8040F9B2950DEA9272114EB2F4B42@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260904180943.3455267-1-jia.yao@intel.com>
 <apsLfbXfIYuJgKUl@gsse-cloud1.jf.intel.com>
 <aptHq+dYSBbtRQqW@soc-5CG1426VCC.clients.intel.com>
In-Reply-To: <aptHq+dYSBbtRQqW@soc-5CG1426VCC.clients.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|PH8PR11MB7071:EE_
x-ms-office365-filtering-correlation-id: 105641f3-e036-4a5f-5aa7-08df0aff7abb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|42112799006|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info: MwRYG5p/JzbvmJEvYnYKrhSMQW8L0aL4ASDmMWMMpx/y8hrnE0mUJ7ssyyKibUsWP2XFqEOFCs0jHMaSMPwImrVuLf5XQvZ47VuYHCIBd55v3yfyJgnfzyZmchpiegsDatnZJJeJd8WCC5R0v1KwOWhO7aeZLEQgm1FRADZw+ynF0kZIwNJWuZpx6Pz6U/V3CT9+encEQxXkUCOtX4TTRCquhSNB5KLoHGQ3jJK+F3OZP6Y6KFK/beFWAtUexj4DAUGG7kbm/IhOdCY4UDvi+WbEThZ0QgeeHCxa4HEn8OgWQLNSRaBzZkj5X3xPA3fXQLelCFunAfgjCvqoIwPMQxcHU4+8dPbsK28pkFMDdK00p31T+rm9TKF2Q1Ea8uepUxi/P7brcsk9CStrwdtkZXqCcQwwRUSnCWDKnCTar8xSpcVdzknpR388zGdMhI4chGyVc80R6mwqafWrItkFVDR6A3QCQayrw22b6Z3vdmeRlUIaCSwKJxuaP2HTgJQ1UmqlLav14raKzt0p9sFUHLpBPzceOVomW+v4GJgC0urJr4BQ4tuqkrXe2y2107W1GI4DYMRZAKl/pT+ERWnZjpiTDZeiuHeic1rLMygPNcQYYlu3PEe2Do6dtOvDLMhXulF3Jtnj9thoC3fTcoovPpSP+TQeKyVX4P0/kaKGX0KacIWAEzVOip8ZSEXbTwwenAwachET47q8O3pzY8jpJ6OSlG4pzNxPs0meSb0FlgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(42112799006)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1lTMkM4eXhZbXBvRGlBTG0xQ3Ftd0R0UDVjQmFVZm5qZGEzWXNYdm9ZY09X?=
 =?utf-8?B?MlNNVHdHbEx0TmRYZitEYTYxVTRxQTd1dStSMTVxdXdYaHZYZXhSZldPcG43?=
 =?utf-8?B?d1JxT3RnekZJOUZKQUtEN1Bhd2NrSWZJS3NwbmtZVDNXall2RDdWYVZwTHpq?=
 =?utf-8?B?ZVdKVU5tbXNmRkY2ZkpFT0ZheUc5dXRKY1ZvQXdjc1Z2a2o2QnNac2lCcWNx?=
 =?utf-8?B?aERzeXhzYXV3VWFIckNHY2NPY041Q0dqUmw5Mldkb1Q4NmxIQlJ0a1NvRUZF?=
 =?utf-8?B?aHAybVl3aVhMY21VMnpGRnFTLzV0MmFBcDgwWFNzd3YxYTBmWEpjeDVubERj?=
 =?utf-8?B?RnBjdEg4TE9LRi95QzNDNjJ2STdKdXJMd0J2b05TSFlWaHpkV0pQcW16aisr?=
 =?utf-8?B?TllVQ1ljQWpyUFhNRDRzcDY1L051a1IxQWJJMVVtSFZ4U01GYlUycHlGUGxw?=
 =?utf-8?B?bmh4NnpGTmZsTnFmTEozVXRrK2tjc3gvSzBUZEtCOGx6U0ZJZHVIV2lNVnNV?=
 =?utf-8?B?VWx6RjBvY3BWb3d5VHBYY0NEMkFhUUMvblgwRnUzSXJTVThhZEpPTk5VclRz?=
 =?utf-8?B?UnZrSWZ2OFVFUXo3OUJoZ2ZuSmE1L05lTE9zcXN2dExXMm5XNDRZYWJacDg2?=
 =?utf-8?B?cTgxY3U3eHVmUHJmZTB1Mnhja1QrSzkvT216VktYMWNuMHVndlJIMHA1RG9k?=
 =?utf-8?B?OFAwWEppUk11cHFxeTlLMVBwdEpSWXZHUkI4VkhlZkhiZENZb215TWtKdDVq?=
 =?utf-8?B?Z2NTTWxZMy9QZENxUi9kbmc5OG9YZFd3bWtza1FSaFpjdHpvdEhiNmxIeXFu?=
 =?utf-8?B?d1MvamNoaXB4RnEwbFI1eHVrbzMxdFlSL3VEMGJObWxlalZDaE9qRVJDdE00?=
 =?utf-8?B?cTFFUnFkaWtXU1RoY1F3OHRHYmF6MUlOWnh6UnJvUTRMd3pQZ09wQ21lNWhX?=
 =?utf-8?B?cGhabEVsNXZMTHZvNXFiNm1VSkppZlR3VXQxQyszc3c0emUrbXAyQlc0Rngx?=
 =?utf-8?B?ci8vbUNFK3ZZRzA2MVhsMmJqdEw2bnNYSUQvN1RRamtic2lLL1FwNWJ2TE1P?=
 =?utf-8?B?anhnallJdUE4emF0QUM3UXRMYXJTYUUyTmJMVzkyWHlMMVVTNkUxcElPSUs4?=
 =?utf-8?B?UUt3ZCsycVlQeWpxbWRXQTdkWkluYzl0MlZpU2JJSXBhbk45bzFIWWRhMVBH?=
 =?utf-8?B?cWFybVpEUlhrdVVnbENhanZXYkd5VmxpU2FiaDRXTmJGZHRmbFFjN3lnN1lk?=
 =?utf-8?B?cHdrbDg5SWdIaVladlpsOHdiaUtJc3djS0c4a0pjN01YMC9sODVtSm4xdmFF?=
 =?utf-8?B?U0kyUi9oeDd2VWlTOEp2dmdoVEdVUzkreHplRDl2OXNPRkxSbytyOTF2U0xh?=
 =?utf-8?B?WWEyNmNnMnJZZERiNlJ0Mzk2bW42NExUWGNTSlBTcEg5NzlCQ28rWXBwZ1Uw?=
 =?utf-8?B?SXU0MjlYL0tGY3lRWjd3OWE4K2QwUDl3TXBHNkZ1c1VyUjgxMlFmSXpnTlF3?=
 =?utf-8?B?NlhlQkF4YklLam8xa0JpK2huUkxzbXdJc0dMM0hERThvYXN1OWVNN01kZXdk?=
 =?utf-8?B?V3YrVWtCVFVpcWV2b2tkc1VMNFZFdXkzRXY3QUR2V2dmajVPcVpkNXhSOWZI?=
 =?utf-8?B?RGI0YTVaUTJJYzNwYjVodnhpbWFmdzViSUtVYmJ4NW9GL1MvWldWSFJpYUJF?=
 =?utf-8?B?VFpXS0ZFTUNhb1hJeU5OZGZsQVVRWUhJcFZuRzM2d1ZtaERyVyt4VXNlWVl2?=
 =?utf-8?B?YUxVeTl6VkIrSUNYRGxGMnVaUjBJZmxTbGlGZjZWWnpiQWs4YzVBQXM2UWtw?=
 =?utf-8?B?K21VbjErVlFWTnZpS0YwdkxjWFNZdWRDYnJ1RVBkMENobEVkNEFHNTU4MHlD?=
 =?utf-8?B?aHdyWVlzUERpMXVMTFR4bWlxN3BRL21CczRLSTFyei9ydE8xTnRTVjZVNnhn?=
 =?utf-8?B?STVpTFpITUVDek5BUUgwNXBWWWE1QVFHUk5kVlpGL2J0dWhYOXdKb2lla0tq?=
 =?utf-8?B?YUo2Y0Ntd1FxQmRmZG1mVG54ZFU0QVhBRlhUMzNYZWJ0clB3VDhFSk5GRFFE?=
 =?utf-8?B?Q3hRUHZ5RU5VSG5Oa1JyOXRjdHN5eHJKSXZmOGhCUFJna2kvZnpySXFPeUs2?=
 =?utf-8?B?NHEyVHpJRTN6OWtHenZtNUNJTGF3c0dER3dDNm9vTHRabnNJeU90dnRSRjQz?=
 =?utf-8?B?eGtIVE15MXZNek8xWXJGbkl0R1d1eUZ3cDAxS3d1SFFBVHpnUlhqdFNPYTMr?=
 =?utf-8?B?L2MzQXJHMnE2d1kzU2NydFVncEF6bk9LUWF5ZEltODJIQ1FFQ0hZYVVOYUds?=
 =?utf-8?Q?ZfTPzDqID4cMcsOgoM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uKAA+uoFF/uYxJ8jgkVHS6h06XfPU2VzcPehjkFy1pab+CSNQJAkuwz11764NIP+/1h5EliKl+CQYeBe1TMX+RmaVsZTDtIYIV/AbXF/GVx8pJ4jNu4tUqykBLRaL+FemI7Z4Bw6eI2wvgfpW2uQYAZGwrq7rM/1IIk5R2T9UwpuCMIO/rS8I0pbSD2hXi55q/42BBS4ilOGVPr3vn9hrS9GKjIHoteytnMmy25DzPQqYBs4DY64pmWiFKqinQFDbosIunoihEgABOMurQ5vpSyuxcFjo+9l9SOQdsBbQo5pdSj5IaJCx+aKw1mD2SACRNce+iLc5x+Y3umFZ0Gkgw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105641f3-e036-4a5f-5aa7-08df0aff7abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 03:40:50.1572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyGw805HXUAiWQEIgnJ0IlTscVt1/HUMrVFuzWTR2EFqI43fh+Hrb/hmP9QLnzJGKgaBwfsQpF7pn7T9CfWhjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

SXQgZG9lcyByZXR1cm4gMS4gIEkgZ290IHRoZSBsb2cgd2l0aCBmb2xsb3dpbmcgcGF0Y2ggZW5h
YmxlZC4NCnU2NCB4ZV9scmNfdGltZXN0YW1wKHN0cnVjdCB4ZV9scmMgKmxyYykNCiB7DQorICAg
ICAgIHU2NCB0aW1lc3RhbXA7DQorDQogICAgICAgIGlmICh4ZV9scmNfaXNfbXVsdGlfcXVldWUo
bHJjKSkNCi0gICAgICAgICAgICAgICByZXR1cm4geGVfbHJjX211bHRpX3F1ZXVlX3RpbWVzdGFt
cChscmMpOw0KKyAgICAgICAgICAgICAgIHRpbWVzdGFtcCA9IHhlX2xyY19tdWx0aV9xdWV1ZV90
aW1lc3RhbXAobHJjKTsNCiAgICAgICAgZWxzZQ0KLSAgICAgICAgICAgICAgIHJldHVybiB4ZV9s
cmNfY29udGV4dF90aW1lc3RhbXAobHJjKTsNCisgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSB4
ZV9scmNfY29udGV4dF90aW1lc3RhbXAobHJjKTsNCisNCisgICAgICAgaWYgKHVubGlrZWx5KHRp
bWVzdGFtcCA9PSBDT05URVhUX0FDVElWRSkpDQorICAgICAgICAgICAgICAgeGVfZ3Rfbm90aWNl
KGxyYy0+Z3QsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICJWTEstODk4MjY6IHhlX2xy
Y190aW1lc3RhbXAgcmV0dXJuZWQgQ09OVEVYVF9BQ1RJVkU9MVxuIik7DQorDQorICAgICAgIHJl
dHVybiB0aW1lc3RhbXA7DQogfQ0KDQpbU2F0IFNlcCAgNSAwMzoyMDo1MyAyMDI2XSB4ZSAwMDAw
OjAzOjAwLjA6IFtkcm1dIFRpbGUwOiBHVDE6IFZMSy04OTgyNjogeGVfbHJjX3RpbWVzdGFtcCBy
ZXR1cm5lZCBDT05URVhUX0FDVElWRT0xDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogTmVybGlnZSBSYW1hcHBhLCBVbWVzaCA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGlu
dGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNiAzOjM1IFBNDQo+IFRv
OiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IENjOiBZYW8sIEpp
YSA8amlhLnlhb0BpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExp
biwNCj4gU2h1aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL3hlL2d1Yzogc2tpcCBURFIgdGltZW91dCBjaGVjayB3aGVuDQo+IGN0eF90
aW1lc3RhbXAgaXMgMCBvciAxDQo+IA0KPiBPbiBGcmksIFNlcCAwNCwgMjAyNiBhdCAxMToxODoz
N0FNIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+T24gRnJpLCBTZXAgMDQsIDIwMjYg
YXQgMDY6MDk6NDNQTSArMDAwMCwgSmlhIFlhbyB3cm90ZToNCj4gPg0KPiA+K1VtZXNoDQo+ID4N
Cj4gPj4gQSBjdHhfdGltZXN0YW1wIG9mIDAgb3IgMSBpbmRpY2F0ZXMgYW4gaW52YWxpZCB0aW1l
c3RhbXA6DQo+ID4+IC0gMSAoQ09OVEVYVF9BQ1RJVkUpIGlzIHRoZSBjb29raWUgd3JpdHRlbiBi
eSB0aGUgV0EgQkIgaW1tZWRpYXRlbHkNCj4gPj4gICBhZnRlciBhIGZ1bGwgY29udGV4dCByZXN0
b3JlLCBiZWZvcmUgdGhlIHNwaW5uZXIgaGFzIHJ1bi4NCj4gPj4gLSAwIGNhbiBvY2N1ciB3aGVu
IGxyYy0+Y3R4X3RpbWVzdGFtcCBzaGFkb3cgaXMgdW5pbml0aWFsaXplZCBvciB3YXMNCj4gPj4g
ICBsYXN0IHVwZGF0ZWQgd2hpbGUgdGhlIGNvbnRleHQgd2FzIGJlaW5nIHJlc3RvcmVkLg0KPiA+
Pg0KPiA+PiBJbiBib3RoIGNhc2VzIHRoZSB0aW1lc3RhbXAgaXMgbm90IHlldCB2YWxpZCwgc28g
cmVzZXQgdGhlIHNhbXBsaW5nDQo+ID4+IGJhc2VsaW5lIGFuZCB3YWl0IGZvciB0aGUgbmV4dCBj
aGVja190aW1lb3V0KCkgY2FsbC4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSmlhIFlhbyA8
amlhLnlhb0BpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3Vi
bWl0LmMNCj4gPj4gaW5kZXggMGE2ZTJiODFiNWE1Li5jYWYwMmQyNjU1MzMgMTAwNjQ0DQo+ID4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+PiBAQCAtMTQyOSw2ICsxNDI5LDIw
IEBAIHN0YXRpYyBib29sIGNoZWNrX3RpbWVvdXQoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEs
IHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYikNCj4gPj4gIAkJcmV0dXJuIHhlX3NjaGVkX2ludmFs
aWRhdGVfam9iKGpvYiwgMCk7DQo+ID4+ICAJfQ0KPiA+Pg0KPiA+PiArCS8qDQo+ID4+ICsJICog
QSBjdHhfdGltZXN0YW1wIG9mIDAgb3IgMSBpbmRpY2F0ZXMgYW4gaW52YWxpZCB0aW1lc3RhbXA6
DQo+ID4+ICsJICogLSAxIChDT05URVhUX0FDVElWRSkgaXMgdGhlIGNvb2tpZSB3cml0dGVuIGJ5
IHRoZSBXQSBCQg0KPiBpbW1lZGlhdGVseQ0KPiA+PiArCSAqICAgYWZ0ZXIgYSBmdWxsIGNvbnRl
eHQgcmVzdG9yZSwgYmVmb3JlIHRoZSBzcGlubmVyIGhhcyBydW4uDQo+ID4+ICsJICogLSAwIGNh
biBvY2N1ciB3aGVuIGxyYy0+Y3R4X3RpbWVzdGFtcCBzaGFkb3cgaXMgdW5pbml0aWFsaXplZCBv
cg0KPiB3YXMNCj4gPj4gKwkgKiAgIGxhc3QgdXBkYXRlZCB3aGlsZSB0aGUgY29udGV4dCB3YXMg
YmVpbmcgcmVzdG9yZWQuDQo+ID4+ICsJICogSW4gYm90aCBjYXNlcyB0aGUgdGltZXN0YW1wIGlz
IG5vdCB5ZXQgdmFsaWQsIHNvIHJlc2V0IHRoZSBzYW1wbGluZw0KPiA+PiArCSAqIGJhc2VsaW5l
IGFuZCB3YWl0IGZvciB0aGUgbmV4dCBjaGVja190aW1lb3V0KCkgY2FsbC4NCj4gPj4gKwkgKi8N
Cj4gPg0KPiA+VGhpcyBpc24ndCByaWdodC4gYGN0eF90aW1lc3RhbXBgIGlzIHRoZSAzMi1iaXQg
dmFsdWUgcmV0dXJuZWQgYnkNCj4gPmB4ZV9scmNfdGltZXN0YW1wKClgLCBzbyAwIGFuZCAxIGFy
ZSB2YWxpZCB2YWx1ZXMgd2hlbiB0aGUgdGltZXN0YW1wDQo+ID53cmFwcy4gSWYgeW91IHdlcmUg
Y2hlY2tpbmcgdGhlIGZ1bGwgNjQtYml0IHZhbHVlLCB0aGVuIHRoaXMgbWlnaHQgbWFrZQ0KPiA+
c2Vuc2UsIGFsdGhvdWdoIEknbSBub3QgY29udmluY2VkIG9mIHRoYXQgZWl0aGVyLg0KPiA+DQo+
ID5NeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgYHhlX2xyY190aW1lc3RhbXAoKWAgb25seSBpbnNw
ZWN0cyB0aGVzZQ0KPiA+c3BlY2lhbCBzdGF0ZXMgYW5kIHRha2VzIGFkZGl0aW9uYWwgYWN0aW9u
IHdoZW4gMCBvciAxIGFyZSBkZXRlY3RlZC4gQXMNCj4gPmEgcmVzdWx0LCB0aG9zZSBzcGVjaWFs
IHZhbHVlcyBzaG91bGQgbmV2ZXIgYmUgcHJvcGFnYXRlZCB0byB0aGUgY2FsbGVyLg0KPiA+SW4g
b3RoZXIgd29yZHMsIHRoaXMgaXMgbm90IGEgcmF3IHRpbWVzdGFtcCByZWFkLCBzbyB3ZSBzaG91
bGRuJ3QgbmVlZA0KPiA+dG8gaGFuZGxlIHRob3NlIGNhc2VzIGhlcmUuDQo+ID4NCj4gPlVtZXNo
IHRvIGNvbmZpcm0gbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0Lg0KPiANCj4gQWdyZWUsIHdl
IHNob3VsZCBub3QgYWRkIHRoaXMgY29kZSBoZXJlLg0KPiANCj4gRm9yIGFuIExSQywgY3R4X3Rp
bWVzdGFtcCBvZiAwIG1lYW5zIHRoZSBjb250ZXh0IHdhcyBuZXZlciBzY2hlZHVsZWQgaW50bw0K
PiBIVy4gV2UgY2Fubm90IHRyZWF0IHRoYXQgYXMgaW52YWxpZC4NCj4gDQo+IFdlIHNob3VsZCBu
ZXZlciBzZWUgYSAxIHJldHVybmVkIGZyb20geGVfbHJjX3RpbWVzdGFtcCgpLiAxIGlzIHVzZWQN
Cj4gaW50ZXJuYWxseSB0byBmZXRjaCB0aGUgcmlnaHQgdGltZXN0YW1wIHRvIGluZGljYXRlIGhv
dyBsb25nIHRoZSBjb250ZXh0IHJhbi4gSWYNCj4gd2Ugc2VlIGEgMSBoZXJlLCBpdCdzIGEgYnVn
LiBGb3IgYSBicmllZiBwZXJpb2Qgb2YgdGltZSwgc3VjaCBhIGJ1ZyBleGlzdGVkIGluDQo+IHRo
aXMgdHJlZSwgYnV0IGl0IHdhcyBmaXhlZCBpbiBiZWxvdyBjb21taXQ6DQo+IA0KPiBkcm0veGUv
bHJjOiBkb2N1bWVudCBzZW50aW5lbCBhbmQgbWFrZSBDVFhfVElNRVNUQU1QIHJlYWQgVE9DVE9V
LXNhZmUNCj4gDQo+IFRoYW5rcywNCj4gVW1lc2gNCj4gDQo+ID4NCj4gPk1hdHQNCj4gPg0KPiA+
PiArCWlmIChjdHhfdGltZXN0YW1wIDw9IDEpIHsNCj4gPj4gKwkJam9iLT5zYW1wbGVfdGltZXN0
YW1wID0gVTY0X01BWDsNCj4gPj4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+PiArCX0NCj4gPj4gKw0K
PiA+PiAgCWpvYi0+c2FtcGxlX3RpbWVzdGFtcCA9IGN0eF90aW1lc3RhbXA7DQo+ID4+ICAJY3R4
X2pvYl90aW1lc3RhbXAgPSB4ZV9scmNfY3R4X2pvYl90aW1lc3RhbXAocS0+bHJjWzBdKTsNCj4g
Pj4NCj4gPj4gLS0NCj4gPj4gMi40My4wDQo+ID4+DQo=
