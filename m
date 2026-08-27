Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93783C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 09:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4855310EF80;
	Thu, 27 Aug 2026 09:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHBDQ+hz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A864610EF63;
 Thu, 27 Aug 2026 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787823953; x=1819359953;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n62vqgQFtzTqSTX1GuptXUeL0rqNPecOCA4S0LMbj+I=;
 b=dHBDQ+hzgxpmxrRKJjzPf1YyYE0sEG6xj83dJ5amUDHP1iBPGqMM3VLe
 PFbPV6kHZnrkw1uSscnHM5gRlVtRz9cvX8S9ipkwO8MpRWwuL5Ujl4fhs
 01MlfiIeX8sHewG1/hxo/fHtLQENwxlj0pZY8dBDfWLUe3GpXs0fHuuf7
 Xhstq9J394C1RbdL6IPeBijVOjANaJ19E6OiZluzGFdjDec3m7BW5FS3V
 0RwH9XRzuMLp1Kl/Blz2L3MEwFyNjD10ZU5TU+7XwGSEp7idGdb3qTPE7
 WVwVVxn1iDSDFU5r64Jm3D9hO5jJOeCE9UgTEKM4unfKK3Myt/YO4Pb6w A==;
X-CSE-ConnectionGUID: FGI73iZZTNuH/ZMTeRkXbQ==
X-CSE-MsgGUID: RZGDUR0bQW6yN3q1Z68q9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92179278"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92179278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:45:52 -0700
X-CSE-ConnectionGUID: l20M5bgWT1+QToIlbxYarw==
X-CSE-MsgGUID: IYfPfByiSRq0X9604GaRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264054620"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:45:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:45:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 02:45:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9VRcJ7Ha3hl6mId0Yu3TjUYw5phHcgoYa6x9xZrYibYcNgIqm7NXqZxk/jbT187pZWOuocfDaUHSdVExPS5/o9aZFFbAIpsuTLJV1b+JDc1GL2Mw2b/6cM5HWg0+oY4mC+8AhgMCpUiR6UG5jZEUcXJuK4Dbi90cgWKEqVvYM49JEeBbLsEkJfejPJ2VN8SpdZuk8Uex6aQZduMgqBdd2DV7AuyoLKWRxHhHRxTfrs50SrnsqYerVvUg9Ozg7fcVMHKBNUXye2S4obenOp8muXYo4NpxtOsnW98Qf9CFd5eFollnpyVRae9OU3Q7SeU55Mo9t/BuuOqegm2rAUcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0TVZCwnt7sSGNcSfk2iBlK+VFREU7hMZpRAuuqAs64=;
 b=etzCo1ERF4fo/eVX3jJ3b0c3/bdTaVPW0qkkcz0oXRF31BK8QBp0OTy5TSBl7rWVGOfacMRiwuHOmH1G6Ci7sUCtkS4PUQsoS2l6/6hihlAYqOqCFCJ6N3JSQnjj8WFkt2fWe7TOJoEeJOIj7A4sumf3MZe+d581cKV0Jhazd6fmvUc0z5srajitQMBevMWJdcsFmH5S8mjn5drxh10jqv2d6OiJOICANXVzZk5yD9tuHRpFHljt2Z5WbXA39Pj05BiTcfWDmh9hp4pM9UU6G8rZuo/vq38wLADDX01LQtVeUSsTdvraed8aAE+dSCz3fK7BO4hzbax5HT12pvQ60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 09:45:49 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 09:45:49 +0000
Message-ID: <c0fcd686-3f10-4919-8bf3-3eb320d8669e@intel.com>
Date: Thu, 27 Aug 2026 15:15:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/i915/cursor: Add helper to update cursor plane
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
 <20260821044755.2234490-3-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260821044755.2234490-3-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c6ac03-78f0-4f80-4996-08df041ffa09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|56012099006|18002099003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: j5liVl4jfadV0p+Ou3RXXqWb0+thFTS9LAPZ8H2JYsqdqCQDJFK1cjuiquv5pXJZKKIT9gVV8ptfs8WWx/mXlBwihLRKf0qda5Yr1iB6e9VaLAz3Q1xrnTqO8m8ffzWebpM5pIcj9iYM4+wzuJVuHKgiObmZIFZUXkErWt1WcEJqUeFmv2qX67JwIHJjcO8JQWA3tAlaALa2XuZGX0oh+DR/b/dBh+FZLjR1JJcUPmY1p2doa8fTSFfYK6tGBpdg/kVjK2uOBZAwFJRjWXMo4mGKk1zY6MIEyVZ8aqsP32fGBijXB3SDLu6amOCRktRtfyqx+5Fyiz8nAkQcsME7JKl9AMzkJC8dMRKd3hrzzBuEbrYMtSdQf0P0QywX6v65PPqOGd1R9It4kvSda70TatjrqEMfYI/ZcDPz2c8qFYqWtTQlzkme4FLxsvKRdh1jhGospQupYFkdOHmwC9/pN7OTCghCwy6HjldGrAqah9sndqZC5KmWPSKfNYRBz5W1Il512J99qCJ+CCZQoWCkcZmoNMBHu9zcq89ytfB+yT0xH6P9UHBIP47jewVnGteA4FNjTWf96HXKtrxw6vJpYD3cpd1NjUh2v4XIHf4m/igncZ8smqQxpZwPkJNa/pASHMj8zluDBu4QH9hJhmFQSVq23Vbm4m9kQJYd9CSgaiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bks4bGlIaVpEanluYWVzZDYySVkvRHYyWG05dXBZWHFFM0ZXRzIreHpGSHg2?=
 =?utf-8?B?UHdWSXdIY2RIekFnR3NkcHlmZ3RUUi9pdi8zaDd1eDRIakdnNHU1alZYWWVI?=
 =?utf-8?B?Vjkwb2pKRkVReFR6TWxESDdnMHNhd1VYTExQR3UxT0VoMkNOYlIrZzNWZ2Rl?=
 =?utf-8?B?K1RxNmZuZzZaanlIUGZEOU44NVhGOVJSVXRJK3dHSzJaaW9sQ3RkR3B0TCtt?=
 =?utf-8?B?QVV0R0hWZ2JuNlNvWHI5SGw1VzJOamxjYVJadFV3bXJkVXhvVXJ2U1d2U2p1?=
 =?utf-8?B?aUZGd25paG1Qa1BNUXpkOHdqQzQrc3BzZURrb2tYZ0ZZSTExbFVOTWRmMkNZ?=
 =?utf-8?B?cXliRmI3ZnJ6TU1xUDJTVTFzU3J6Y25WdTg5TGRxTmxPTDVTRUNGTTBOREsz?=
 =?utf-8?B?TFUrMWYrL1lGQnZScWdIcENaenJTY282M21xSDgxbzM0NUFMWWdNQk44OGU3?=
 =?utf-8?B?QmpvbmU0aWI1QU85clJ2aTdQRTE2NU5wNEZNTU84dno1VUN3V1grSzdreUZY?=
 =?utf-8?B?Z0dUcUZudmNVanduWi95UWw2OHJlQmVFS0JJWUdaRUVDdlRVSFkwRFlQRHA4?=
 =?utf-8?B?YkkrUkRySnUrUHVZMGZKZ3djb1FpcVdieEl1OC8rRUVvZjJmRUpBUlc4SUJa?=
 =?utf-8?B?ZE93T3ZmZ3QxbHFWWHlEaGg0T2hMcUc3SHk4UGpObXNTT0pLN0R0WmJxaXFo?=
 =?utf-8?B?VE1jL1RKSTRwSGVXeGgra215b1lHVHZSWkhmMFZHM3pTaVRnbEU2QVplVzkv?=
 =?utf-8?B?UnpoRWU1byt5TEtaUUxYazVEeEF2WG95cWNOd2FKWEcranhlQmdRWTRlRFQ3?=
 =?utf-8?B?VDhleEx6SWJQRlJEOVhFZmlPckZLUmZvQ1BJa0xyYWdQa3F2OGlZSHlVdTA4?=
 =?utf-8?B?WlFhVEQrVVBYWjAyT2lMSlBSZ25YVnZvSlExR2toSTJ4djZOOXJ3a3dJZ3ps?=
 =?utf-8?B?VjdXd2w3NndEaWJzVFpvTUhXcDRXa2ZtUnRjVEdIZ3ZmamYySCt3VDZ0M21a?=
 =?utf-8?B?MUhiUk1GR0haYVphRGZuUlFXTVZXWVRDd3dXOXJnU3lUZUVsU1RHZGFybmh6?=
 =?utf-8?B?bGcxdW5mOVQ2Ym9HcGp4aDZFTkYvQWY4RkNRWDU0N3BUS1pFNlBaaDFTSTdq?=
 =?utf-8?B?dnMzcUhGdXpmTDYvdkdWeTE2ek9vSkc2UDRkaE9kQ1Z0Q2hKRytmM0d0ZFZx?=
 =?utf-8?B?c3RLS0h2TkpzUjduMngzRFdyS3c0RXFmWnZFN1JFaFUxZkN4SkxTY29rZ2Iy?=
 =?utf-8?B?MHUzbStiRGZGQksxeUZWS1hBRGs4Ym9sOGtJakxuU3ZOMFozcUhBUi91a3JN?=
 =?utf-8?B?NXNYeS9lZGluRU5YZUlQbEhvMForZ3JXODdYc2xyRExQVWNCR1E4QVdkVDJt?=
 =?utf-8?B?bnlRUmhLZUUwbzdNWFY4MnpOSjhlSFlnckROOW5rbEc4aklsb2pLR3ZxdW1r?=
 =?utf-8?B?VktGVHJOOWIySUFubmxuYXdsT3dzYU1GRE9haEFMOXRieVZhWW5wbXovZDND?=
 =?utf-8?B?RlYwNVY0R3F6TzAxV01aUzdDN1pDa1lLaFhqUGN2RXVudjRYc2R3V1Z6YWc2?=
 =?utf-8?B?aXp2VXNpN1A0aXFTdUJGMFFQUm1IenBtRnNIbnFBbXBkdW5CS3lVYVRlNjhr?=
 =?utf-8?B?MzZ6a1BFYktUdElwdlJUaG1hdmlFVi9ZNG5ES0ltczYzYU44bE9RL1hzYlFa?=
 =?utf-8?B?V05RRlpVMXNSdG5mM1lnOHU5cHUrdlp0NHdTd1V0SUdHdktuWTRZWFRFY3dI?=
 =?utf-8?B?cXFUVjJZL0l3YzhSYzhmdm1Hd2Jna2kxU3IzejJzM3Y5RFNmcHZreWZNVWJU?=
 =?utf-8?B?YlY0SW5jaHR6dnZnWDVEM0xpYkJ4TnIvOUk1QzVsRnp1R2dLQ0RLY0FuNUVk?=
 =?utf-8?B?ZDNYbkpvMXVOYjRZWkYzOWxRaHFjQ3NMb1dSUVQ4ak03dEJkRFM0cGovemR5?=
 =?utf-8?B?YXNQcDN3MGtvVm8xRXVpL0k4Qk1ZUGRMQ3BGUnFuVmFRRUR3R1llMEl1MWFV?=
 =?utf-8?B?dTYyS0dZbGcyRi9vZXhYbXBvb1VBcTVuaWVyaWxNUXpXMitpbDJtRUE1a0Rv?=
 =?utf-8?B?U0dGMFVXT3dwdE5uTWRvemlPWUtDQ3d5OHlxMWdlSUMrVmVQS1RHQzZqaEx6?=
 =?utf-8?B?WTZXTTVWalcwaXhHbDdQQzJ3YUxXTXhmdytPUENTYlI2UXhVWmY3LzVGamln?=
 =?utf-8?B?VXEyUmhhSTNhUFBUMFA1TU1US3V0TlllTDl4NDA4L09CWUhFYU1SSTYrbmRa?=
 =?utf-8?B?VlNVUHV1UGQwSVY0Q2haQXZZUXM5dC80RjJNVnpaSkhTZ3VzK3NxUXdBUTA0?=
 =?utf-8?B?YUpPbFdOdFZLMW85UVFzWlBqWURmZG5NeEIvTEVxUFd6WmVuRUhFT1Uza3pG?=
 =?utf-8?Q?sFnW52Z6Hxja5i/sdkhd2ATw8w8nPqpAqOs2i?=
X-Exchange-RoutingPolicyChecked: kb3B0KPzvgAY5f+R9qg/ghTdHNJ4x1KGGaLnlr6Nuwquqc34Piv5vXJDu4Wc9GVycR5H+JwZRkw+KRuYDVujAsq3mMpRYW8o7yD4gekI818kfSKRzzly3pJul6YsGCcb+NP3PKZYjVcmCyFtQIubRkRUvZjsUL2wmSu2v6kuvKd6EYyBDfm0IaJAHdNjt3e87n7M1a4/FAIuDWe8r7lhFzXriroORgVE2nILTT4q4vJnj3VICAuJnUfzL2ylAcY6kiDIyLE+TAZ/FR4eQfVM7poIKdYJwYa6gSP/LoSUnPREJ4btt/l2DrK0n0AylN46E+/i0B5Q/1LJypxgU3QOig==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c6ac03-78f0-4f80-4996-08df041ffa09
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:45:49.8219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kos+sFYTPkehqMQ7KJV6nx1yeVNrnOSY6jMXu8+ixECcfsPxQe1v3+SSww6G3OYgSvUbWjEzdV3zzOIZsqG+soxmbIZJzAAMRD1rXTEtH1g=
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
> Move cursor fast path plane state update into helper
> function. The target hw.crtc is passed as a parameter
> so a later patch can reuse the helper for joiner
> secondary pipes, where hw.crtc points at the secondary
> being programmed while uapi.crtc stays on the primary.
> 
> v4: Drop uapi.crtc assignment from the helper. [Chaitanya]

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 39 ++++++++++++++-------
>   1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index bc1e58d5c4c5..db4eaa74fc58 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -840,6 +840,29 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
>   	return true;
>   }
>   
> +static void
> +intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
> +					 struct drm_framebuffer *fb,
> +					 struct intel_crtc *hw_crtc,
> +					 int crtc_x, int crtc_y,
> +					 unsigned int crtc_w, unsigned int crtc_h,
> +					 u32 src_x, u32 src_y,
> +					 u32 src_w, u32 src_h)
> +{
> +	drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
> +
> +	plane_state->uapi.src_x = src_x;
> +	plane_state->uapi.src_y = src_y;
> +	plane_state->uapi.src_w = src_w;
> +	plane_state->uapi.src_h = src_h;
> +	plane_state->uapi.crtc_x = crtc_x;
> +	plane_state->uapi.crtc_y = crtc_y;
> +	plane_state->uapi.crtc_w = crtc_w;
> +	plane_state->uapi.crtc_h = crtc_h;
> +
> +	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, plane_state, hw_crtc);
> +}
> +
>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -915,18 +938,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   		goto out_free;
>   	}
>   
> -	drm_atomic_set_fb_for_plane(&new_plane_state->uapi, fb);
> -
> -	new_plane_state->uapi.src_x = src_x;
> -	new_plane_state->uapi.src_y = src_y;
> -	new_plane_state->uapi.src_w = src_w;
> -	new_plane_state->uapi.src_h = src_h;
> -	new_plane_state->uapi.crtc_x = crtc_x;
> -	new_plane_state->uapi.crtc_y = crtc_y;
> -	new_plane_state->uapi.crtc_w = crtc_w;
> -	new_plane_state->uapi.crtc_h = crtc_h;
> -
> -	intel_plane_copy_uapi_to_hw_state(NULL, new_plane_state, new_plane_state, crtc);
> +	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
> +						 crtc,
> +						 crtc_x, crtc_y, crtc_w, crtc_h,
> +						 src_x, src_y, src_w, src_h);
>   
>   	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
>   						  old_plane_state, new_plane_state);

