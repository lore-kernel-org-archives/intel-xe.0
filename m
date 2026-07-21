Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB4CC44532
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 14:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F0610EA89;
	Tue, 21 Jul 2026 14:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTc9Pqn8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FC510EA2E;
 Tue, 21 Jul 2026 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784644962; x=1816180962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3GB1u51oufvfKTFullKcrqiXlwcK20bbnaF0+xbTnHI=;
 b=NTc9Pqn8WoQn1wDBgqfunPA1VPLQ7/N12OxYsdrBjMQr4DzJkM4bvbBT
 eHbYoXl38oXzFYUi7KVxhnyHfChe1uoHKhlbhRjmZFQ5TasQRAXUn1X1P
 9xbH6LnCvDPfDh2uLP8cOQQejR+6Kg5TOH4BVUjn5/ptA8R4BzX7wK+Wb
 qU3XUCchopXLADSpEkxfoNqIylS4U0FLKpqk3Tc2kKffrU91lIGKvl1BX
 7lX9jGCJDTxMTl68dGZCHBrt1O336bqfYXFRxysNk9zbtyRR7b9/UydHA
 lbALVyDqK6f2l0mmIwjWEKfeZZuKCp3lJpO7tNGhorK45l93JWQsyJ7ID g==;
X-CSE-ConnectionGUID: aMZa2u5jT6yXG8Bdfp+8lA==
X-CSE-MsgGUID: Gtir2HRZSUi6my7d8mF4IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85265438"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85265438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 07:42:41 -0700
X-CSE-ConnectionGUID: SIYw1uiaQZyB8g3HByWiTQ==
X-CSE-MsgGUID: q4WMpbc3SL+dTQA6Me4MmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253869821"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 07:42:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 07:42:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 07:42:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 07:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I10FTvRwBCakPnjmDqBcxYOX4p/G7JrZrRpW27NL2M3xsTnODycVTVkTUel+qthVf9YgAGCQiubsGdWTRxEAvHoAR5F94tcxVbuGetYoDQ5P3fiMFf+Q0z1GX4ynM5FZPeWUMNjAbvHl22AqOZ8x5ZCm1e9Oji+f/qRKZPJeMlYpEASLjBj2lAV3mc8JgMPbQwzEbC15+lwpQ2II4+Qo43GMeZ8BxX6yrMilwxG6diDMOIPLrcdON3TmGB0QlT7msFaecNrlEjb+J+TqGPVU+iZkT+/tfiFBVDCdqwsJubFMeZobt0aM8Kbe8w64E/Mg+BZVnsaC47lmdj1RpHEGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amjDoyoCJG3YHke++Mz+HkVVWcZmmJLol5/yFpLmDxU=;
 b=w+FAOYOvEL9po8DqgWoTiLtt56XiY/Sag1p2gXGfxtnKY+YHs4j02adwdHL9wdW3Rn/tIATrFtPbwUDtZKhUbULItGQpy2ygu9nnhFStFAxBPu0ozEvwjM+11Rb0dqP/9RoPCv6TQJq7jVqScXx2VXQPJRVBiX5DF9tRz4yUsYXQ1nxsEs5Y68jXyIzRypHkYB34BcWNY1w2kqI39j7oVD+Ptx9g0NjtJoEntvC8iUMnC7nauwANowdew/N7p+qpdSofppx1YDnIAtmw2GAqslUkIkGh33j6qkNXn2vluoFKVdBACmaUHIP0vM59O05NcZTjvdASELCFYnBBixBVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH8PR11MB9722.namprd11.prod.outlook.com (2603:10b6:510:3a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:42:35 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:42:35 +0000
Message-ID: <535d50b9-82f7-437d-8eb3-76f7554aa528@intel.com>
Date: Tue, 21 Jul 2026 20:12:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Ensure a non-zero safe window from PTL
 onwards
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>
References: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH8PR11MB9722:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ee0684-c65c-4be3-d7ea-08dee7364dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 2ytOFwisP2zf09Sq/y1j/z9QwQ0w8NxokGrG4Lvy1N7fzh5K6CkUrOkPpLjTZt7NVAXRr7Rc80zxKehbH0wNlPAibAeHNzEUHBo4n03BC/gfknKxuQq/R+6z9p9VEhR8owvvWh9RR+p8yB7QEL/mJF7t1LY5zVj1psN8XNdOdjxyDPm3j7eJiriiCkmd14lyO2oh9SUvqDEKEZy+9rcx1ni+u7Pbw0FJ88LcMG3V5eEkPAjJC19r++oJFN8NTCOsF43DXb+PdkSsVd+yuBWVTW6Se3T8E4Wfw5TOWNBzm1BmKTlZf0gb3P7jEfXkgUg6TzMKi5u+RXJUOCLMtQNOpOZnwgPaYFtDm5Y7bkDvUADttYBaJDpCvLWZ6HA6ezVuTkC2gmHLFddD6xndn248vg73T0wMvTwHzPSjGaQOmWGVmCVzKkjw2KLIKEWd/pVUgwGzvkyTTvvbl2ve7X0gKRWVH2xstKFM1Z6R3/SkMyCAudxLk9CqBezD1bOQ4vI32NeBrmGwX89im5QsW7s1v3XHmNjoHAwikTEx6XpixQf3IqBw1jQrp8aRxfYOhtQx8P2vwXFuR07YVK8L6casPWoeeZHA+nB+HLAzcoiaUIpIBFu+mJoL2nCYzcSxGPDNRqqHqtbrJfk9z5M4qaWEH4uyv8nfL4jW6hgDYZ58ybE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhTMEtzdWl0ZUd1TlVBQm82enNXbUNJRkpNSnlEY1VuZEpMcjI0SXBWZTRl?=
 =?utf-8?B?aVZxOVhDcVN4dE1DRVltTy9TazN0VGlwSUhCQmFLT3JhVDdFUG1iL1c3TmZp?=
 =?utf-8?B?ZWFrQktnOCtMZ3dBUEVRMzhYQ0hPT241d2dya1NmNTFOWEpUbHNjUGpRbzVQ?=
 =?utf-8?B?c0JsbGl4U1IwZUtTeGVXKzRxVnNKQm9aVFBsanc5MWhYNjZXeE5SN0Q3dE9l?=
 =?utf-8?B?MXNMK0Z0Q2Z0OFg5VGlTcHRNdmlDRjRGLzFGdkg4enB6ZFdvOFQ5R2sxcjFi?=
 =?utf-8?B?L0FNQnBCNCtXdnNhTkJNeHhldXpkcmFRMXFUczd2bjRxYXhqT1RZVSs5K1hh?=
 =?utf-8?B?UTZlYVN4STM0RnVBUUg1RTV4WVRXbzN3U3NnM0JiQ2dEZ3lsTnVxcldGMzJy?=
 =?utf-8?B?T3FLNHB4VXBZc3I2aS9pKzNyV1BFTExCWWxGUGRjclh4dVpEVTV0bkxPM0Fs?=
 =?utf-8?B?eDNQNk5FR3BWSUdyVW9wdmhuNXVWeVA4cEl2eThseUVReE1zMkttNlc3VCsy?=
 =?utf-8?B?WEVHaThvbC9nQU1iZldQSXRIVHNDdytmN3Vjdy9hV3JtbktHMEpMMjNPNU9s?=
 =?utf-8?B?cnVzdXA0TXlVdlZSN0pENzVYTExVQUxtYmlLVHRncFRRL3ZiWjNzeW1CYkZ1?=
 =?utf-8?B?WGFxckRnOHZkNmVEZWZrSlZIcHNPaTl3TGN1bG1CM3NPQjEwdUVhN3JqdFE2?=
 =?utf-8?B?SlZybmtBWTNwdURCU1M0OWkvWUZSb2dyM01uWHBBdWVNZ3I2bnZ5bzNIL2tu?=
 =?utf-8?B?RFU2OHp6Z2djRTNWOFNiREtqdzRIbDVZNXA2ZGpGY202Uk1KMlRRQk9ub29y?=
 =?utf-8?B?Q3duWlNvK1N4Z1FqVndSa1RBTVRaK3hCSjh0cElsRHJpYmNCS3lEUVo1ZWRl?=
 =?utf-8?B?VVBJUmRieEhleVd3QkRuazIwTzZIR2JpTDNYYkxQSjMycXZvd2cydXBxdmd4?=
 =?utf-8?B?VTl0NHJyckx1OHYzWm1LWktKdDJXM0tVMkpZZzhoQnk0NjVxRzJ4YW03b1pp?=
 =?utf-8?B?ZlZRRDlRL25xVnFaZE1wUUZab3JSQW5pVHRybTVaSmRlS2NZSE1WMnFUMmYw?=
 =?utf-8?B?U1V2NG5ReGwzc2h0NWtBN0dnMHp2bkJsTDFveWdSRklQVTFRSUZUNEcxRytP?=
 =?utf-8?B?bk5qMkl4LzF0TTVuNGdCUXkzMmo4Z3hwMWoxcDVEdzFUR0MyWUswWTVJbTV2?=
 =?utf-8?B?YlBYbWxZSmRHV0JnbVZwVXUybmY3M04ray9YSnNTUUpHNVNwS3JrelYwNUV5?=
 =?utf-8?B?RTJrS2lTK1M2MHpBenE2REo3VEh1QTcyb3lwdlQxRkw0TDRqQWVCZFE4OHFn?=
 =?utf-8?B?My82OEIzdFJ4K0ZOK0d2cGlTeTNQNVJrQkNNaWcrNmdkN0FncEpGVWFEYjZu?=
 =?utf-8?B?Y2N6a2dJeHRPRDBDZWRHSXhiOUtZT1c0cTRMSmJ5aVQ4Vi9MdFdaR3FIT3kz?=
 =?utf-8?B?d3k1Y25wRUw0UnhhMmpBMXdLdkR1QnRBdW1hNklRck9DNHY4TXBLR0picG9B?=
 =?utf-8?B?Z251NWJVb3R4TDdLM3lyQ2VTWmVHUExoOVJUajlpcWxlTHNpbktEQ3NJOXFI?=
 =?utf-8?B?dGozV3RNQ3g5cDM3S3V3S2tSYklJWndoaDRDbFBNNktOVlpIOWc1aFQraVJX?=
 =?utf-8?B?R01hRGFYRnFLRUlRVUlKQWNFL09Ib2xmYzRMeVdkanZlaFdNSXVtUlRka0sx?=
 =?utf-8?B?RDNkVVpsdHl2WHhQVkJOOU9ZL1FSS05Dam12ZW8vZVEwdy9ZbWd6TnBNcXRT?=
 =?utf-8?B?TFJIQ1ZIVUY3SUd1QUd3THlONEU5MzRjUU9OTHdJUHFsTERkY3MzQlZGVnVT?=
 =?utf-8?B?T3JVbFJWY2dKS0lZR0VOSk4vMVRzWTFXN3Q5dXVBWEF5T0tlcWxvRUQ4OTkx?=
 =?utf-8?B?ZEJrTXlmY2hjTC95U0k1UkJPTitrdmJScjFhVEZrbmtkS1Mwc05QaGRwQ2J3?=
 =?utf-8?B?c3FMVEhQZS9nRmkwUEVmdmx0RFhLY3NrMGJjWkJTWE1tTWs4amhRMThvRmdm?=
 =?utf-8?B?dENnRTkwWUNYM2RFM281aDlwK1c1bUFBaVRuNHB2dDFwaDNhSVU1STV0TzlT?=
 =?utf-8?B?b09ZZzRXMGpGeEVadmFSU0dyUnd3dzBzUHByS0dTYmplTDRmYUNUN1dRL1hq?=
 =?utf-8?B?dHhMYSt2OXozL25CSTFsNjRrVW9KK0NsdjM4a3lERWlEakFMcDd6Y0ZDNVJ6?=
 =?utf-8?B?aWY3NDdjYU0rZkx4NTl4ZEpLOUx0N0Ezc1lnajJXTk9kUkhlZDdtS0ttWmlB?=
 =?utf-8?B?bC96Rm80aGRSeTdodGZxWnp1bFhtWEMxTlNkclRBZlpjRng3UjRjNjdjRm5t?=
 =?utf-8?B?S3phZUVjMk4wYTlyc1NESUc1Y0YxNVZoUjR4YkNRV053ZmYvdXVOV0g2dmxR?=
 =?utf-8?Q?nCxRp1y6kij9gTb8=3D?=
X-Exchange-RoutingPolicyChecked: HfTM4DoD2CYOGw/GU3q9VeNjp8BxruWkZpRVQA7yvtHh7GyUPfvGQ7MnkzuAXbdT3qK+6LkNKsixCDLS90vmUpR8ePVuMNVMLSHwPKA6cJcxKwkWyB8MKuPTK7YDiTGCNhWmmR3o1wauxa9KdLuTojhxlmkoeeDp+5oAYkJFtey40hGy9+tAxmCEedL2e6x9yBRLY5fB3IxP7++f320yDzrb9A9HTB0Um4DSMcitsNC0OF/eWsIoKHqrUMxYaOgpylEhwsCrGSgdyDFCYBVc7r5k2mQdTeAanQ+ibp7yf83VQ1QiKAyIoq/ud0ya6vLUYgvz5hF2xmuEVw7thi2P8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ee0684-c65c-4be3-d7ea-08dee7364dad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:42:35.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjCoRfBfwegL9s6wvf2E8A/B5oyimi1dEpj/h7Tx/xN9EOkJxXpp7yqsUqUqUv+Q5Lp/mh0u0Zvz8pVlPBKJBoW8NNK43qIGx9L/YF6XTq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9722
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



On 7/20/2026 1:48 PM, Ankit Nautiyal wrote:
>  From PTL onwards the DSB waits on the VRR safe window instead of vblank
> (chicken bit 14 selects the safe window signal from the DPT unit to

bit [15:14]

It is not entirely true that Safe window signal was used only from PTL 
onwards. Pre-PTL it was still used but just for VRR.

> start the DMA engine). The safe window starts at (undelayed vblank
> start - set context latency) and ends at the delayed vblank start.
> 
> With modes that have a smaller vblank region, the computed guardband is
> clamped to the vblank length, which makes the undelayed and delayed
> vblank coincide. If the set context latency (SCL) is also 0, the safe
> window collapses to 0. The DSB, configured to wait for the safe window,
> then stalls forever since the hardware never signals it, leading to:
> 
>    *ERROR* [CRTC:159:pipe A] flip_done timed out
>    *ERROR* [CRTC:159:pipe A] DSB 0 timed out waiting for idle
> 
> Clamp the set context latency to a minimum of 1 from PTL onwards so the
> safe window always keeps a non-zero width.
> 

I could not thoroughly check if there are any side effects of this on 
the optimized guardband (and therefore on PSR, LOBF etc.) but the change 
looks safe enough to me.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Fixes: 4a68c7516c57 ("drm/i915/dsb: Use safe window path when VRR TG is used")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Assisted-by: GitHub-Copilot:Claude-Opus-4.8
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 38763a6802c5..0822a2194c7f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2459,6 +2459,19 @@ static int intel_crtc_set_context_latency(struct intel_crtc_state *crtc_state)
>   	set_context_latency = max(set_context_latency,
>   				  intel_psr_min_set_context_latency(crtc_state));
>   
> +	/*
> +	 * From PTL onwards, the set context latency can be in the vactive
> +	 * region, letting the safe window start some lines before the vblank
> +	 * start. With modes that have a smaller vblank region, the computed
> +	 * guardband is clamped to the vblank length, making the undelayed and
> +	 * delayed vblank coincide. If the SCL is also 0, the 'safe window'
> +	 * becomes effectively 0, and the DSB configured to wait for it gets
> +	 * stalled, since the hardware never signals the safe window. Keep the
> +	 * set context latency at a minimum of 1 to avoid this.
> +	 */
> +	if (DISPLAY_VER(display) >= 30)
> +		set_context_latency = max(1, set_context_latency);
> +
>   	return set_context_latency;
>   }
>   

