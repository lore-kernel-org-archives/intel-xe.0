Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7342CC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 06:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEC210E126;
	Mon,  5 Aug 2024 06:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+6TF4D3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3219810E126
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 06:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722839516; x=1754375516;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Hd6ec1GxjevSsbvHSn5u6Ep+sZqfIoucwXIYKyfk65o=;
 b=F+6TF4D3X4ZXd3mnYX/Z4x0g2JrpPQUEGBeus5s5mmCKa24vMN32A/WA
 zp3oq2o4K04XzbsUYRargfIUTsTffCau0mpNctJMqfDW9eL6MQP9hDm8S
 bBAk3QgH3poCfg2cuGzKtBrM93+L7ww2fYwaRhlaPqOcWLcRCcMZ5Z6W1
 6iAlC5n7gVD51pgqmSXhqvoo+0puVqeS9sSpmmrvO8+CA5Qj9BoviFTDA
 rtpUMX/ZHtuv6gnDNWTLmQD3pXMyI/nmcPq9Vxr8Hj5pAuB0qTQEpTWiy
 kkr1BfOyspCBFvWZVCcqS5jiJaE9i/MSRuQNGn3T3AwfNWBYdWJ8+vfe8 Q==;
X-CSE-ConnectionGUID: 900SVqztSRmV2aCMnV/2sQ==
X-CSE-MsgGUID: 6wxrUQ3TTPWWcs04+wHA5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20663250"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="20663250"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:31:45 -0700
X-CSE-ConnectionGUID: sqsiqAQxTgeYGIcUzB6Ccw==
X-CSE-MsgGUID: e+JQCnIzTq+QhdjgzzUuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="56144536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:31:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:31:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:31:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyxYxydbLmWPeNNcPcDWvuhb2PksOIy/zYKX/gu3XxRVlF/7fw9h/M/htsZ2n41ZRQHH0Yuktwj5/VtdoD8+7z9/9ZFb8A8aFPgcRpFtEudQz36c+DLp6g9+H/ic2/ZXKPTWZeooxOGVwFVt+v9Ulg+XpKK73onjf6jViV6bimWVbuwhsHheQcqf67dYkL9khQQgjx9K8XB52Y4GN7/Asna45DbuSFzz76d0v6FIH6i15u4qJ6EDDdFtT6QApd8BoBVX1PsKi0/06vSRkhyhb2LCNYgQ7t8SJyYYUy1GSXJ7wce+aUhVVDKAHeKZC19aCcFuRMSMzB3PZ/tX9b4a3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4hCOHMPhJITyClHzqRwtkn+IvVLTjZkH7ZFSfBNsEU=;
 b=tn4F+53XwbMUhjjqagHfe3t+CPL+7O8TmslBcY9GJK4G1SoJtt/20Rc2KYZNvMBnSa215YSbYsj2rBd23+qNDBA4QfYqSYvV2Sx9xVLSWYxh/ZRe3ErQBZXtYmOYh+3Z8SenaG/lBCjKaQNSEbFGZEglOpdGZ3dnEWbb+3HQqaAn39yifOt13JHWJpmkImcb0j52d2RV1FuOP/BEminIH3DZPdWj5S6JjN58X5W3986KrklV42CuMyV8wql5vxK4FoKr8Glv5L3ivBFu08PoMpVe/AMNI7ZLgBYL7/h0tnDxdeRV29vaXpDNI7hlBpordaI1tZvWDeLKNuWropg/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 06:31:38 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.7807.026; Mon, 5 Aug 2024
 06:31:38 +0000
Message-ID: <53e43d97-ab50-4928-9b88-d827737ead76@intel.com>
Date: Mon, 5 Aug 2024 12:01:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2: Add performance turning changes
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240805053710.877119-1-shekhar.chauhan@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240805053710.877119-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d75d0bb-3939-45fb-1a5e-08dcb5184257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU1lZUdtdGpEcXduVG13blNDZUhtbHdBZU1aSUpteXp0TUxmZDN5aEViaUs0?=
 =?utf-8?B?SUdGZWFLUkZtSGl5K0txdG12V25YQkZ5TzBqbXRWbk9ZY0Y0UVZRVGdkRmtk?=
 =?utf-8?B?cHJSZFMyS2tEeWFVV2NlUkZYNzZFSytVNWprejJ3aE1qbzg0UVhaZWFYVk9G?=
 =?utf-8?B?N0d6c0NQaHpwTTRHc2RqTHoyRlltaUhFQ0RvUndXTzhLYlpNNTd3MU9xU3pO?=
 =?utf-8?B?R0dTbkNyQi9EcndHMWlQaXhwc1JVbDVBLy9VNGpKRk9VVFg2T2dpeHBrTnNW?=
 =?utf-8?B?MzJmUE5rWkxKazE3bmZkM0RIR1dmSVV6YXNKWW94OUYvaWM5Q1JZMGVGZEVX?=
 =?utf-8?B?TDdHaGdzSTAwZG1XdDg3d0cvbEtuNmJzbGhqRld4eldtdUdTbU5CS3hFekpj?=
 =?utf-8?B?blc0U3hhUGZpOXhReE5uUmZqQ0liY0U0SjFWNUNRR29ybkkwdDBxZ2ZFVVlD?=
 =?utf-8?B?cFFsbHg4K2tzN2VuVllhMSsyaFhaZFhlOWFzU2VpUXpTQm0rdVNLY1ZDanl3?=
 =?utf-8?B?K0tFWnZOTWR2U1ZXVGowNm9xeVR2VThYSW44bjFGNUtRNFVkT3BmMy9VWlUw?=
 =?utf-8?B?ZVQ3bHZFLy9Wd3duQmhiVzlaWGQ2andTclpYbVFhN0FWNXBZVHBJTnJ2NzM4?=
 =?utf-8?B?WTRBQitTMm1zVm1GckZOQ0dBbVB4Wmc2S0dLRmFzSDVVWFN2ZmJHNjVuc3Nu?=
 =?utf-8?B?RVloRVg2R2k3SmN4aVoyazFVMk1sZ1dTNEZvMlRsYVVOalFYVDAyVWl2ZWpR?=
 =?utf-8?B?SjVmbzdEQUNCT0pyZ1drUXovRFVudHBYOFZ3aGszVGx0bVZJWEU1VDJDNUVl?=
 =?utf-8?B?TFpzdXoyNVI0RSttdWFvRlN4bjVhQU1mQzdBTFBveVR6TldUWUp1bk15REdt?=
 =?utf-8?B?K1hWbDNNK2VRR3NGRU1oS0s1UHBoQWJhbWdMVlFJNGMvbnVkUTNDQm9FMmpU?=
 =?utf-8?B?OXVXdXAxNXMwRWU4aSthUHBzR0ZSb284VnExT0xWaUhzMzMwamVhNG0vM2RU?=
 =?utf-8?B?eUpWODZENG5RRTFzVmY4ZmNFUVBueGpzY3N0T2hkSDdFeFBKYXhMdWxLdjc3?=
 =?utf-8?B?a0czSndzY2ZTTnpjNElMV1pBbTBvSEJoNTRUeGIxdEhUWVFocWtWUFZNU01J?=
 =?utf-8?B?eU1xR01yMEV0eCtKS1pBd0phVERyUFVhOGRSeTBtMXNkNmtrN25nSEVzWG50?=
 =?utf-8?B?VWgrcnJjUXkxVzJPVXkvUFNHVVhTcUM2RHd1UURnTS9qS3NFWFcwTG1QZ3pN?=
 =?utf-8?B?Q0htTGF2Qmg0dGhCVEloMHNTWXRHQkVQRjN6VHdEazBaUlFoT05qSmJ5eEtJ?=
 =?utf-8?B?cThtWFd1YWJmS20raHQ1SGV5bmJ4MVNsMlV4SlZUNUhia3g3UFlXZitMSStH?=
 =?utf-8?B?aXRmVEgwWWZzd0t1STNZcWY0OEgyTkJkaWRUaEQweCtBMG1vWmtyUjdQMC9E?=
 =?utf-8?B?OW1pTEVrVUNtWE51d0dsTysvaVhDRlhxL3M3QjRUTzF1NzNOYnEwMm5IYjFa?=
 =?utf-8?B?cG02R0ZzeW52ekJPUlg5WmVIVGJPSHJMcHdNS2VLRmZpd29vOTA3dmRVMngy?=
 =?utf-8?B?UE05L21kRWg3ZStMVUJoYTAzaGo0R3pqRTNwb0QwL1JXT2laY3dhOTRsQjU4?=
 =?utf-8?B?eXk3Y1ZLRnNjMGcxdTE1bkhoZGxBcWYwaEhpWFFDOFNIMVUvaTdOMG1QUWd1?=
 =?utf-8?B?WkpxdUhwTWJpeHcyTDYzZ0hyN2pGOHdudkpSZjkzaFN1SWs3MXN6WG45NzB3?=
 =?utf-8?B?dm01ZmZkckhRY0gxMUpGd0ZTaDVUcWlGc3poV3c2U3VRVlJ4NElwdDFWdjNY?=
 =?utf-8?B?ZXdzVjNPdmwvTmMza251Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1l0K0pJTFowN1EyeC9PNjBwUzNlZGU4TWU0MFFySmxJMFJUenc5M0FQRjVh?=
 =?utf-8?B?VW5uSld6SUsxM1V2NTg3K24yT3JBV2Zxc0NHblRiTkF2QUNUZGVha1p4OE9n?=
 =?utf-8?B?NWlkQzdLditlSkQ1dmhDbkVYc1ZUb0dsTjR5dlE5K081ZWdaeDRhclRYeWZl?=
 =?utf-8?B?SHB4SzVGdXN4Y1ZMVjNrZ2FYM0ZvYzFwcnhBTFN5OGxBZXhFWWdWQ1ZML1di?=
 =?utf-8?B?TVkvWFhnMGhSSUtjWFljWCtDYi9GRU1pcmgxSUo1ekhUSjVWODdJTFlPMXJ0?=
 =?utf-8?B?MjRPR01HMWFuQ2Z6a2NvSkVPN2pQa0ZPTkQ0NG1zRlJtRFl3c09kNXBjeG9R?=
 =?utf-8?B?TDBieFMrOXdwNnBlQnVMVDhtSUozZ1pveXEyWVFxTGpORTY5SVdlOUFWTEFl?=
 =?utf-8?B?azZ4NHNLd21uNk5naUo5azgvWmk0VkpZYktYMVVVRXQ0LzJOZDZmaWdtY0dL?=
 =?utf-8?B?T3hvOU9PRHRJTGhqeHlWRm8zWHQ5THdUV1g5cjZUMHR3bkhRL0hzS0NhZmFm?=
 =?utf-8?B?b0Nvcm50ZE4wZ2NrK1VzS2FNMkx3M2RxWkIxTHExNnplSVBkWVdESE9USStV?=
 =?utf-8?B?dUdFKy92UC9VYlFKVE8wK2FFWEZMYUVWR3Z3UkNZNTFUWmFOaVlJUnIzTzFU?=
 =?utf-8?B?VUJIOWZaaVZyM0Q0aWpkVFhlcVV4b01HOFdtWnV5VEhYc2dOUWwwSDVwNTMx?=
 =?utf-8?B?Mk1yc2NPeWVuWm90MkVGVEVLTHgza3hnOENocm1rNEZudmZPK1ppVWhpb2pw?=
 =?utf-8?B?a0tnV0RjOFJkM0JhRFZtcENNTmcrWnRFNk5WUVZiY1VpTy96OW9KT2pJbEEv?=
 =?utf-8?B?Z2NDaU5qSHdWSC8vcW1KdERUU0FkZC9EUGhJZHpWdnphVXBSTS9vNUV0YjBK?=
 =?utf-8?B?MlMraG41clJZd0t5MFRHeXptOW5kNWlEd0N6M1FHRm5GclA3QjZEVGk0a0xD?=
 =?utf-8?B?a3EzMHdFS210Y0lyWDc3b09IanJGV1N1OXN3MDdtbW9oWTZYT3pmRGF5dVNm?=
 =?utf-8?B?QzFtSnV6TUFiWEF4aDMrc0h3clRUblFBdmdhbkF2QzZKL1pvU2hxdlJpd2Ro?=
 =?utf-8?B?Z3BVanJUNjhPSURGNW5uYUNuN29BR0JGVE81OXc4aVUvdUpOM1BjUXFTQ0VI?=
 =?utf-8?B?SnNNYXJwT29uMHlLL2hoQ1RWdk1idkEvVXk0MGwyZFNvaTlXVkF2QlBpMzEv?=
 =?utf-8?B?UkZUK1FJdVZ2Um96dHJjR3V1MGlJSmtqeUlXVSs5a1J6K01lakV5YllRQUo3?=
 =?utf-8?B?Y25KaHcvSUpidUtwam5RU3RBMjNGRGhMWG1JeFQzdkwvUVA5YU1CZ1JhNFNU?=
 =?utf-8?B?YW8rb2syYXY4OGNaVWJaZmRWL2k5RUJkVUdTUEpxdDdrRE05ekkzdUd2TTcy?=
 =?utf-8?B?aTJGTFYxanR0WkUxL3g1Vkd0ZzRsMWFEVWFLK2JCTll4bXVoa3JTYWNOSWNV?=
 =?utf-8?B?M1FrNlVJZFBEZmYxTzRRK3NyMjRNbXZHQktnUUVjcVZ3aXpxSHpiamlJaEk0?=
 =?utf-8?B?Uk5VNDF3S1hEam90TGtZNVBjb2VOQXZEazBKVGNDV3VVdnQxWUpISG4wVHkr?=
 =?utf-8?B?NDhlNTdQcElhcjZmOUdjYlM2M0FGNTJ4OWdya2tZR2VzM0g1UjVqSG1sVXc0?=
 =?utf-8?B?SUFUQjdoa0Q0M2tMSFlpZ2tlUzc5RmsvMmdxb3Z5SjdqMjB2bVdjYW5HRlk2?=
 =?utf-8?B?aHBjV1lxMWFPd2FKT0NVMTFJQnFYdVNsOWRwKzYvVTlBRlVuSjk2NVBweVV2?=
 =?utf-8?B?NTdBY05LcllJTWtwSk5pN2JIQUcvdHZYS0Z3UnJmekRmaEN4WmhaNHdHU2Vn?=
 =?utf-8?B?ZURhNXZwUkY3MFRYUVFWZmRsNWJFb056UjlrbTV6V2tVQ1ZXdmo5aWNEenpy?=
 =?utf-8?B?YlM3QUMzWm1jZG9xcUNXS3BHanhwQVhYUzdjZGYvQU9Ub3diTGp5ZmlsZjhj?=
 =?utf-8?B?NW1YVDRxWFZRa003RlBGOVpwMEJndjdhOTZqNXhKRjRFbGM3Rm9FcXo4eXh6?=
 =?utf-8?B?aDBpUFZmcFZ4cTB6bjVCN250SC9OWEtPS0V3L3NFT1lZQ3oydlZ4ZE5lSkhk?=
 =?utf-8?B?OEVMKzYrNWdxY3M3ZEIzKzQrY1luWnhIMTVjUWloOGpjRnd0QXRHSnFFZWg5?=
 =?utf-8?B?clZRNG0rZEUzUjlpMU9JcjVhcENUY1VMbDlmZTBEbFFuaWM0RHh0SmRac1N3?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d75d0bb-3939-45fb-1a5e-08dcb5184257
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 06:31:38.1511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fWhsA/DAKi1A6qAeo7mZXP66z9Hm+Yoiz1lB+WLlajoUlWREboAk8B5C1WPWzlUTbt429BizV8P2S4ne1JNB4gl0esIeuKe5gOih+C72pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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


On 05-08-2024 11:07, Shekhar Chauhan wrote:
> Update performance tuning according to the hardware spec.
>
> Bspec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Just a small typo in the patch subject, it should be tuning not turning.

With that addressed,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
>   drivers/gpu/drm/xe/xe_tuning.c       | 8 +++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index c50643ab4c84..2c8c4d4218db 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,6 +80,9 @@
>   #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>   #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>   
> +#define STATELESS_COMPRESSION_CTRL		XE_REG(0x4148)
> +#define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
> +
>   #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
>   #define   CG_DIS_CNTLBUS			REG_BIT(6)
>   
> @@ -193,6 +196,7 @@
>   #define GSCPSMI_BASE				XE_REG(0x880c)
>   
>   #define CCCHKNREG1				XE_REG_MCR(0x8828)
> +#define   L3CMPCTRL				REG_BIT(23)
>   #define   ENCOMPPERFFIX				REG_BIT(18)
>   
>   /* Fuse readout registers for GT */
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 3817b7743b0c..faa1bf42e50e 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -39,7 +39,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	},
>   	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> -	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
> +	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
> +			 SET(CCCHKNREG1, L3CMPCTRL))
>   	},
>   	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> @@ -50,6 +51,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>   			     COMPMEMRD256BOVRFETCHEN))
>   	},
> +	{ XE_RTP_NAME("Tuning: Stateless compression control"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
> +				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> +	},
>   	{}
>   };
>   
