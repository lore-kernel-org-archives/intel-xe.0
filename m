Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA6FD3C536
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 22:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536F010E064;
	Thu, 17 Oct 2024 22:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlKjW4kC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7498710E064
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729203957; x=1760739957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OSyj9Qpv3rhS8jAzxnA1/CFWuuamSq385M8IzOZSxyA=;
 b=dlKjW4kCLJCyGOZbIvZiquL7zEc5uoTCbRQSDhr0lIu8NIXHHC0CBAwe
 RlFtEa8QzfI3KrNq42Gul04BCF3yvoZ05YhG5WgEwJZNHuB83gZhiCR9Z
 rij5DKfUFdaa8T3GrkR8b62BQng+Kpyyk6U82RdaAFce5YeunvQvQn8jK
 QXygzC9kTaMXPxCht5gmwTo6CaYQZ6MFMiezh2hxQw/ieGvI5o2QkWXGP
 wg5+866z5mMDty7d8hFL7dXwcxBFn84r1DxkBAZ4O+CpXNjq1/NzxxwP7
 YdxVKtkrTBFTJ3wJ5tiquWwj262SJVpnye/8jWFfFzfiS3084OgNPp+uQ w==;
X-CSE-ConnectionGUID: bah945ISTGiJomrox/sasA==
X-CSE-MsgGUID: RX8g7C4tRgqFWr/SEEPxsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40122299"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="40122299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 15:25:56 -0700
X-CSE-ConnectionGUID: AVa6Wh5qSO2xAsjAdWxoKw==
X-CSE-MsgGUID: DYnh07HDRRWZ1ndy/kMK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109505537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 15:25:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 15:25:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 15:25:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 15:25:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 15:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVbDR9dKJdts5hdPOW0QUdRZMFYbMDC6ZNGIaqeyVSZO9ZJDnzGs3NuS1KPqOf7QsxKStfeTYaaduastm+VOrIlp4gB5Zlxtr/57+JbmreyQeAgqzkg7/ZA8Rx+p/XM/VSokKNJpaWzbJMekcnjjh6LM4jIKNz7rLfwl8NRWkAxWTBdEP3MVBMUikHKz7Lqk2mMmLgvy7PNJb/0b/4cP99sEUF8Xpp+Yc2bYWesMNbsFnIT1yQ3cAlBJikgFQUyAyROvtsasXOSSz0u+Fs5iszelXPrZkxMJi7nGf9XKY6y4PZGuQPrAN6P9nmb/6VzcLBf1VpV28+UExF4/ob8q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSyj9Qpv3rhS8jAzxnA1/CFWuuamSq385M8IzOZSxyA=;
 b=CjUioF/jBhNDV1ICAZ7ZRSGeMTXYloUOn/v8g9xnbxCjx0wMZ4BzY6exRHcxxX1nazdz8yo2SBpKkutkueXegjTMozUuyLJ3iDMwlVOz8cTgrxa9SWBe6b3296vZzRXzgA+xCnxXqUsGs6dLJ+ansBeH/2d1fzSgi0yde4N3/HFGeSPBIfmjM6xOT8PAzN58xDvCXOvtDeEByqpKB9sgwgLccNyO/uowXStkKIK/IH2/E/eTx60GRosts6X/H74e58YecO/C/pUXe3xnwTUYP5gO/vCakQ1un7LcRklSAkPkOm45U6EboO9qvKSXDyfnhSvJtX8SStGk1ITjLyQOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 22:25:46 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e%5]) with mapi id 15.20.8069.019; Thu, 17 Oct 2024
 22:25:46 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v3] drm/xe: Handle unreliable MMIO reads during forcewake
Thread-Topic: [PATCH v3] drm/xe: Handle unreliable MMIO reads during forcewake
Thread-Index: AQHbILcFjwDAwAv2k0WSmF6u20wRzrKLOMWAgABBPYA=
Date: Thu, 17 Oct 2024 22:25:46 +0000
Message-ID: <BL1PR11MB5447FD4629F9DF8E6068A307EA472@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
 <20241017163038.1554591-1-shuicheng.lin@intel.com>
 <b5e91925-2c95-461d-a18a-ef7d448c9f78@intel.com>
In-Reply-To: <b5e91925-2c95-461d-a18a-ef7d448c9f78@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|PH0PR11MB4789:EE_
x-ms-office365-filtering-correlation-id: eb3a05b7-264e-4fb3-6f52-08dceefaa569
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OEJ5akZMZFpNM2t2d1JUaCsyL2xHbEh6QkVMT0tveS9peGllS0YzZ2wyUGFR?=
 =?utf-8?B?QlZ5UVphbVhDM0pWQkgzNWFDUTZneThKV3k4YXVwTEVXSzZyblZvT29qMnk4?=
 =?utf-8?B?Mmx1WmFHbmdqMWhQNjdHMHd2SHlwSzF2Y3lVN09zMU1HekpuejMxbFFBNTly?=
 =?utf-8?B?bnkvTTloM2ZUdlY0SDZMN0lSa2hlYkRUaDFWeWxkc3Z2QlFBZnhCb1ZvWVJK?=
 =?utf-8?B?YTNuN0ViYWxibUdWYVpGMDRaRU1JVnF6TDM3Sm1OZnVUcGFUakpKQ28vejM5?=
 =?utf-8?B?TTl2UjJ0M0ZpeFJRZFkyeHFvRy9IaWxWa0YxSUgyYldVYjNkVnhYMTBpM1dK?=
 =?utf-8?B?WjJpMm5EYkJ6VXVxeHgxTWpLWXBXbjhrWlIxMmlaVDRvNllkb3F1Z3NYdlh6?=
 =?utf-8?B?R3FhbWJvY1JuSlp4RjRyUjZSOTVmbHpWSjVxNXJhZWdCam5LWmk2c04xTy9m?=
 =?utf-8?B?SnZ1aHkzSnl3K0J5TGliUnBXNVA3T21YK2ZmcjVwT2tHM3QvalBLNGtGTlU4?=
 =?utf-8?B?aWd5bDY5QkZQd2Z6Qlc2RnF0UHVsdzRxQnRCQkU1dDB0OFZoM1M3dWlIUVV5?=
 =?utf-8?B?TWwrUmhPcTdybksxY2dQWmpuR3RMa3NlVHBUZEQybVE3NmhETWtkcXpibW9Z?=
 =?utf-8?B?SHBQUlRhckk1bWhwVFp4OVhtNnNmK0FNc1E4QlljN0taV2d5bnM5VU1hRnJ1?=
 =?utf-8?B?SGlNckxGQS9CZzc5R0owdktWTjV2bGQydlZUakdORmdVdTBlZEFqZC9tbTdF?=
 =?utf-8?B?WmsyKzBFcVBWTWFqMGFKTTVkVlFWZXcvTkpaUzNJTm9QNVdUdTR1dktRVTR2?=
 =?utf-8?B?eDBFODB3TERtbUZZMkNKZlVuWGJLVWpmN1IzdGdRRGZIaW9CWmxubHIvS1Jr?=
 =?utf-8?B?cDUxRDg4M2Y5WWFQM2lyaVdSU2VxT2hvWW1GdUVKckZLcFNncGZuaHo3eEty?=
 =?utf-8?B?NnhzWDdWN3VmMUorejExb1BtZTFFc2lTQTEwd0FBU3hoOHJRYTVmMXI0d1ND?=
 =?utf-8?B?czRjYjdWSDVUSlZVNWFOOXZlYmhrUEJHRGRvVXZFUW5XZXU5NnJaaFdzWjlN?=
 =?utf-8?B?SlU5MVVjc3FDeE1ibVV1dHlNem1mUnp0MmhTekNmR01JYnovU0JaMGhHMlZ0?=
 =?utf-8?B?Q2lETXA5MHcyRGphMmJsb3QwNktTWS9NWndQNm8rMU5zQ0w4WWJoVHZHTlFq?=
 =?utf-8?B?YTM4WW1WQUhyTDRTN1pTWmNoVnd6Uk9OOUtRZ3V5dnBhY0NVUWxhN0QrU01Y?=
 =?utf-8?B?d2VwYitZeUd6WXhaRGpEbmZNZG1iTEp0Q3UrMzZwelh2Uit0OGk2T1kyZGJR?=
 =?utf-8?B?dERPSjZXOFc4SE5LeURQT0s5U2xLN0NtV21RQ004a0o1SFAzaVJWMFVaMG1L?=
 =?utf-8?B?dzBnVUxMVXQ4MFVOVFltdnJ2SEt0Zk9CRitvYjVuVFZBbXU2SWRGMEs4SUl3?=
 =?utf-8?B?cDdOeWRQYlFHZS9Nb3BXQUZLTkVUSmVIZnk4djVMNkVlMmlGakp4aU9jclp3?=
 =?utf-8?B?UWZXM1RrNVc2T2VJb1pUMTUvUVUrUksxd1FaY09TZVJETWs1eDkrM2lVbEQ1?=
 =?utf-8?B?V3Q2R0ZKOEZaRTFCb29ENklhdkZPRXZVdnNFTmJDbHQxcjNlZnM5MlNTM3My?=
 =?utf-8?B?TTFSNU5scm9RbTVYTW41VTJwWUdRTjF0eVNucmpqT01PQVpGZnduaTlCK25w?=
 =?utf-8?B?QU82NWIveU04Qk9SeXNyWEhmWDU2UWc0TS9SUG9jTWdpOXZmTzBCZEJiZWQv?=
 =?utf-8?B?dFZmTXdhSDU2RmJhbmpSWkxDTUFEaThFdlE0bTZtNjNvbXZhYTVSYk8xQS8v?=
 =?utf-8?Q?dp1Uoq+CMD1IjR9g6lNlyh4IMato1H4g3S58g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3dObjVCT0F0bjVjTG9DOHVmYTk2OU9ScWg3SmFSMVdmOTRMUkF6YXB2aU03?=
 =?utf-8?B?WkdURGxXREhqMDRvSzl3LzVobmdyY0dGUU4vNnhYc080MXBMY2NyUThaU2hr?=
 =?utf-8?B?L0UzcjU2dWh2eW83WnNrbnpZVnpkVzdQWkVJc1hKVk1ObEYyR0hIbnE5Unpm?=
 =?utf-8?B?blp2VjFXak9GWFJCN2p0SHVpRXJNMHhFRW9taWYrVVB1bFczQkxZWWcydzhj?=
 =?utf-8?B?WjlTQ2NFYllXYWNUWCsrVy9BUTc4Ym4yTU94OHhBQ0FZWktXOWFQTnJLSFRN?=
 =?utf-8?B?bVdxS3RhWEhpeWR6eG5KSTVaTDNrNG1HajVSOTN4YnBtamR2Wm00b0RLRi9H?=
 =?utf-8?B?L1NLL250cG5wZE9SV2V6NU9naVJQRFNXSm00SzdaWUllU2QxNVEvT3RzWVkx?=
 =?utf-8?B?OUovUXNKQ25wSkxJT3IrdjFkaG03eFR0ZG84YkIzdEdrU3pobS92YXY2V0VM?=
 =?utf-8?B?aE9KNDNHR1RQM25GYVRYRWp2L3VISlY0MjZhNmZVVnNoblVWeGhzc1dZclJJ?=
 =?utf-8?B?SFVGQTgrUmN3WWh4MysvTkxPZnBWa3l5V1FxekRNdFRVT0hlcFdWZXVqd1k1?=
 =?utf-8?B?Z05IaW80YzJiRG9qYy8vTHVrN1hJd0RxL1g4ZWY2RjRETStZNEx3ODF0S1ZH?=
 =?utf-8?B?RGVXN2NmeFE3WktLb3JuWFIzZmdPdzA5eWpTaFQreWJnY2YySlpYc2drMk15?=
 =?utf-8?B?MUN5aWNoV3pQaFdvbzN4UTVJSGZqQ2s0T0w5VFFEb3ducGdEZzhaWmNscTho?=
 =?utf-8?B?dThDZHhJUDEvNVY5RVJsSjJxZEFSM0xSVERvU3NISUhGTHZGUnpZZ2xzeVZE?=
 =?utf-8?B?QTk1ZmVzYTdjeXd4bCtFYzV0WHlvb0xrMjBKOUV2NkF3N3k4bkNFOEkxelhO?=
 =?utf-8?B?NlpCeGhvL254WVJ5RFVyVHE2YXZyT05aUE1KQ3N0OW1KbW1RWGhoNlM3YlJn?=
 =?utf-8?B?QmhPbTZ1MUs4VzBud0YzZTRmdHdWTm51K0lnNVRkVGk1VSt3ajUvT0t6N2JK?=
 =?utf-8?B?NkhOSWFYLy92blBKc3N1UEp2VzFuQ0tCcGh4dnlCQlVSSnRCWVpUSmRwZ3NV?=
 =?utf-8?B?NVhiNHExanFvY2ZiZFNtUFp3bmg3d3ZjZHUySmxXb0ZzUXIzRkVUUUxrUXJQ?=
 =?utf-8?B?QWF1b0hZbitzdHVxUWNFdnczd2FGTFJSK3VPNHNMNitUd0FGbWpScmVGdW9Y?=
 =?utf-8?B?M1p2RXI2WXpTaXZTdkdPRm5SRjViQXNxS1RBdld3bzVsRExtU0JwcTJ0bjJu?=
 =?utf-8?B?MUE5RjUwSVptckE2WFVpR3NzN012TXBnUVZwNHVPbmx4bzlmL0YxQndRUzdm?=
 =?utf-8?B?NTlMMEdQSTEycXlSckVBb2lreDVmUXZRcTJMa1RDZHB0OUlIMklRVkRsTzZR?=
 =?utf-8?B?cStUTy9yYUx6VUl2TVJVNW5Jd1BJbHZvZHh3MzVUMTBpdEhuMXpEaURHNXcr?=
 =?utf-8?B?RVZzR29wT3N1WC82dFNSN0w4aVlHcXdKNDNuR3RSVjNzc2Yzc0hvTHNqMGo2?=
 =?utf-8?B?MXBFeTNRNmtwd0pmYUozdmVwM3haSTl1NkdvKzkvU051SHc0dGJSSmtmMnBF?=
 =?utf-8?B?UmRBUHU3Z1hkUVd0OHlINC91VDdCK1ZIUmNkdG42VGpmZU9RV0NWKzB3cFRE?=
 =?utf-8?B?MTFKQ2p0QUxjaUhwYzh5ci91aGtqYlpxdVIzVWVYRWRHNDUzeldBVldhYThY?=
 =?utf-8?B?VmxZM0ZLWHd3Y1JpVWk3WGZMbHRLcUdmNzdZOUhxQThUdDZzRW9DQVloenhG?=
 =?utf-8?B?aklsQjhIVFl2NjViNGwzWVp5MEJVK09Gb1YzRGRXVndhR28zZ21KNnVUQUdE?=
 =?utf-8?B?MGNkdTR5NlhaUkJGRGMwL3E2TCs4SW94RXY2WndaZFpEWHBiRDJBTUp4Vmwv?=
 =?utf-8?B?NjByckhqVDNqZytDcjJ3NFk2cUhiRHdvTnROOVlublp4Z1NodTQwZFVrTTRK?=
 =?utf-8?B?aGxlMGxONW1YaVdkQndBQ0NGRGVYanRWZ3I3TEdrc2l3QU42d1ZCek5nd3Vy?=
 =?utf-8?B?d0hqTjAxWktLS1FXS2JMR3Zlakl3SDRkd0FpNTR2RmZRc0s5VlF2d0lYbC9B?=
 =?utf-8?B?U0xoeTFBTjNyZkpIenN1YVlEUFRhZTg2cWpKTmxLV1NIVjFaS0U0bXVoTmkx?=
 =?utf-8?Q?0lV7jA9tbpHhjWVz5whxbwPjQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3a05b7-264e-4fb3-6f52-08dceefaa569
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 22:25:46.4118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFvxsjvUrVHgTMtcryGWVIkd+F9am4mQ4gdCzsXMKeagkQjGmZVtAPgmZO2nhHPKyiBOPwerIbkKjHZ+QAqq5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
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

DQpPbiBUaHUsIE9jdCAxNywgMjAyNCAxMDo1MSBBTSBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhp
bWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+IHdyb3RlOg0KPiBPbiAxNy0xMC0yMDI0IDIy
OjAwLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0KPiA+IEluIHNvbWUgY2FzZXMsIHdoZW4gdGhlIGRy
aXZlciBhdHRlbXB0cyB0byByZWFkIGFuIE1NSU8gcmVnaXN0ZXIsIHRoZQ0KPiA+IGhhcmR3YXJl
IG1heSByZXR1cm4gMHhGRkZGRkZGRi4gVGhlIGN1cnJlbnQgZm9yY2Ugd2FrZSBwYXRoIGNvZGUN
Cj4gPiB0cmVhdHMgdGhpcyBhcyBhIHZhbGlkIHJlc3BvbnNlLCBhcyBpdCBvbmx5IGNoZWNrcyB0
aGUgQklULg0KPiA+IEhvd2V2ZXIsIDB4RkZGRkZGRkYgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYW4g
aW52YWxpZCB2YWx1ZSwgaW5kaWNhdGluZw0KPiA+IGEgcG90ZW50aWFsIGlzc3VlLiBUbyBhZGRy
ZXNzIHRoaXMsIHdlIHNob3VsZCBhZGQgYSBsb2cgZW50cnkgdG8NCj4gPiBoaWdobGlnaHQgdGhp
cyBjb25kaXRpb24gYW5kIHJldHVybiBmYWlsdXJlLg0KPiA+IFRoZSBmb3JjZSB3YWtlIGZhaWx1
cmUgbG9nIGxldmVsIGlzIGNoYW5nZWQgZnJvbSBub3RpY2UgdG8gZXJyIHRvDQo+ID4gbWF0Y2gg
dGhlIGZhaWx1cmUgcmV0dXJuIHZhbHVlLg0KPiA+DQo+ID4gdjIgKE1hdHQgQnJvc3QpOg0KPiA+
ICAgIC0gc2V0IHJldCB2YWx1ZSAoLUVJTykgdG8ga2ljayB0aGUgZXJyb3IgdG8gdXBwZXIgbGF5
ZXJzDQo+ID4gdjMgKFJvZHJpZ28pOg0KPiA+ICAgIC0gYWRkIGNvbW1pdCBtZXNzYWdlIGZvciB0
aGUgbG9nIGxldmVsIHByb21vdGlvbiBmcm9tIG5vdGljZSB0byBlcnINCj4gDQo+IEZlZWwgZnJl
ZSB0byByZXRhaW4gUkIgb24gdGhpcyB2ZXJzaW9uLg0KPiANCj4gQXMgYSBnZW5lcmFsIHByYWN0
aWNlLCBjcmVhdGluZyBhIG5ldyB2ZXJzaW9uIHNvbGVseSBmb3IgY29tbWl0IG1lc3NhZ2Ugb3IN
Cj4gY2hhbmdlbG9nIHVwZGF0ZXMgaXMgYXZvaWRlZCwgYXMgdGhpcyB0cmlnZ2VycyBhIGZ1bGwg
Q0kgcnVuLiBNYWtpbmcgY2hhbmdlcw0KPiBiZWZvcmUgcHVzaGluZyBhbmQgcnVubmluZyBjaGVj
a3BhdGNoIHNob3VsZCBiZSBzdWZmaWNpZW50Lg0KPiANCj4gQlINCj4gSGltYWwNCg0KSGltYWws
IFRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdXIgZXhwZXJpZW5jZSBzaGFyaW5nLiBJdCBpcyByZWFs
bHkgZ29vZCBmb3IgbWUgYXMgSSBhbSBzdGlsbCBuZXcgd2l0aCB0aGUgcHJvY2Vzcy4NClllcy4g
TWFpbnRhaW5lciBjb3VsZCBoZWxwIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgZHVyaW5nIHB1
c2ggc3RhZ2UsIGJ1dCBpdCB3aWxsIGNvc3QgZXh0cmEgZWZmb3J0IGZvciB0aGUgbWFpbnRhaW5l
ci4NClVubGVzcyBtYWludGFpbmVyIGV4cGxpY2l0bHkgb2ZmZXIgaXQsIEkgc3RpbGwgcHJlZmVy
IHRvIGNvcnJlY3QgdGhlIGNvbW1pdCBtZXNzYWdlIGJ5IG15c2VsZi4NCkZvciB0aGUgUkIsIEkg
Zm9yZ290IHRvIHVwZGF0ZSBpdCB3aGVuIEkgdXBkYXRlIHRoaXMgcGF0Y2guIExldCBtZSBhZGQg
aXQgYW5kIHNlbmQgYSBuZXcgb25lLiA6KA0KSSB3aWxsIHRyeSBteSBiZXN0IHRvIG1pbmltaXpl
IHRoZSBwYXRjaCB2ZXJzaW9uIG51bWJlciwgYW5kIGl0IGlzIHN0aWxsIGEgbG9uZyB3YXkgdG8g
cmVhY2ggaXQuDQoNClNodWljaGVuZw0KPiANCj4gPg0KPiA+IFN1Z2dlc3RlZC1ieTogQWxleCBa
dW8gPGFsZXguenVvQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGlu
IDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+DQo+ID4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpk
ZWN6a29AaW50ZWwuY29tPg0KPiA+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnBy
YXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5y
b3BlckBpbnRlbC5jb20+DQo+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtlLmMg
fCAxMiArKysrKysrKystLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2ZvcmNlX3dha2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2ZvcmNlX3dha2Uu
Yw0KPiA+IGluZGV4IGE2NGMxNDc1N2M4NC4uMDg2MjE3MTdiMTRiIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jDQo+ID4gQEAgLTExNSw5ICsxMTUsMTUgQEAgc3RhdGlj
IGludCBfX2RvbWFpbl93YWl0KHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdA0KPiB4ZV9mb3JjZV93
YWtlX2RvbWFpbiAqZG9tYWluLA0KPiA+ICAgCQkJICAgICBYRV9GT1JDRV9XQUtFX0FDS19USU1F
T1VUX01TICoNCj4gVVNFQ19QRVJfTVNFQywNCj4gPiAgIAkJCSAgICAgJnZhbHVlLCB0cnVlKTsN
Cj4gPiAgIAlpZiAocmV0KQ0KPiA+IC0JCXhlX2d0X25vdGljZShndCwgIkZvcmNlIHdha2UgZG9t
YWluICVkIGZhaWxlZCB0byBhY2sgJXMNCj4gKCVwZSkgcmVnWyUjeF0gPSAlI3hcbiIsDQo+ID4g
LQkJCSAgICAgZG9tYWluLT5pZCwgc3RyX3dha2Vfc2xlZXAod2FrZSksIEVSUl9QVFIocmV0KSwN
Cj4gPiAtCQkJICAgICBkb21haW4tPnJlZ19hY2suYWRkciwgdmFsdWUpOw0KPiA+ICsJCXhlX2d0
X2VycihndCwgIkZvcmNlIHdha2UgZG9tYWluICVkIGZhaWxlZCB0byBhY2sgJXMgKCVwZSkNCj4g
cmVnWyUjeF0gPSAlI3hcbiIsDQo+ID4gKwkJCSAgZG9tYWluLT5pZCwgc3RyX3dha2Vfc2xlZXAo
d2FrZSksIEVSUl9QVFIocmV0KSwNCj4gPiArCQkJICBkb21haW4tPnJlZ19hY2suYWRkciwgdmFs
dWUpOw0KPiA+ICsJaWYgKHZhbHVlID09IH4wKSB7DQo+ID4gKwkJeGVfZ3RfZXJyKGd0LA0KPiA+
ICsJCQkgICJGb3JjZSB3YWtlIGRvbWFpbiAlZDogJXMuIE1NSU8gdW5yZWxpYWJsZQ0KPiAoZm9y
Y2V3YWtlIHJlZ2lzdGVyIHJldHVybnMgMHhGRkZGRkZGRikhXG4iLA0KPiA+ICsJCQkgIGRvbWFp
bi0+aWQsIHN0cl93YWtlX3NsZWVwKHdha2UpKTsNCj4gPiArCQlyZXQgPSAtRUlPOw0KPiA+ICsJ
fQ0KPiA+DQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCg0K
