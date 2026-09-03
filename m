Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EF0C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 06:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4087410E0A1;
	Thu,  3 Sep 2026 06:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2R0iOIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9DD10E0A1;
 Thu,  3 Sep 2026 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788417681; x=1819953681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jWNM52aGPpclXK7akZgkq9Tba9uOSfQLRJ7x/iikFoo=;
 b=V2R0iOIC36zxOS1LTLn/dqcgN1aVZznNn8fcNg222p97L1gYYAMlVaWT
 w89UlAQIT5HA55zyETp5VQQSEMQ7V75IBnY4GE8a5RNGsBjxTLlV9hUku
 1Uo2C9SkmFg7wxX2UOKOybqYnWg9/Xr/osjooTyemeYh8Aue9IDDV6M4i
 y5HvSM/xijkWBST4AXBpTUzrxQrqFjyD36gEKWu1WXLmVLP+kL7eAzxZw
 EfMonUdzICq5TyBqKYpJPh0vQVD+S/xeDdHXBdVU6s5AsM90nBjtIMqyH
 CVo4iUqzEEBEZQYDUr165lgUFStQvABiDzOfjcWhNki8vpbSeOHBobva/ w==;
X-CSE-ConnectionGUID: V8xeCJ2oSCK21rpNc3FzNQ==
X-CSE-MsgGUID: OkthgB0kRx2jp4IykTNOFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114430501"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="114430501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:37:48 -0700
X-CSE-ConnectionGUID: dtkI6JzuRra26BMEJ1w4iA==
X-CSE-MsgGUID: P3SPNirOSxiH5JTo5zgUeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263452286"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:37:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:37:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:37:47 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwGWGwacb4fGaqmrOJe4NF2QpH9gpYmk5I/Y9CpN0Hk0k506mm6mdyPE2b0C76DeRgOKdWrXnS65gL+rmjA+mCcUrg6umGJiGbywGnZSzchOVoXTkrO8ZX0cswR/mdZtaEqJVzLvPzRbYpuOYiIFI3ZfQ1YLcJfqXKVJmb2/pZWZ/sLppdEU+dN2RXcapDe0BLhl3UO7pJrXDzc9hkxgCo5pvbl3SseiyNDzIuZPVJHXv+Yhn4wIlzKhmEVwD91a+gYadNEtqM6amB+d6qmi24aVgkNBhKwL+68sDxA2tU0AsvXuT3PmUSadxjSm8Lpf0kAmNdvCP1uUkFoUZNE/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfkyXr+kymF2GoWD3ts2dCwC9XYr7Bgj51k01Z5x5kk=;
 b=MpTz8DoreN0umtJqpa0K6e3ctjzgGT+TaK2qhD+pWbwCEd+OLymsDJIZY3kcxJvXWpVVyBV8Bngm79m5QUM4qMpyonf5ZB9n7UTHi2RcZSihkpCQdpMCbpbKaK+1VVEF2lSmAubkcCy/lYPWMxw1TcYs4ULz46QWw6Xsz2IQcbyTFBIqXoseFc0ew1ekwQ4nyVBqorO1F+3RZFjIFcNiK1nMrm39N+MD+66U/7YGjmEYtYrvV3RR/aJNbKw9DsYMa2hCLRebi0eidWM+Cjtfa1k6NpjrKmPj43hhgn+oNq61Bx4UlKJMU1plj/lowzh51kczFrTcANsSTlXIzoZa/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:37:45 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:37:45 +0000
Message-ID: <522550e5-afaf-4014-b1ea-8ae8ff7c07df@intel.com>
Date: Thu, 3 Sep 2026 12:07:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 4/4] drm/i915/display: Gate periodic AS SDP skip frames
 behind a module parameter
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-5-uma.shankar@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260831213421.1804635-5-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: a7100b67-fbf8-408f-2813-08df0985dcc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: u49v6yuNIDu8Dg59YDG90pqne3x/lU5mGzWRZyyMbgDyETNJEPXCl4pOQmIlgdYkSS/8ARqOYcUCDak6HA+Ttl4wlrPHc6TMjw+KK4cKS9a3TN5rCizkZ1m0c9G3pMVniIIpXmI5+7i9JYCH/FHC+sqH5sQqor3PsuTTaWRSlSYxip+14TXL0RrfYiWXNTGY9WzVWrlcgEdvzps/xatMlKLfEea8B7li4FeG8BdOYA0f+rVEq89oZFaRG36CYkpTMU8z34kMZ2QwrOO5bv2OZs95VzGkz3l/ErCa2PQl/8ZhjDU9VjfStJ2+d+fk5aS6vFaYlT4G5C30fL83jrerWwGG83EFeE9W2JiDSd60E5SWrN0rsFqfCUso/NsSd6adTR/Zo0rFxsP/SIasCikJtajbxyyS3IxDOx3qwnyHsooXHGBkFdYTsCESPfZr1fSI1Va1R8gDmZS2IAxAkYgA6kvVTvZLBoeNy84Elud3we9qtIs3CcN0zDMNVx7ZaQIxX16WSCbGOT/kGCf+cIl4wSIGOBCSbMqmzU35n7pjraYBtqQK316i1Oe4/vH2GBTIFuJ7+05ZOMAI8V3xyuaACWdn93uCP4bDy6qpcOl4kjoc6e1Ebl9ICKAqQkMypicr1qkh6R1vb08R0/CyYTlhvlW0lwI/VRvqMVwWm3EjOxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRTTC9EeENoM1c2Z3VpTlVGMGh2SHd3R1J3QmwyMkZKWlNVNjZXWURlN2xt?=
 =?utf-8?B?R0NuczBrdXBjOTdLekRjemdkbFhQYTE2RjVxVHJxKzRVZmxUUVB0OGNkaXgx?=
 =?utf-8?B?LzFkSE9jSXlWM0JudnpsZVJ5Y1hHZFJ3WlVJMVJPN2xvY1RZZlErblp2aTZB?=
 =?utf-8?B?c2ZKaUlyT2pDOHordXgxS3UxY1ErVEhxcUQ3WTYrbnh1MlhtaGtLZVFadHR1?=
 =?utf-8?B?NHQvK1plTUNneWZnT0U2T3ZEVEhqL2V0RjRBM0haeElacmtqbitDWjJETERK?=
 =?utf-8?B?OXc4UVlqbmZ6NUhIWGppTkppQ0pEQ2Exb2pEWnlOR1ZYNHVYcTVFcUg0Rk56?=
 =?utf-8?B?ZG81eHYxM1llMXhDQ0dZQUcybFc2emRNaTB0K0dpRXpQN2twSXFzSU81N1JQ?=
 =?utf-8?B?eENGdFlMMjVRSGZNTjJTM1ZUWnhnOXFmeFdWTlFUY09TWlVnVm54bFpxQ0xp?=
 =?utf-8?B?YXRpSW9zc1ZvNHM5SG9LRjlJREN2czVlTkI4UUxPekRjb29DdEkyemptS2di?=
 =?utf-8?B?VDVaV25RWSsrUU5hMmtxSjZYRGlQaE05Smt4RTR3MC9iM09GU2lBcmYrVGpM?=
 =?utf-8?B?NFFXVzJVYWl3S2kvRFRRZ0VEMS9PbXBOWXo3bWZCUmY5TnpoMm5mdmNmNFkz?=
 =?utf-8?B?R1lsOUJVMk9uU3Y4QWxBM29GTWd6N1FDd3h4dC9BbHJUcG5jWUdYYy9QVlBT?=
 =?utf-8?B?NjF3cXh3ZVA3K05ja0pMVjRMcGlYc0c5VVMrSTRMbUJUZnJDaFdwK01nbVEr?=
 =?utf-8?B?QTFwNWJGNmxiODY4Kzl3QTArZWVNS1N2UjhvNUFYN3kxUHExS2FtS3IxbFd1?=
 =?utf-8?B?NWdJN2N1dDBLM1Q5YmZOd1BEOGpWTEZ0WGdsQk85UVQzRW1KZWRzeTlFSi90?=
 =?utf-8?B?R2FYRVdicWl2eU8yNWw4ejNqQ3c0a2JrQThRNzFzQ2c5SDUyZ05KSzJBUWdk?=
 =?utf-8?B?enhuWmlXQTl2U0I3SWcvb0VOQVVibGcvNEQ4eVAzUlBFdnVQRm4zV0NLelpN?=
 =?utf-8?B?aTg1dXlQMElOSjRRVkJjS3RTNnRNYnBPQUdMa3R5dHFaZzhxVk1xcjN2S1Nv?=
 =?utf-8?B?cUNKbWRoQm81MkhlTGYzTy9CaEZxQ1cwRkp2OG9BSEd4N1ZOMXhPeFVtS08v?=
 =?utf-8?B?U1loR2Z5eVhKZkw5ZmVWc2lQaHFMY3pEaE9sUTczSmE3LzNNRXJ1TC91UWF5?=
 =?utf-8?B?N0pxR2ZoK0htRmhSbkZKVTJ0SFkyeFR1OE9LUzZtbG9XUmFCYmdFWkdZclk3?=
 =?utf-8?B?c0pvMi8ySlp4aGk3UzJjWnJZY1lqdW56ZnRyTlVESlJHVEVmdHV2Q2FBdU0v?=
 =?utf-8?B?cTFXd3lERTFpUGg4MGFES2pBbzNDeXJCQy9DRnVaanFlRFZYRWJSTUphMUZ2?=
 =?utf-8?B?bVlkSWpVQTRXYUpqaDY4RWRmYnBLNXcxcS9sejNCMytwR1ozSHp3bk1senhF?=
 =?utf-8?B?TURha1JUWGRXemVOdmtNWVJQZzhSSnQrcGpxOFQ4OXJMZUs2d05aL0dsRmxE?=
 =?utf-8?B?OEZ4MDd3TTlvSEVWak9zOWhmUXdBS1poTlBadDRBWnlQNTBEeld0TXZ2U1V5?=
 =?utf-8?B?L0gxblNFTnZoQitOOC9zallUYnh1SkJFa1QyWEgzUlRxN0FVbnIxcEQ2ZzNs?=
 =?utf-8?B?N2tyeU1jQkFVcFVKRjBzNmIvVFhWbG45RDh6VE5JTDlJMDdaaVlwU1ZrYStO?=
 =?utf-8?B?ZkVGc1VhMWlhZXJCVXNmUVZQbHlIN2dFUlVIQ2ZGNTAzNWloTGZSekVwSy9L?=
 =?utf-8?B?M3RZdUhORjlYbys4Z3g3Q29UZml3WVh4ejdwd1QrYTJFNDUrdkgyS1hUeVBz?=
 =?utf-8?B?ZTJJRWJwSWJXbFBFbnFGays2d0MzSTkvRzVjaUp3MzBjQ0hBVlIvS3Nody9t?=
 =?utf-8?B?QmxsOGJqNWw5eHRCVEdmVkhlVENaajgza1phd1BiWkhuQzQ1SjJOQ2hHVmdU?=
 =?utf-8?B?amxBbThDWWVIWUpWSDNlU09XWUZJV29ZbU5jSUs0dVBRMVc0WXZBcm85K1Fv?=
 =?utf-8?B?bGdScjN6Y2Q3dFVBSVQ3QTVieU41dHVZaVA1V21hMzBaRUQvOFBxREE4NWRo?=
 =?utf-8?B?aEt2Y2ZWY0Q2K1NBSWZBRVA3TmlaM2dCdnU5bUJXUkY2WHlhdU4xR1A1U0pm?=
 =?utf-8?B?NDlJKzdlZXVBaFQ2NG5lLzFLcVEyejkvMlhhZlBQQzJQT0VFUVEyRHZyVDA3?=
 =?utf-8?B?VW5kRUVvYktUL1VBbzBSY2R0dHYzZGR1WjFOM3FXcGE2ZTkvcE05cmNtbmhi?=
 =?utf-8?B?NkdJdTI2QlEyODQyYkE1KzJ0S2svWmlJM2h6Rk8xOGdDK1lxMW1TTTI5ZE40?=
 =?utf-8?B?eXVYc3JhbVh3OVBHaHBPUmt1S2ZwUU1NTVczL3B0Z01vbDJTdVVua1RQVTBP?=
 =?utf-8?Q?utEirWb97JcmBG5M=3D?=
X-Exchange-RoutingPolicyChecked: UkJcgCTXhv5/UcWpHg/9z2XaW/MOfXfmQggKPbWtWiyWlOrgqZmXmi8bp83JagG9aLmbJicU4hnLvZvl4lMsBYhBLNFTuC24kMMZg9PhbXlxZfjLOVc688GHWqP8wKp9GFIpnS+Ul2kJTEAftFXn3X9MIEsn3mPVbkkRQGkU8JKuR5Ep4UWtZq69nfsjlJ2tVDYzRKSDD3WcmalJWE0LdIMgcsngu1EN9ggy70818QlaClbGlB+pWS4SgXDpxac+yMhH5Pe5U1zgmuus+UtL5SyxWYo5oRItmKkmfV38ENYQ+HIY88ekeWUohQLeHeBhG4ZUaYYNL2PihxyuAAvCmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7100b67-fbf8-408f-2813-08df0985dcc9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:37:45.0416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ya+DL7tzjyODDzQs0ZxjV13z73jsmLdlZlwdayisNz6b3V4gQfzdoGXFvc2FSLCG+Pl73q7lOw+pZ7DAFM//PJts7hZEeA0B2+WLufGU7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
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

Hi Uma,

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> Periodic AS SDP (skip frames) drives a Panel Replay panel down toward its
> minimum refresh rate. It is a new, panel- and platform-sensitive behaviour,
> so keep it opt-in rather than enabling it unconditionally.
>
> Add a display module parameter, periodic_assdp_enable, shared by both the
> i915 and xe drivers via the intel_display_params infrastructure. It defaults
> to false (feature disabled); set it to true to enable periodic AS SDP.
>
> Gate the feature at its single choke point, intel_pr_as_sdp_skip_frames():
> returning a zero skip count when the parameter is off makes both the
> PR_ALPM_CTL programming (intel_alpm_configure_pr_as_sdp()) and the DC3co
> force-disable predicate (intel_alpm_pr_as_sdp_skip_frames_enabled()) a no-op,
> so AS SDP continues to be sent on every frame as before.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c           | 5 +++++
>   drivers/gpu/drm/i915/display/intel_display_params.c | 6 ++++++
>   drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>   3 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index c784e77f610b..537cad13f0b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -392,11 +392,16 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
>    */
>   static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
>   {
> +	struct intel_display *display = to_intel_display(intel_dp);
>   	const struct drm_display_info *info =
>   		&intel_dp->attached_connector->base.display_info;
>   	int max_vrefresh = info->monitor_range.max_vfreq;
>   	int min_vrefresh = info->monitor_range.min_vfreq;
>   
> +	/* Off by default; gated by the periodic_assdp_enable module parameter. */
> +	if (!display->params.periodic_assdp_enable)
> +		return 0;
> +
>   	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b09..a845d29610cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -139,6 +139,12 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
>   	"(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
>   	"Default: -1");
>   
> +intel_display_param_named_unsafe(periodic_assdp_enable, bool, 0600,
> +	"Enable periodic Adaptive-Sync SDP (AS SDP skip frames) for Panel Replay "
> +	"to drive the panel down to its minimum refresh rate "
> +	"(0=disabled, 1=enabled) "
> +	"Default: 0");
> +
>   __maybe_unused
>   static void _param_print_bool(struct drm_printer *p, const char *driver_name,
>   			      const char *name, bool val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index b95ecf728daa..4d912aab4811 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -50,6 +50,7 @@ struct drm_printer;
>   	param(bool, psr_safest_params, false, 0400) \
>   	param(bool, enable_psr2_sel_fetch, true, 0400) \
>   	param(int, enable_dmc_wl, -1, 0400) \
> +	param(bool, periodic_assdp_enable, false, 0600) \
>   
>   #define MEMBER(T, member, ...) T member;
>   struct intel_display_params {
Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
