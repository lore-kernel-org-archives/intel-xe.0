Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5093FC88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 04:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAD910E5B1;
	Thu, 10 Sep 2026 04:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJJsGSwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26E810E23A;
 Thu, 10 Sep 2026 04:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789016106; x=1820552106;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+DadD9sqa3E8vKEGy4AmtdDD6Ievgb4b+J/9WlogG74=;
 b=YJJsGSwekhkeZ20Xprv7m57E2UfRgXj79rHTnQ5sdrngDz4lO303KlpT
 kkGPXIVpoJP+bj9P89BAgZ/w14gZjUmvNtqap7JgF7DI+ASSkU3Pvhcas
 lVBwUwIntdwdA6uGRCAQMpy62UaqmtVY1hSb3pAxctItUkKC9CKZYqUzf
 re9K39uUhzeNdSfZSMzHWI2nOYQMSpFj6whjK85wckknJsWX8Nu/XcRlE
 xj7uSw1KUPoSLg2fayxkAKUBbhNGtuD4RZbm+ZiXL5WGkCCkMtCGMEixv
 AtP83ZHr4lyvYxWihHj5yA+RBTZInomoTZGkHOQH6d4kVAjDICKABtV1l g==;
X-CSE-ConnectionGUID: 2H6RH5mISN25yRpp260qOA==
X-CSE-MsgGUID: Gp9dBTn9Q+Ov+Ge5xbqNKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91971759"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="91971759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:55:05 -0700
X-CSE-ConnectionGUID: Htc7T/R0T+SESN908/uoOQ==
X-CSE-MsgGUID: uKuWaYnuQau22LHnsUfDkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="271034751"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:55:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:55:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 21:55:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxG1mGh6mHNwK0mPpt3OHh3v0+EI6yk/q/U0gUiChl3LnJII1RzFTFl3zl26tGIAQirWTH/inRKGNgyKET/P+OnaH6jR+utVWRX+iX9MP4023nlo68KbrKbSgD1g3vwmmSQvpnMmi7fsQ9FvwWVgFzLejlpt3Ex+tmNktrclbRaQqpaNNc/0TElG/Ya17ZKlKVRsxG5ADwleyOlX2EoZI6fntkk7VLuYRSphnyr+Drj2QcCBiQq93OJQm5cf6L4eR/rkFgApF5eBQ4ckswnhcyOlCb6utP3EiBYMfBPRwnfdshjO89uDbJYRcae6guvxgtF0AU3ykOLCFLllpmJ7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqKRqh6GymJ0k485AdUkYZryTRQP75bPTtOrh74P0eg=;
 b=xRO1j7kbBLSY14Iia4jjy/ltH7Rjl8c6vNwrEkiWNe3qRl3GFdlVF35F7RCkq67X5Up92Ud7FcsGusXBcglmDT5DLqbe0x6nr7LcKSuKzaiy7Ngklk0IKCy60pVEMyZND0EhWgjqAJJxOxr6Qtkj6jBpfDvz3DlURJDrl5Uowvgj4s/nHktjEQ2yd43u6MnXcUFWJFASxCtVrNJIxUzODvkQ17vRENq8oLojfEAP9lXbrtziHUEbNpdrRyWa80j+cpCldP3rr+vBHfuAIiO6AEoKyBVZ2QOBYR7Uq1sM+1jPdZ1AKKHrs4PyA6NI3PJwnnaGb5MNgUrjhkcl2pBqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 04:55:02 +0000
Received: from PH7PR11MB7571.namprd11.prod.outlook.com
 ([fe80::5c37:7a32:46d5:a8f4]) by PH7PR11MB7571.namprd11.prod.outlook.com
 ([fe80::5c37:7a32:46d5:a8f4%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:55:02 +0000
Message-ID: <769511c7-fae6-4f6d-8e7d-b831eefbf17b@intel.com>
Date: Thu, 10 Sep 2026 10:24:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
 <DS4PPFE901A304F33780D3462F329ABB79EE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <DS4PPFE901A304F33780D3462F329ABB79EE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To DS0PR11MB7558.namprd11.prod.outlook.com
 (2603:10b6:8:148::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7571:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: c3204b0d-659d-4d10-a663-08df0ef7abc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|11063799006|6133799003|4143699003|56012099006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6/qgcHTpVgWbjexSV/iJe3Yu1KHxrcQgDgJn7bbhbQOhprnur9PmluSD8eiDlk4v9Fi1qAYDL/szxiAZkYnk872aKnuLkz7+cGTVokfbt1Hcxkxy2YNsGvbTLQntGh6MtpTsFPSPs2tocYO3m1ALK1YCjt03Xl2rXQlbdIdKyBRvK+kBzSNBpQEQexpnFTRqMR7JlMZ4hoFYkceuZ0Gd8aViuKQCe6v95os+943NQw3DKujMRPR3H4n49mCGG1g4/DnZWx+5nZ4raIlBpzzV4Dkfws8TNEpPizpnXvIFZeT0xm5KNfPyux26axD0fRXmoM/8sf1JTUbOsKQKVzW2kxH/RSn1C6Akza6xjq+zm730WtckPA6UtR7XGD6ngMFz/zz/f5shMFzhplBRuXS1d5iuNUsQVz++Rf3vyIe6o0Dz3HOao9Wy8Qb63j11PT9Srm+9LjakH0FXK5bCDXkBOT2T4yGQequELI1yJpVWuNJBB1Rtu+pBZDbuPgz+081jjGlGpL0eWZ7wUIVLd1Q69X2Jlz0GpUNr492kw9L/L63I8VgKhpGmVGHrkjD0LRVtU4+QNb8Fng2u/mn1MYdVDd4gipumtGZ8QzSs0TZZEE5UcdpEm4C8baySIS6eAABvn5zT7cilFUFfmg7pIyNbRS1HJhbTTYSdrNIY2HSkN0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7571.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(6133799003)(4143699003)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnB6bGVpa1o1OENrQ25qQXFKSzZ1R0hlakd1SFUrRVZaMllYNXBNck1xWkdw?=
 =?utf-8?B?ZlF4TWxDNE5VTHA4WWVRZlRIT1A1R0x6bUdjRm9rc2oyWnpZUjErQ2U0c1cw?=
 =?utf-8?B?R0w1R2RUaXZLdG9nYlJGQzJHRER5K0dtTTc1c1Y0VlFHNWpwUlJldU1SWEFV?=
 =?utf-8?B?MWFRbmVTb3Y0aHcvZXltU1lwWFEwdk1PcXM3OU9wU2tGNThuY1gxS0s3T29Z?=
 =?utf-8?B?QXZiMzVNTWR2b2NmRkNHbXRaRnBkMXdJYW5YN0ZUSkg5RmZwYnNJdzdiOTht?=
 =?utf-8?B?a3grb0J3ak5JaFBmZWpsSzA2MTd4bXBlVkcrcmkvN2ViaWxHUWkwZFY3cHdu?=
 =?utf-8?B?dU9aQ1gwQUpVZG12MzIxQkUvU1BDNlVyOXB4MHJwbmVqQkpKVEcvaDc3QTVP?=
 =?utf-8?B?NEZaT04xQ1JMUmVEZjJad3ZDRFNEdjRncHhFTHR6WmhGZzB4aFljN2xMQVhN?=
 =?utf-8?B?MVV6UU9FaUI3UFUrUUR4eUl5N0tMclJGOHAvRG83YzZHc0F2VllibGZjM0Q1?=
 =?utf-8?B?Q05qSFFHUjgvalZyNmxuQ2IrTEJaYVQvcjZaTk54d2lPeFBXRVRGREVUcFMv?=
 =?utf-8?B?dTNnUnlvQi9FK3NKTWNVNE1qeFRxVW1DcWxlNnB0a3k0ZmhEOThSOTdWNkZt?=
 =?utf-8?B?WlZJUWozb3M0NzQrV0JEclo5R1BWUlBvZ2FXTDc4bm1BYkJXT01rcXp6TWFh?=
 =?utf-8?B?UDMwdFdVNHQ0RnZ2dlpkNWFNV2s5TytxNzV1b0JmaWdoNUtzQThHc0FiMkJ2?=
 =?utf-8?B?REdWRld4Y3hPZlhZZTRDOHdOamh6SUVZZ2NHSEMrRFdjYktteWZVYksyWXBx?=
 =?utf-8?B?dlN0QVd0dEg2T09nMHYzQkhQU2J4VlBVRXRXK3Vxb0tkRzNJZXRqNXRQYzNz?=
 =?utf-8?B?dkREU2pmYk4yZ04rYjl2UDk5cWJJMlpwMm1GZmEyRmdVVS9ZbEJQWWtCZWdX?=
 =?utf-8?B?WCt5akM4S0ZQbTViVXhlamRsZy9RNHgrUDVDcmVmMjA0VExEVExQR09hRjZL?=
 =?utf-8?B?aFlxZEtiRzJLSktCR2JESmhkQjZ1aDJyZVU3SlFuTys3QmQzaHlJWUxuRURu?=
 =?utf-8?B?ODZ3L0w2V2hoZFhEN0ZCZ01XQ0dGYzRKOW1Lck1sd1RIc2JjSGdyc1pmU0l5?=
 =?utf-8?B?R1Y3Zk1CV3o5TDZ0Ny91NzBob0x5bjFVYmJkRFAwcUFOUUpoYXRhUENNbGJh?=
 =?utf-8?B?SGh2a1UwU1BRMWhWZnA2L1hodmEra05Ea1p5OTIzQjdqbk1YbmdtOHlBVXB4?=
 =?utf-8?B?eThmMmdNRTBSSys5WGJVS2crWHpYQlFwclJhYXpSRDduQjExc1JZZ1UvNVFn?=
 =?utf-8?B?amQ2Nk5uQmpKMGZCYXZIN05vcGM5SXZLQklaTEhpSUJnYTQ5T0wrSCtLcGNl?=
 =?utf-8?B?TWphQmI3NVJOSkZ5L25uWlh3dVZQNENjK0ZOV1BRa05kYUZleU1yaXJsZXhW?=
 =?utf-8?B?WHVUa1JHL2o2UDhMdlluM2gxQU1ZZUg5Mk50OTRYUWtscDM3eFJsbWZ1OVla?=
 =?utf-8?B?NFh2Si9vN2ZrYUNBUUR6dFV0cXM4YmtsRHZ6QmdObVg4K29laDVIeDllZjI5?=
 =?utf-8?B?WHE3dnhqSmZGWm5nQXZwQ2xmOG85RDlldGswc0FqcGVDN3djTG9UZWlDQXBH?=
 =?utf-8?B?TGY2MHFMYXdHbVNtS0loOHZrOEpLNzkwV2NZQ3dGWURBQlBWY0ZCaXQrR0R3?=
 =?utf-8?B?dTd2bWRFYjFzcmd3N25GY1dyQWFGSnJBb0RuaitwRnNPc3JZSEVSais0Zjlt?=
 =?utf-8?B?b2g0N3NZVjYzZW9URDRKL3NyNmdybTRnSzlrR0RrcGNlWVdGOGh3ZGMyclpP?=
 =?utf-8?B?N2FSanRxNTB0dFk3RGYxSHB4VlFzS04zR1luVGtYT05WK1Bid21kaWwwRE16?=
 =?utf-8?B?ZDI2bTdzUHVtWnNTcHRXeDl4dTE2d1RBZ0hmUlNNU2Z5cFlzSlpXczZsUzZC?=
 =?utf-8?B?YVd1VCtrc0dkWW1ZNFNrVlU4RFRlR3RwdytlaHpWTTlaSGNoS3RVRU95Nktn?=
 =?utf-8?B?bW9BUWJGQ2lYR2lJdjBmY1NCcjZiVU5kbEhyQU1LUVhOM1R0NkRmRFBEUVNG?=
 =?utf-8?B?cU9PK0VLSjdxRml4NGs4andaSkZyaXhHOEluS1RReldwdlZPTnRGcHd0MkV0?=
 =?utf-8?B?dnFVUzkyMDFHTVNXMFR2MnV4eEdWVGpOS0N3UXJLckJNRElTZnd2bE45Y3k4?=
 =?utf-8?B?dC9GYTYxOUx3Ty9IREd0L1JnK1pXYXprM3lrTVpCdTZmVHR0Mm5yTnJxVGhp?=
 =?utf-8?B?SnNWSTY0VnFKbWJEelYxWkJLbXZKek1BeXFQQ3JzUERJZUgrQXc0c0tWeENX?=
 =?utf-8?B?N29OaEpKTXRwZC9DMUN1Rm9ac0FTWE9KeVM1c1FJenZRWWNKNjhleHFmcEd5?=
 =?utf-8?Q?cUP2SEZaCFnS7RlQ=3D?=
X-Exchange-RoutingPolicyChecked: HiilI01LUT0muJMg0sYiUX93XL79qqMxHw9j1QpKGFQYcXm4YjrlftHclLik2G3o5cMnB0IzbBLGLZMuJtAFOXuUgfZzqZChOBXXDbDMecrG5weB/Xl+ZH16iN35AIsAbptdLvQUcaKanSnMJfAf7VLrVr3l7nrKCy9hwPSASm9yYq03sNtj0kHJXLNOdGdq+Eeq5Z5MvgGLb6q2pzMdUFZCgl2sYKIQpY9kM7Vy+oyEWYWlokpx71ICpQuWnfwNw2JYjpazL9hWvVRN2DxEaFQdM2v+nUEdiKg6q53fHLR0T4eqLt6YxPXxJotAU5grSvA6uQ7XTFIZuVtzYhcgxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3204b0d-659d-4d10-a663-08df0ef7abc1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7558.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:55:02.0268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjOPoz6hHPHaVglR6pAY0NQkyLmA4nI1cDOG+F+ef8ou2g14lk7DcH4AiTrvzjQexYuEWjNGpRKvM4pZWIJ2dLJ8AmYif20m4ZUJA7MPJT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
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


On 9/8/2026 1:40 PM, Kandpal, Suraj wrote:
>> Subject: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
>>
>> Enable programming of the common SDP transmission line on platforms that
>> support it. Compute and program the common base transmission line and per-
>> SDP stagger values from the crtc state during modeset, and disable the feature
>> on pipe disable.
>>
>> Currently, the stagger values are set as per the default policy of the Hardware.
>> This can be optimized later if we come up with a specific driver policy to
>> sequence the SDPs better.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c |  3 +
>> drivers/gpu/drm/i915/display/intel_dip.c | 90 ++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index dacb4b7588a0..3cdb06e81130 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct
>> intel_atomic_state *state,
>>   	/* 6.o Configure and enable FEC if needed */
>>   	intel_ddi_enable_fec(encoder, crtc_state);
>>
>> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
>> +
>>   	/* 7.a 128b/132b SST. */
>>   	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>>   		/* VCPID 1, start slot 0 for 128b/132b, tu slots */ @@ -3124,6
>> +3126,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encoder,
>>   			     DP_TP_CTL_ENABLE, 0);
>>   	}
>>
>> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
>>   	intel_ddi_disable_fec(encoder, crtc_state);
>>
>>   	if (DISPLAY_VER(display) < 14)
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
>> b/drivers/gpu/drm/i915/display/intel_dip.c
>> index 0c80d6305fec..007c8fb87ecd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
>> @@ -10,6 +10,7 @@
>>   #include "intel_dip.h"
>>   #include "intel_dip_regs.h"
>>   #include "intel_display_types.h"
>> +#include "intel_hdmi.h"
>>
>>   static int intel_dip_get_as_sdp_transmission_line(const struct intel_crtc_state
>> *crtc_state)  { @@ -54,14 +55,103 @@ void
>> intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
>>   		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
>>   }
>>
>> +static int intel_dip_sdp_stagger_to_tl(struct intel_crtc_state *crtc_state,
>> +				       int stagger)
>> +{
>> +	return crtc_state->dip.cmn_sdp_tl + stagger; }
>> +
>> +static
>> +void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state
>> +*crtc_state) {
>> +	struct intel_display *display = to_intel_display(crtc_state);
>> +	bool as_sdp;
>> +
>> +	if (!HAS_COMMON_SDP_TL(display))
>> +		return;
>> +
>> +	as_sdp = crtc_state->infoframes.enable &
> Since as_sdp is bool does this need to be "&&"
>
>> +		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
>> +	/*
>> +	 * When AS SDP is enabled :
>> +	 *  - The common SDP Transmission Line matches the EMP SDP
>> Transmission Line.
>> +	 *
>> +	 * When AS SDP is disabled:
>> +	 *  - Bspec mentions the positions as lines of delayed vblank.
>> +	 *  - Guardband = 1st line of delayed vblank
>> +	 *  - Common SDP Transmission line is set to 2nd line of delayed vblank.
>> +	 */
>> +
>> +	if (as_sdp)
>> +		crtc_state->dip.cmn_sdp_tl = crtc_state->dip.emp_as_sdp_tl;
>> +	else
>> +		crtc_state->dip.cmn_sdp_tl = crtc_state->vrr.guardband - 1;
>> +
> According to Bspec 74384
> The transmission line for each SDP type must not be within the V. Active region and should be positioned at least one line into the V. Blank (see "Transcoder VRR Function" for definition of Vmin)
> (V. Active + 1) <= (Vmin - SDP TL)
>
> When Panel Replay and AS SDPs are enabled, the eDP/DP standard requires the VSC SDP indicating PR Active to be sent out before the AS SDP. Therefore, the following programming restriction is required for this configuration:
> CMN_SDP_TL >= EMP_AS_SDP_TL
>
> If PSR1 is going to be used with the Sink, then Software must position CMN_SDP_TL on the second line of the VRR Guardband (i.e. CMN_SDP_TL = (VRR Guardband-1))
>
> Don't we need to check these restrictions
>
> Also according to Bspec " crtc_state->dip.cmn_sdp_tl = crtc_state->vrr.guardband - 1 " only when using PSR1

CMN_SDP_TL = (VRR Guardband - 1) only for PSR1 this formula isn't 
PSR1-exclusiveit's our general strategy based on Bspec: 68921 of 
replicating the disabled-mode default SDP position (2nd line of 
guardband) whenever AS SDP isn't active.

It happens to satisfy the PSR1-specific bspec requirement, but it isn't 
gated on PSR1 specifically since it produces the correct/expected 
position regardless of PSR mode.

But I agree we should have some checks for cmn sdp tl.

The guardband must be sized so all CMN SDP TL positions can actually be 
transmitted.


I'll address this in two ways in the next version

- Floor the guardband at 5 lines in intel_dp_sdp_min_guardband() once 
CMN_SDP_TL is in use. (As mentioned in response to earlier sashiko comment.)

- In compute_config_late, add a check that cmn_sdp_tl (measured from 
V.Blank end) stays less than guardband + SCL (also measured from V.Blank 
end)i.e., within the SCL + Guardband region.


Regards,

Ankit


>
> Regards,
> Suraj Kandpal
>
>> +	/*
>> +	 * Currently we are programming the default stagger values, but these
>> +	 * can be optimized if required, based on number of SDPs enabled.
>> +	 *
>> +	 * Default values of the Transmission lines for SDPs other than AS SDP:
>> +	 * VSC : CMN SDP Transmission line
>> +	 * GMP : CMN SDP Transmission line
>> +	 * PPS : CMN SDP Transmission line + 1
>> +	 * VSC_EXT: CMN SDP Transmission line + 2
>> +	 */
>> +	crtc_state->dip.vsc_sdp_tl = crtc_state->dip.cmn_sdp_tl;
>> +	crtc_state->dip.gmp_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state,
>> GMP_STAGGER_DEFAULT);
>> +	crtc_state->dip.pps_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state,
>> PPS_STAGGER_DEFAULT);
>> +	crtc_state->dip.vsc_ext_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state,
>> VSC_EXT_STAGGER_DEFAULT); }
>> +
>>   void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
>> {
>>   	crtc_state->dip.emp_as_sdp_tl =
>> intel_dip_get_as_sdp_transmission_line(crtc_state);
>> +
>> +	intel_dip_cmn_sdp_tl_compute_config_late(crtc_state);
>> +}
>> +
>> +static
>> +void intel_dip_cmn_sdp_transmission_line_get_config(struct
>> +intel_crtc_state *crtc_state) {
>> +	struct intel_display *display = to_intel_display(crtc_state);
>> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>> +	u16 vsc_ext_stagger, pps_stagger, gmp_stagger;
>> +	u32 val;
>> +
>> +	if (!HAS_COMMON_SDP_TL(display))
>> +		return;
>> +
>> +	val = intel_de_read(display, CMN_SDP_TL(display, cpu_transcoder));
>> +
>> +	if (!(val & TRANSMISSION_LINE_ENABLE))
>> +		return;
>> +
>> +	crtc_state->dip.cmn_sdp_tl =
>> +REG_FIELD_GET(BASE_TRANSMISSION_LINE_MASK, val);
>> +
>> +	/* SDP VSC uses same transmission line as CMN base transmission line
>> */
>> +	crtc_state->dip.vsc_sdp_tl = crtc_state->dip.cmn_sdp_tl;
>> +
>> +	val = intel_de_read(display, CMN_SDP_TL_STGR_CTL(display,
>> +cpu_transcoder));
>> +
>> +	vsc_ext_stagger = REG_FIELD_GET(VSC_EXT_STAGGER_MASK, val);
>> +	pps_stagger = REG_FIELD_GET(PPS_STAGGER_MASK, val);
>> +	gmp_stagger = REG_FIELD_GET(GMP_STAGGER_MASK, val);
>> +
>> +	crtc_state->dip.vsc_ext_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state, vsc_ext_stagger);
>> +	crtc_state->dip.pps_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state, pps_stagger);
>> +	crtc_state->dip.gmp_sdp_tl =
>> +		intel_dip_sdp_stagger_to_tl(crtc_state, gmp_stagger);
>>   }
>>
>>   void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
>> *crtc_state)  {
>>   	crtc_state->dip.emp_as_sdp_tl =
>> intel_dip_read_emp_as_sdp_tl(crtc_state);
>> +	intel_dip_cmn_sdp_transmission_line_get_config(crtc_state);
>>   }
>>
>>   static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *crtc_state,
>> --
>> 2.50.1
