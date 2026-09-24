Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15208C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 13:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC97110E492;
	Thu, 24 Sep 2026 13:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkvKSLDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7031110F588
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790257781; x=1821793781;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NT+Jaz2jGd1chufZgovvO/JbGOnulR9MZob/TEBLhmo=;
 b=TkvKSLDTUORPjeES0E0ue/uZwYMR17u9B2fB9cf/sVE1ZR16ZKajUPGG
 meU8+RW9cJ4n9oYTXE7dc3Y21S+fCEdXidwuj4sGDw1qHGviJkAolHCa5
 izTD+qWsQou78E+kIIBHZjAq86upbVuD4Bh8joIHkskMswUUuTvZFKmnC
 IdXzXhI2DfKibUGxsgy41+HPoVAENu9AKo8zzRbCygt2gd1/6LrJhjtrx
 BKcslRs7x+3R+mlmTQGAsUNCZ2nSKdmav0zI+litrdYLebliyv1zAgzZf
 jIuRtnBNDTkjUS/ouE99f2owRNtZbwo4kfGqr+PuioRMvlgNA4TwnHQb5 Q==;
X-CSE-ConnectionGUID: KeCEMs6rS3ColtBzGHLsyg==
X-CSE-MsgGUID: HtwSjxiOQ52+TQStdvO5ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93527100"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="93527100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:49:41 -0700
X-CSE-ConnectionGUID: g/u+cnrNS8Spt6jkEFcPJg==
X-CSE-MsgGUID: IjgpPW0nTFCD3XZDFNvCYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277192617"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 06:49:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:49:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 06:49:40 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF3a4zjxtbbfO/07gDKcu5w56/4QCzwROv1JSMzhkMJ6Xh4MHU0gGN522S6OCHrJIlmQL2DmrkNlmC9Btk54WqXvAkeMFIU/MR5jHKk/aP8a5znm9MumYcyg+6IKnzdCrfiqYoJAfgMES2SNjDafnQkT8NSX0ZBHDP+UAyfbxO6KAcmtJE8XropDJ0Yyj8MYbJWWfinnLH3RaEl85bT5f1viWugll+rFafyFpK9XeM0waeDaYf6lBogeSGEq7ijzunPAUQocIDkRUn3eIQuG+/mVcplWix3tkIK705C9cHzdtN6ddImdCXVSBygS1sHsSTX4JHOdv+nf9lHAu1S2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4UNv8FxK7WYSsYb3568v2UT8K1nDPuGmL+fhtjCY4A=;
 b=S76ZxHg9dDaeg3qqoTo/95BmXcydd0pLa7xEelDNaOPENjFHEMkBSf9GQZTnMrl/a/6V5aXTWFwVMla0Ak68xa9WY5AM6X+232JYfAa8O5ntpncgSBcGBeyR+gmGunSXNtScDPE8iMCfNzKklMogvM2V88tE92acl7c1TLIBiwXVlKZpFKCeLefRLTE6L+Osm6i58dLZ1sXMG7v6rkyNm0zTN7q2i0HZeS/DNwa3v8k6F0sZu+qmBXBYqDrVBjCOQWYLLtt2qZg0z8mhE8RVHUOEywCduxdx+Jc4oaSpdDG0EaxUYw4xwgSeAg7RVpyc8ryKVgJM0AimzCxxMjASvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:49:36 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d%3]) with mapi id 15.21.0428.018; Thu, 24 Sep 2026
 13:49:36 +0000
Message-ID: <02daf65a-f63b-496d-811c-6f0580a05bbb@intel.com>
Date: Thu, 24 Sep 2026 16:49:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3p: Restore sampler fault for uninitialized
 surface state
To: "Souza, Jose" <jose.souza@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260824220458.520358-1-jose.souza@intel.com>
 <20260826193807.GI681121@mdroper-desk1.amr.corp.intel.com>
 <01f98eeb0492e16dbe8b20695028b0494390f600.camel@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <01f98eeb0492e16dbe8b20695028b0494390f600.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To CH3PR11MB8137.namprd11.prod.outlook.com
 (2603:10b6:610:15c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: be94426b-5fe7-403c-f20b-08df1a42a4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: g/rAJBYqLMuuE8FpFnYrXQtUHCNS45C0dGTAhmtwAFXn4CHw7OBtsfFUq2dPC1mCMEee78biAEZN65FycmFvKR6FKz4oN1q6G9f4jAy5nlSJBCMLg7RFOa84mo9f7AH9AIOcZ/4jPp6gbbuQyEEhRHpJRK+fTgLiWe5XO8IT18NU70ZBmP2B5PH74vkQqTBWZdjubil/HQw7je0ofjtdpRYFMjcFdFTp4N6lJXglVLJtOO3Oc2dIsmpPJxuvdJc1hcGX43AWElDFQWU4m7Dpqptql6YlKFfvkBtc/X5+3dtHKaw3UzaBRHoIB+LLV2YeL0QE12eoMZs17GUc2U+AoqqQhDpyecPbXWBzL/LivAlYjMwC1QbcAGZR1SZnxHVZl5JpieCiJnWlK2A/eWVkYyCtQ0MQF+fYht449IsmfJVffPcjB+zZ80iKsjNkzrKQuj+d8ujY8Ls6GGKj/+J4aF5udE2fEEJQvsmBxBe60uQd33nZwKrx0icX5geagZfJuQqOyloUasmc3G1IQ5ecTKwp6BgKDcvUKs1FoPwmAwqxITqj3QKmEP4WFmr9BVwjWiZ8aRGrT6fHTeCS+yuE+0Egzxwq/ILAppwG0VWu2r8XZDHf169z3+bBZVpFKOAssrJl0bbV7nhjZyKy71rAxn2YXZniOLy0RFsk2Tcy4Gc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU1XVFMvemlsM3IzR0t4MUVSNXlacDl1VTJVWXRyUlJqWDhEeHBiRmZSQW92?=
 =?utf-8?B?Z1lERVV0eXFXY3pXZDZXMEJ3a1JqMnd2bFppdWZka2RocFdlcndDRXpaWTlZ?=
 =?utf-8?B?ajRUakVtVXVwWlFFN0lOUy80bHJ5a1ZxRUVidlNVWHlXdmRwenNwR0dUTDVa?=
 =?utf-8?B?VmRBeUJwZkd2RUFkQTJ6M2NOSlBmYmxFKzdDMWJYNEhLYXlpZGsxaGxlSlBy?=
 =?utf-8?B?YzFOelNXSGVRTGpTazhVSk96cThqTW1KQ25TQTBaZ3BrdXhtZU1GTXI4TElm?=
 =?utf-8?B?N0ZkZXBDYlZNdzkrT0JqWUVrREJNYnoydnFoQzRySDNCYUFJQkZWeG9ab1c4?=
 =?utf-8?B?WjlnTkRVa3NFNHhmWnkrRTg0WXlUaGJsVE1LY2dLZW5mTldCcWorbWJjcmVV?=
 =?utf-8?B?c3p6NVkrZkdxcnZ1UjU0RVA5VjVUS0dUcTBTVHZGRk5DTlJ6Zk01cTdkRE9n?=
 =?utf-8?B?NmR3VEtGMlRHLzZuYlhxVlEzbWxGRVpPRE9uV3F6U1ltM1Z3RnFwTC90R2Mz?=
 =?utf-8?B?dEU3dGFUbzVaZnZjSS9QSFF1NkJBdXJTaWEwNnNoU1NZQit5V1hIc3JWVUxR?=
 =?utf-8?B?c200cDdwRFlkNm8yUVpSTTlXYngrU2NTSDZ2czhxRFN0ZzFCL0VyeGV1OHpI?=
 =?utf-8?B?QVZZeTBzbDUzN0Q3NjVSZ2JqbUQ4QzlCa3pjcTEwK3c1NGhydTQvbWR0NjMr?=
 =?utf-8?B?OEVVN2JqTktoeUxTRzVnOGNkM21pUUZvcWFndXhkcHdxTkZUZVFyUVZtMGNQ?=
 =?utf-8?B?L2FHUXNMcHRqa1YwK1laL2dZZFZNTGZhbWwyTnlWSERJWU9mb2ExR2ZPQTV4?=
 =?utf-8?B?OVFwcHpleHJuNlROc0t6TEZXSCtwZkVTbXVibDQ0YUtLR3ZHa0N0U3EvS3ll?=
 =?utf-8?B?R0piUU5KMWZKYXlTUFh5Yk15WFRJZjlsUDIvaTZMQ2o3bWY3ZHZWTVFWcWNj?=
 =?utf-8?B?S2pFaHlwS3huZWUzd2NBQ2JZZnpTdUQvVjNzd2oySE91OERud2o5cTdCbndk?=
 =?utf-8?B?T09UMkJpeVYvaHlQK0xialdHWW5ac0hPSWNVNDROK1VKRFRMZXk0bDJMM1Zh?=
 =?utf-8?B?YWE1dGdiWUhFTVRkK3VHT1dwZFp4MEFWN0o5RXNKSERmRllvRDVDWGVyZ0l3?=
 =?utf-8?B?WEJDb3VzODIva0R0N2JVOGRXUmNKYTBXeVduWUtRcnBJR2d4SDJnLzM2c3pG?=
 =?utf-8?B?R2k0eFM5WEZxdzBodFVVTW9sbjVwRlUvQmZRNklmMkVza0J1ZzBlU3B6alc4?=
 =?utf-8?B?RVNqcDAvTGoxK3BwMGVjTThYTnhnN0toV3Rtc2dQYjNUcm96V1hrWVJMNWJq?=
 =?utf-8?B?Y3QvK2xDVlMvWnhaZ0VRZTJHRVBZaXcxSG9wbDR4WjRyL2pIWFYycmhMOXp2?=
 =?utf-8?B?MEhaUmEvNjQ2K2NHZDlOQWtYY0diNWRKTE1KQUIxYUtzaUpNT3FURy9OQXAx?=
 =?utf-8?B?SWpzM2pzbTY2dml1YkdrLzlxaDhnTnNGRlZ5Yi9rU0xvOGZ1Z3lrdnQ5a0Js?=
 =?utf-8?B?SU1yWitJd3hNMHp3WkVrWnR5L3pnRmxFNFdDZ1E0L01wNGthTHl3cVZVMWwx?=
 =?utf-8?B?eXhLNGRTQmRjSHNjakl6SEVMck4yZDU3NTkzTjBXUGhQc3ZYZWlwUTB2S2FF?=
 =?utf-8?B?OXREejVJM2hONTNLVkYyU3B5dWl0TnVWN0o3bW1DRjE4REZaUlU0L0hzQUV0?=
 =?utf-8?B?a0toV0ZHVlJaR2MwTEo1QkRMcnIxSUFBemRNM3NkYk1UYzBheGRVQ0pNMzVj?=
 =?utf-8?B?TzdBMXNjUmV0ZHFhMEtmRi9pazlLVnN2bGNJV3Rad2VUTlVvM0JVSFZ2NTdP?=
 =?utf-8?B?a0c0TFd6WVBtWjhYVDF2WEdxOFpGc2doL2JpUnRJczUycWljS3lmekpzc25S?=
 =?utf-8?B?djRQV0ZDcytYdDFGNGw0emhlZHk4Sk9SNGZxZmdGcUFKWjJOQmI2NmlzNHl4?=
 =?utf-8?B?Qk03TkdkNDJBanRXRmxEWEJsZ3o2R0F5N2R4eUY2RzhPT1Rla0VnSnFmYWlo?=
 =?utf-8?B?cnNsQzRYbnNXY2l1YkJNb2Rqa29uWUw2QUJqTksvKzMyMVJOL1BvNlkrenRH?=
 =?utf-8?B?RWNWaitsMXg5ckdjcU1FRUZyclpkWUErNTBWelMxajRIaXpTVEF2dmFmQUlp?=
 =?utf-8?B?MllodzIreVFlM2M1MEdqNGtQOWM2T25Zd0xRcHpJN2JxOUN5QXhjcVBQellM?=
 =?utf-8?B?OXFGSi8wRU9lZGp0SjEvVGR5bjMwZ2VYTWFxWERBa2tEaWp1V0ZiZlNYNmZL?=
 =?utf-8?B?MVJSSGFGRmJadjVSa004T2wwNlNIWHg3bDg1WUZxMExzbTJFT3BkdnBnVXh4?=
 =?utf-8?B?b1RwYVJtN1dFWjQ3ek1sblN3end1aFJxdk50a0NhUmVLeEcveWptZHJaTFdY?=
 =?utf-8?Q?QKjP9hp1ZcAs8epE=3D?=
X-Exchange-RoutingPolicyChecked: ntgl/CRAZJHiJlz7Ym9bOoK70VBJHczS2QFmlwJBlvRJppZohz/69YM3QKC32r8WVN9tNUFqWMaacjpXEzoavi7KZYAa6F23qFJQW+WGYu51Bm62qGi/j+evQ5xNEBW4tiHhJq2wqDHhluC/X0BVDZS2tGrY8wCzY0fXzYlPU6SA+jpWqzqjzePGxhb6Cqa/jhxr+SCrtSU7x9NFvdrphLFNMF1+owuZ6w4+1g4Zu30F3E3EB9/p4938t3UfwZaJ4yP+Pdv7Lywb3J2Va065/6UYnf6HyWEjJf4HBaRSeums2SM1fJl9c+WNc6wUtaQSAbYXK0Ga0aSSbE3Cucw5xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: be94426b-5fe7-403c-f20b-08df1a42a4a8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8137.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:49:36.7105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX4VkRXQKU+oYxb6GLKlIFb86Y9Av7ekg+jZgxSBGi073fIuANoZctICDg85VKJ0D0uTcGnjReWI8hhOpFxuyc9bcJc61D1QwP4OIMpM100=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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

On 26/08/2026 22:54, Souza, Jose wrote:
> On Wed, 2026-08-26 at 12:38 -0700, Matt Roper wrote:
>> On Mon, Aug 24, 2026 at 03:04:58PM -0700, José Roberto de Souza
>> wrote:
>>> Xe3p changed the default behavior of a fault in sampler when
>>> surface state
>>> address is 0x0.
>>> With the default behavior some default values are used instead of
>>> trigger the
>>> fault, what would make pretty hard to debug bugs.
>>>
>>> So here programing SAMPLER_MODE to change back to the default and
>>> expected
>>> behavior.
>> Reading through the tickets associated with the original hardware
>> change, it sounds like the change of behavior here (not faulting) was
>> deliberate.  In the illegal (but apparently quite common) case where
>> applications write shaders that reference uninitialized descriptors,
>> this allows Intel hardware to gracefully handle the mistake in the
>> same
>> way that other vendors' hardware does rather than failing.  So it
>> sounds
>> like making the change below has the potential to regress some
>> real-world applications (even though those applications are
>> technically
>> behaving outside the spec).
>>
>> There are also notes indicating that the chicken bit here is
>> intentionally placed in a privileged location so that it can only
>> ever
>> get set by privileged software in specific debug situations.
>>
>> So maybe the best solution to avoid causing regressions would be to
>> just
>> leave the default setting be, but create a debugfs interface that a
>> privileged user can use to toggle this behavior at runtime for
>> dedicated
>> debug situations?
> Not sure what other Intel drivers does but in ANV and Iris even when
> application don't provide a surface we set a valid surface state
> address that points to a null surface.
>
> So if for any reason a bug is introduced and we set the address as 0x0
> would be better to catch that with a fault right away than spend hours
> debugging it.
>
> Lionel what do you think?

Sorry, for some reason I didn't see this question.


No, in Anv the surface states are not initialized to avoid pagefaults in 
descriptor sets for example.

Iris might do because it's still using the binding table.

But that's explicitly undefined behavior and will hang lots of HW out there.


I think a 0 address for a surface state in efficient 64bit is actually a 
bit unlikely.

What is more likely is a random address or oob address and that 
triggering a pagefault or more annoying the address mapped but pointing 
to garbage which pagefault/hangs further down inside the sampler operation.

So I don't really mind the behavior we set here.


-Lionel


>
>>
>> Matt
>>
>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 15 ++++++++-------
>>>   drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
>>>   2 files changed, 13 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 48c515d91882..e6e51d04ca57 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -503,13 +503,14 @@
>>>   #define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
>>>   #define ROW_INSTDONE				XE_REG_MCR(0xe164)
>>>   
>>> -#define SAMPLER_MODE				XE_REG_MCR(0xe18c,
>>> XE_REG_OPTION_MASKED)
>>> -#define   ENABLE_SMALLPL			REG_BIT(15)
>>> -#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11,
>>> 10)
>>> -#define
>>> SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER,1)
>>> -#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>>> -#define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
>>> -#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>>> +#define
>>> SAMPLER_MODE					XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>>> +#define
>>> ENABLE_SMALLPL				REG_BIT(15)
>>> +#define
>>> SMP_WAIT_FETCH_MERGING_COUNTER		REG_GENMASK(11, 10)
>>> +#define
>>> SMP_FORCE_128B_OVERFETCH			REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER,1)
>>> +#define   SC_DISABLE_POWER_OPTIMIZATION_EBB		REG_BIT(9)
>>> +#define   SAMPLER_ENABLE_HEADLESS_MSG			REG_BIT(5)
>>> +#define   FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE	REG_BIT(4)
>>> +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE		REG_BIT(0)
>>>   
>>>   #define
>>> HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>>>   #define
>>> DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c
>>> b/drivers/gpu/drm/xe/xe_wa.c
>>> index 139434946f8f..5273dea83df6 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>> @@ -602,6 +602,11 @@ static const struct xe_rtp_table_sr engine_was
>>> = XE_RTP_TABLE_SR(
>>>   		
>>> FUNC(xe_rtp_match_first_render_or_compute)),
>>>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
>>>   	},
>>> +	{ XE_RTP_NAME("Force fault for uninitialized surface
>>> state"),
>>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500,
>>> XE_RTP_END_VERSION_UNDEFINED),
>>> +				
>>> FUNC(xe_rtp_match_first_render_or_compute)),
>>> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE,
>>> FORCE_FAULT_FOR_UNINITIALIZED_SURFACE_STATE))
>>> +	},
>>>   
>>>   	/* Xe3p_XPC */
>>>   
>>> -- 
>>> 2.55.0
>>>

