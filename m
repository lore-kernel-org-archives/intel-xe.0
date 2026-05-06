Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2DCD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 16:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DC010E554;
	Wed,  6 May 2026 16:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUDfRDJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B967B10E554
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778083457; x=1809619457;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KRBOp/1hbkw6JaYJtqXZxF3CN79cynOZ59+wPzq4CYY=;
 b=PUDfRDJnMNMFZW795xN7UVQpovzB6YCaaga8ecW1qZxZivCQrf3dPb+T
 GzGCsfIO5zz/p9Qo+R3vZ4Kh0nUuovs5l+zg7FUvuy5AXdNewjWNVz9zj
 ryEnJikjHialIxzcJ7BH8bErYMtcEBtq89MrFm8h3wOPgRi3TbAG9ss2M
 NV2y5K0ngZaDQsNSHaAZ5GElij+JBzKSGbYP5iMTVYjCVMBzo6v7C71Mx
 hKkPYo4B8VLj6cqR2ZIZDcYtaMPiYy/92sFVpcq6OkSPrUlCEmP2314Dj
 n3sxMKppruF9Rix7oLK8OngO7NLx+eScUL0vM967VjMV9hdqWuBLkPJ25 w==;
X-CSE-ConnectionGUID: SNKOhu7HTvW36qHSYLK4iQ==
X-CSE-MsgGUID: rvJFwdWQQE+QxJikzYY5OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82891113"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82891113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 09:04:17 -0700
X-CSE-ConnectionGUID: ZnGtutBATBGITrINdsSoFA==
X-CSE-MsgGUID: tH0iSmwOSZOpK27QgdSeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="233083033"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 09:04:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 09:04:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 09:04:15 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 09:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0rLcfoZOxRjLpTiD3vV8kAGKozTeSZ9dey+8ykjXn6Y0ea+4UUMsOKU+X6eiNKnzvAWmzPK5VvhN6FegPYeKZMvq94pEiwjcrbqzrEHBTjTaIngBT+GInTAH5hOjYF17RnJb4jQuT3MiSBkkAaaRrokJWJK32cNKf0Yyhc5BCrJNMF7EH7xbLsiLSYWPsxw0aaMx2E0hETsJIroqzqbUQrMgHlZSGEExaZSSRQFnUqxkfZOc8nUz89GFEIrYmjTci1TsZTMJXED92X+azUQLOjW1Q5sUB9zL+eo0g45qapxUlNsuOtLAb56WPiBCfA6n8LVfVK1ZE4s8QxCjdILPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt1Mhb+iuqbUL4gqeXEXkgdUOg6lzNS2VpqcI2mXk1U=;
 b=KzYQYmPGSUadghp/uQ7xiX68lfbOqn4CQJnPbCpctdam52trCuOumIhRY/UKH/B3QPfqqZ9+pd3pJ/e6ERxY2fCxR/ALHgYwAPtCBX6hsfY/sVK+Kjy0bU7te96kKJOWSFowaSTH2uwQzEhFDHVrBsI61GjDEk7k/vphFa8uA3J5ip5I4k5p8zUa7aLbW849CuHk7158j4cWFPvcaKge2gTrBBtczqr5zgVC1nnbwnH0UogQWfB8hzMz8PedtEgYEqZjV6QZvt2K1MPU57KCKVtjPjrM4Y8aroxcjYlgR9QyW6X3qkh3YsPAbAPUnclqPZCGADy7rsM3oiygrqeXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by DS7PR11MB6149.namprd11.prod.outlook.com (2603:10b6:8:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 16:04:08 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:04:08 +0000
Message-ID: <e9b9b4da-9604-488b-89fa-8e69e8e4c432@intel.com>
Date: Wed, 6 May 2026 18:04:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] drm/xe: Engine class and instance into a u8
To: <intel-xe@lists.freedesktop.org>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-7-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::27) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|DS7PR11MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f3c5ff-4618-4577-8f70-08deab891ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NlIlLCxeSX6QLvimCtmRRSoqX08mKROtXfAfQ0Xy2fu4Ns6DZxtDbJj76YjV2Riev/2lN+izBzwBLNXa+mYZrkf13ao9+L4kTPb25vhCTKA0cOhiM+f5mf2u90Yn7+INdk27z/YaMSOtur6hJALwY29Y4+VAgvLT9YS5c9WBzN8ssn6brkCMb9GmM136Yb25IPq0VvZup/Abb0QrvH4O6Wi9a1gGDD8WT1BB0+woTW36zaH3fepyg+hkRtkbdi0OY7P3nO/mDyKsUsenf7NogfETCHzpcavgp6L6/sZQ9VOiPzmQbIiwEii91wV9N/Fs24SGxScE7/dASyNQjkgUGYwZ2jeB8tb4MocXiAMHUqOg3rCCOxMeRC+cech44aKeihv8kOiMqa4hYRPdlud+LAnKMHVA+pR4F5MbNe8GH33KhyUrf+p7rraHysDu7pcXczaB9IhJ1HAXewoF8XAkBQk9EEMGb2YvJg/p/SxNWZeM+pxYHiPXAL5pF1PG3xlwonpU+6VtBw28wvtGMNcvOQslBbyFNfPXU8zFoHPa/A0fprM+Z7ZEv9DC4U2e+dAF3U3nVf/A5PpzSYHCx664zTx+cD68JM8nF0QgPVO+5x9kOui0ORi63IlnaDy7JtJjVFFyyJA7aBiw7D/mlztSb7Kzn+Tc7gIcU4JA0Jx3sK4VQf2hDPsz3j9eUWwBORec
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0tBdXI0YVdUdzFxRkcxRmtpRkZzeEZweXNZYnFJN1J4dEoreWtIZjM4Z0xl?=
 =?utf-8?B?Ulg4OXZVT1FCaVNMSW1NV2hPSmV6T0hubDIyRzdGcit5WUNDNHE1QlNmcGRN?=
 =?utf-8?B?SlVFL1o0ZXN3YmpGcFFXaXR4YmZUM1lIUERhcDJEczRVZ2JOblZJcmQ1cnNp?=
 =?utf-8?B?SEx4SGpDUzQxTFQxd2Q4RVJEWm9RalI1Z05ORjNId1RrOEI3aGdzTVhRaUVB?=
 =?utf-8?B?Wk5vaEFLSktoQ2M0em9Kc200cjJjQUFzMVpPOHNhclN0WWU3ZGdYaTNLcjhW?=
 =?utf-8?B?elF4WTdLRjdHTjA1RkY4V1RZdmgvQkg4NXh6QlhGckRuTEFlMXpweGRvTlIw?=
 =?utf-8?B?TWwxdXpCNzVEajBiOEV1Wit3N3NSMHJRTFRPcG1WVTQ5SjU3SzU0MlF3eGFl?=
 =?utf-8?B?d1ZMajFsZWMwODE3LzV5SDg1N0h4MnJhQmRVY0oxUm9NYThTbnU2ZmxEUmF4?=
 =?utf-8?B?TDNwa1NzTDdIRFN2T2RsQzlva1VIbnhUREszemg4bXFZOTRVRG9vUElNN0hj?=
 =?utf-8?B?OGk0em8rZVhONDNIMDJ5YkZtbHNHZE9DZWhzRnJTSSs0QzYyWU9DaGo5dVlp?=
 =?utf-8?B?aE4rMDFCcitFalZFYmhDYWlWdWxLVnB3SVFVc1IrVkQ4OXZXWXpwYWNUNVha?=
 =?utf-8?B?cjNCTDZsREo5TjhyQlJGKzVKOEVMUXB0c2VRbnZUVXk2S2t0WWpLVThlVTUx?=
 =?utf-8?B?TjN6UlkxeTV3aDhyL0Z0eDJsaG5rWEoyTEVRUm5PNm4rZ292NHZBaXoydGdE?=
 =?utf-8?B?ZHErTlphY0V2U3loSUhBbFBZdk1QWVpyWDJmNnZCbXFGWi81K1oxSU5sTndL?=
 =?utf-8?B?UGhhNFlFVDNPTkZhUy9qL283U3lEV0xQdjlUbnpaQk5vVGh1bjRrUzFFNStL?=
 =?utf-8?B?UlgweFJTQUpZOWw2dFpUY1Ryd2UvRDhSN1E4bVN0N1lxV3RZVkFtL2Exd1Zo?=
 =?utf-8?B?OExtVWVTOS85R3g2WXN5VTdFaTE5V2JiSTVmM244dmphcWc2bjFoejBMUGdX?=
 =?utf-8?B?R0NBL3owZ1E2bTZjaUFQR1J4N3N4NytOa3lTSjFVZk1JUUx0ZHhGcjFVRHp4?=
 =?utf-8?B?bUhHVE1BUEgrdktXTXBNakwxWmp2ZDk5aDdzbnc3QkJCMm1JUHpWdFFSZXda?=
 =?utf-8?B?YWdRZlBLeklpK25ic3E1dWhhNlFqeG9ESk5GSzhMcTJFTDZMTjl0c1IwK1lJ?=
 =?utf-8?B?L2djUlJDU0paN3R6MVMvdUlTeU1DNks5V1V4bzk4aHduZnV2K24xeFFxeEhN?=
 =?utf-8?B?MEJzd1RodXlvcW9GSTNTYk13QVdCOTdLUUpQWVp0UzZUNm0vNVZPYkkxQS9E?=
 =?utf-8?B?amw0cUMyRkhkUmJoU1lsL1Zub0RodUZKNXg2cHN6TzdibFpSZTJQNGRhaDVr?=
 =?utf-8?B?VDE5VTFHTmt5NW5vVDA4TXBPbXBod1lHa2R4ZlNseGYyRk9wVVJiWkRqMkZM?=
 =?utf-8?B?NEJwR096TUVPRDlxTDVNWVlRdWFRQlR6bDZhMWtPK216d2Z3UGNlSVNyVDhG?=
 =?utf-8?B?Mmg1Tk9oeXN0VHNOaDZIdElNUjI1a1I0OUFsWTRtR3dPMlJpOUtQUUpBa0o4?=
 =?utf-8?B?QW81QkQ1ZkUrZnVKeEZ3d29FYndHS0pQVzFlMUlnUEJKeG1VRXVRbEFpQVo0?=
 =?utf-8?B?Q0JQZE1PNzNmVEp5NHJWaFVRdi9GMGxHZXhGbzk2bmtLS2ZCeTBQbktaRnlW?=
 =?utf-8?B?SFRRNGF5OUw0WFhSWDZ2Umw5OE9wYUlhYy9aVitHd1NCM0N4MWg2ZE5zWk9p?=
 =?utf-8?B?SENQeFI4MVJtd1N2MytLeXJrVEY1TSs1QnZJRkhxU0svV0FhNlRvNlpNbU8r?=
 =?utf-8?B?aE9ZdFJCUkp6ZFVQdmRieCtMaVFHQ0hzdXZ3Y1hKQ1QzUlF0SWp5dEMvRjht?=
 =?utf-8?B?ZHZFYUpDR2Z3NnlROXVNbXFuVDM1bWw2MW5MQk1OYzJLaThvNHpKeFNnZDdM?=
 =?utf-8?B?a01La2JCOUtwMndscjhGRlUrZGY4Q21mQjdhRURGOERhZXY4c3JHYk5WNHpH?=
 =?utf-8?B?RlpIM2FhdUFjekpEWW9NV2dieFdRZjhCNHdqYUFNL0pDbzNCc2tYMkd0Mjh6?=
 =?utf-8?B?Q1g3WGxudlcxa0tYeTBhZEhkdWhoZmI0K2pPLzBLZDlzeW4rcDZiYWwwdW1r?=
 =?utf-8?B?TzA4SUsrMmphM1pZdHFnVzIvOEFoYTZmcjhGOGUzTEV5eGZDV0llcUozdzds?=
 =?utf-8?B?QmVzQ3FDZFUyUWZaOTFSc3E5RHZBbTVRaklBREM5WUNiclUvQ2lWR2NWa24r?=
 =?utf-8?B?ZVNhWlpIT1R4bEVUR3lab3FMbXRaZndGcHJBS0lnMmtkZW5Vck0zdjJZaWZD?=
 =?utf-8?B?QkdVTUxtdEFXWnRURnQ3cW9jRTA0WUNNNC9yREhjWnRCalNFbGVSblZIWTZq?=
 =?utf-8?Q?hAuO1inh+VHpsD38=3D?=
X-Exchange-RoutingPolicyChecked: MOMGYJ3KN0RT6izO3UO9aqIKT1oDX4pNmW+/5Shk1iku7QtJGTCSunmQaPYwarML714J0W5ax503WsS5WVBrMlgRbS18gfDr8UDDGkdbl4c3PeFnN2H6XQ6JUtwN4no345yGezYXR+9F75sC4i6FX4nJCS0vAP1FpMwtKbukWhn9qbP48R9yPhu1Zy1jTI43PhTwgxdjn1SxjA0EcZUng2ZoDTwnvHiJDNYNSK0NMw2emXhFViSqe/ASJUUJ5/PgfJpDp4untf6ecOdo73cTsoC/HTplgQw+uy5llyiVXqtwiBIfe2BD+mNApuziCY9IxdR09Sv62M4scvIQCGHkVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f3c5ff-4618-4577-8f70-08deab891ad3
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 16:04:08.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEf6gLr9vYoR4MpXubnqiByUhjfDSbZrD7qe15T3+FsE9+3H2feFeXRW+6ZbAEl7ZpfJLPCvyUM0po3hw6Co9ZN3C934MXPO/zkbA1+6pYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6149
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

On 26/02/2026 05:28, Matthew Brost wrote:

> Pack the engine class and instance fields into a single u8 to save space
> in struct xe_pagefault. This also makes future extensions easier.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  7 +++++--
>   drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++----
>   drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++----
>   3 files changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 607e32392f46..2470faf3d5d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -89,8 +89,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   				   FIELD_GET(PFD_FAULT_LEVEL, msg[0])) |
>   			FIELD_PREP(XE_PAGEFAULT_TYPE_MASK,
>   				   FIELD_GET(PFD_FAULT_TYPE, msg[2]));
> -	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
> -	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
> +	pf.consumer.engine_class_instance =
> +		FIELD_PREP(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> +			   FIELD_GET(PFD_ENG_CLASS, msg[0])) |
> +		FIELD_PREP(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> +			   FIELD_GET(PFD_ENG_INSTANCE, msg[0]));
>   
>   	pf.producer.private = guc;
>   	pf.producer.ops = &guc_pagefault_ops;
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 64b1dc574ab7..a6fa790774c5 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -245,13 +245,16 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>   
>   static void xe_pagefault_print(struct xe_pagefault *pf)
>   {
> +	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
> +				    pf->consumer.engine_class_instance);
> +
>   	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>   		   "\tFaulted Address: 0x%08x%08x\n"
>   		   "\tFaultType: %lu\n"
>   		   "\tAccessType: %lu\n"
>   		   "\tFaultLevel: %lu\n"
>   		   "\tEngineClass: %d %s\n"
> -		   "\tEngineInstance: %d\n",
> +		   "\tEngineInstance: %lu\n",
>   		   pf->consumer.asid,
>   		   upper_32_bits(pf->consumer.page_addr),
>   		   lower_32_bits(pf->consumer.page_addr),
> @@ -261,9 +264,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>   			     pf->consumer.access_type),
>   		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
>   			     pf->consumer.fault_type_level),
> -		   pf->consumer.engine_class,
> -		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
> -		   pf->consumer.engine_instance);
> +		   engine_class,
> +		   xe_hw_engine_class_to_str(engine_class),
> +		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> +			     pf->consumer.engine_class_instance));
>   }
>   
>   static void xe_pagefault_queue_work(struct work_struct *w)
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 45065c25c25f..75bc53205601 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -82,10 +82,12 @@ struct xe_pagefault {
>   #define XE_PAGEFAULT_TYPE_LEVEL_NACK		0xff	/* Producer indicates nack fault */
>   #define XE_PAGEFAULT_LEVEL_MASK			GENMASK(3, 0)
>   #define XE_PAGEFAULT_TYPE_MASK			GENMASK(7, 4)
> -		/** @consumer.engine_class: engine class */
> -		u8 engine_class;
> -		/** @consumer.engine_instance: engine instance */
> -		u8 engine_instance;
> +		/** @consumer.engine_class_instance: engine class and instance */
> +		u8 engine_class_instance;
> +#define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
> +#define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
> +		/** @pad: alignment padding */
> +		u8 pad;
>   		/** consumer.reserved: reserved bits for future expansion */
>   		u64 reserved;
>   	} consumer;

Looks good,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

