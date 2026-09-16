Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59173C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB810E0FA;
	Wed, 16 Sep 2026 13:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tl7gahOu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921ED10E0FA;
 Wed, 16 Sep 2026 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565011; x=1821101011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i0rrU10RjdBH2PkPGucaPu8q1tH6Db14ytoPwFw1n08=;
 b=Tl7gahOu4H8yyej41wVxlE3wO6UtFfExNG8d/f63lgFFuTM+hZtgdcUV
 7YKTGpOmUssHuoxO/K0u7pPDluB7ESJCDUcyvDQ6LWhXysUxqLhWSANBq
 XkxwgS5C5+CEdVNDqMEvmXlhRhEpec6LdbPorWzVOSNn4r09Ep7T1BbyH
 58b1MoDX+0hfuk8iyFZQC9V3YOoPR89V9yEIDSip8VLGWFHQ2qDMtt/Ax
 0r/+XOR6K+3yyKOfaSpHrX72pQ9+uYtwdW8uJ5NQ2tkdhaX3YP1OqFARD
 UTVjVt9O8VlBmdudkwGoMPOqrNc/YjT4u9fORnapPUbSq3z9/xVoK6c1r A==;
X-CSE-ConnectionGUID: vWLkfdQKR2GrFhNKg2NnVA==
X-CSE-MsgGUID: daV29A+hRPW8lVnOiaiGSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877467"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877467"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:23:24 -0700
X-CSE-ConnectionGUID: BB54SjuaR5CV1PnPjIjV7g==
X-CSE-MsgGUID: snmjNrK+RpO5nurOX6Qndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270059831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:23:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:23:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:23:23 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEQGLjkCZOd4ECfXRBYRIV4nt2tmOQHr3hLfvnVZQPCGLgwAXWM8pa6P7LN+uIIXytt7UxOYZitHpSgUJXXC3ZBdwgCRXcWEXASIFQVe40B9J57mjGgHphiCKchr7/mk0tW9Yz6rZ+/5ZfufMlhqXT4SG63l7NYjR+eLKCJun0ONyiDQUi4eOsKqjXXl30hFUFVI/f/NZL4Zru81ieFTAVb3WOOA5eEN58bgFMvpyCO5K+tYBODmEH8fxa9dMOykOeKHsUh/+2/3YTSPhXL0O5SwNDqNUzwBHSseMV7JzX6i1itR6gl01TRKahkYkx5KLa5nQBv6+e+K9R17LI1pKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdsMd1B4VEfBLVebAylXkCnLBQzO6HwpF7gE9r7B7oc=;
 b=S2T9scxretEqfMIZbWlzM7m+IsdfVBNH7ZZ7akyvJD44PRqVByJ76m7CzFyo6VCTO8l1kGl0GG2rofxud47PMqtxAfSSSbC395zRCB+Af8QuzwfbcXHoKT1R1JwGpZjJW7jDap2EqI8Tj7Z1axANSQiYJcZnsfszbjqlWw0CgaxoMkIUiVsCklr9//SIqQCdH2ESaGqhv42XoROfwhf0G0FFxPlmmEPWP47olTKpS487UfjcYoF93gsYhzAJhvkfAPdTZg88mHCPjzHJrZx675Cabyf2u8tU31x5uxgUMQsmsWc0GUb8pg0g6/0Px6hI7glaHo1cuql4eqHvVuJxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:23:20 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:23:20 +0000
Message-ID: <4885e199-f563-4b5d-ae8c-97683f343683@intel.com>
Date: Wed, 16 Sep 2026 18:53:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] drm/i915: Refine vblank evasion DSB check
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-6-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::12) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0f7c19-9f43-4c21-5e35-08df13f5ad24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: vdE5nOFnPnE06BBtAtWly13QzgjvGbxMKjyVEWQB502+rrCBpf2AqO9FoF0XpRXqhtRkThsEACk9GwLLorqVG9n2H51fWWTT5bpQPRm1sIjVwlBYL09flpgOvDiIHj1MjJHooTEVcaAilXN+6YSTmg0lVXzI876PPF/hEnQTkN+VCUplZttTt2SjttPyLoc7WYnHi8zP/cZMkxf9BQdBCaRW7mJJY14xfD7N3JQxvs+hzr/dZeXG/LRr+UN94j7TXPxPpiF+0GruAPCKyhgSBUFNYAR0xXvzVvArFFqTwfA6pTeV7uayvMMf5moytCOzArQPG0sLhCFO106MWSDIL1fKWzaZqBuCcjNj/1XDKkbDFVqBChbUoieu+YFDZ/n2zVwiFLr04F3qB7bVGwtj7PsPKXjUOprFvZk3ubOy456AcCRAmhjWu/9ZdLgIDwgAeWmATCsEKGxpCPar4Azliz5WUPFXCoznqyIS7a4AHYLu8rLZuF7EH+MKQBXy1K8TlLbovSN2L75IlL30Sbm+Z2HbA672Xbkgt75ME2Sda/5VD4FIwUOcCgV95uzRgJg8/QkTHe0KiSHOHrJPAMkbnRb+vypWniKjJ0ZJoaCCq7/+PpSUhbus2xu/L/ghCtO69gPSG18fp3aVzGcZwLcVZDNPKs9L83m+2sZDqfPNZUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTV5cHhFK2M2aEVyT3ZpeUdtSmlWRHdYZ0NsZXpJWEVLNHZnK0RmNTh6Lzlz?=
 =?utf-8?B?MXJ0K25keUk4aFRHdkw5eTNwbEMwdXlPQlBta002REo3Z3NzVWNRRHNYQkw0?=
 =?utf-8?B?QkVmQ05IN3RINDNKQTEvbW1RTllsR1JEVzN3SEQrOUVNTU82NWpnd01oK0x2?=
 =?utf-8?B?NXFsTXU3ZWp2amFPdjc3eGxSSTIwUEtHWFlpNmNubkxWcWtEcXgwNFhaWFRF?=
 =?utf-8?B?a2Njd05FQ1NKeDVnVnl6SHc3MmxjS09ramIxbmpzdERsZHJxUzU0NDB3TkNn?=
 =?utf-8?B?bFMwU0RZVE0rVU1QejRBU1paOFF3VjA0V2NWSTdybHpER21jVzZNY2oxNTNh?=
 =?utf-8?B?ajl5Y2xYUzdpemx4WkxycG53YTBxQ1V4dFFPckJSQWY3Ry8yMS85RUhCY21X?=
 =?utf-8?B?SUdjT2FRa2dFSTZoNnRKRkJXM1hIUzc0TDdLaGhOTUhqWlYyN3huOEE1MUxx?=
 =?utf-8?B?L2NHLzBnd3ZnaEd3TlY0UHp6d1BSbUR0VUQvSVpaTmRjeUJCajBJSGlTN0Fk?=
 =?utf-8?B?ME9RYnU3ckE0ZTc1VjlLaTBaemY4UU5DWDgzTGhJOWx1bzdHZ3dMZi85Ukxq?=
 =?utf-8?B?NmtQRHFNQ0VuVGtpZTdrYmFOMUx4MXdha3N6aks0cHhQZWRCQVhVaXc5cTVo?=
 =?utf-8?B?dU03T2ovNEE3Y0ozT3ZLNFE3U09MbWlpQ2ZYL0VQRExPa2kxRlFLdmNOVU50?=
 =?utf-8?B?REFEY2ZzTzdqUWsyRnk5enRqQ2Z2enZFNHRDcnppWC9QZFZsWGtBOXRvaFZx?=
 =?utf-8?B?Y1hrU0o1UVVrN2pjTm8yQzExdStBbUVqTUI5VHZHVy9oQ1RtVHpaaEtRMktY?=
 =?utf-8?B?R2RqMXI4blpYU01nUFlxRlhtRkRteHRjMC9MQ3BzcjY5amNLUnNJcFhGWXBk?=
 =?utf-8?B?dGV1dWZmQURibWRmNzF4cDFKWWl6aTVxWWtKVlhLbGs4dDlub2p5c0JlL2R3?=
 =?utf-8?B?ZFpjMnRoV25Vb0pqUFk0a3FCTklGbmxFS0VodHFKU0RBMEF4Um94ek5KTlZC?=
 =?utf-8?B?bUpJcXVJWXFKaE8zWDN3UjIvajBiVnc5eko1S25ZcnY3blBobEdIWDJHbmU0?=
 =?utf-8?B?QlRDZ3RBMDBQNWFIdXV2TCtidTNXRGxJb25jRUMxUjdUOUtlM0NpNk5uYUx3?=
 =?utf-8?B?SEhyVm0wQXE3NVFwZG1CaG43Z2tURlErR002ZFpsMzJyalo4SFRWVTl0QUpH?=
 =?utf-8?B?Ty9teW1oU0hxaVBKaTc3Mk9HdnMxK0JtRVNKaDRxa1E0TkNqUnVaWHZuV093?=
 =?utf-8?B?Qk5OaldpSzJ5R2FGTDFLY29SZjhHS3VQUTVtYmpqWkQ0N2dBVTRzR0hlV2Zh?=
 =?utf-8?B?Zy83eElTaGdmSWNJSmRXQ0kyejhvTUNpaVM2TmpSSU5PVTlPYy9qSldRejJP?=
 =?utf-8?B?MHh4K3ZidXNZMmViQzBLUjdPcWZjV21XOEZ1Qk9tamdxeGFMcDExN2lVYzgw?=
 =?utf-8?B?NlEwVHlxL2JZcEZDNHRZdE1UNW9vbHE1UzRjbm5Tams2blRVUnJjY01INUV6?=
 =?utf-8?B?NDNXMmxWaWdSbUdsSWZRM2h4VWUya0RnQUIveldqSmx2Y2N4N1NRUDJJQjYy?=
 =?utf-8?B?WThDbVZQMTJBTGNpbUtVNnphcys0bWNUckt4ODlpYXJDaUdGaFVpYVlyUVJY?=
 =?utf-8?B?VXg5cjd1dFBkRHZHbG9zSmtWRVFtQnUvRmpQamtaMVlZc2lZR3pDaks4TXZ2?=
 =?utf-8?B?K3lmSHV6K25CcU5CVkNUKzVqTmxGNHp4cU1RNm1nVFdUNmpaQ21xVi9QNXBh?=
 =?utf-8?B?MDlhSWNLTHpvVGFFUEVRRVB1TlNDb1k2ZXIzUG1jRnpWVWgrRjkraURWU1V1?=
 =?utf-8?B?bGlNaUxBNHNjaFo2NTFUczVHNC8yMlFPa0VIWmhYV2RJeU1JeTlmOGdFOTcx?=
 =?utf-8?B?NGtrVjZ4R292SDAvM3M2RnhZam1WLzhiTXc3K1IvcUs1eHlJNHRmMFRpam80?=
 =?utf-8?B?eTM2dmxwa2UycVd4Vzk0bldTYU5DaUJ1OFRzR1Q0TFkvN0kvYThySjFPS09D?=
 =?utf-8?B?UlNyNXlpemhIOTROSUlpRW02N3hhSHZRMEV6U2dRYTEwQ1dTOXVsbGpkUkJy?=
 =?utf-8?B?TmFhcGZTb3pNZmVmcGJUUVNjWWgwZ1B4RXhFMlk2M3BRQllBQVBVUTFyMVdO?=
 =?utf-8?B?ZGZqVlZhU2VoNDZxSVd5dDZzUytRZEY1cmlUVzkwTnZRRlN2V01wK3dhY3N1?=
 =?utf-8?B?Z2tvVUtLUlZRenNvQnFBTU1NNW9xN013WUlkemtERW53Y2xMQ1BDYm1Zcjg1?=
 =?utf-8?B?RU8xNTBvSWtuQUorbTFUdGFTS0FZbEllWGxnZHF2SmpQWWEzNXJKNHZnbkJa?=
 =?utf-8?B?Nk9jd0VZQWpkMVJ5aUZNekI1ZTArQ0xZN09jblkvWGZnaFdQb1Z3WEkwUUJs?=
 =?utf-8?Q?86jKf6Vkim9Mabfs=3D?=
X-Exchange-RoutingPolicyChecked: Dufyzx6vxliMbhA3z4ItHd/yD33qRNM68Am3x1T0BoZ8d+BhkVKEFYNmrE85AQa3u8Ecoo30s4JTpjGQ7DUIgCPoO4duNw0ubB5uA2JaGpgdOdfmY8xP8YV+2Yz5poJciFDJJvMPf/1RLzziZeK+JmHrRBjnvafCuqc5nqIgt2bMJdMXxoo+0HmLT8YNUCxadKmsTvXyJ1tX+/FunRg0znSwPEfZ9Km6ZKZGj9uebiH8aUtM+VKrciWgeShICfyiRYEsw8+/D/0D81cQ9kM+oLQM2LWEd+2w5T/SOK4L+w8qJ/OBnQ/vE99a63j0/+ELbsyF0k18iiE3AxnSmZeI9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0f7c19-9f43-4c21-5e35-08df13f5ad24
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:23:20.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4oBQXaPhGeybdavUUs5zu5XwyY7Dpk2BOcOJQdGqTyIJQtLQEx2PuJCPmou5yU7qdXutXXlfpLALtBoU/tjAsS8oNgL1M5moT5xGf1hZ9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Use intel_color_uses_chained_dsb() rather than intel_color_uses_dsb()
> when deciding whether to evade the undelayed vblank/SCL in the mmio
> based commit path.
> 
> A non-chained DSB will not wait for the undelayed vblank/safe window
> before starting execution, and the LUT itself will be double buffered
> in this case. Thus we only need to evade the delayed vblank.

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vblank.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 28d81199792e..72e04c4f0303 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -724,10 +724,10 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
>   	 * undelayed vblank, so with seamless M/N and LRR we must evade
>   	 * both vblanks.
>   	 *
> -	 * DSB execution waits for the transcoder's undelayed vblank,
> -	 * hence we must kick off the commit before that.
> +	 * Chained DSB execution waits for the transcoder's undelayed
> +	 * vblank, hence we must kick off the commit before that.
>   	 */
> -	if (intel_color_uses_dsb(new_crtc_state) ||
> +	if (intel_color_uses_chained_dsb(new_crtc_state) ||
>   	    new_crtc_state->update_m_n || new_crtc_state->update_lrr)
>   		evade->min -= vblank_delay;
>   }

