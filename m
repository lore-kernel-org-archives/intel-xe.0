Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F72ECAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 12:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB0810E10C;
	Fri,  3 Oct 2025 12:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NygZMjDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D623D10E10C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759495495; x=1791031495;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=3SwVowmywLlUS8efRDaPsHmWa2ggnmrZRx4UtDAmka0=;
 b=NygZMjDENssw2lxGf106sT74gC1nZRvmvUx1+F2LYB26qHTNK2L49mjK
 PpjhdnBUXFSrLwp3uxhPziLkg8UOn7LKxTlYjx7XVon0aU6SRwmJOEhoG
 gVp/CAxdJZEkXO21AF82J8ksDUAY8gc2PgmOoL29WKievVqYEYzAJ/EV2
 mq9cDmUDm+5YSDTggqJD4cO07Pa51+guKt71cGdmaEV3J7e+OkR/afPfa
 h6V5XLoxT3XidGegsbTbIxfWRUbBhqtNFOJsr4MoK1CbzPGnQTXwREEoD
 BgelTrQxUqNqtrLRv75l+EGnbXLQO/PDUyq1fcG3B2xlx9Mzvsyrp8EKj w==;
X-CSE-ConnectionGUID: szvYxwKUQh+hVgpf/reQHg==
X-CSE-MsgGUID: 2LrEo/JVT22LmKXpjN9KLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="79425347"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="79425347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:44:55 -0700
X-CSE-ConnectionGUID: 6FZ8Ej1vQRePCcdp+IubOg==
X-CSE-MsgGUID: im5EjgEcRT2P8SsE+7hUFw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:44:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 05:44:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 05:44:53 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 05:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfiIKRSsyqngzV6OXJfvhKX2ph/CTV+2MvXHM4Oj8aa5z4IsL8CAnd6wvY48VWlSt53MOoqAu8+8UWhrcjTfh7C9M0lOqKOV9HqgIQQbjkE25hTKeEw8kqxvfiEakJXPugEkDL+F1lPbotHA00VKp3Mx218jNwjFprWpPn8TwEPA6aOWTEmoVx/q6qRzofVsBsDvZNKCR+g2AgUUhnGQp7AtzOdo9DFhsYylEtO0BAadFv6gCyH47BwrnI3KVhalAzS0StW9l21NdaJiLuGC1zt1flWaMOK17SvTuS1kJ/1RUIGgSYUDy4RIwt1DfBlU46UZGeSJ/Xf/uL2kCQ7+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5/xx+Au58dOU/ZDbRal+LTLRTjv7N0egFNFeg249Aw=;
 b=lkYRvKs8DKZGOz094Xx9+ottbnIMHJptS1bpMYLpxbvSnUVcTvD7E0uqtRz1XUyeKVcxkmnvKohBROXwXD9S4vthdUiWKIXv6oQB5gtDhxUExsWLfbsAs/XQHmphibC+3YnFGNO0zg8x7vcBZBr7npiNGotoph//Uoz0IGjVJlB+2WRB3r7aJJl/jPDeg7My+Ftxx82hkNkzpjkB6vLP2P+sA+oMbD2fg/vqeNSomygXVDXPh+7NO+GdaDjDD4awYQyxG74MwO3AiAqz7nAwZs6wDI3i1hkfN3mz6r6HzLjoDtCAKjaZl/lewQyKsOMMVcmyLS1Q5130A+XB25Iftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 12:44:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 12:44:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-42-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-42-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 17/23] drm/xe: Bypass Wa_14018094691 when primary GT is
 disabled
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Oct 2025 09:44:42 -0300
Message-ID: <175949548299.1952.1705956699160081771@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: de73b0d6-35d7-4170-900b-08de027aa32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjFmbWNkajhqdzc2YjNhSCtYT0t0NW5EeXZ3dUthRFBxVXhZQlU2YVdpSk1N?=
 =?utf-8?B?S2xEeDJ3RUZGS2Q2VEQrVE5OVDNzc2ZjNVZNQ1VZVk5EMkhSZnFsUHlKQXly?=
 =?utf-8?B?aUFXd3lMT3dXbGZ3MjJmN0tSVUR6R1ErQlVJWDNZdUdVWnc1OS8zRTNIZGRm?=
 =?utf-8?B?S0hIYVhFbEFVN24wQ2ZqR2l0OGo1ajMyQTVmcDNQVWhCeU9wRW9vSWV3NlJW?=
 =?utf-8?B?YndGaWZlMEZlMDB3V1NHWTNtZUhROUd4OE5UMjdVY2dKUFpDeXdDMENUQlkz?=
 =?utf-8?B?VCtubnZkazR3ZXJnaWJOd0tXeWtyUWpadWRxVXpXeHJnYkpaNU9XdEZVaDBa?=
 =?utf-8?B?Qi82dFZibHp3QWJPTFE3WklERGlHM0FIcEp6MWR3SkFlMHBuU1JRMUNSYW1J?=
 =?utf-8?B?V1EwaTArcGV4QmwrRGtxK1NMc2tmUDVjSm9xUWRLZm5YQnoweTI0c3F2V2Va?=
 =?utf-8?B?R01zV0VZSWN6OTczVC8xTEpiak41SW5taG1XbW5QT0lvbmlldDBDSURRS09X?=
 =?utf-8?B?OUJveDBmTUNseFRSTUN2TURweHB0b0VKdFFhK0tMS244NXFWc05McjVJeFFH?=
 =?utf-8?B?VWFHUE1JVnZuaDVpZHk0aHhjMDVlNm1XV0tKalh4QzF3cXRiWmJKNDVFV3lP?=
 =?utf-8?B?WExScU5oUjRWaGVoWi9YUlRDUHJva0QyK0NZM3RvcTJ4emNDWDdveDF0VnpT?=
 =?utf-8?B?a2xESVlyRWYrVWs0b0E4cmh5OFlJWEg5YzNYMGpKNnlENG9PVnVqR2VtQUYy?=
 =?utf-8?B?TmNLbHJnSkZGMDJYQU5jVlUzRENBZExJNWFoVkEwVi9EQi9KUWVwZnNzZjJs?=
 =?utf-8?B?am1CeEI3STFDY1N2emMvMlBHM2cySXVrb0JFZjNRb25wVTluMTMrL2VzYlZJ?=
 =?utf-8?B?Y3ZMS29WTG14ZTd4c0FkZjZhcDVVQjRsZEVCWThqQUYxcy9CNDdCWWMrOFVF?=
 =?utf-8?B?ZHkzR0JjWTNEMXl4Tnk3UzJ5Ym9MaHp4ODh5Tm5tYUhqcWFoMmZFZHVJSlc0?=
 =?utf-8?B?S1d2eG1UVHlDanpObk5sYXdZbFpZWjY1TmtTM1k2cXI3SnVEbG1MMDZVTDJy?=
 =?utf-8?B?dm92dHFwTElwcjMzTG1LcklEc242eEFxcUdzYXJEano0ellnME1DQ0ljNm9Q?=
 =?utf-8?B?eVRlam5GZk9RRE1kK1BBc3hHRkZyTktsY0VSSXpNeU5yQi83d0lPdnRzZC81?=
 =?utf-8?B?SXRIVko4aXpLcE13Ty9TeWxxMzZxRkZla0dOVDVBNjBGVHhRNko2N1I5Mjg0?=
 =?utf-8?B?TEk2UTFUR2hHdGhNSS9VQmVMS1RCeTlvMmkwQUwzWmZXcFlaQmVJSTZWNWZz?=
 =?utf-8?B?U25XOHQyRFpGUkpaRjJ4cGFsa2dydU0zYTVjcnJkL3NVVW1heGNaMGhQU2lx?=
 =?utf-8?B?UkN2S3Q2cTkyU3Vmd2dzTzVscVV0QnJFNU5Ed2FNeDRIdjJLZFRKLytaR0NU?=
 =?utf-8?B?KzRXUEpGOHFjMGRHZkJKZnRRZlBQaDM2VFhIWmo2dllRbVJiUmJkcStCcW50?=
 =?utf-8?B?ZzViZkRzNTVrWTVZZVRTaGV0d2NUVHhQa0xOUks3b0FkeHlzWEovT3UvSklD?=
 =?utf-8?B?amJnSkluOU5vblRPSWZRZWhEVjNxdDVIT042cjZLVVU0K3NjOWRHODZMcm9X?=
 =?utf-8?B?US9OZmI4QldFcXhoY3lSeVI4TVpOeFBabmlQYytXQmVNNW1iSGRpMGpXUzVR?=
 =?utf-8?B?L1I2ODNnQ2FjUkpQRFN3ZzFCVVNwNWpscS91Z05kRGlQRll5VHpONzk2TExL?=
 =?utf-8?B?VjZPR2hZVDZFd3J0ZTc3cmYrSTkyUk1NS3BEZzZZRmJWTU43NlBFdXE0OGhn?=
 =?utf-8?B?V1c3SFh6OWZVdlc0T1ZOK0h4OS9peTV3dTdCN1c4TjBHaXlFeVR5bjZFV2xI?=
 =?utf-8?B?cUNZcmxCY3VDV0xTY1hwT0l2SUh0dnZWckczMkVlYzdaUE5yNmd2dERsQnlz?=
 =?utf-8?Q?eXwNOUbfL8FLgSO2MUhhWHLvvdhadpso?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lVc21FbllUQ3F3S1luSVJJODE4Q2pXbkpKMHNMQ1lscHFvaE1oS05TL3o1?=
 =?utf-8?B?WmxQc3VQMDhkL1JFcHNaR1g5TkRyY2RYZzlKbGdSaDdkdEdFTTZEb2tEcEdT?=
 =?utf-8?B?TVdTR3ZPSmE0WStrZXRCVS9OZlEybEZDYWhJMVNsTjQ4NzFMeEhNeE1FRklF?=
 =?utf-8?B?Mzk3eWF3eVdIamF3NW5NeFZqSnlyL01Jblp1NTNSeEZGemVQUzhNWkdsZDRl?=
 =?utf-8?B?TzhLNUFYS0NmMUprSUszMUYwMk80ZThEWHRQYXpMTjJWVzlJSWptdlhvRmNn?=
 =?utf-8?B?L2FUbUpXc2hLV0x4ajBPMVBJQTlrcDFRYVhqREpyVyt3MjhqcE4xSW1LWjZU?=
 =?utf-8?B?aUdxZzlacG4rK09rdXFGTUFHVVhzaFIyUWJ2VWJuZm81NXJKa2s4Zlpvc2VP?=
 =?utf-8?B?UzFOMEpscmhnN3VSUXM1NVlHMThTOURrbzI3LzNNSlFsYVBDQVgzTXR5SHNS?=
 =?utf-8?B?RFlrdWJrd1ZlSUIrOVBzUG8wNkNhakVlRjU0TTgzdlFhWjdaZUxqZTFrc1dL?=
 =?utf-8?B?SCtpVjNNU0dlakpIanpkazVaeDgrK1NZejJOeDhmSUdrNWtCNnVIY08zYzk5?=
 =?utf-8?B?YjR4M1RtYkZMc0VJZzJpYytXbXBTaHdnSE4yZ0luenAxOEduY01OaEdSSFlK?=
 =?utf-8?B?aUVwQ0ZOb0MxNENNNmFCMUxsN3JQdXdLVXFZMmNQRWVkclB2NnNZR1NTVDRJ?=
 =?utf-8?B?R2I1bGtrSXJ0c0t0b2IwUmZnR3NoOFJNb0RmWCtMb3ZrRXBpZU1xWTVSZStN?=
 =?utf-8?B?V1dCWVUxQWh2dnhpd3VFSmZjcGNjeFpXSEZqSnJicTV1SmVmMnBBV2Y5bFJ6?=
 =?utf-8?B?ek9DMEVIZXJ4a2VVVnR1MVdDcnB0amt1YU9CMy9iY3JzTjZvRkVqeUp6bllY?=
 =?utf-8?B?SkhSN2M3b1N6Skd3ajBEMnFOOEVXR0VmczhFa2I5UG85cGFqQ1RwUVZsLzZV?=
 =?utf-8?B?UHRpRW9Hd2Y5OG52Nm5DWXNlUWJVWkZ5d01YNDFlNW1QSXZkb2JESWd4U0lq?=
 =?utf-8?B?Rng4aS8vZDBWMEFGdW44dkRnbzlEbnZOT05SbEFGZlBBdGZKcmkzWGpLYXB5?=
 =?utf-8?B?dlViZEtONkFIa2NjWVdGS2RhVmZ3T01PYWZ0OFFYdzNNV09Yc1FLYjFWN2ZV?=
 =?utf-8?B?b21YWUpSV0dpRXFpV2pZZ0VGallIUmJZeVJTZlpmUHUvYWZFWUZ4VDhjcFhX?=
 =?utf-8?B?akJTNUlpc1FiK3kxZGFxOUlwbXR2blQwRVdIL3hwUHNDRDlaV2cyMzczUjhZ?=
 =?utf-8?B?SGZvQ3gxVzUvTHIyTCtUUVZ3a3NzSU9EK3FoTGtPWHh5a01jYnp2WEFwNHVi?=
 =?utf-8?B?V3EzaTJLMmpmSnVXOEpmSkpaMERGYkZXdWM2QVJreFNwWVBUZCtncjMzL1N3?=
 =?utf-8?B?Nk9LQUw5T05lVnFJNGo3cE1QcDg2ZVU4WUpLWDR5RkV6b09tNHdDOGM4QU42?=
 =?utf-8?B?MkRrR1d5ZTcvelJUYWc0QnN6S3lLbjEya09xNkRrZWxjb0k3TDZ3aUFoRk9v?=
 =?utf-8?B?OS94YmVtTWpDNGFEcnRVMlZGUHc2YU95c2xLODA5NHNMcjRXcE9BVStoMVZH?=
 =?utf-8?B?eXNPNzE3MnNqaEp1bU50TGRBMlJSR1U3QVRlQUhEdzAvMFhZaW5rWjVLSSth?=
 =?utf-8?B?ZVZOQmJOdkdtT2R2VUhLSm5KQ1dpK2pybVB4ZHBwVjhIVjlTTEtQSmxNUHM3?=
 =?utf-8?B?OGJqdWM0ckl5K3EwbkZ0Z3BNZ0Z1aldqWU1NM1dGSFh4eUQwd0VJNWp5c1hE?=
 =?utf-8?B?Njk1cnI2UlQyZzArWStzbzdERDVEbjVFVGlhU2ZRUitpYnRTdGxmb0wxVkda?=
 =?utf-8?B?S1M0dmJ1UTM1dHlhaFlnVXV5Q3hIZTh0UUl5VURPREFRYm52RU1LLzI3MHp3?=
 =?utf-8?B?UW5mdTRpSzA2dW8waWJubGRsd1FWLzIvakV2QXRRVGtrRms5YW00U0wxMGVV?=
 =?utf-8?B?T1FUZmlvbkF0WEdZUkJPUGsyZ2NaRCtBM0tzaWVlQ0RualB5R2NmUHArM21r?=
 =?utf-8?B?L3Ztc2w3TnRiTjNrZTlIVTQrMVhtNFBWZGVwRU5FSkVYdHBXa1dOelZvWXpv?=
 =?utf-8?B?WkRJTHRzQmdmUDR4ZTBLQms2ZXhTN3BVY1AreEZaWU4rMUZLVlpkbG1PeFVD?=
 =?utf-8?B?Wm4vdW91dktjY1dvOWdsU21HY05vSEdHQU12TDZYZHJoN3ZCWkJ5TTZsWlRz?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de73b0d6-35d7-4170-900b-08de027aa32a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 12:44:48.1900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15duld60vYyhJLYRh8u/Ne5mctHWWcV8QJ94Q80XyPky1/8zDwvT5nkJjirX2Eh10uJJ3jSw4fDrJnt7fbv7/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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

Quoting Matt Roper (2025-09-30 19:56:34-03:00)
>Don't try to lookup Wa_14018094691 on a NULL GT when the primary GT is
>disabled.  If the primary GT is disabled, there's no mid-thread
>preemption happening which would make this workaround relevant anyway.

s/relevant/irrelevant/?

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 83d61bf8ec62..dd69cb834f8e 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>         unsigned int fw_ref;
>         int ret;
>=20
>-        if (XE_GT_WA(tile->primary_gt, 14018094691)) {
>+        if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) =
{
>                 fw_ref =3D xe_force_wake_get(gt_to_fw(tile->primary_gt), =
XE_FORCEWAKE_ALL);
>=20
>                 /*
>@@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>=20
>         ret =3D gsc_upload(gsc);
>=20
>-        if (XE_GT_WA(tile->primary_gt, 14018094691))
>+        if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691))
>                 xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
>=20
>         if (ret)
>--=20
>2.51.0
>
