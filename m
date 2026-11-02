Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162A5606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 03:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LvHXvAUr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C78310E00C;
	Mon,  2 Nov 2026 03:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F232210E00C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 03:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793591015; x=1825127015;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=f6muNF44T04nU2d4UfywEF4bPe5ryvGDtNgLcIVegQg=;
 b=LvHXvAUrQhgu7ZyZxmnoUnR7nZAhL7hteT4hMI5OCpuf23coUWxQ4M27
 vvLhA7jzqHfdoouI/fi+TcoFjofzCHxJxQPtDOgIyfTgmvCSt3zhx4qiU
 d1uwjqpeqy4GVV/2K7LRHxYglWOB9HySJ2ZLwnxO3ZaLkNR4hOmYXVe0U
 jZFVQKIn/2igu/9eIlB5lyh0kXNg94XP9zmZKIS+3ARfdIwYRXuRjALTZ
 nqFqx0d9ChlCfRrkWcVTv2/vJEK5OfWDYtLmPlPaOQHSatvXbZMScbykC
 Jw1M2lMRaH3EW3G35fm8tmBKS9FfJOSgP9OeiSngShfRRQt9iIkz4RGPK A==;
X-CSE-ConnectionGUID: 68Drm4vnQYm7mIExaISkpQ==
X-CSE-MsgGUID: QCNbxUyRQ7uhcS650neZyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2277982"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; d="scan'208,217";a="2277982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 19:43:34 -0800
X-CSE-ConnectionGUID: 2pQdimBuSAypb0e0BF2A1w==
X-CSE-MsgGUID: hDeWgHtUTK6hwYZSjRC5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; d="scan'208,217";a="5838237"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 19:43:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 19:43:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 19:43:33 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 19:43:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjjpL1CLaNIRyBdLXI08vor+KAc3oEL6rqfuKnLmV6sBJi8ayC3XC8s5W7ddHOhkrmKcNO1BVOIKQG/8DX0vTS+bvhKgTLY2uolw2c1zqVcETWvSdIJDTHtYHTBCx3lyBUYM89fPDBrt75njtyTQGsmOHI/o7S5mVVjW/SWnWClpdReQZvZwMeoGQ7LlHQUAbgZduUsucCagDvP6xCr1RtFzXqPJzV82/dcaD6XkslppLOtALMshKOebu33CALzN/nwN1vtXRQgGgXG7sjp6jWA0SrUnnDZO/g01d6phKrNgxgD8HeV78a7DWi1ZZguG4w6SX8zkYDQwiRq2yTA2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJbUeetBL5eernCxG+aS9hbd4nnxBzSRBLJqt2XFEHQ=;
 b=hKHfuIHy0cLk5ZHJhQvCbEepoOkeGx36X3Ad1JxJ5/Q+QlBNpFNnrXclHiAauczfLsbrzcu5kypr9IWHgOM9DEK/mWCFUxqI14rPQ07fvNaGaXWj6+mTSvqERjgnB4d49xh3BkN17r3I8sKlQheYa38Mxx+zea2kU/5RR+S6v8LYSDqK1L66Jj4B8uwQ3mmt03FleK47Ag/nDglr9+mGIJU+5g2LbkLSnRfctsm06cObEbYFZ29PWfrzHKUCC68YSD/02KNEtynB+Nn/7c9QSsbkL5wnJfVhU4ME7ivfMGCWLI3klKzpbz9YoSyfjaeILEAnuUcddKS4v2TskmgUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0SPR01MB0030.namprd11.prod.outlook.com
 (2603:10b6:408:16d::16) by LV2PR11MB185511.namprd11.prod.outlook.com
 (2603:10b6:408:414::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 03:43:31 +0000
Received: from BN0SPR01MB0030.namprd11.prod.outlook.com
 ([fe80::43a1:340e:3e9a:5b1f]) by BN0SPR01MB0030.namprd11.prod.outlook.com
 ([fe80::43a1:340e:3e9a:5b1f%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 03:43:30 +0000
Content-Type: multipart/alternative;
 boundary="------------cTO9TPvnaK7f4OWLfWcgGxAI"
Message-ID: <9d447cd4-2c2e-4d44-a281-ece8c272f4c1@intel.com>
Date: Mon, 2 Nov 2026 09:13:23 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/irq?=
 =?UTF-8?Q?=3A_Always_free_requested_IRQs_on_uninstall?=
To: <intel-xe@lists.freedesktop.org>
References: <20261020040211.496778-1-arvind.yadav@intel.com>
 <179248034969.44265.1344969603769876221@221881a7231d>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <179248034969.44265.1344969603769876221@221881a7231d>
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To BN0SPR01MB0030.namprd11.prod.outlook.com
 (2603:10b6:408:16d::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0SPR01MB0030:EE_|LV2PR11MB185511:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbfb0ba-d9da-4dad-a9ec-08df3893754c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261021133027099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261009223327099003|261009220027099003|261009221727099003|261009221227099003|261009223027099003|261026130827099003|261026140227099003|261026121527099003|261026135527099003|261028144727099003|11063799006|4143699003|5023799004|10067099003|56012099006|22082099003|18002099003|6133799003|13003099007|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: P2aMJmIkQoeX8GU/4q12j8sVFuUsAxK/KomkFS2DqfNC2aabOtz0FS8rGB+GYzQ07TBIaNfE4JUfqR0NwZ6vf1Fjbb2gnFj6vdllYeNl/GPLox+DhU9GSuO8sKesvjxUBQA1ajXfOI+7OuoDBE0RyKggDJSUORHJ3CXmNEovYmZdu630RSvsY0/IVQSwZgpMJwyWT94GQIs3wYfiCLhdD748OzfSNnQoalPtO6id+YrgFIn01+AejA704NG2CeanZoOua8nJpOZZMezvHr0IhgluE2e9dE8GFd0MLtf9Hjfia6e/9aibkie4CBSp3wmu8UZy8G3QvBj2olfrt83XX2mUsy4dxIOZuOOyxf0RxHKKfJfM2TG8Rjk9iB1iK0LWR0gByLhLzZlnukjhBIZ2FmVvTHtIovbAMYnkLGxzb9wJ0KBhB8WR8vWCOlFXN+/zgqE9QAFcNxX4dnqfU6Iw6KP44LA5bg50ZS5RLvR5Rr1SRhAfgKg1/TXN/+8F0iYUPDo7qP1wEnfrPStq75ji50i+pJP9Q5L8Ml3flXqWVEQVVictuIWbpMoajFfJ2tH/XBkklT1E0H0XSaOxhJ6blabrE2mLZ65IfoeXHkRqOFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0SPR01MB0030.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261021133027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261026135527099003)(261028144727099003)(11063799006)(4143699003)(5023799004)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(13003099007)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGFZWjB0YU9ZMVhSOWI4c0pWamd0dmNKeWtPOWFUYWNaU2gwT0sxNlI0TG9K?=
 =?utf-8?B?L05JaWVWV2Q0OTRxTWlSMi9ZOERjaFVaYmlUN2QzVVFsNDl4TCtzWENsYlho?=
 =?utf-8?B?OWdYWmMwOVQxSzRVbW1LSHdjZmoweGtjaXI2SXhtTkRLUVVSREozbUU4ZkNY?=
 =?utf-8?B?eXNyOHhXVkZHMGUxT0k4UzdDNCtyVHFndjMxZEE2NGJ0VFpIV2I4dEMwRFRq?=
 =?utf-8?B?ZW9NUUQySEI0NlZBS2txdVVsYWJ5WDJVZENvTUNVM1A2dVdYMmVWQUt2Y0cz?=
 =?utf-8?B?bDVBemFCYmRIc1Z6Vk9DTUdPZjg1eTFtZGltNHljMnhsc05CWDVyQ240WEVz?=
 =?utf-8?B?TCtKbFN5TzZjcTV5SVVpTXpUcGpKSWhLQlNETXhnblM2bmVmZmZkVWZrRWJB?=
 =?utf-8?B?Nk5YZjRYU1I4Qmh6YmFZNHVrZlVIazgrQUJhNHo5dElzcmpkYjljZDhHSHJK?=
 =?utf-8?B?d0JKc0x5ckhPTkRhQ3lhWHUvSWFMUExPaVVHZGxEMFB1OHBrR09oZ0wrdDdM?=
 =?utf-8?B?d3RiZHJnVWYrRGFTSUF6YkVHdVBLSCtUcUxzWVNBS0doalRsUmU5d2pNLzJB?=
 =?utf-8?B?WmczeW0za3V6bWhEUklCamtXWm1RaHVpUHorKy96U3dxa0lBaXkwckVBMjR3?=
 =?utf-8?B?WDJKWmNGSk1zUHpHS3pOejBDcWNLRnZIVWNnQ0RsWUtsUGNObWpGbFNlSDVH?=
 =?utf-8?B?OXBRcVBONkFBK01MMmEraUFVaTEvbjI2bkdJa0M5NXlhbFc2NmVUZnh2Z0o4?=
 =?utf-8?B?MjZKUmlhUXlVQTA2Wkh1ekpyUmdLb2Y4UktVanBwaDMzczM1K3RYekltZGhp?=
 =?utf-8?B?NHZ4b3ZkRDNtR3IraTZtaTlxV2tvQUxoTWh6b2pnODl2ZVlYYmpvcUF0M1Ns?=
 =?utf-8?B?NWp6OEhXaVlCbmpsZ0FxUzJRVExJVTMzbGgrUzZiVGg1bU02LzkwS3FDOU96?=
 =?utf-8?B?S092SllUMDVrb1pSdzF0eVpKMDUrT3VPL1JuZ09LUFBRbjE0dkYycWd3UVR3?=
 =?utf-8?B?R3E2cWNtSUs2SWY1UDJUVTdTMThIU0NlZldVc1BieFRDMkxXRFNHNERuaE1Q?=
 =?utf-8?B?T25YWnE2ZThlRjNJQ2lIM1ZESnJodVdtM1MrZEhybHorNWZVd0xySHRTUm5R?=
 =?utf-8?B?YWZGQ09wQnk4M1RIYjdXYWI3U0E5TkVwdUVXVjJVVlFwRndVeEFCQ05IdE9s?=
 =?utf-8?B?M0pyeG9ZNG5ZUHVQdFNZU1ArUEx5RGdGOXBEVUVLcjFaM1BFRXFiUm0rdUcw?=
 =?utf-8?B?Ym1ZWXdqQVc2ekZIOGkrckx4bGpZSHYzaERJc2ZLd0kzRjA5N1kxdG5ubDAw?=
 =?utf-8?B?anRRS3lOZnljNFZHVUVENnR0SkVkM3dDNkd4T29WR2dnWG1zR3RKOTJ6aW5u?=
 =?utf-8?B?d0tuVUd2VmJrOFU4dklDbklVbUdYL2xzNU1IZFU3ZWw4bEtkYWF4VnVkSjVB?=
 =?utf-8?B?ZklLVUxLb2VkSTJWYkRJam1hMHpRZDlsM3Z2NWJuSzNETHlycWhiRkFEK2Qz?=
 =?utf-8?B?RWxhbmZ1aVo5cG5oVG1rcDJSbFp6alBZYk5UMnNrbW1QZWxlbmNxOUd2ejUr?=
 =?utf-8?B?SWM1eU9oejM0RzZWYW1zdytGUExsTWZVZ1VoYkFUdUpPSVJLaW9MN0N6V1JB?=
 =?utf-8?B?a0JiZ2NNdGJ4WEZ1bFJUSHhoZ1M1MzhyVGh6eWJLcHFsT3RWanFyTngvZmlp?=
 =?utf-8?B?Z0tNYUZoQk1BeHhCdmlDWnlyblJlbFNyMHcyaTkvUW9JUzJVbSt1WjFMTWVI?=
 =?utf-8?B?UzMvU09za0FVUllUVWhmcklPMjZnTEVuYXlNODIwNktCeC9oRWdjUWRJdGMy?=
 =?utf-8?B?cGY3M3Z5QUhGc20rRGJKejR2YXdHMEkzTnlCV0hFUG5jb3VyWElDcEU4RnZB?=
 =?utf-8?B?aGplSklUa3YyREJrc3hmSkNaNzdnL1dUaUdkNmE5OSsyais2RXhrdWRoWlB4?=
 =?utf-8?B?aGVrVTJWR1hJNERka2t1RzlYUlA0cytGSlpHVVFlaG84MnR4R0E3Rm8rQUQw?=
 =?utf-8?B?RXh5WFpkUVkwOHo0TVNRd2JjNWU1Vmo4T1pMajB5Z3JoRmhCNEY2NDIrZkh3?=
 =?utf-8?B?SWs3dzVXZUNsS2s1MHoxZzlxNFY1TVFKbFN0ZjdMdXJjZnVUcEdmTkgyVWor?=
 =?utf-8?B?aDJrS3hsQ1hxK1lkdEE2N09Hb1VndTduSU1Bc1Z1L3JQT2U0a21ReWM1bkZh?=
 =?utf-8?B?THVoNDgyOE81YjhBWXMyN3B1SEpCMUIyanZFbElaSE9GaGlpSThRRzZlUFBw?=
 =?utf-8?B?RUNVZVFlMnh4Sk1rM2lEQXVIQWVVSko1VEQzZ1MzZlhpSGczRnozUkxyUEFx?=
 =?utf-8?B?dklXM1pKMjhZdlJqbFNLdzh6dHpzY2IxMmx5WFB3ZkY5RGIraXhqUT09?=
X-Exchange-RoutingPolicyChecked: g8QGGF4xYsjFrCmg5t1ZqVaLJYHgLQehR77SjpRO8tGEokqDrbkHwDkypqCbnNXwbqJyt7dfyhE9erMWX3jdV3IyvOpltpZfIoaaY6DfHxY+pjxWYuUUZoK+c08MzAXUY204WIdUCzTC7t73f+iTappUFU0LVAF/OhFnlldrcy8fy+KHEi4/B7KrO5sNVsfiQVcrs+Cm7+b2sf+n/JGPHxOZA/q99Zjuql3RFsFhqtx9xriJuOfNS2nWLyaKT7DTpBCy9L5dka+cco8fgWUtQH8m69I6hd9LeLgSWUmjeu4JT71XMbWIVHWrFxl2Lhv6Cd2sHlN3BqguBSpPWWhOIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbfb0ba-d9da-4dad-a9ec-08df3893754c
X-MS-Exchange-CrossTenant-AuthSource: BN0SPR01MB0030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:43:30.9630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwNC8j0uNIMfHtxl+d1tVjrcVyZiFhErq/frK42EtPsU7EcD5547W0I21dqUoWcSG+EBH2AFmsTSdw99PhGepw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB185511
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------cTO9TPvnaK7f4OWLfWcgGxAI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

This failure is not related to this changes.

  Thanks,
Arvind


On 20-10-2026 12:42, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/irq: Always free requested IRQs on uninstall
> *URL:* 	https://patchwork.freedesktop.org/series/176441/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42_FULL ->
>   xe-pw-176441v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-176441v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-176441v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-176441v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@device_reset@unbind-reset-rebind:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-9/igt@device_reset@unbind-reset-rebind.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-176441v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>         (Intel XE#5901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#6925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658> /
>         Intel XE#7360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360>)
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#7059
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059> /
>         Intel XE#7085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#7085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#7059
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059> /
>         Intel XE#7085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>  *
>
>     igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#5851
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#5808
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808>)
>         +10 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html>
>         (Intel XE#8365
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html>
>         (Intel XE#5823
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823> /
>         Intel XE#6918
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#5822
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822>)
>         +15 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#7008
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008>)
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-after-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#5824
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824>)
>  *
>
>     igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html>
>         (Intel XE#8391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html>
>         (Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +5
>         other tests skip
>  *
>
>     igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html>
>         (Intel XE#6969
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969>) +7
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#5845
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_content_protection@srm.html>
>         (Intel XE#7642
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#5846
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         (Intel XE#5900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (Intel XE#5962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#6035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035>) +1
>         other test skip
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (Intel XE#9530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst-direct-train:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html>
>         (Intel XE#9534
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html>
>         (Intel XE#9537
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9537>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#7359
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701> /
>         Intel XE#7359
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_feature_discovery@display-2x.html>
>         (Intel XE#702
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/702> /
>         Intel XE#7344
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344>)
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_feature_discovery@display-2x.html>
>         (Intel XE#7344
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#9365
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +7
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +2
>         other tests abort
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>) +5
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7349
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#5828
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#7385
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385> /
>         Intel XE#9144
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745> /
>         Intel XE#7385
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385> /
>         Intel XE#9144
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#5865
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865> /
>         Intel XE#7399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469> /
>         Intel XE#7399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#5800
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800> /
>         Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>         +14 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html>
>         (Intel XE#7399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +6
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#7865
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865>)
>         +23 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#7865
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#5812
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812>)
>         +95 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>)
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656> /
>         Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +7
>         other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb16161616f:
>
>       o shard-ptl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb16161616f.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>)
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_hdr@static-toggle.html>
>         (Intel XE#5917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917> /
>         Intel XE#6174
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_hdr@static-toggle.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900> /
>         Intel XE#7362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html>
>         (Intel XE#8303
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html>
>         (Intel XE#8303
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303>) +3
>         other tests skip
>  *
>
>     igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +9
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#8395
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395> /
>         Intel XE#8396
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html>
>         (Intel XE#8396
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (Intel XE#1131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (Intel XE#1131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html>
>         (Intel XE#5858
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html>
>         (Intel XE#5858
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>) +7
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-sprite-render:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_psr@fbc-pr-sprite-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#5835
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@pr-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr@pr-suspend.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (Intel XE#5821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821>) +1
>         other test skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_setmode@basic-clone-single-crtc.html>
>         (Intel XE#5910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_setmode@basic-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435> /
>         Intel XE#9142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142>)
>  *
>
>     igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>
>       o shard-ptl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +4
>         other tests abort
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_vrr@negative-basic.html>
>         (Intel XE#5949
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949> /
>         Intel XE#9277
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_vrr@negative-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499> /
>         Intel XE#9271
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (Intel XE#5948
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948> /
>         Intel XE#9277
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277>)
>  *
>
>     igt@xe_ccs@suspend-resume:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@xe_ccs@suspend-resume.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@xe_ccs@suspend-resume.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362> /
>         Intel XE#9581
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many-vram:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1
>         other test abort
>  *
>
>     igt@xe_create@multigpu-create-massive-size:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#5878
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large-multi-vm:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html>
>         (Intel XE#5764
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764>) +7
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html>
>         (Intel XE#6144
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144>)
>  *
>
>     igt@xe_exec_balancer@many-cm-virtual-basic:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@xe_exec_balancer@many-cm-virtual-basic.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>)
>         +17 other tests skip
>  *
>
>     igt@xe_exec_balancer@twice-virtual-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_exec_balancer@twice-virtual-basic.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>)
>         +10 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         (Intel XE#5575
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575> /
>         Intel XE#7484
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484>) +5
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>)
>         +12 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-multi-queue-imm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-imm.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@many-execs-priority:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-priority.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>)
>         +15 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>)
>         +28 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>)
>  *
>
>     igt@xe_exec_reset@multi-queue-close-execqueues:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>) +5
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html>
>         (Intel XE#6196
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196>)
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
>         (Intel XE#9096
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096> /
>         Intel XE#9297
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-rebind.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +2
>         other tests skip
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#9463
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463>)
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_media_fill@media-fill.html>
>         (Intel XE#5830
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830> /
>         Intel XE#7453
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_media_fill@media-fill.html>
>         (Intel XE#560
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560> /
>         Intel XE#7321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321> /
>         Intel XE#7453
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-atomic-op-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1
>         other test skip
>  *
>
>     igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-pagefault-conflict:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +2
>         other tests skip
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#6069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069>)
>  *
>
>     igt@xe_page_reclaim@binds-large-split:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_page_reclaim@binds-large-split.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>) +3
>         other tests skip
>  *
>
>     igt@xe_page_reclaim@boundary-split:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_page_reclaim@boundary-split.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>) +1
>         other test skip
>  *
>
>     igt@xe_pat@pat-sw-hw-compare:
>
>       o shard-ptl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_pat@pat-sw-hw-compare.html>
>         (Intel XE#7695
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695>)
>  *
>
>     igt@xe_pm@d3cold-i2c:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5741
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_pm@s3-vm-bind-prefetch:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_pm@s3-vm-bind-prefetch.html>
>         (Intel XE#6867
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867>)
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +1
>         other test abort
>  *
>
>     igt@xe_prefetch_fault@prefetch-fault-svm:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_prefetch_fault@prefetch-fault-svm.html>
>         (Intel XE#7599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599>)
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#6019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130> /
>         Intel XE#7366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>  *
>
>     igt@xe_sriov_vram@vf-access-beyond:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@xe_sriov_vram@vf-access-beyond.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376> /
>         Intel XE#7422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422>)
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@xe_survivability@i2c-functionality.html>
>         (Intel XE#8415
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415> /
>         Intel XE#8432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432>)
>  *
>
>     igt@xe_vm@overcommit-fault-vram-lr:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_vm@overcommit-fault-vram-lr.html>
>         (Intel XE#9597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
>
>       o shard-ptl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html>
>         (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098> /
>         Intel XE#9171
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9171>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html>
>         (Intel XE#5408
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408> /
>         Intel XE#6266
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html>
>         (Intel XE#9474
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9474>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html>
>  *
>
>     igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (Intel XE#9365
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb2101010.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-ptl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-7/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_pm_backlight@fade-with-suspend.html>
>         +11 other tests pass
>  *
>
>     igt@kms_setmode@basic-no-cpu-idle@pipe-a-dp-2-pipe-c-hdmi-a-3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-2/igt@kms_setmode@basic-no-cpu-idle@pipe-a-dp-2-pipe-c-hdmi-a-3.html>
>         (Intel XE#8618
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-5/igt@kms_setmode@basic-no-cpu-idle@pipe-a-dp-2-pipe-c-hdmi-a-3.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_fault_mode@atomic-many:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html>
>         (Intel XE#8578
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@xe_exec_fault_mode@atomic-many.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html>
>         (Intel XE#9096
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html>
>         +1 other test pass
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-lnl-5/igt@xe_pm@s4-basic.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_pm@s4-basic.html>
>         +3 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509> /
>         Intel XE#7437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437>)
>  *
>
>     igt@xe_pat@pat-sw-hw-suspend:
>
>       o shard-ptl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-3/igt@xe_pat@pat-sw-hw-suspend.html>
>         (Intel XE#7695
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@xe_pat@pat-sw-hw-suspend.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>)
>
>
>     Build changes
>
>   * Linux: xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42 ->
>     xe-pw-176441v1
>
> IGT_9153: 9153
> xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42: 
> 24d867f5e671c78760ab39087a57c25ad98e1f42
> xe-pw-176441v1: 176441v1
>
--------------cTO9TPvnaK7f4OWLfWcgGxAI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      <br>
      <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    </p>
    <p class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto"><span style="mso-fareast-language:EN-US">This failure is not related
        to this changes.</span></p>
    <p class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto"><span style="mso-fareast-language:EN-US">&nbsp;Thanks,<br>
        Arvind</span></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-10-2026 12:42, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179248034969.44265.1344969603769876221@221881a7231d">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/irq: Always free requested IRQs on uninstall</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/176441/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/176441/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42_FULL -&gt;
        xe-pw-176441v1_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-176441v1_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-176441v1_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-176441v1_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@device_reset@unbind-reset-rebind:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-9/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-176441v1_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901" moz-do-not-send="true">Intel XE#5901</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925" moz-do-not-send="true">Intel XE#6925</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658" moz-do-not-send="true">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360" moz-do-not-send="true">Intel XE#7360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059" moz-do-not-send="true">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085" moz-do-not-send="true">Intel XE#7085</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085" moz-do-not-send="true">Intel XE#7085</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059" moz-do-not-send="true">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085" moz-do-not-send="true">Intel XE#7085</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851" moz-do-not-send="true">Intel XE#5851</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808" moz-do-not-send="true">Intel XE#5808</a>) +10 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-send="true">Intel XE#7679</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-send="true">Intel XE#7679</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365" moz-do-not-send="true">Intel XE#8365</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823" moz-do-not-send="true">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918" moz-do-not-send="true">Intel XE#6918</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822" moz-do-not-send="true">Intel XE#5822</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008" moz-do-not-send="true">Intel XE#7008</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_chamelium_color@ctm-max.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824" moz-do-not-send="true">Intel XE#5824</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391" moz-do-not-send="true">Intel XE#8391</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358" moz-do-not-send="true">Intel XE#7358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969" moz-do-not-send="true">Intel XE#6969</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send="true">Intel XE#6974</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send="true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send="true">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374" moz-do-not-send="true">Intel XE#7374</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845" moz-do-not-send="true">Intel XE#5845</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642" moz-do-not-send="true">Intel XE#7642</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846" moz-do-not-send="true">Intel XE#5846</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900" moz-do-not-send="true">Intel XE#5900</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962" moz-do-not-send="true">Intel XE#5962</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035" moz-do-not-send="true">Intel XE#6035</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530" moz-do-not-send="true">Intel XE#9530</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534" moz-do-not-send="true">Intel XE#9534</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9537" moz-do-not-send="true">Intel XE#9537</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359" moz-do-not-send="true">Intel XE#7359</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701" moz-do-not-send="true">Intel XE#701</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359" moz-do-not-send="true">Intel XE#7359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702" moz-do-not-send="true">Intel XE#702</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344" moz-do-not-send="true">Intel XE#7344</a>)</li>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344" moz-do-not-send="true">Intel XE#7344</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365" moz-do-not-send="true">Intel XE#9365</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>) +7 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>) +2 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a>) +5 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349" moz-do-not-send="true">Intel XE#7349</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179" moz-do-not-send="true">Intel XE#7179</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828" moz-do-not-send="true">Intel XE#5828</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385" moz-do-not-send="true">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144" moz-do-not-send="true">Intel XE#9144</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385" moz-do-not-send="true">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144" moz-do-not-send="true">Intel XE#9144</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865" moz-do-not-send="true">Intel XE#5865</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399" moz-do-not-send="true">Intel XE#7399</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469" moz-do-not-send="true">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399" moz-do-not-send="true">Intel XE#7399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800" moz-do-not-send="true">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a>) +14 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399" moz-do-not-send="true">Intel XE#7399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>) +6 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865" moz-do-not-send="true">Intel XE#7865</a>) +23 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865" moz-do-not-send="true">Intel XE#7865</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812" moz-do-not-send="true">Intel XE#5812</a>) +95 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905" moz-do-not-send="true">Intel XE#7905</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905" moz-do-not-send="true">Intel XE#7905</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb16161616f:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb16161616f.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917" moz-do-not-send="true">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174" moz-do-not-send="true">Intel XE#6174</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900" moz-do-not-send="true">Intel XE#6900</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900" moz-do-not-send="true">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362" moz-do-not-send="true">Intel XE#7362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303" moz-do-not-send="true">Intel XE#8303</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303" moz-do-not-send="true">Intel XE#8303</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +9 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395" moz-do-not-send="true">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396" moz-do-not-send="true">Intel XE#8396</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396" moz-do-not-send="true">Intel XE#8396</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms-negative:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131" moz-do-not-send="true">Intel XE#1131</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131" moz-do-not-send="true">Intel XE#1131</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858" moz-do-not-send="true">Intel XE#5858</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858" moz-do-not-send="true">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send="true">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send="true">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send="true">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304" moz-do-not-send="true">Intel XE#7304</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-render:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@kms_psr@fbc-pr-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835" moz-do-not-send="true">Intel XE#5835</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_psr@pr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821" moz-do-not-send="true">Intel XE#5821</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910" moz-do-not-send="true">Intel XE#5910</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send="true">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142" moz-do-not-send="true">Intel XE#9142</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
          <ul>
            <li>shard-ptl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>) +4 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949" moz-do-not-send="true">Intel XE#5949</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277" moz-do-not-send="true">Intel XE#9277</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271" moz-do-not-send="true">Intel XE#9271</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@kms_vrr@seamless-rr-switch-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948" moz-do-not-send="true">Intel XE#5948</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277" moz-do-not-send="true">Intel XE#9277</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@xe_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@xe_ccs@suspend-resume.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581" moz-do-not-send="true">Intel XE#9581</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@multigpu-create-massive-size:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878" moz-do-not-send="true">Intel XE#5878</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764" moz-do-not-send="true">Intel XE#5764</a>) +7 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540" moz-do-not-send="true">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144" moz-do-not-send="true">Intel XE#6144</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-cm-virtual-basic:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@xe_exec_balancer@many-cm-virtual-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-not-send="true">Intel XE#7482</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@twice-virtual-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_exec_balancer@twice-virtual-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-not-send="true">Intel XE#7482</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575" moz-do-not-send="true">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484" moz-do-not-send="true">Intel XE#7484</a>) +5 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374" moz-do-not-send="true">Intel XE#8374</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374" moz-do-not-send="true">Intel XE#8374</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-multi-queue-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374" moz-do-not-send="true">Intel XE#8374</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@many-execs-priority:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-priority.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364" moz-do-not-send="true">Intel XE#8364</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364" moz-do-not-send="true">Intel XE#8364</a>) +28 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364" moz-do-not-send="true">Intel XE#8364</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369" moz-do-not-send="true">Intel XE#8369</a>) +5 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369" moz-do-not-send="true">Intel XE#8369</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196" moz-do-not-send="true">Intel XE#6196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096" moz-do-not-send="true">Intel XE#9096</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297" moz-do-not-send="true">Intel XE#9297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378" moz-do-not-send="true">Intel XE#8378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378" moz-do-not-send="true">Intel XE#8378</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378" moz-do-not-send="true">Intel XE#8378</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-10/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463" moz-do-not-send="true">Intel XE#9463</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_media_fill@media-fill.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830" moz-do-not-send="true">Intel XE#5830</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453" moz-do-not-send="true">Intel XE#7453</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_media_fill@media-fill.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560" moz-do-not-send="true">Intel XE#560</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321" moz-do-not-send="true">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453" moz-do-not-send="true">Intel XE#7453</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069" moz-do-not-send="true">Intel XE#6069</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_page_reclaim@binds-large-split:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_page_reclaim@binds-large-split.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793" moz-do-not-send="true">Intel XE#7793</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_page_reclaim@boundary-split:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_page_reclaim@boundary-split.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793" moz-do-not-send="true">Intel XE#7793</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-sw-hw-compare:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@xe_pat@pat-sw-hw-compare.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695" moz-do-not-send="true">Intel XE#7695</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-i2c:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_pm@d3cold-i2c.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741" moz-do-not-send="true">Intel XE#5741</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_pm@d3cold-i2c.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694" moz-do-not-send="true">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370" moz-do-not-send="true">Intel XE#7370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-multiple-execs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370" moz-do-not-send="true">Intel XE#7370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-prefetch:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_pm@s3-vm-bind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867" moz-do-not-send="true">Intel XE#6867</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_prefetch_fault@prefetch-fault-svm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599" moz-do-not-send="true">Intel XE#7599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019" moz-do-not-send="true">Intel XE#6019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366" moz-do-not-send="true">Intel XE#7366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-7/igt@xe_sriov_flr@flr-vf1-clear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342" moz-do-not-send="true">Intel XE#3342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-beyond:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@xe_sriov_vram@vf-access-beyond.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376" moz-do-not-send="true">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422" moz-do-not-send="true">Intel XE#7422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-6/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415" moz-do-not-send="true">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432" moz-do-not-send="true">Intel XE#8432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@overcommit-fault-vram-lr:</p>
          <ul>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-2/igt@xe_vm@overcommit-fault-vram-lr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597" moz-do-not-send="true">Intel XE#9597</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
          <ul>
            <li>shard-ptl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098" moz-do-not-send="true">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9171" moz-do-not-send="true">Intel XE#9171</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408" moz-do-not-send="true">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266" moz-do-not-send="true">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9474" moz-do-not-send="true">Intel XE#9474</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb2101010:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb2101010.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365" moz-do-not-send="true">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb2101010.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-ptl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-7/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-4/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">PASS</a> +11 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-no-cpu-idle@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-2/igt@kms_setmode@basic-no-cpu-idle@pipe-a-dp-2-pipe-c-hdmi-a-3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618" moz-do-not-send="true">Intel XE#8618</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-5/igt@kms_setmode@basic-no-cpu-idle@pipe-a-dp-2-pipe-c-hdmi-a-3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@atomic-many:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578" moz-do-not-send="true">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-9/igt@xe_exec_fault_mode@atomic-many.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096" moz-do-not-send="true">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-lnl-5/igt@xe_pm@s4-basic.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-lnl-8/igt@xe_pm@s4-basic.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send="true">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-not-send="true">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424" moz-do-not-send="true">Intel XE#7424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-not-send="true">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send="true">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437" moz-do-not-send="true">Intel XE#7437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-sw-hw-suspend:</p>
          <ul>
            <li>shard-ptl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42/shard-ptl-3/igt@xe_pat@pat-sw-hw-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695" moz-do-not-send="true">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176441v1/shard-ptl-3/igt@xe_pat@pat-sw-hw-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362" moz-do-not-send="true">Intel XE#9362</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42
          -&gt; xe-pw-176441v1</li>
      </ul>
      <p>IGT_9153: 9153<br>
        xe-5980-24d867f5e671c78760ab39087a57c25ad98e1f42:
        24d867f5e671c78760ab39087a57c25ad98e1f42<br>
        xe-pw-176441v1: 176441v1</p>
    </blockquote>
  </body>
</html>

--------------cTO9TPvnaK7f4OWLfWcgGxAI--
