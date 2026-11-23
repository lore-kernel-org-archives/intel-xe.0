Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B92606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rg3q1lLi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CPja9wiC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7E910EB6D;
	Mon, 23 Nov 2026 09:15:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E8B10EB6D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795425342; x=1826961342;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=WEEhOtAnPTa42pNzYEw+Uzg5tipWTToe/8wFlJwNT8o=;
 b=Rg3q1lLi/AfwduXTk51y14AZ0dWdjTnOCzTsuvs7b0UTrv4wqwioqUTa
 KhM1HB+65dGDWCTt0ND4Ot2+Z6rZLsVYbxGqQuQ56tsgy7my6onKrqxj1
 bqd7tWLR0ZjQ0EIgzrdUf4KHsfbFw0qbQQW+GIf+616EAed+g1nf+fXZK
 3Rtyx80oaL8KsCspxDawZVNFzYXAesyi2dNsyUkcSD3x4MGclodsopUyV
 x3ByM4cit4+gwfiv7gIxOP/44o+pJN3TYNcXsryY5ltTsrKp4ukw/Zyef
 4v/PMq9lG3X8PZVK/xEYCyXsPPYz6WtIidoEQEwKLO+VzvG6IDBiq4V38 g==;
X-CSE-ConnectionGUID: ixW9InoNT1i6FAR1wAbILg==
X-CSE-MsgGUID: xa6Nkd1tQRuFcos9edg3lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4134995"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208,217";a="4134995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:15:42 -0800
X-CSE-ConnectionGUID: n0UYGqCdRo6UlfjHApVhSQ==
X-CSE-MsgGUID: 7m7x6W6cQ3210unvU1r7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208,217";a="11271606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:15:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:15:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:15:41 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:15:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx/zQSJngMr1d6QM/aVyHJHImjfOjZEvDlSSuie5GDeHxWkm4OYWQsVTiWAKMzma48SouTSX7ezvfPQL2NGPjr5MwsoY579y/wuWyaJ2J69I8bEMeqCVC7BIYGIjqAWLQ+Oh0HKnHJz6Au86GAg9RGWYFyhJ6gfm8fEd47ntSDUehbR51KKxwoHrbTvOgg/S2z3aGCU7HxALQDsB55XT4Z/PBUY4IZhVN/5YLJ7snBnc7PYfV1QVJ3zXTf4BiyC7FmcJHvgXxnKKJ8SzHVVAv7+yOrINjjqU0WQLValX4j9c2HaPM6LDjjzWKkPyvUANNuYYLzZ59+zZCrmiV7ZEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pb3kVzpS0974eUaVoVAmJT+WRRejVptY51gUpOioMGw=;
 b=FVN/Tdk8dx/QOlgAVF0AVg3wmJt4HlBnywR+86AhWatqAEKl/lVqvSXFMKgOMS9hCzvNyVBNbQrnH8s9etx79rqlisyadfCFBy+PCsQiR/XFsJd80+AaFS2w9K0gwqc3ntSRV56xPJcuEejYV9Pcr6BEN10uMnr5HFCf+ZyQXsaJ1lNiJ60QuLklyIwl15Y3MaUOkXBdNULEeGt0vZQ/WyFozSEzwcLAWuPXYy22I4AEJ9a9GducQPDnBi08hXV9j8NvPZHrln4zhPadqEfzOyiFVYnUuwsMh/SihsOsWxQCVmqUOAfN3bF5dXXpA5U8qTx4bqB6eqAoAxWT4f6dsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb3kVzpS0974eUaVoVAmJT+WRRejVptY51gUpOioMGw=;
 b=CPja9wiCOGZY/FezShfBr+NpPwOZW4PPnFO9fcte3Zu+IRR6kjCqUMvO/+65drN/0ec64uC6whVAmP3xK7AV3rbOlWZeeytoo1IkPNCTLjoinRc8ooesPxJrf0rAOeawnOKmEoAxNGrIr3SuUhOfMJhvtSX4FkmUFL1v7TqOTs0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA3PR11MB9445.namprd11.prod.outlook.com (2603:10b6:208:578::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 09:15:39 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:15:39 +0000
Content-Type: multipart/alternative;
 boundary="------------op1025BOxa8PPh0F6c63pFnz"
Message-ID: <6dab6d3f-5743-46f3-8fad-39c260e039b4@intel.com>
Date: Mon, 23 Nov 2026 14:45:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] drm/xe/vram: don't let firmware-confirmed
 permanent bad pages decay back in
From: "Yadav, Arvind" <arvind.yadav@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <matthew.brost@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-7-tejas.upadhyay@intel.com>
 <a4938fa3-f92b-4eb0-9f88-f5d3899427d0@intel.com>
Content-Language: en-US
In-Reply-To: <a4938fa3-f92b-4eb0-9f88-f5d3899427d0@intel.com>
X-ClientProxiedBy: MA5P287CA0306.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::9) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA3PR11MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 72adbb54-603c-4386-07c2-08df4942572e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261102130727099003|261009220027099003|261009223327099003|261009221227099003|261009223027099003|261009221727099003|22082099003|18002099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: RJJsMuJ9v6Uz7bfsYDwM8kyvgTYvDejyV3VIdSTCpiUC3D4nTX2C3JQztX8nM7OenkjYWtSGQGo3JsjyIrq7vLTqtmDDCe719vEMpPDlgyLgShbKEqN8jSDEt4CB9YzRkQQMvKD1Zb4WhjMlGzffFxfjpUyZfwCyvXYaEo5pqmwX5TTsV55AYCHah3UWyHUMg6JXg2IbFW47T53ndkp4DuC964VEKOhJiQv2eF11oU07F4lXcErdIZ+Jq8CC7/DQkKW3EYRzjwQsyPFps3g2i3rxNw75YYHo298zpTG54FkAlemHjufzmJ4XIe7sG3zlyebJb/AI2iI4Tl/tuUVHp7AtuuLTynnRDdiqogVhjVs5qb3FSu7d+xOA3J2CH232sUWztk6Pjp7DwQzPhyfIo0Cof+fKQppQBg5JwFTtU0vkKwwOFb8DqRD/RW6CE5sDtqmQ87ojS6MQQgOHaZpaEPh7jUAssu2gdQVmCizOKNKDKj1XHLSZDKyNUqU7flg1FtR+MHl+zDtBO/jIarKA71mj58BbM50nw+USoszF18ZI6RU0p6CnftPh931g0SuiqrToxB74/72gzZAQUs4V1ytAMz0Z29K6mOaV+9BbKy2wUL0K2zo1e5jza8JfpUdHxxuJH7r7a0IYqL+3ODos8WtzU1xqYBvlNadsJCJNg9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261102130727099003)(261009220027099003)(261009223327099003)(261009221227099003)(261009223027099003)(261009221727099003)(22082099003)(18002099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmk3UVVabkVXOTdseWJlVTVqcWZUeGQxUk5lanlXdFRoRXU1RTF5eWFhZ1pG?=
 =?utf-8?B?ZlVnMG1tSkVGcDkxcjdKSmFheEUxRHBDMFUyYnNPWFdLancwMXIxU1FtWm8w?=
 =?utf-8?B?c0NWQzhReXRHK0ZqUnZtWnRSR05IQ0pDa0xDZDk0VXNKUU1VWTZaQWVSaU9L?=
 =?utf-8?B?dFlXcEF1Q3BVRWtJVXE0QkdQMTdzMDYxT2V4SjhVbGlISERPRklQaWQvekpP?=
 =?utf-8?B?TnVGdTN1L09UQUxNSytiZ2RWVUlPNXJhRDhOS3crMzZXNGFUb001K3gxU0dx?=
 =?utf-8?B?RWozZ1piaU5jTUdTeEtSYjFhZnMrQkhNM0NPM0k3MDA3VDQ2dndHNXFqT2R4?=
 =?utf-8?B?OEJGcGw3RlJnYytIYzFoWkUyb0JWclpxYklhUXlia2R2QUttOFp6cE5pdTUx?=
 =?utf-8?B?NWFMOU9DZDF5R1JPcHlhdGVkWEphUEY2VzNZSGYyK0liSUJNREdLTkdTbW5v?=
 =?utf-8?B?T3VmNlhDYlNFREh1ekIzSFloYlgzcU9sQ3pUL0VFaGgwc2xIclUrcG4zbGM3?=
 =?utf-8?B?OUp6NmFzQmJ2K2QrL1ZaMnlNUGF6WTFQL0R0Y0VSMXlGQUdxK2hrdW1RYzBQ?=
 =?utf-8?B?V1JVOW40WEw0VFZicW5CRnA4TTNlTFlOaVR5cHVsbzNtMWhUV3dOZEtmY2ZV?=
 =?utf-8?B?eFdvTVlKQUtzSWdZanVTbE1SOFFEZWtWU2k5VUt6THg0eEt4Rjg1SGZsNUor?=
 =?utf-8?B?VjFuaUcremQxUXRlSXMyYUdjMU1BNi96SzlnOElydnVoUWRhMUJHOUlKSWs5?=
 =?utf-8?B?U3ZFSEgzamlVd2d4a0tocWxHSjJiRE8xbnNnR0RzNEtIMk5kNGRCZlo3M0Jh?=
 =?utf-8?B?R3YwR00xVWJWaHlVTXpMMmRZVU9JTkJoZ29tcEo4SFpOcmhOaVhCUkh1T2pi?=
 =?utf-8?B?amNWRmxjTjhvaEthclpGMG5mQVFNdFVIcTJiRHJaNnVZTks4YWRJTEkydHZk?=
 =?utf-8?B?MHZDN0UxNzd4YXZPeFpIci9BS3lQcUxtR01saUxHZUFHRVFOMHI2UTZ4aDFi?=
 =?utf-8?B?aVNybE1hU09xUFFQbDJEOUx0Z3ZiYVJNQVZiN0IzVnVSbEFJTDF2SlQrNGNN?=
 =?utf-8?B?aXFvbGlqWW9RbHYySU13YkhZWHVXMnZqRkVTV2JzVUl2MWJIb0hTQjhWdDll?=
 =?utf-8?B?OG84ZXJEeWRKZmF3SUFRbWxyL3E5QXJKVnZHdWZvQkpHV241cDJxNEcyZUIx?=
 =?utf-8?B?b1N2QkZYNWh4TFNnYVI0dnQ0SnpGWDU0eVhVeXBNYnJvR21Zei9rV2pwdzN5?=
 =?utf-8?B?RFhvd0h1NzJIZGIyTU9tVk43R290YnNDT25GYUFieU5DT1YzVGV0TFY3bE8z?=
 =?utf-8?B?emRleDZmNDk4T0hkS29PK2lKMzhmdGUzQ0NFbUdiUDc5emF5UU1TeFIrTkVZ?=
 =?utf-8?B?YzBaeXU2UHBzcVhmZkd4NGtPVTlVWFlXNU5ZeDhSQ2FKSXYrK2FOcTY1c0dU?=
 =?utf-8?B?a0w0OGtWYXh5MG1Rak9KU1dPbThjakpRR1pHNklBdFVzNzZWMFhxdXlhdlR0?=
 =?utf-8?B?RmlkdnA0U0lFMzVaSURuVitHb2JDc01kOVJvRTlaZEl6NDluU0szWHFUUHNM?=
 =?utf-8?B?NlVVbTJTSGFQZHJlUXB6UTVVdGtSdEhpUHBVbFZsanE0TmRZcDcrMjhnMkVF?=
 =?utf-8?B?dzdpRHhyejduOFlCT1lVWDFLVEE3WXFheTNHaUNCendlU2k1aFRaRCtRVHBC?=
 =?utf-8?B?UWhpNHVuYUZobVNBclFEVzg0bGhIOTVLZkFjRXN4MVlsUjhSVHZ0VUd4RnlY?=
 =?utf-8?B?R3hZcUQ1eGZLRys5OGFuLzlFemFWWUhCbHRzZkd1ZHV5aU1tekZ2TGxCS0lZ?=
 =?utf-8?B?R1VVcHpQMFErR2crZ0ZJMGxtdkd1UWpQRHZhUWsrWm9jU3hSRW1CYjdYN3p6?=
 =?utf-8?B?dlRtdGFWUjIyYThwaDI1SkJiWnlzVDNvUndadzM5ckpGWG9IaURsdy9NWmtY?=
 =?utf-8?B?Zjl3ckhoYnB2Rk0xeElZcmFoU2dDZ1J6aEZmODhCWVdkS2dvS3MrNnE1NjBE?=
 =?utf-8?B?SEhDYkw3QVAzbXgvUjBuL1QzMCs0a0hSU3lsMzc1cFcyd3lWZFkyNzA1NzRa?=
 =?utf-8?B?cTZGTU5UeUc1cDZvdnk5VDBYT05obmhiTXFWY0tRNVVlWmtuSms1Q2VuWlBu?=
 =?utf-8?B?TnRNNzNycnZPMzIxb2ZtMHlrdml1TUpPL3NmdmlpWW1rZkxUWFlMR2FOV1A1?=
 =?utf-8?B?amh4Qm9zOFNtTEpNTlBPVzJ3ajN6dzY1TlU3YmVhNU5LVjJwMGgxVDVvSXNH?=
 =?utf-8?B?THlwbnhxbityWDUvTlNHaGZDRmNzRWx3Z01hdFFleTRlMi84RzVzbnNUVHFh?=
 =?utf-8?B?N09jN2xIYVVzOHBHMGtGSlRJdVlKU0FpUDdOMWV5UHhsY0tDd2FjUT09?=
X-Exchange-RoutingPolicyChecked: XwnHB0znftDy7KzMf2euh3Q/glTPJjOAUStwuSRgXHtXYo5gf9MOSoNyXGlvV9EO8DTuO1e1BLBdSRce+Lm9/X4tNV9ngCEbi40086vYC5KojYHK+OvxrU2rOZFF7hVp6c06W7AxBd3IAixPG316ABQ3GIMJlLsJZcXgtFw/QpSYqJfFYEqbPzafy9xeeFMmJJf4PhjYCybg/9EAReS2XGzCbCbiIJWbDwiCde0mnZDd2n4oNgyU1KAr7IgC+oRSD8K3Xh/04HYx5uW23jZweUfSc++j8r2b8A/3SpPWuEkh5xM16DJS4A6vUCUsO2tz36blzcVHyFvcWwcyaHnDog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72adbb54-603c-4386-07c2-08df4942572e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:15:39.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whUoAtQt/p61+mTsGvH3RCXm83Kw+LE/JZe3h8qaeaNoWgog6FQnqIGiGofxqPwslQXmbmXNY3IvMEQjSUxoag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9445
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------op1025BOxa8PPh0F6c63pFnz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22-11-2026 14:02, Yadav, Arvind wrote:
>
>
> On 12-11-2026 18:13, Tejas Upadhyay wrote:
>> get_offline_list() reloads pages from firmware's non-volatile permanent
>> storage at probe time -- these are pages already confirmed bad across a
>> prior boot, not a fresh first-time report. The reservation path always
>> marked new entries XE_PAGE_OFFLINE_SOFT regardless of origin, making
>> these permanently-bad pages eligible for the SOFT-offline decay timer
>> and silently reinstating known-bad memory back into the allocator once
>> the decay window elapsed.
>>
>> Thread a 'permanent' flag from handle_page_offline() (derived from the
>> existing notify_fw distinction: get_offline_list() calls with
>> notify_fw=false, live/queued HW reports call with notify_fw=true) down
>> through xe_ttm_vram_handle_addr_fault() to the reservation path, so
>> these entries are created directly as XE_PAGE_OFFLINE_HARD and are
>> never eligible for decay.
>>
>> The two debug/test fault-injection call sites (xe_ttm_vram_inject_fault(),
>> xe_debugfs.c's inject_mempage_offline_trigger()) pass permanent=false,
>> preserving existing first-time-report test behavior.
>>
>>
LGTM.
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>


>>
>> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_ras.c          |  7 ++++++-
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 17 +++++++++++------
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
>>   4 files changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index e59d4964d811..fb10a3ed7fc6 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -119,7 +119,7 @@ static ssize_t inject_mempage_offline_trigger(struct file *f,
>>   		return xe_ttm_vram_inject_fault(xe) ?: size;
>>   
>>   	/* User provided PFN - convert to DPA and inject */
>> -	return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT) ?: size;
>> +		return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT, false) ?: size; } static const struct file_operations 
>> inject_mempage_offline_fops = { diff --git 
>> a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index 
>> 2c01c183d02b..b57ff3dba279 100644 --- a/drivers/gpu/drm/xe/xe_ras.c 
>> +++ b/drivers/gpu/drm/xe/xe_ras.c @@ -332,7 +332,12 @@ static int 
>> handle_page_offline(struct xe_device *xe, u64 page_address, bool noti 
>> addr = ALIGN_DOWN(page_address, PAGE_SIZE); - ret = 
>> xe_ttm_vram_handle_addr_fault(xe, addr); + /* + * Pages sourced from 
>> firmware's permanent (non-volatile) list are + * already confirmed 
>> bad from a prior boot (notify_fw == false); mark + * them HARD so 
>> they're never eligible for decay-based reinstatement. + */ + ret = 
>> xe_ttm_vram_handle_addr_fault(xe, addr, !notify_fw); /* * Handle 
>> return code from address fault handling function: diff --git 
>> a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c index 
>> ed0ca5f2b144..07360ab7b072 100644 --- 
>> a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c +++ 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c @@ -837,7 +837,8 @@ static 
>> struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe, } 
>> static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 
>> addr, - struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm) + 
>> struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm, + bool 
>> permanent) { struct xe_ttm_vram_offline_resource *nentry; struct 
>> xe_bo *pbo_to_put = NULL; @@ -859,7 +860,11 @@ static int 
>> xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr, 
>> INIT_LIST_HEAD(&nentry->blocks);
>>   		nentry->status = XE_PAGE_RESERVE_PENDING;
>>   		nentry->addr = addr;
>> -		nentry->mode = XE_PAGE_OFFLINE_SOFT;
>> +		/*
>> +		 * Pages reloaded from firmware's non-volatile permanent list are
>> +		 * already confirmed bad by a prior boot; never let them decay back in.
>> +		 */
>> +		nentry->mode = permanent ? XE_PAGE_OFFLINE_HARD : XE_PAGE_OFFLINE_SOFT;
>>   		nentry->last_seen = jiffies;
>>   
>>   		if (block) {
>> @@ -900,7 +905,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>>   			}
>>   			++vram_mgr->n_offlined_pages;
>>   			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
>> -			if (vram_mgr->decay_interval_jiffies &&
>> +			if (!permanent && vram_mgr->decay_interval_jiffies &&
>>   			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
>>   				schedule_delayed_work(&vram_mgr->decay_gc_work,
>>   						      xe_ttm_vram_decay_gc_period(vram_mgr));
>> @@ -986,7 +991,7 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
>>    * pending if the blocks backing it could not be freed immediately; the
>>    * reservation is then completed from xe_ttm_vram_mgr_del().
>>    */
>> -int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool permanent)
>>   {
>>   	struct xe_ttm_vram_mgr *vram_mgr;
>>   	struct xe_vram_region *vr;
>> @@ -1023,7 +1028,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>>   	}
>>   
>>   	/* Reserve page at address */
>> -	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>> +	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm, permanent);
>>   }
>>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>>   
>> @@ -1074,7 +1079,7 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
>>   		 * test-only path.
>>   		 */
>>   		if (found)
>> -			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
>> +			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base, false);
>>   
>>   		cond_resched();
>>   		if (addr == 0)
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>> index d77f067d197b..3c1f1f8b8061 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>> @@ -31,7 +31,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
>>   u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>>   void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>>   			  u64 *used, u64 *used_visible);
>> -int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
>> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool permanent);
>>   int xe_ttm_vram_inject_fault(struct xe_device *xe);
>>   
>>   static inline struct xe_ttm_vram_mgr_resource *
--------------op1025BOxa8PPh0F6c63pFnz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 22-11-2026 14:02, Yadav, Arvind
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:a4938fa3-f92b-4eb0-9f88-f5d389942=
7d0@intel.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 12-11-2026 18:13, Tejas Upadhyay
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20261112124329.2960272-7-tejas.=
upadhyay@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">get_offline_list() reloads p=
ages from firmware's non-volatile permanent
storage at probe time -- these are pages already confirmed bad across a
prior boot, not a fresh first-time report. The reservation path always
marked new entries XE_PAGE_OFFLINE_SOFT regardless of origin, making
these permanently-bad pages eligible for the SOFT-offline decay timer
and silently reinstating known-bad memory back into the allocator once
the decay window elapsed.

Thread a 'permanent' flag from handle_page_offline() (derived from the
existing notify_fw distinction: get_offline_list() calls with
notify_fw=3Dfalse, live/queued HW reports call with notify_fw=3Dtrue) down
through xe_ttm_vram_handle_addr_fault() to the reservation path, so
these entries are created directly as XE_PAGE_OFFLINE_HARD and are
never eligible for decay.

The two debug/test fault-injection call sites (xe_ttm_vram_inject_fault(),
xe_debugfs.c's inject_mempage_offline_trigger()) pass permanent=3Dfalse,
preserving existing first-time-report test behavior.


</pre>
      </blockquote>
    </blockquote>
    <pre wrap=3D"" class=3D"moz-quote-pre">LGTM.
<span class=3D"reviewed-by" style=3D"box-sizing: border-box;">Reviewed-by: =
Arvind Yadav <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:arvind.yadav=
@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
</span></pre>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a4938fa3-f92b-4eb0-9f88-f5d389942=
7d0@intel.com">
      <blockquote type=3D"cite" cite=3D"mid:20261112124329.2960272-7-tejas.=
upadhyay@intel.com">
        <pre wrap=3D"" class=3D"moz-quote-pre"><span class=3D"reviewed-by" =
style=3D"box-sizing: border-box;">
</span>
Signed-off-by: Tejas Upadhyay <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:tejas.upadhyay@intel.com" moz-do-not-send=3D"true">&lt;tejas.upadhyay@=
intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_ras.c          |  7 ++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 17 +++++++++++------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c
index e59d4964d811..fb10a3ed7fc6 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -119,7 +119,7 @@ static ssize_t inject_mempage_offline_trigger(struct fi=
le *f,
 		return xe_ttm_vram_inject_fault(xe) ?: size;
=20
 	/* User provided PFN - convert to DPA and inject */
-	return xe_ttm_vram_handle_addr_fault(xe, pfn &lt;&lt; PAGE_SHIFT) ?: size=
;
+		return xe_ttm_vram_handle_addr_fault(xe, pfn &lt;<a class=3D"moz-txt-lin=
k-rfc2396E" href=3D"mailto:PAGE_SHIFT,false)?:size;}staticconststructfile_o=
perationsinject_mempage_offline_fops=3D{diff--gita/drivers/gpu/drm/xe/xe_ra=
s.cb/drivers/gpu/drm/xe/xe_ras.cindex2c01c183d02b..b57ff3dba279100644---a/d=
rivers/gpu/drm/xe/xe_ras.c+++b/drivers/gpu/drm/xe/xe_ras.c@@-332,7+332,12@@=
staticinthandle_page_offline(structxe_device*xe,u64page_address,boolnotiadd=
r=3DALIGN_DOWN(page_address,PAGE_SIZE);-ret=3Dxe_ttm_vram_handle_addr_fault=
(xe,addr);+/*+*Pagessourcedfromfirmware'spermanent(non-volatile)listare+*al=
readyconfirmedbadfromapriorboot(notify_fw=3D=3Dfalse);mark+*themHARDsothey'=
renevereligiblefordecay-basedreinstatement.+*/+ret=3Dxe_ttm_vram_handle_add=
r_fault(xe,addr,!notify_fw);/**Handlereturncodefromaddressfaulthandlingfunc=
tion:diff--gita/drivers/gpu/drm/xe/xe_ttm_vram_mgr.cb/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.cindexed0ca5f2b144..07360ab7b072100644---a/drivers/gpu/drm/xe=
/xe_ttm_vram_mgr.c+++b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c@@-837,7+837,8@@=
staticstructxe_bo*xe_ttm_vram_block_owner_get(structxe_device*xe,}staticint=
xe_ttm_vram_reserve_page_at_addr(structxe_device*xe,u64addr,-structxe_ttm_v=
ram_mgr*vram_mgr,structgpu_buddy*mm)+structxe_ttm_vram_mgr*vram_mgr,structg=
pu_buddy*mm,+boolpermanent){structxe_ttm_vram_offline_resource*nentry;struc=
txe_bo*pbo_to_put=3DNULL;@@-859,7+860,11@@staticintxe_ttm_vram_reserve_page=
_at_addr(structxe_device*xe,u64addr,INIT_LIST_HEAD(&amp;nentry-" moz-do-not=
-send=3D"true">&lt; PAGE_SHIFT, false) ?: size;
 }
=20
 static const struct file_operations inject_mempage_offline_fops =3D {
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..b57ff3dba279 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -332,7 +332,12 @@ static int handle_page_offline(struct xe_device *xe, u=
64 page_address, bool noti
=20
 	addr =3D ALIGN_DOWN(page_address, PAGE_SIZE);
=20
-	ret =3D xe_ttm_vram_handle_addr_fault(xe, addr);
+	/*
+	 * Pages sourced from firmware's permanent (non-volatile) list are
+	 * already confirmed bad from a prior boot (notify_fw =3D=3D false); mark
+	 * them HARD so they're never eligible for decay-based reinstatement.
+	 */
+	ret =3D xe_ttm_vram_handle_addr_fault(xe, addr, !notify_fw);
=20
 	/*
 	 * Handle return code from address fault handling function:
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_t=
tm_vram_mgr.c
index ed0ca5f2b144..07360ab7b072 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -837,7 +837,8 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct=
 xe_device *xe,
 }
=20
 static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr=
,
-					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm,
+					    bool permanent)
 {
 	struct xe_ttm_vram_offline_resource *nentry;
 	struct xe_bo *pbo_to_put =3D NULL;
@@ -859,7 +860,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_=
device *xe, u64 addr,
 		INIT_LIST_HEAD(&amp;nentry-&gt;</a>blocks);
 		nentry-&gt;status =3D XE_PAGE_RESERVE_PENDING;
 		nentry-&gt;addr =3D addr;
-		nentry-&gt;mode =3D XE_PAGE_OFFLINE_SOFT;
+		/*
+		 * Pages reloaded from firmware's non-volatile permanent list are
+		 * already confirmed bad by a prior boot; never let them decay back in.
+		 */
+		nentry-&gt;mode =3D permanent ? XE_PAGE_OFFLINE_HARD : XE_PAGE_OFFLINE_S=
OFT;
 		nentry-&gt;last_seen =3D jiffies;
=20
 		if (block) {
@@ -900,7 +905,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_d=
evice *xe, u64 addr,
 			}
 			++vram_mgr-&gt;n_offlined_pages;
 			list_add(&amp;nentry-&gt;offlined_link, &amp;vram_mgr-&gt;offlined_page=
s);
-			if (vram_mgr-&gt;decay_interval_jiffies &amp;&amp;
+			if (!permanent &amp;&amp; vram_mgr-&gt;decay_interval_jiffies &amp;&amp=
;
 			    !delayed_work_pending(&amp;vram_mgr-&gt;decay_gc_work)) {
 				schedule_delayed_work(&amp;vram_mgr-&gt;decay_gc_work,
 						      xe_ttm_vram_decay_gc_period(vram_mgr));
@@ -986,7 +991,7 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_regio=
n(struct xe_device *xe, u
  * pending if the blocks backing it could not be freed immediately; the
  * reservation is then completed from xe_ttm_vram_mgr_del().
  */
-int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool per=
manent)
 {
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
@@ -1023,7 +1028,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *x=
e, u64 addr)
 	}
=20
 	/* Reserve page at address */
-	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr-&gt;dpa_base, vram_=
mgr, mm);
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr-&gt;dpa_base, vram_=
mgr, mm, permanent);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
=20
@@ -1074,7 +1079,7 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 		 * test-only path.
 		 */
 		if (found)
-			return xe_ttm_vram_handle_addr_fault(xe, addr + vr-&gt;dpa_base);
+			return xe_ttm_vram_handle_addr_fault(xe, addr + vr-&gt;dpa_base, false)=
;
=20
 		cond_resched();
 		if (addr =3D=3D 0)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_t=
tm_vram_mgr.h
index d77f067d197b..3c1f1f8b8061 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -31,7 +31,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *ma=
n);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
-int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool per=
manent);
 int xe_ttm_vram_inject_fault(struct xe_device *xe);
=20
 static inline struct xe_ttm_vram_mgr_resource *
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------op1025BOxa8PPh0F6c63pFnz--
