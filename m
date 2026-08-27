Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5862AC61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 09:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F9910EF63;
	Thu, 27 Aug 2026 09:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF3JXooJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7D10EF63;
 Thu, 27 Aug 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787824006; x=1819360006;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f6TehMFs7JstkXOwdJCeYJjeNVpZavrJ8sntnFCl9gE=;
 b=iF3JXooJQi0hRa7TL2dk2XFm6kFFINtM78/Ro9hZtxRT1buzXGwkJNxI
 BW6WBp797A3lkHywTrHjuMPimlmwI7jUUtps/gO5xS7zqZSMLFrYPQMG9
 JohUiCCOwxc8u5i9Lla8hPUuzRf8Ti3Jf9wYJW6al1t3WBxjWaWHqh7iF
 fA29jGuT6piKM9OEANrQplW1k/Xsa1eKLFd9TOAbUo/tUFA7eraEbY4T7
 SiO8WEe1VRp1jP0KEtCQ8jSEGfgKLKQQBRLrZr7UXtv2p5Ihyeugw415i
 vkbI0JqyigWvUOgV3Vg+P3bTSGh2kbiJ3J3hLIMVJaH4UvFmHRlrVzppf g==;
X-CSE-ConnectionGUID: a84QP27/R5+BF4G+b9f6Dg==
X-CSE-MsgGUID: h7P/ytcgR+e7isFy91lgPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92179352"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92179352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:46 -0700
X-CSE-ConnectionGUID: wtSExAPLQ0mXKnd10I8BsA==
X-CSE-MsgGUID: hSrR+BJJRaS8V9X4xa3Ojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="267243628"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 02:46:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRMcv0OujUB/LjW57UBbbdTZjZpPAZqWvyP59HlI+ykK59RAMi18EJq9I9CJH4jKThFUHN5NBZkL3ALO62BfKZJNxQmTQ21Nd4CE2LYkn5IhhsjWVxNzXn6vsBlSjESCwv3Cib3NDnHhcdM9QMvgO7O6qlQlSKiBlbrMtfeHQbGBu1wTQX4rACc/7kl7wdDdZRb4zEXDtWoQLI5MNyL6KRYBM0t/LdeG3KmcVxggv2sBsbjeQoQo9wd1reMJ5YGXg7zuvnUS2i5WOQOo7E87G1E+p5MT4NcA3xaMEalY+EzjvL6UCmH7I9vRq78s23mb/jtVUhTL7t4iWM6BCts99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPc3hDWZ3REV9JMIrhsFGy74uo/m0SWarXlR9O1gNT8=;
 b=sV6yAOnTfpRKIVOsgMXJm985Ba4Sv6mtACe4jbo3H3vVOpWDsXnjohpR2jN8yJ6uzk+JOVnQ5/C56brvdXe89QOSOsNvSipI9Q8pZkfd/1YtUhdTtyIu920FFMACh/OhOLh+zKIGbETwYFMSnWUcDyWyAwr0OQfeFUDPjUoXYTamXhI9WoVEVz27Bn9uoC1VEKbMCRngpZYCf6i7XnHgB6cxYZCR5e2jgUvhGh7wuNOwAZQOJGDm8/4AEkccls/UD2SBhrGAlIX+mwxEupYYOW00SphrFv6dDVzHuyCXjLEWFxiXTJYCHat1OrTofjtzvNwrS64eObApfO1C8f2OLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 09:46:42 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 09:46:42 +0000
Message-ID: <477d5403-8df9-476a-9731-27b4eac0cea2@intel.com>
Date: Thu, 27 Aug 2026 15:16:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/i915/cursor: Allow joiner cursor fast path update
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
 <20260821044755.2234490-7-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260821044755.2234490-7-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0244.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 88623b8f-28b7-405c-a73c-08df0420198e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|56012099006|18002099003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: IlEGjYJnu8c+ELRXAXPVQ0VgWoj8B6D0sEkyCAyKOANSCBTd9c2x9LJNoZJBrGkvqPeof2N5CKaXOOdKHhibqEiWhQrop3pedMS4jh8tc3RD1G52AWmj0eh2Sk/RxrhftzcfowjnuZvcsJghSXtigSCbqrRB9sSv0Fsl5G8zPpR3IOp0YRvJnsJjPauikZwbvyieuT+ZJZTMAjhHUlEiWzMGn4C7AR7++vVZcgu7mAPFQ51cYuUHpuZIfGegYPMOQNOzXRSDGkwYzHCCHc8St7q+i9ivhSw97UVW6CzeWIzkrfI+hn7an0NkrKVHrKaUsKMOgyBmgGD1ZXnKndfIMEwPStMM0rr+XmihN2Pmbz7w9uyGvoxmE5DQrTz592Ab3/X2Q+Y0r6EGLkMRN0hquZ3OXTvaEtUEITuiOZK1n03YcZ853vd+9bw9LcvG6gpm4zf4dmsDy/DJx3ufV+7Ry1venzw1aLZ1qAou8QEi4eU5f44/e8Te2CkG3fqfetSW9cRRwayuPd65l/W6S/ITc3fcxCyEdGivIE3lVOvzLToJ/iBWiQS8AmRzLUeHEEl5eTGYE8dVqh4Vr270SkgVMlVUaVuVl584pixqyKQbir5jMQmIIkZmjDeLcRF8LhosmYjvG+bx/4kPXq0dr85Lwxzbx4EP4ywWyY0Kz+GOIls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFczb0RyVlNLMlpNaFQva2drMGh1b1B0SXpKSy9NSnp4SlpGcXp2TzY4YmVW?=
 =?utf-8?B?RlA1aGpqOGlhNGg3ZG9SOG5CYlBBamlKcFhwN0NRNTFQdUp5REM1VFlFeVVV?=
 =?utf-8?B?SFlqTlN5M2R4NFlWUHNyeGpSa0ZPZXJwNzcxam5ROHF5K0RMenN6K3BZdmhj?=
 =?utf-8?B?Y1gwaHZpWnl1bG9udlVxS0JiWGdiWVdnWVQxd0pMaDBHMkYwRTJWc0g1MHcx?=
 =?utf-8?B?OTgyVGFURHkxYWxlQm9jdTR0TldCQzl0TWxmS1hHRS9qZlpyM3ZveEp0dW1J?=
 =?utf-8?B?Vm9VcGZzZHRnUG9BaVN5TWdVQ0UzRTZ1ZjZUUEVaSWxRR1RhLzl0YWdodGVp?=
 =?utf-8?B?ZHVzNEJldVRwSWZhWWNHQ1lhR0h1eWd3V3FYeDBiYWo2ZWdPbDhBNjZRdmE0?=
 =?utf-8?B?em5TMCs4S1VrdjBvYTdLK3BvWmszRmZlMllkd09tTzBUSlBOVHkzODZhVEpE?=
 =?utf-8?B?ekhTNTJDNlVOWCtsQ2FrUkJrNFpwdVZweFVwejNCcHFqNFJOMkV2YVlSeTVr?=
 =?utf-8?B?eUErczBDRnArTmcyT25Wb1BudkwwSU5tWGxrK1JiVm5ka2RWMUhiWjFBNkQw?=
 =?utf-8?B?NWgyaHpraVJkZHNYZkJxNk1tQ2tFcFB4dm9YN1YwTHg5cEJLMzM4eEQ2OW5Z?=
 =?utf-8?B?Y25tcTVMWE10QjgxK2RRcGRuZG5WRHRoS1doRnZTQk42d1FJVzhJbmN0bnEv?=
 =?utf-8?B?SW9rRTJGMVhCaElLa0tJZHZjbXIyV0VzS0Qxb1RZTnpPdlFyNlFXYUdEY3R3?=
 =?utf-8?B?TDlkcDdlbWlKYU91Ynlmbm5haForOW0rK3p3a0g4MGlxeDBSY0pUUUVGdlBU?=
 =?utf-8?B?c28rSTI0UXBjcEJzVG9rUkhRYVVHV1dEd3Q0dFBvN3NwWXFrZEhkNWkyMXha?=
 =?utf-8?B?Smo5YjRVbEFhQ2hlQjIyMDhTd0xSZ0NRdDFHS0hGenNWSGtIN2F0QzJOT3A4?=
 =?utf-8?B?ZDgrajM2b0x6bEpHMy9NU2lQZ1RKeVJWcnJIV3UwaDFHL0FEdU5paTJsZ3JS?=
 =?utf-8?B?dFhrOFpRUTRzNldXTmhvS0NRNWJkUTlKTUcvMnZtelN2ZHA4VXFPc1hCSjR5?=
 =?utf-8?B?NDZ4Tkk3WTZPVFlzZy9NWXJDRWJTVGxUOFpoZURmSVlRNG1oRk5ZN2NWOHdZ?=
 =?utf-8?B?di90N0M5TWpkUnp2ZklEN2VzVWp3cFFHZzhqU0NyUG5qRERybmpSR2R0eGlt?=
 =?utf-8?B?VlRnTGw0RGJCL3JCMGxGUlo0cDZiNkYzbUM5RFJ0TW40cGJZL0xJN0k2dWRD?=
 =?utf-8?B?RVpjRWg4U3dUUVJCU3ZRZTJNZWpaNk05RFdGcGxtNURtS2tzazhEN0VRZEMv?=
 =?utf-8?B?VG92OXJJaVFyaWM5U094dEp6bkdTR3ZyTG43b0NnRHhZMXAzaytDTTArdTNS?=
 =?utf-8?B?RUkvazVTMmxWcmxVZ25jZzVOT1JxNEpuWXJmNlRHaGxJSXYyUjNlOFJrVXN6?=
 =?utf-8?B?OWdpTjJ5Z0ptYktpQS82ZThyTTkvZXJkV0U5OThZWjBmQ3RhYWJmVTFQOVlI?=
 =?utf-8?B?STVDbmdlOEFVOWw4YjduTlF6YkZBczYrWU1zd0pTcDdMSjQ2dmt3S05GNkpL?=
 =?utf-8?B?dTg4dWFsbWxRYzlSbVdKRWRUMG5Od1VIYVNlRXZYaWlFK2VBeGVkM0xDV1ox?=
 =?utf-8?B?ZmdQVTFzYTRacGpJWHR2My9zUEJQUEtFTFRKd0ZtNEhzTU43emlJWUh5RklR?=
 =?utf-8?B?MDJVL3A0M0R4UW0xYkZDdjA2YlhnQUVnNnptRkk0SDRvVStqWmpSajdJam8w?=
 =?utf-8?B?a2R1WVVtYnJyZ0FlMjlMSWh4S3Q0Y3RsbzRwTExjMG1GTTR3eTUrQ0N5dmpv?=
 =?utf-8?B?Snc5WXRqT0VNQVZlam8ya3ZKeEhWb1dzNmNnK0l1a3RpV21mNHBFRzkyZGw3?=
 =?utf-8?B?dmUrODJYcXZqWFZJZEJ6OVhRZVRjbGlhM2VHSWJENkhzOEdtektrdG9ReGU1?=
 =?utf-8?B?TnprK0RLZllEU1VST20zNjRhMXhGb1pFWWo2bmJaRjMrK2NsUXpSeXIwWXp6?=
 =?utf-8?B?alFBZnJPeFgzbXV2eDUrdDJMclB1d2c1L3g3TkFiNmViQkQ0b1FkU1V5dGRT?=
 =?utf-8?B?Nkltc1lkU01RY0FCYVpJcS9HWDQyN2wvcERiOXcxQnJXRnk4bk9xVStBTzZq?=
 =?utf-8?B?b2FzMExSeklBSHpZVlBMU0xxd2d2SGJhZzUzcXFMajJFc0NDaUtoSnZ2Zjhw?=
 =?utf-8?B?TEdkNVFodHZ3QzNQaHkyWnBEWFRFT1NwUU16WVN4QU56MXFpb2VHckpvd1FV?=
 =?utf-8?B?eGozTlVTaW5OWWN3dWhGMXlBTzNkSEM1RVFqaTdVYVFHdTZOQnhiSG4zZ2xp?=
 =?utf-8?B?MmZMUGhEMEdVRklYU1pyREkreXgzOTVnc2xXbzQzUTNUSjhONG5mS3daVHhl?=
 =?utf-8?Q?9paSWdSGZPJJmALnbNZZhvslcIfgm3xJ2hSBC?=
X-Exchange-RoutingPolicyChecked: rjiQpn1IsdO8t+q6qSniKRSWu9GC+SehRtNph9/RDMrlgULd4Fj1IruIRgZYYWZcwn1LpLvxnViOYtUKpFUrozeuJG4Fr1OGbheLLiBKVBgKPTxR50fo2YXOppyUWm3Mya47PEn/s1uwXk61FaYJkCZ55U6vYwT18iPGL3O9wYEjutGEK543GOdDMefiEAfwi1yAQKWyyD80Arx2ypap9DA4N6zo37Deq1Z6SqQW2sUCtz8C84xJIqQS08GfZiiPugRSA/BonSHTELLFNRYx5QDjgC67qGkpKKsR17oymK1GydSzYUtzXCPMMCgtKSCX3escvEwx/PLDkudJel4Jww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88623b8f-28b7-405c-a73c-08df0420198e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:46:42.5310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj6Gcg75NRMb4oIlR3ucsd4wiASQEyFqyhaIFp0fNhpAvwfA9rkS+BqeMlDUCNT14hpL4mfQMJKjz9LvUxmkp6f2kRpwEcV9NR3uk9r9bLE=
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
> The legacy cursor path forced all joiner updates to the
> slow path by checking joiner_pipes.
> Drop the condition so that joiner cursor updates can use
> the fast path.
> 
> v4: Trimmed to only the joiner_pipes gate drop. [Chaitanya]
> 

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index dedb6f87359c..fbf0c9e143a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -909,13 +909,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	 * PSR2 selective fetch also requires the slow path as
>   	 * PSR2 plane and transcoder registers can only be updated during
>   	 * vblank.
> -	 *
> -	 * FIXME joiner fastpath would be good
>   	 */
>   	if (!crtc_state->hw.active ||
>   	    intel_crtc_needs_modeset(crtc_state) ||
> -	    intel_crtc_needs_fastset(crtc_state) ||
> -	    crtc_state->joiner_pipes)
> +	    intel_crtc_needs_fastset(crtc_state))
>   		goto slow;
>   
>   	/*

