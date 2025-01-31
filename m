Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFEBC0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 10:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C42E10E192;
	Fri, 31 Jan 2025 10:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVk8dCR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11BB10E192
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738318191; x=1769854191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Js6CHHRI9J5mqP2dW3HosoQWvSWK0F+smV/Vc8pb5R8=;
 b=VVk8dCR5o2Fyob540BlBsGAQPdMzzjM4DktOqqX5p2SKzxM1J742WzjE
 hALFNTvvMKOuq7YQYkhEzN5GM8eEvotKQN0pIFnBLoMjqd2/ra35g/jZ8
 jmBkL5u53rqGq/yuTn7qXVOnLglWQv693O+yn3K5s0V4CK9eSHakflAzZ
 lOey7QlmbNKOQxn0DMFvOq8c83G+gQ7LaRdT0RiTu9pzCF+TVb7bYiDVT
 mva7LJ2jnKDhwjUdFF6Q/Xj6sPdPRQIkjtuk+nyvDllbohjUvsu8wsv49
 gXOcQRe2x6xq9X8aGsD60G8MpUReRhFEupQ5+h5SVWSJIeqQmXJl9BtI9 w==;
X-CSE-ConnectionGUID: UgtW92dcRJq5hFNEScQEiw==
X-CSE-MsgGUID: RIduAihWRfGG2PxE81ddQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38986234"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38986234"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 02:09:51 -0800
X-CSE-ConnectionGUID: cSSC8KjLRmWsnhXl/T9jxw==
X-CSE-MsgGUID: iNfh/nKjRVioXrQqVv3MlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="109535306"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 02:09:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 02:09:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 02:09:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 02:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsqlrG+4QG4aYisR08nZdADfY8NJvWBN9+HtP4YlL3+0lGd3ZCzpiRIg5ezyPSYrVVt10Y6uEhRCXhxBu/Zdbgx4RAp0V6fX4SEmoKzb03NtWFnkJogYkHKk7g4qLdKAmqVPK0JGGvhswpnSF5exZz4PDb49MeCYkBtm9ZGdqmcp2kws08PbceMGpDRL392p8Jd+htgiYpzhfZs1KkcOlX4Gz6+g1YfjssIVVVfLDSt21p+TgVpup5tLclYDCwaztvHaqBWoui/1+MIgB7Ch85D8ETmF7AmmoIOZCOL5NyrM0EUfgLkxoSjRpAm6QBGNlUrSOY4bwuwaBArlzl+ulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXlej3TvoIrRLS9MRwzCfc5rJ3gcf8sMwRKzzWEq10Q=;
 b=bHhmQneP2+Ankw7jZPekc/GRxp/2S9x7xeQJUcmyLHyQIcSIlLtSb1opftx6jeA7s2aB7qK2uroIuE1v1s7ylIQn2PN2Wl1CKribYCeH1q3nsz1UtK/9lpiDEqZU2VfJaIhKH1Y8bD+KGsfeHxs4gCYe/iphV3uIQ7fV8eE4LUMn+VdUyGWA/4BnxqTzSgnKz1P84Cgfb4AMMST5PBlwJ3rP66zud/RlBNLJxAr2i+YrQEjijKwlL4azY2cPfjdIYiY2jCN61Cp8h5P772gc2fP+SqQJlXVJXB11BrocV/WUW/QLmzXh5Dh2D4SJG1oJLDvV5eU4f463mk+X/zxRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 10:09:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 10:09:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/2] drm/xe: Rename struct xe_mem_region to struct
 xe_vram_region
Date: Fri, 31 Jan 2025 11:09:12 +0100
Message-ID: <20250131100913.659082-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131100913.659082-1-piotr.piorkowski@intel.com>
References: <20250131100913.659082-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd26435-72c5-490d-42c0-08dd41df5d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UC9rWitPdnNpVk5OeDhDNXpDemErSTJRV0xqZUUrK2JZQ2VwUFBuQkk2ZTZX?=
 =?utf-8?B?V0R0OElpNi9DZWw0SWpCSmlRSGIwYkg4cmQ4Qm5xb3N4TmozaEhMVjR3UUZM?=
 =?utf-8?B?SXBETVFNY0l3Q2ZlMmZvSE5JQXNWVFZBR2NjNWNTNVNxWWIxd1R1dEhxalI0?=
 =?utf-8?B?bE52SCtaNnVMSlMvV2w2ZFpxVEVZUXl2clZ5S255UjdXOE9yNWs5RXVZalRh?=
 =?utf-8?B?R3pseTJwMWNObDFhTEJ3UjEzM05aOTRXNGYwNUhDYy96blRuWXh3Vm1yVkhw?=
 =?utf-8?B?c010dmVMMWpjQ0ViNU5MdklmeCtGZUo3ZlZPdUd6MU5yczJRVU5BSldhclU0?=
 =?utf-8?B?RXlwTHN2QWFKdGFlOXhMNFlua2lneUZ6QmNjWmVEU3VaNGN1QUhHT3ZYTk44?=
 =?utf-8?B?R1hwTThpMmlSQWI3aGtzcE9ycW9ubm5DTmpiQ1NkNnBSamN4OExFNGVmbmZN?=
 =?utf-8?B?UUkzeEtYclByU2ZnNDdId3puN1N3ZEtCZEFEU0xjWXNucldhbWJjTlZzVWJx?=
 =?utf-8?B?dDFSUWVQYnRPRTZxaVFabkhwdXEwZjZ4dEM4Z25nb2tiZlZ2OFpqcm0vRGc0?=
 =?utf-8?B?Z1MvTVErNHdvZE9IdUcwbUZ0SWpWcjdOa1pnSXh0Zzk4b3BlKzNhdktyTGxi?=
 =?utf-8?B?TERtNGhLVElDbmZjK2U2SFJOSjJmYnRvMVZxeG8ySnRiYUJidHNBTzZCK0cr?=
 =?utf-8?B?VmZvNit3RG1mTnlTTjdXNEY4Z2kySHkzOGhDSDFrMWx3akdIMkpUT05Wc1Mx?=
 =?utf-8?B?dEhWQUZSTStjdnJwZWMvV0NNZUNHaHFTKzdteXE1aE1OT0hDS0NvTGhRblpJ?=
 =?utf-8?B?T1VzcEZ1L21KOFVpRVVXMkxQS0c5QmJ6OEZhYmJuYitkaEVQcXlJVU9tQzlx?=
 =?utf-8?B?ZUo4KzZlWnZwREZabVhwQzNNTVEwVWhrMWl5WW1ZSzE4SDZpcUVJL2ZrTm5E?=
 =?utf-8?B?NWVNUTU2L0ozdDdsMXdEY0llcUVJQUc4bHZ3S2hsc0o4eUxYS3YzekZ2Qkd4?=
 =?utf-8?B?VEdkK1c2eFZZbkM2S2MwVXJ6bjNobmVYdldUVU1ocHJlNmZJQVVRZkpBSHFy?=
 =?utf-8?B?VmNGWktpRGJqUnpYWFUzQ09RaXdHc0t3KzBNc3MxdUxSRTVDaU5CaG1abDBz?=
 =?utf-8?B?aEpjQ1RUSUNlR1YremJBMHVCY2FFeXNueWFYd1pWTnVnK3I4MUFPRlJjOEYw?=
 =?utf-8?B?U252U3F6dkFEUjRmcmV3ckNkMXNLOHErUW1vK0xJQ2NIZjhrZENWRWNUeGo0?=
 =?utf-8?B?L3llYUZVNy9GU08xWU5ZSE5YY1lTNFdVOTk2eFBJV2hheVQ3dWpXem9MQnhn?=
 =?utf-8?B?S1VYTm5CUURyVjQ1NUJyaVdQWmVYNFJPSW5KdThONzd5b2Q4eVZIKzhBeUUw?=
 =?utf-8?B?VzlPeWE1RXlwNUtOWlJWUVl6L0RRbkVialJ5OVp6cFMrMHJHSzJHenM2c0pX?=
 =?utf-8?B?TWRkcFhpRlJORnMrMUszR0pKZXhzZ01PZU5wT1N4cmFPSkVkc2ZjTG9YeTdz?=
 =?utf-8?B?Y0pNc0IzaDlubS8wOHB3U0VuUzhZTGVxVkhUdlh5eEhRd0dTRC9nZ2VnQXF6?=
 =?utf-8?B?WGJTaDJRQmh2Rzlna2FzYUdNQ3RMMEU4MU8zT2tuRHpmMThBaG12NWgxeVhi?=
 =?utf-8?B?SUtFaEVjUnBwbWN2ZHZOT1NiaWwvTTZCNEZjdnpyMlQySlI4Mml4VG80dmpV?=
 =?utf-8?B?ZFUyelZiSGNSSG1LZ0VwT05rWXFTc0JHeGlyZXB2RTNDUmRweUlPOGY1SEdL?=
 =?utf-8?B?OTNZNitCRS9VUDRWd0lTZUUxYjNEWVJHcmdLV2NYcGNTRElvblpGME1qdElK?=
 =?utf-8?B?MDgzOGhNLzFYbVpPVVFyOTVTZGxTdWZVeGxVN2dKbHREOWZuS3NTSmdLMElp?=
 =?utf-8?Q?tonBRXZ7L378I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk9XeFNyZWlsUjhCUDM5LzNKakJoTldEWnNBNDF4Tm9zTHkxQW5Ybk53R3Vi?=
 =?utf-8?B?ZW9yM1Y1djdBVUdTWHU2UG9sZERqVTR5L0xDSXl3UHpibXRFeDI3b096TVBk?=
 =?utf-8?B?UEUvRkpIRzRJMXE4M2MrUnpDSzEzWUxBdTlTTFhSeE5NYTNtWDBYRjlObzNN?=
 =?utf-8?B?aWlhRWpLbVpsVlMrRlEzM3paVUpjclhTRmMxQUd4OXJ3Tnd6bjdHVFJ1TW16?=
 =?utf-8?B?c3JaMzYvUzRWa3QrSzVISDBmS1IyM3BJQ256WXRoRHI2VXgrR1BBVUtxa3Jr?=
 =?utf-8?B?cVo3Qlp5cGhVenZJUmNZNFhzRjlTVU5QYXc0Nmc3eTZ5UVdLNHd6V2tlRmNC?=
 =?utf-8?B?VVU0TWJGL1UxQWpER2c4MStKa05VSkhGUG5qZTZPVTg5VGw3L1VTY1Q3Q0lv?=
 =?utf-8?B?UE9Ob1lQWlY4RkVqZTlYeGpzY3EvWXJuaDI3Z2RlUnpsZXNRNlVUeTNlblls?=
 =?utf-8?B?bHVaeUxEaGFRVXpYOFZ4MldmZStWM2VJaUJxTmtVWGZJa0NRMGhMVUNBWjBE?=
 =?utf-8?B?d3VCNSs1RVdNaE5rQVJQb1NYUU1MK1dNaXRST2hIdE1OTklteHVHQ0pFVVhK?=
 =?utf-8?B?OUxtM0x0T2RhNXF6djJ6c25SSFI1N2pCQ2ZsN3ZLRjlUajhOSDJkU2ZCblpB?=
 =?utf-8?B?dTdway9DNXdtQ0F1SnBHSElVNnZFMkxOREFRU0ErazB3RjZvd29xenB0Wm5E?=
 =?utf-8?B?SWhNcFJ3Smh5Uzk1V2d4VWpKem5wSnF0OFdzTU9mUktaY0lOcVlPTmdvSjc2?=
 =?utf-8?B?UWxkQ1FWd1pxUUJLR1ZyVVpMQ0dXREI1UnZUa3BkSTBrVTdsV3U4QmtLWkFG?=
 =?utf-8?B?OHQ2R1k5eTJycndrWUhXRXZiVG05REJVTllJUkJBK2J0Q1J5Zm5MMmNJbW1s?=
 =?utf-8?B?d3VJU2VJK0szWW5sMGgwTDNoRThpN3FyOE5BTGo5QzZEK3cydENheE4xbFEy?=
 =?utf-8?B?WTNVd2VDNTZ0TFgrbUZqNHBRUDA5OVNLK1dwdkdUV2ZYNndaVWRvWnFrc0lE?=
 =?utf-8?B?RFRseEhTRkFUTUlER25POE05L0dkNm5WSU9VNGFDV25aTEpGRlZwZG4vRUFn?=
 =?utf-8?B?K0lkRlE3U2N5blY5RDNoeFUyRkRUQThMaTFJS1NDTmJTbHVHYW40NTBxVEVz?=
 =?utf-8?B?amVmTWNzUEdnZjVMMnRSdytjcVVXMUZuSDBzSTY0UFVDaTBwbitVcDRhM25l?=
 =?utf-8?B?cnRWbWZyTEpFbGRqTTR1dFdyTGYwdUdRKzNSTmVBV2E5WisrajNzOFA1Sk9o?=
 =?utf-8?B?UWljbTQ2UzRnMWtMNGRhVURQTEdDdmRLZUVzZWZOWUtmY3VCSGRaN1NMT01Z?=
 =?utf-8?B?R3pYT3ZlaFExSEQxVi85dlhpY3B5ZCt0U1VwTkhIREdBUXZkRVNhemE0Vytr?=
 =?utf-8?B?Uy9PUDNtZzVMOWFmK29lRWwrUXpQQ3hLWGl2bmIxanM2aG43em9vNTJ0c2tC?=
 =?utf-8?B?QXdLTkN5NjYyRTB3bWxuTnp2R0pLbXNxRjRuQ0FRbjRZSk5laGtZbWpXOW42?=
 =?utf-8?B?MTVHV2c4ZjJTa0t0bCtyLzhpZkJPbGVpNSsvVHhmU3ZnblJCZ0IyYUpROC85?=
 =?utf-8?B?OFVObGdJd1FSOHFESXM5QjZHUnk0ZVp4VHVDb01jKzA4dFQwWFdsYWFXdHdH?=
 =?utf-8?B?NEl3aFIrNFZYY3ppZkIxZHRFUjIxMExURzRmdjNCT1hRVWZDclZ2Znc3MGE5?=
 =?utf-8?B?dnh0RUtiTEtFdnhlTzAxSmM4RUhaWFlkTnZPRDgxd1NpZS9wQ0tMeUdYOTlT?=
 =?utf-8?B?QlB3LzRGZXdZZ2U2N1pLUXZlMUN3Y0RxOFFZS3BsWHNRQVl6L3g3S1RKQmhp?=
 =?utf-8?B?S3UzaHpzbU1keDV6NElmbGpDRTdhQzNZeVVlWUtWdm1JQ3RPazR3UDl2M0E2?=
 =?utf-8?B?S2liTjlaWGFtZ0xWV0FiaGpualZpT0JTKzdzc3B0VndrYVlyVytFY3d6a1ls?=
 =?utf-8?B?bGlUdVdaVUVYTDBPSW1YOVhCaXBCSzB1aTFPS2RzaXVXYjVPNzhBN25GWEV5?=
 =?utf-8?B?Si9RMFJmaTZlNklxN215K0V0TEhRMkNTb2poRk80ck05bEh3V3JrTzRnSHJJ?=
 =?utf-8?B?ZHlySTlvaHF1cjBqSjBwUUVvRG5CdFVhZ0hOMXR3MnhGTmt3T3BjUUFkeFAx?=
 =?utf-8?B?Y2VOUFRRcHpnYzRlSGFYZ2xkQ2FhdGdORlRzUVdhN0llZStDSC9EV3ZqUElk?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd26435-72c5-490d-42c0-08dd41df5d70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:09:35.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIKTuYzDGo0uwdQyva46uTZH9y8xBzfZCxNuCo7KucGQTUdKNdmUGrX4tqn7JcmDBzYivuKK/aWkRKyIZGDO4lReGCtfz9m7gV++Dlpabx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The xe_mem_region structure has so far been used only in the context
of VRAM regions. Also, the description of its fields clearly indicates
that it was designed for VRAM regions. This struct is strictly related
only to VRAM.
So let's be clear on this point and rename it to xe_vram_region.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 12 ++++++------
 drivers/gpu/drm/xe/xe_device_types.h       |  8 ++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c32201123d44..095794200438 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -141,7 +141,7 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 	return tile->migrate;
 }
 
-static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
+static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
@@ -177,7 +177,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct ttm_place place = { .mem_type = mem_type };
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
@@ -466,7 +466,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_mem_region *vram = res_to_mem_region(mem);
+		struct xe_vram_region *vram = res_to_mem_region(mem);
 
 		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
@@ -813,7 +813,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
-				struct xe_mem_region *vram = res_to_mem_region(new_mem);
+				struct xe_vram_region *vram = res_to_mem_region(new_mem);
 				void __iomem *new_addr = vram->mapping +
 					(new_mem->start << PAGE_SHIFT);
 
@@ -1023,7 +1023,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_res_cursor cursor;
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
@@ -1163,7 +1163,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct iosys_map vmap;
 	struct xe_res_cursor cursor;
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	int bytes_left = len;
 
 	xe_bo_assert_held(bo);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89f532b67bc4..c7c285c6a6c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -69,11 +69,11 @@ struct xe_pat_ops;
 		 struct xe_tile * : (tile__)->xe)
 
 /**
- * struct xe_mem_region - memory region structure
+ * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
  * device, such as HBM memory or CXL extension memory.
  */
-struct xe_mem_region {
+struct xe_vram_region {
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -196,7 +196,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_mem_region vram;
+		struct xe_vram_region vram;
 
 		/** @mem.vram_mgr: VRAM TTM manager */
 		struct xe_ttm_vram_mgr *vram_mgr;
@@ -366,7 +366,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_mem_region vram;
+		struct xe_vram_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 	} mem;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index f4a16e5fa770..a8c37fb4fec0 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_mem_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = &tile->mem.vram;
 
 	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 2d75cf126289..4c52ced4ee44 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,7 +9,7 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_mem_region;
+struct xe_vram_region;
 
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
@@ -22,7 +22,7 @@ struct xe_ttm_vram_mgr {
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
 	/** @vram: ptr to details of associated VRAM region */
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
-- 
2.34.1

