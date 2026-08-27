Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC20DC61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 09:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A586810EF7D;
	Thu, 27 Aug 2026 09:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGH/aRAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463310EF84;
 Thu, 27 Aug 2026 09:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787824009; x=1819360009;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qyARxxKqBmD7WB0w0Lppf1FtsNDODvg7uBtgvMDZM4U=;
 b=HGH/aRAwBJ1YLpeO/F/pjeeh2LlU63A6AGOFFSyBhWbXYYN3sWlP4vBd
 oHhBeW9vhmun+Wic2AYNPOtGuEYWBKf7DfLSlNGdg8AGY4NMJ0Ljd/cND
 Ow+CVqsqJ1lbDzzgGyCQNcEsi33It9ioiDrai9tw1v4JmVsbOuRZ28g0V
 ILyuT+YC+GKWG3PY5nwj+lhMLGuw/CxpQQc0ewggoCL+B0JL2uimK6lyH
 VP9hpUSJ2SGiZ22Ct95nsDttDb2XUOB44vaLUEDF4LBGE0+HkqqndfvMY
 Ix1de6i/4q8CCgXN8mfy4nOnMRucSJZqQz4w6Uly6rJTBRJ57T+sc1Ed2 w==;
X-CSE-ConnectionGUID: bqCXegA9SZGO60slX9wSOw==
X-CSE-MsgGUID: rnMOZwsIRzakursCLbBhug==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88346629"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88346629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:48 -0700
X-CSE-ConnectionGUID: 4elSn1SGTT+UB11Fz42sTg==
X-CSE-MsgGUID: XKDt3ipjQUGjvOG9QqonVw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 02:46:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpSBVZoqybKNWZQiRFYjoVQWPepSYzpYrUlerIIdm86UJ0gd4gNWOU4114wWhrefGL7iw+VQLZmmPn7YxSaRCRH6ZuoNje/rtgZGf95E5wcD78JZRLgOCBjf2UQuBz1dQQ/vmIXYD8eT5ZrRDRTRibXx465+Im94xIPCqCZ6IPtodMtTNo2U2uE6H+Rfy2ofJhZAXXqcAHsuQayhIXqmDgfzcJ1o6DXl1E4BEG+YiT2ZCbD60ecgqlJfdKrzMVAhCz3x2zbgjBksGpbfi+HmBqqObiy6I/WsZi9pk8DG4yTPTt5WDotD99dCVEn1hJZbFSDCjXCTrU1GuaZggmw4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9O5koBcPybMhDNy2pyZvEV7dV7ZccPLr83S8WZuMno=;
 b=I6DlWWmHd9+UnyJJfXaHL1At4SOjJLsjctGi+BI6pEKjfguJx7ppSpH/2p/spLnis56S7TRVFehQYOdlj6oMpW9AoowN96LpLUlIY+j948Fr33005BFkIeWxs9HQ8yDf5Lj9V1o1i/VYlOVT4cpRdRYF2lZ3t6PLYxNHalhNKfgrrEAi51EEX9fAACyndZp4e17kjc55djRyHzkZIe5m131wDJZwWOu8imOtdmKso9gQKWU847YOvzAauNbvfhI4HOBCXKpWo59CY1HYclXXeavdWB2gdZyBVqnir1dbZQ6qqkRmtB7+vivmeegknLdb3C5WJNlVtrjt8XgV/GHfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 09:46:44 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 09:46:44 +0000
Message-ID: <3a7112a9-d726-4306-bdf8-5b71872ffab8@intel.com>
Date: Thu, 27 Aug 2026 15:16:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/i915/cursor: Schedule cursor unpin per joined pipe
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
 <20260821044755.2234490-6-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260821044755.2234490-6-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0244.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: bde2a502-5129-4d4f-3a87-08df04201a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|56012099006|18002099003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: hmFI/pc2vOKfYoeXexpbxiVDW6n34jHNeXfwjE5zm9LmZfFmyDv6mlBHf/btIxoW9tkvJIMmrPx2ftbURIN9wMEulMKybiN5LoWlHDUIgeZpJ2/bql832LXfx72e5NAaJxi8kDhG9+i48xGX1Y2cUTb1do/rdLRCBC06sFOiPO9QOZ/eF883k8276LqEPSjOcxiZcbty/w7ycrRWcXVVfgtnneBGpBEWM+jiY2qzPBel843+k+0fmYZC7kxnT/XG579sYtXzXfZg6dGw8IZuo2dsF8dVcslIifcf45BxUAnfQMk76CDK8fC00Lr6HkgyPWXf66lw/93gZm15NDLMSmXIKWz0UZNoq1TFDIbxz/65tt+X6N7w2k0AT+PuJLGEm/HlDZkw7uKmKrqN9CX30V6d8tvrAzYWMiJH4Qal0tA4WY6z0Pbru9jgtOqhp+axsmmn+nc54mTfc0QHOl8QUmJOgN/Qlr8a9bRAvMAcHr7EgNUpUAl7WcMS8eOYFt3I1VruGtwnUc4M7sgTotEDF0yEajtzIgJK0jZTikFGpQ191ACViwKMl967FZqSW3LiKGfLi/FEdM3O5Zd+Hi58o1W6+EY54CQjY7jz+VQcmvNfpIEXy2WXrgAOUuYSadlRJQb6u+cYSjpJd+g1G9Fi6NZvpa6NuhOlYZsKJe6VeBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3dEY2s0ZHZSalgwQnlPODl4dkM4cTJuNDZZaHNPMnFuSm81SXFLYlh3ZGxr?=
 =?utf-8?B?QmFVL2JtODRacDc4a3dsYlVaYWVhMmlJTW1GKzhGanNvWnJ6ZlZFTlJwYTFa?=
 =?utf-8?B?Z0RudndPclZLUUNhbFZydnBIQ3Y0S29GVk1VcTZObVY1eEFFZUY0aGdMM0ZR?=
 =?utf-8?B?YkdpUGhEQWZzK0g2S0RwUEFxdEwvc0pmZjRxdlhPdUVVMlRXZWMxV3preW0v?=
 =?utf-8?B?dEo1aXpRSi9BYkJkMDNrN0JvaWttNmFoVWRCOEZFNitMVG9kMFMwQmt0cXRP?=
 =?utf-8?B?RGE1ZDVjSlhOM2VzaWUwckxNQTE1cjhBR2RIWWtjT3hWQzZCMVdjRWsrcEs4?=
 =?utf-8?B?TkRVeUdkQTBsaWNyeFB4bnNQWXFsS1paZGFRbjMxeDRsbkhYZk85UmJGYjdC?=
 =?utf-8?B?Y29nTlhEYW4zQzQxcHUzOXdBUHd5SzVyUGZJdGwrVTdNQjF5b2pIUlV2MmUv?=
 =?utf-8?B?RjNObDA5MkdJUWZKeEtMRWNXYlFjanB5WjRUOWtGeGM5b3QrQTZMTDRPSTZE?=
 =?utf-8?B?MFBGTCtwSzJ3UUhPQkZUcjQrRlhKWVM5dExsWXFuMHRUVzc1Q0MyVk9wd05O?=
 =?utf-8?B?ZDBMNzhibGFyN3ZJQkV1SlVXWXV3UE04V3BsNFR6eXpFNGQvazNYTFM4U0RE?=
 =?utf-8?B?ZE9jZUNtMUlERWo4aFFZYmpsYk03aHdySEpjS0MwMncyeFhEQmtZOXNtb3ND?=
 =?utf-8?B?YlBKMFcrZXlhSFo0SXBCSkw0dVg5YWJ6Z2laOUh0UElWY1RjcVhEQVYxT1RX?=
 =?utf-8?B?N3ptb09Ld01iVk14SmZsVTlEdkhpSVQ4SVFFWC9PeHYwb1NEdnloaWJSUjlP?=
 =?utf-8?B?dFlUYXBVNWJNSjZuckttUDdmckZWRTJEY21UY2kzVWZjQlVJZGFvdWlWcGZm?=
 =?utf-8?B?Vll5Mm9yeEtTdWxqZGJ5ZlYrS2o4UkZpREU0TnNIcjIyU2F3MzcrN1QrOTBK?=
 =?utf-8?B?TUt4RjlCb1R1NzIxWEhrSDRIZmZJNnc1d2QxOVl3cnVHbWF6NUYyUjF6REt1?=
 =?utf-8?B?K0pKeE1tYTJOWHRvVXQ2a0V5NVNXaU5hVGlVMFNyMVBoektQZjdDR2Y3c1N4?=
 =?utf-8?B?NGFjR1JCNUl2bHNXSXNUL0ZvSk9MbU1wSG9GRXhkRnJyelgxM2tTRzNQUWpC?=
 =?utf-8?B?ZlRZenp5clpUckpNVHR2eEpaUjJUMmtmNWZzRndrd1NMRVVyVlc2T2hxeExK?=
 =?utf-8?B?Zmt2ZzByaWwxV0J6U1F1Lzlyb293dWZBek9IOE1PNUNKTllIeVFWUlZZOUdK?=
 =?utf-8?B?NTdxdnNWWWYyTGsza0ZUN1pyWW5PTzB2MWxKQUk2bFhJUlZTZHlJUitDMDZq?=
 =?utf-8?B?azFzeWtCMXROaGNNWmxldWoydVJzL3JUZ3E5VXlGWTBRZmxOSkJnUjFmNjRm?=
 =?utf-8?B?NklWYjhmNkVDZ1ZPRHpuVnp0UStkbzEwNEVXSko1Q29YNmRaSzBRc0d5eVNR?=
 =?utf-8?B?TjF0Z3VxSDl0RW5OeGdkUmp4N0VUanFMTDZSRDhmcmFwOFB2V0R1bTJRNGho?=
 =?utf-8?B?N0hkekJPSFdQa21HM3R0OVNlOXAvV1UrYjQ5anBoak11V2JRU3JPT1VCYk9B?=
 =?utf-8?B?cStzLzNzWjdwOGVlVGxBSHRHak1kNzNhYThpWmFUaVFTUkJWczRHZ0Z1aDh4?=
 =?utf-8?B?QURHRFczQWthWE1ORVNzTjE2SnI4bysrNUE1TERBWno1Y1NFVHBzMUhMQ0FI?=
 =?utf-8?B?YkxhNFg4bElQK1NzWENNaUF4ZjlBWXlPSHZ0b29sRXRuWVUvcTZKdXcybksy?=
 =?utf-8?B?OGc3Mm9uZHRhZHVCb0dwWlVIN0tYK2xZUVRKM0FmYnl2R1NyeUpwMFJzNUxr?=
 =?utf-8?B?Zmsya2pKTWk2SEpQK013cGZUemVHNWlLU2ZIaHNBQ1JLd1VRVWNlZTJ3SDZ4?=
 =?utf-8?B?OTg2SjZoMlVNL1RQMm9nM3BXMUZtekhIaDlQVVc3OFpmV0gxTXZJalpTUDg4?=
 =?utf-8?B?MHNIZk9RSjB1d0huQ3ZtaUdEbjROWVF0KzRhTFdpcmlUaHgxTVVTajRrejBG?=
 =?utf-8?B?UDBjU1p2ZlU5b0xvR095OFdqdlhNc0t1RkViR0JvZXo1UmxLaTJSNnJKalJK?=
 =?utf-8?B?cXBqb1hDcVZQZEZWNEZidUU4MytXT21HRHJqL3prdG5zZXhaMGR3NlcxbGQ3?=
 =?utf-8?B?MVJ6OTVnTkVIdnVOTG9MRHZHY3VyR050R3dtaEF2eU90Y2twc2ZZZG44aTJq?=
 =?utf-8?B?ZGxJaXYyc1dPdzhsRGh6WE5PZ21takpEQWorVU1qMTlpMTZuMXJmc0p6bDRm?=
 =?utf-8?B?VU5aZSs1eFN0QXUwUW9lak5na0ZvVVl2OEk0ai9vYUpQanVFZ3NKNUd5ekdF?=
 =?utf-8?B?ZU5ERWI5TFpITGVuYklqOGphSk1EQm9sYzhyWUgweU1zNUdoWi9uTWFwNEI2?=
 =?utf-8?Q?DG1uwa/8vo8la/8eYpx5zc4ZnqNso/znULo1N?=
X-Exchange-RoutingPolicyChecked: bRiscAEGAVQ3ig8hFS5kSPK/+joADOGGG9mXPQb1IpOW4UNUzn1+Y7ed2UqeDEO9+5JbJemYxXtJHggoOA6xSUmmImOholrjSCXZI4eTuv3oG2enzXxlURBL2kcZ0dVOOqBcNCDVmyJDVmFFJYL1g6lqueM9c7Fl/GpGCFng+jkNCuj4BD87LgY87nd1GF2RWaVUt+meEehEOJY6Cgt7N7UsNmchVF3uNUfDkwjQlQDWOVu47SDjcHqZCv0XLSWVSmRcwJWoufQYjuBpV0MU/4l4aWl832ShCnEny+VntLMMpuGKLN2A3cspezOYmeMMZDm0pIDrfqvdjeJ5cZg+dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bde2a502-5129-4d4f-3a87-08df04201a92
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:46:44.5557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2pFN+fLOxaejXdb6MtoVqCb9oDShgOezIfWzj4EldPU4CWf+K8Nncaz3eV/krXZCGYWg+RQh7hYpWZKER7wYHEzy3Jp0e6FJFeF0j+YJFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
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



On 8/21/2026 10:17 AM, Nemesa Garg wrote:
> Convert the primary-only vblank unpin block into a loop over the
> joined_pipe_state[] array so each pipe's old cursor framebuffer is scheduled for
> unpin (or unpinned inline when unchanged) independently. All unpin
> work is armed on the primary crtc's vblank (&crtc->base), consistent
> with the single primary vblank evasion used above.
> 
> v4: Split from the update_arm loop conversion. [Chaitanya]
> 

If it is possible to do so cleanly, I would prefer to squash this change 
with patch 3 for the sake of completion. Not a blocker though.

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 26 ++++++++++-----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index f5625dabc8f6..dedb6f87359c 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -894,7 +894,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	struct intel_display *display = to_intel_display(plane);
>   	struct intel_plane_state *old_plane_state =
>   		to_intel_plane_state(plane->base.state);
> -	struct intel_plane_state *new_plane_state = NULL;
>   	struct intel_crtc_state *crtc_state =
>   		to_intel_crtc_state(crtc->base.state);
>   	struct intel_vblank_evade_ctx evade;
> @@ -993,7 +992,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   		num_pipes++;
>   	}
>   
> -	new_plane_state = joined_pipe_state[0].new_plane_state;
>   	intel_frontbuffer_flush(to_intel_frontbuffer(joined_pipe_state[0].new_plane_state->hw.fb),
>   				ORIGIN_CURSOR_UPDATE);
>   
> @@ -1078,17 +1076,19 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	 * Schedule or immediately unpin old framebuffers.
>   	 * Protect against concurrent access.
>   	 */
> -	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
> -		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
> -				     intel_cursor_unpin_work);
> -
> -		drm_vblank_work_schedule(&old_plane_state->unpin_work,
> -					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
> -					 false);
> -
> -		joined_pipe_state[0].old_plane_state = NULL;
> -	} else {
> -		intel_plane_unpin_fb(old_plane_state);
> +	for (int i = 0; i < num_pipes; i++) {
> +		struct intel_plane_state *old = joined_pipe_state[i].old_plane_state;
> +
> +		if (old->ggtt_vma != joined_pipe_state[i].new_plane_state->ggtt_vma) {
> +			drm_vblank_work_init(&old->unpin_work, &crtc->base,
> +					     intel_cursor_unpin_work);
> +			drm_vblank_work_schedule(&old->unpin_work,
> +						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
> +						 false);
> +			joined_pipe_state[i].old_plane_state = NULL;
> +		} else {
> +			intel_plane_unpin_fb(old);
> +		}
>   	}
>   
>   out_free:

