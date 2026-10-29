Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE25606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXjubBqh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510B510E7B4;
	Thu, 29 Oct 2026 08:40:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18BC10E74D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793263232; x=1824799232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qfjto6hPFgrzaM18R4dEB8g6drZ0xarLrJA8prQ8SEg=;
 b=gXjubBqhGQEBZChreNP+Px/NQNe/ZTAh03dVEwrCTFv9hy/iL4cEoDCB
 ztSiomtNN038nWAtBOXaPz1lJRzQ8RB3iTRzPvtAKJ9mgiaurAWUHKYuj
 u83yLJ2i28nVamQ9Csr0v422aFk916mxcGZJ9tv9Gvaf12LrlkQtzS3zH
 pkC9bdxQq5gU4bFfY5MtLrfTNW3+W66+6Zv75LILXUM2d7bjAB9BPSXt0
 1xcqNk1jX/RSaMppYQFKkpERV8egidlnSGEpdTfZh3Y8EkeaZPN15XwzA
 RVO8HyisPBaPUCt/41lsdh2n4jsy5v+gyzm6v0BSpJTluSv4u72erblc/ A==;
X-CSE-ConnectionGUID: L4F3d4WPSc6hZUqqVNPY0A==
X-CSE-MsgGUID: bHSVedxOR6aYa97eEUz7PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2032162"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2032162"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:40:31 -0700
X-CSE-ConnectionGUID: zV9ozkBbRn61sjzWxWCs5Q==
X-CSE-MsgGUID: Uv7DNCjxTFCswS+QiVzMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6910500"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:40:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:40:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:40:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSyAWyJfyOoJZFlnqeOl40mXIWqk3eOWXcnZilPHwEfwrKNOwOuRLRDg398nknf2feGILB4z0D2xnbcDI82HNo73gf6xKs2ZNjl1erB4T/x34G3mC+IQDvNeZ0fmDWdYdCYvyxCVs5/3oWligvrgdjp4V8SBRI1QHOx0i1w8MM8BssbQvsyg5gfrx97m39dg9XpPsBsq45FpFC4QqPrbepNT88BsEX4dT+ScvnG+aGjbODr6/QJ/h+IVMoa85ZgeFGQph6M9K1riy7YdEfV9MRQcATwFJMiT3ksvFeBGmt1EXO36qnxTD/DCY4qTaRYoGikHDzmhkqUzoxZB6rfzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21Q1d7cM7kTYYEAlv+qCkI4PtqwVLqHJNGNg+IuKNd4=;
 b=y4LdA93k7qRTDZxMTernICp7L+P952Mp93JfXNtUEMkkXt8KF2wb1yTe75TWR4gVsd5Bn8BBggmmVm/BSSU0s6XNGvSvbGNfzpB/XZTk6W1n8tk9FoMb9ZqE/p7+SZ/LNMWVwKeJRI611VsIuhOGf7wWfe/qOO1dXqGHEXH2eL7RFCEtt3AOcydh4mkAe0um6NDaT+qcFjPyCVCaXXR8W75NCX/VKX896Qx9XODMRmCCBdepEegFJp5ES17v7AYy3mfgFvZS9Ld6gIl0r1CYYrqjh0yE5GQZAmhL5uVh7TKYMN8nan0rQ7tyURqAFqb79h1IH7sdCH8gj9DECbL59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 08:40:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:40:21 +0000
Message-ID: <bb04d592-282f-46ed-82eb-86d8d90d95b8@intel.com>
Date: Thu, 29 Oct 2026 14:10:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20261026050735.566613-1-raag.jadav@intel.com>
 <20261026050735.566613-10-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261026050735.566613-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0122.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d7fa1a-906b-4dbc-5a60-08df359844bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|5023799004|11063799006|4143699003|56012099006|261009220027099003|261009221227099003|261009223027099003|261009221727099003|261009223327099003|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: KWIrmKDfDPJOJ8UG2NWkIrsoTQoKCA+9aHjQAAGXHfArccYSAcg3MESRlTsGxXO0MzSknwD/iqpjfwFjyP+yx/ktjOod6Fb3QXrKhh2gymUiGzbMJD5j6ru111zAyAjIUTHgCzbHCGKCRwkwlb3718xkhBwefz9wsMJydVXmY8jS6bmtTKgYKyaGhYmOoAOxdAMIAmM5LbkDjf1I6C9o9+fLAoIYYg13OCYrG2GLgYEtHFTvr1hLvpG/8qv2kROX90s+b1wFn9iR1eOWd4edV2Jlx2mDJDtW9vn0WOMs7c5TdJyrZvOlE1jKH0nzbeT3he3TRLwjqwyvyOvCEJ9w02Yr7BR7wG20MpVVacVz/ZksQ6AjwMvkLvMA5uj3Oep0M/ho4/xFlxflHprq4fXdT9AM04B1oC8IS0DdHjBrliI2OTZjIeU+Vq81UTSv7Bza5OdT6MuWp0hUR70GOS+OceIKlI0YMbuNWzPfIgAtmNOK9/wlXg/TKQAcWcCekDYVvbNdOnACdm/eR6wc4JK5HggVoULckih+PqPbKOezFWCwK6Ao2GXkizj1vNr0OZZYPGp4kclJvrPzoDedOyQdIWw+KvL9LFQ5ui4YJrA5t65X2PPbD/t4Ijy1q/6XFmJSnNO8LUA4bbIxMAFih/mhqgDOiJ0zw+FINClY2RTiNY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(5023799004)(11063799006)(4143699003)(56012099006)(261009220027099003)(261009221227099003)(261009223027099003)(261009221727099003)(261009223327099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXB1UysxdWZxdFdKQzFhcVdwSDREai8zU0dLbzRqT1FqTjl1UEtrN1ZOK0lq?=
 =?utf-8?B?eEV3YWNaOGQxTzlIaTFjQkJiQW5aZDRYaGFrcmtnNUhzTTRPbnVTb3d1U1NH?=
 =?utf-8?B?SW42czVBcDVMbDdFZXRyUGdwRzRoOFBpMitzK3RvalpRVEwzSDgxdXdURVVT?=
 =?utf-8?B?L2dkMXdvcTdXMkpxbUtEUVQrcmU2c1IrRlo3cHFMY2EvdDBkbjBGdElWcFZw?=
 =?utf-8?B?L0M1NTBkNHI0Z3A2NlAxeWd6NkZxRUNQN1dFcXdCR04rSUF5UHd2MGwrYTdO?=
 =?utf-8?B?MW4rUk0yVnIvWlNPZnRGUCtmS0ZPM1BSdzB2aGN1K1J6SjdGOTZ2S1NWNU12?=
 =?utf-8?B?cHljWUVBQkNYVG5ENXJYN1JBcmlwRW9NMEI5WnhJbjh2b3lVTkxQSDNObkNH?=
 =?utf-8?B?UEUrVVowbldtWDljUGN6M2V5bHFrK2tDUm43OW1OSTRaMTNmNjV0d0E1N2s4?=
 =?utf-8?B?bEFBaTJXU2tBakFZWG1tSnl0MXlWcGVtaXYvdUxZaGwya0RObDVCQ3FseW5V?=
 =?utf-8?B?UUpvWEhiTnFUenlIdUltTGIrNmtObFpxQ1k1RG5GK25ERnlOOUJXdisrU2E4?=
 =?utf-8?B?RVQ3eERiYkJCZVlQUGN6MGlzSWNvZVAya0kzeDZRNGV4NjFkYXJjRXN3dUJX?=
 =?utf-8?B?RVlMMFJGOXZJc0NuQTl5ZzkwWjFHdU1pRkk3eU5ham9oT0ZEa2VOWFc2aUVU?=
 =?utf-8?B?aFBPK25RNytNT2hLUko0cXd6TE1BMkI3UWg3WnNGRG9Rb1Q2MWQrUnlCSEdJ?=
 =?utf-8?B?b1ZsL1A2UXNSczQzbE1GM0gzOStBNGFZYzBRQTY2bktRd21NZHZhL2FIekNC?=
 =?utf-8?B?OE8wNXNEbjF6N1JnZ0lUODdzK2pnSkRFUFZiWkQvZGpxcnAzN3V2YWdxdXRz?=
 =?utf-8?B?dVV3emQrb2cvaTZ1SDBmdnd0RmttUHc5cnYzWmxpRFgrdHBjM3Q0eXJid2dC?=
 =?utf-8?B?VnAxcE5yRUsxcEJIeiszbk9PeVduYWlvWlV4L091WTA4V0FROGN3RFhkOVFm?=
 =?utf-8?B?a3pGK2phbCtjZVVOSXZBcVpZM0Y0T0NsMzhDNEFBUkZrR1Q1bEFjUEI5b0Jp?=
 =?utf-8?B?UHRCdytUd1l4c0U4VjVvZ2xDQjJoaGtiZWcyVlRRWWVOS1pQcTYwTy92bVF5?=
 =?utf-8?B?OHduRXFqaWNmaGR3NllmN0FSMFYxUU4wR2VVcTNjc041QW1SdFNGNGs4VnBM?=
 =?utf-8?B?K3FEaGZabWRMOGQ3MDRJdktzbHJ1Si95OW1JQ0YzaU1xZjRhS0pMUzdjcGNw?=
 =?utf-8?B?cG9naEc4c1Z3UFU5SitvZFNxamlOTEJheURodG8zdDdlelhJa25aL1hKaisx?=
 =?utf-8?B?UVpiam5BQlhXbE0vTFNSNkxONTI3VmVaU2tuTjd0RThab000QTBDOWd2ZUlY?=
 =?utf-8?B?anNDdUNRWGxEcjBqK053Wjk2QmlNaGw3NHVXTTNEZ2RtMkw4Z2pjc3FOcGZC?=
 =?utf-8?B?WjBGeS9VTzRyYSsvaUhmUXluYXVWSUZRcGFzVTVmdy9ETzFyWCtZSWxtblhV?=
 =?utf-8?B?TDBJYlVHN0hkVllUak4yZHVlQ1pYTENEa1R6VzQ5MVJzTFIrK1JseVhNZkVD?=
 =?utf-8?B?bjhGY1lCdElTRFJGZ2Q5NHl5N0d1NURkY3I5V3B3QWNOUkNtU29QakRNeHJS?=
 =?utf-8?B?L1gyQU9LM0dWcWNaU3V4anowc1E0bXNVZFo3akVvQWtSRjV4bG8zZjI1aG5s?=
 =?utf-8?B?RDdyR0VNVzZFMDdlZm9KckZyZ3hVR2VsS2RoalBzcFhjODc1RjR3OEtXbGtP?=
 =?utf-8?B?ZHFxbWw1WVRJQm44dVlRT0dvUlpneFF3WFIyUWtMRG9NcUhzdFFVcWdRL1JY?=
 =?utf-8?B?SkxYcWUvbjB0SWNjR3VFN0E1UzdnV1oyOEZhSEV6YUE0V1pyMHhrUVlZUURr?=
 =?utf-8?B?eHh1UVB2VEgvWHlpVzR3MTY2ZmNhTTRKdnVGdWJ3Y0JTSnRyMmNXeVhpbkJx?=
 =?utf-8?B?ZkVUWlk1Mml5Ty9WZFpJaGMwSlQrYndVUG94TWVsVEVMemcvS2YyUGo4aG9o?=
 =?utf-8?B?MHhheFd4bmlDRExnemdGaDFXc2l6cGVmdFpPaU9YWnAxb3Fkcmh5ekw0NVZi?=
 =?utf-8?B?QVJHUzQ5UlBaNTFNK1dWN0hRL0VYWVVYalJLY1VBTGxGSVhrRlFsbHBBQ0l0?=
 =?utf-8?B?RzJjOXA4NGR4bWFXUXRrTVU4WDZSUUdia3V1WlZMcmlXRzgrRjJ6Y0h5R08y?=
 =?utf-8?B?WndmVVRXYXN4cVRvZ2JrY1ZLVmJ4aUFzcmZwdnBuYWZwTGR4Z2owbjM1b2FR?=
 =?utf-8?B?VXNaN05RbEg1UWdBcHZFbDBVQUwvbzVNUkhjUlFYcGxEVnU3WXFCUDFIbUQ3?=
 =?utf-8?B?aVphUjYvT2k2NzJXZFFUU0daVVpHRjY2Y0M0TTRDL3JYNW9FaWkyUT09?=
X-Exchange-RoutingPolicyChecked: IuIq3dEnfFkytFCEn7AXMwSzFQqkLnYUkgGbmLfzffWs2atSQe31NyBKqgfdkKz5gBgU9xlFLyWyM9GOhgveWR5cYk+dBubTZCK4lfuBRZIGCVxGj513GoLUaHgVidrXZAVdpCRtve76AJnThPfxT2E/Ia92bZImXP/w/A4YYkb3Ug1jF6F/xXWqr9RpKR21hMZVTbk7Eq1IO33NyGDGZ7adsPG26uF0thkEiwClixUSA0mzW1m6gICkrvkz8HLBWGO9b1EZ6BzqrgQyfK2qBP+t1QoS2Hk/zkROvAaxMcROgwLESSe40knMIp1w1ZYQJFi1CoWc2p0FZLFZIAoCkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d7fa1a-906b-4dbc-5a60-08df359844bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:40:21.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iXAWqhDs9gSi4Tm1yui7vIogdPcOxZAWvuYIsgjpRBV851Bn5l8XHa3ucYlZ9KmheRu1GhZG1SWkSxvI1jBRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 10:36, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) support which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   v2: Spell out Function Level Reset (Jani)
>   v5: Prevent PM ref leak for wedged device (Matthew Brost)
>   v6: Add PCIe FLR documentation (Daniele)
>   v7: Refine PCIe FLR documentation (Daniele)
>       Introduce xe_pci_reset_skip() helper (Lukasz)
>   v9: Add 'Xe' prefix to document title (Rodrigo)
> v10: Update documentation to include PCI Error Handling (Lukasz)
>       Maintain wedge reference on FLR failure (Lukasz)
> v11: Cleanup wedge reference logic in ->reset_prepare() (Lukasz)
>       Use 'PCI reset' in logs (Riana)
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 134 +++++++++++++++++++++++++++
>   2 files changed, 137 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0eb36fd91539..73028a45f677 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -521,6 +521,9 @@ struct xe_device {
>   	/** @pxp: Encapsulate Protected Xe Path support */
>   	struct xe_pxp *pxp;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index cdd0af4ec139..3ec687256309 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -12,9 +12,55 @@
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
> +#include "xe_sriov_pf_helpers.h"
>   #include "xe_survivability_mode.h"
>   #include "xe_wedge.h"
>   
> +/**
> + * DOC: Xe PCI Error Handling
> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
> + * hardware needs a full re-initialization. The way Xe driver handles it, is
> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
> + *
> + * Prepare phase:
> + *
> + * - Temporarily wedge the device to prevent userspace access
> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Stop the scheduler and all submissions to GuC
> + * - The fact that FLR is needed is because hardware could be in corrupted state
> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> + *   contents
> + * - Remove all memory mappings since VRAM contents will be lost
> + *
> + * Re-initialization phase:
> + *
> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up all hardware units
> + * - Unwedge the device to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.
> + *
> + * TODO: Reuse FLR callbacks for bus error handling.
> + *
> + * Current implementation is only limited to re-initializing GT. This needs to
> + * be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SR-IOV cases which need PF and VF synchronization
> + * - Re-initialization of all child devices registered by Xe
> + * - MM corner cases
> + * - Display
> + */
> +
>   static void prepare_device_for_reset(struct pci_dev *pdev)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -153,9 +199,97 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   		xe_wedge_put(xe);
>   }
>   
> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> +{
> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
> +
> +	/* No guarantees by PCI core */
> +	if (!pm_runtime_active(&pdev->dev))
> +		return;

Add a log here. xe_dbg should also be okay

> +
> +	err = xe_wedged(xe);
> +	if (err)
> +		xe_err(xe, "PCI reset failed, device in unexpected state\n");
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	xe_wedge_get(xe);
> +	if (err)
> +		return;
> +
> +	err = xe_pci_reset_skip(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset not supported\n");
> +		return;
> +	}
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> +	 */
> +	err = xe_device_suspend(xe, true);
> +	if (err) {
> +		xe_err(xe, "Failed to prepare for PCI reset\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCI reset\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
> +
> +	/* No guarantees by PCI core */
> +	if (!pm_runtime_active(&pdev->dev))
> +		return;

Same

> +
> +	err = xe_pci_reset_skip(xe);
> +	if (err)
> +		goto out;
> +
> +	if (!xe->flr_prepared)
> +		goto out;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to system resume flow, except we'll also need to recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	err = xe_device_resume(xe, true);
> +	if (err) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		goto out;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	xe_wedge_put(xe);
> +	xe_info(xe, "Re-initialization success\n");

Add PCI reset in log. Maybe PCI reset done

With the above logs added
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +
> +	return;
> +out:
> +	/* Most likely the device is unusable and there's nothing we can do about it */
> +	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +	/* Drop local reference */
> +	xe_wedge_put(xe);
> +}
> +
>   const struct pci_error_handlers xe_pci_error_handlers = {
>   	.error_detected	= xe_pci_error_detected,
>   	.mmio_enabled	= xe_pci_error_mmio_enabled,
>   	.slot_reset	= xe_pci_error_slot_reset,
>   	.resume		= xe_pci_error_resume,
> +	.reset_prepare	= xe_pci_reset_prepare,
> +	.reset_done	= xe_pci_reset_done,
>   };
