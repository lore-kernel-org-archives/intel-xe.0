Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53E5CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 11:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4905811B4CD;
	Thu,  4 Apr 2024 11:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEqf/qfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EEF10F4FA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712231301; x=1743767301;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z9yKsrjAEVMczhD9DB+ArQe1+gxN7jn+HG46kVeenog=;
 b=jEqf/qfLOb4NHegVvj7b/s+XEEyGayP3+MFLbJYVRDneq5Q+MSjEAlj2
 /qGtG2qvlfMR5IjYua6Q6ZnCaXrW5T+XHRqvIGl9zAcJLEZPxF2IZRyYt
 lanfmm4ZSSrdLDTZJ5OF/GvKjECP9RoWQwrxWXLw+U5nSv+CLFKtLscSJ
 g7eAB767Ijpn10/BtZFcRd2pdpK+4UXFLcxv14bBVKLxzo5vVe1Lr5JZJ
 vs22RD7QKb6cAGUD2Ebf81Iy+Gx2bFWNBxBaogykREm2IHJxdfCXdEPbZ
 ecWZRqRr7ibrtz73GiHRNTjBBJhWy9jKU2GJyQ0BE2GzLrMzKQBzbLH3c Q==;
X-CSE-ConnectionGUID: A9AjYTMkQrGpxEj6Kso64g==
X-CSE-MsgGUID: ozKTLcRtSvCKUQcDU01WqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7348534"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7348534"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 04:48:20 -0700
X-CSE-ConnectionGUID: /nq2ctHISrCSIDzfievvFA==
X-CSE-MsgGUID: tNAfj86OSVKH5dpA+U7QGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18796417"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 04:48:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 04:48:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 04:48:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 04:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1CK1QvYL7AtWw4OiJJ6hDZeAuV5HDtFAqbrS4hujP+MivSqFmAoFPvTaB0UvwtaW8UVnxaQ32GzOR6GNAhowwMDg4TZk7x+JCwKlYGcZ3g5o+wctZLt3ziffUHZvw8ieJRjgTpxemSEabHxKiZiYNcJ1dlfNGlHmX48UWKBi2abUdJ3knAeWdQmrtSiXr7UOaHL6OryH6jAOV0aurIWL0tlJBd/BxEST0QoEMZhzEQfktKvJl4HRSXTJCUSpikBTH++NO5RCMihKL0Ci96VioH88054AnWWVabJbngd9MMOrZ9q3Wwlp+MmE2tIUnPRmsWB8sCkqr1hP8/hFFI8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHwE+6RtJaQA2f+gqNDRWN7GlnD2K9djwEzyeHz6QFI=;
 b=n2a7IHCyPIHEO4NJNAgGNNE7djk9tjhkUV14unxbhzTysdNafOUJ/ZwgFRmUwH16gzuwFM3aoWqqQTTNzaqbGsH/0MXDJRF1WdEu/TTsoLODIfa/5kEnyU6nbSHJizy/wdzFAjZdgnROlVEb+WGBELUR24ZW1PorHAZZh3zEXAbjQZyqzvkab2ySRF98V0B56xSUNi/Hp+cZ9WxIoyZXC9acJyw0EofuWjvXVBmI86tVXhu1JEfbo+jUF6/YgN6ICfLgYVAvhbtV8x3i44HVDzlBrPhsyrL/4a6kdTWE5M3HwWGmvnJIG9X0BT4kYb+TGxXV4gNcE8afO8+gnv2ghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.38; Thu, 4 Apr
 2024 11:48:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 11:48:12 +0000
Message-ID: <7fc7dead-e856-4b53-a68d-f280e5983751@intel.com>
Date: Thu, 4 Apr 2024 17:18:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/hwmon: Cast to output precision before
 multiplying operands
To: <intel-xe@lists.freedesktop.org>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-5-karthik.poosa@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240404035441.965590-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB5066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gMUBV25oSzVfV2CjNOR0lAJABx0/UxUokfD9tqVqaYnFuH0tpGyne2DlyUJm+PseyRo7gbN40aFBurm7QvCFutv8LTnXEs/OZaFfUsm73GUgzAoKxGiLkpVDhkF0A0zhuXKQIzfBPaaPJbrgpyecuRlTY4ikm5jBkBFmwt7DnlEtzsFtoWI4yRfHkMXwMDzn6N87f6mnS8orOxLxuZy68q38H6tzvdZT1dL3Kxzgn6iXKf7iFW8nrQs946mTdqdAR7kcaOLlpVt1MhRfbWlO1a31K/bmVMq8kk0XpM1w3aIK2Ulp6FrmA7FzCZBa8io+ib21RUCoUAQcK2SvLBc8TdBeWwsC5K7XdtDFs8tKGitm206pzpnGpQcDiYUuahA/D4E3BgzQUoDlZjjYOGeun6MG4zxVJxaH1HFgXfpl6gls3xdvJxJia7skHNti7NcoC6u3GXVi6PMDYWWgF1QzvE5ZAFSyjd1NoahdMSNdkA8RQ0CbrzRVfzwqlDegJF0p6E0NR6m3OJYlvmIOkpJkXJg9USQpPocQ/T/Hk1yJ+turXsfsVxBhNj2FfFdaO7PLvqZ+TdH5DeZ5cSdRXaqXi2Pz6s8JuCGG90zvdqrCzz0XE+xnkXjJMNYa67/BjPgIQLXRu+Vr4/ybnBGm07HvsJoaljVyLjjAabFSN84Pkho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0JTU2ZlOVM0TGE5SjhzQlJoNUlXNW9sRGVOSXJtMGlQdUtHVHFHNXZhelhB?=
 =?utf-8?B?aDQxVHN1S1U1MFVMOTJKc2FpWHZoZGIwOCtPMnJ5NnltRGN0eituandpWC9h?=
 =?utf-8?B?RTJtSUlMN3VWRVVVY2xIR1VOQjRTclptT1MyTldCcnR2eG0xeWQvWHZMaThT?=
 =?utf-8?B?TDZCZ3Z3QnJYbXc5ZVhIK3V4dFNVY2hUSjA1VzZpNWRHc29YK0VvUEVSM1Jp?=
 =?utf-8?B?MEZYVU1OTlE1WENOMEdlQ1FuSm16cGlwZGQ4K0EzVlU3T2VZOTZ5TlAwMnlC?=
 =?utf-8?B?d0huWHNlRlY0NUhTRXl5MWt6Mkp5dldOcnNjTDlrcG1yaXRBMzFXdDJ5TXdX?=
 =?utf-8?B?UDVIQU01TkhiWVlwcmsyUFN3L25ydWhMS253SkVJNHp0dmNBWWVIay9iR05q?=
 =?utf-8?B?MlppSktXSnhMbzJKK0lsb0RHL0RmenpxWVZXQVFHTG9qYUdFcEppOStuMS9M?=
 =?utf-8?B?eWxQRy8vb3NkenlyeFJ1RkI2N1FmVWE1L3ZzSVppQTEyVVQwSzB6aTF2WDIy?=
 =?utf-8?B?N2lXTEZxRzdwTDRMK1FwOHNDZmdpVURDRGxnVTBTaVlYK3UzSnYwZDZmQm5U?=
 =?utf-8?B?ME9WT3l6UkIxUDRmVDNSWmlvZnhWYVJOeC8ra2pZeWR1RXczK2ZBeDd3aUxS?=
 =?utf-8?B?Z3YrZzdnTFdqdTVVSW13MDlZYVpIL05XZjZSek9MSWF0eis1VERHa0grbTVn?=
 =?utf-8?B?MDF4U21UbXBadHl1WDMyYXlQWGQ3YTAxMlR4TTlpNzFZVmVvSmtTN1QreHFl?=
 =?utf-8?B?V21GRE0zMVBlUHkvUjc2ZmovZ0t3ak5Rc0dLQ0Z0NzJjN2N4cWJUWDZuNXE2?=
 =?utf-8?B?cUVMMXZmNHpQWWNxbXBkU25TV3FyVkNIUUY4RlBrM3VwQWlnNVFybTI1R05Q?=
 =?utf-8?B?WmlZcEpHWlBrYnR0cFgyV3lXOGdIWC8rMTNNQk9ITFZMV2VLVUJLTklkU1Va?=
 =?utf-8?B?SXZrOVU1MExzWnZjQlZzM1FwYnRVaHQ0T0JWbURXenp5OWdzWEVva3hqR1lT?=
 =?utf-8?B?YVZXcWhUNHBxVTdyUEhVbHpnVHZNTHIxRUM4MzdwU1FvS29Qb0dBWHNMcTBY?=
 =?utf-8?B?c1A2RTNvQlFudXVQRlBoTDZ3QnpxdEkzZXhSbUtVcUcrbkhVUnJuUURKcTJJ?=
 =?utf-8?B?cDl4a0RiU2hyQ1dEMGdNU2NSWm5UQ1dIVnNBb3ZUSVJ2bjhqdkpVZkxnR21Y?=
 =?utf-8?B?cmZRSHNRSDhsUXJScTd0b0lhL2ZlaStEcHNWZEFNOTMxa1dHVXZ5OVpDTU5M?=
 =?utf-8?B?TlppcW9JbklYOFpDWSsxbXBUaWZhOENsUnFLci9ISzBxd1VDNHdzTjVoZTJh?=
 =?utf-8?B?aU1CNE5JWHhZYnBJaEVxY0c5RW5oaHJVelJCN2EyV3cvdDM3dWp0eUh0aFUv?=
 =?utf-8?B?Q0xEa0pDRnpMZnFXSDlDTGpHSnBUNUJvSFRTZGlMc1U0SXVlRW4vZVl0Tzlu?=
 =?utf-8?B?TytIVm9vUUNlTkdrcE1GQWI0aCtVVTczcnpuKzhXcmx4elJxNVBFUHY1TC9G?=
 =?utf-8?B?TGVjZ1ptUXBDUEdlaUZiM1VJTXMvOW4xMTZiQStSY1JWY3Z2aEZQUUpVa1Ex?=
 =?utf-8?B?QUlFZXZpRnVCWlZiTG1pL0xqd1dYWjhzeTJsZTFrbHRnaU94djJxS3VORmJi?=
 =?utf-8?B?L3Q3YVZhU3RSQ21VN2toMDNwS0NwWDI4SFRuc1Q3eTFoaDhnbG1nU3ZJSk5X?=
 =?utf-8?B?WHRWM1dXcERjUzg0RnRxQ0kyWXFyUnM0L29saHNCcFZhVFBBdXpJSXQvUmt4?=
 =?utf-8?B?TVd1d1dkeWdBZXFEZTVPY3ljQmh0U2hYVmdxVmNFaGdDOEZWdFpPM2poZ1JO?=
 =?utf-8?B?ZWM2ZXRnMGh4ZElMSi9kSC9RMEZaZWtBaERKWmRKMlJVNmJaQ0pFN1FkMEtI?=
 =?utf-8?B?bzdiUFRybzY2S1U1cS9zbWtaRUZKTTFUNHJONlMrcWNBZUpGWmFmZU44bUNG?=
 =?utf-8?B?UWhPYytEaWNIMGxGTEZpOE44S09NcWNyZ09Yc0hIejRUV0NLTEw2TDJxdXRi?=
 =?utf-8?B?Q0NDVkZ6S3cwNEVsVkFLRWt3SUVzRGxGT2FsbzJCNmVZRGV6VlRPQU1wN1J2?=
 =?utf-8?B?R1dmQ3JSejduTjZ1RzVYNXVGN0NHR2hXaWwwTXJnbXRPdzBsc25IT3FLM01Q?=
 =?utf-8?B?Rmh3Wm41NmdiMGVwZGVQUlpBS05ibGV0ajNsUTZjdUdBSXlwczJlSVdhT1Va?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71678d2a-a5db-4241-02a9-08dc549d1ad6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 11:48:12.0168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkCqjKxbQInVduWcT6G84W7/L7ffCVwB6ga53v1xgvwg4/rcV8w8eco7q6ovZVv4uH3EWnz81b1IsFda6W6ZB6FZpneNUZrM+YYYnbUh/E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
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

Commit Message and description doesn't match with the operations you are 
addressing.
You are using left shift not multiply.

On 04-04-2024 09:24, Karthik Poosa wrote:
> Address potential overflow in result of multiplication of two lower
> precision (u32) operands before widening it to higher precision (u64).
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 114aadb54c8e..3c5764af8a23 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -297,7 +297,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	 * As y can be < 2, we compute tau4 = (4 | x) << y
>   	 * and then add 2 when doing the final right shift to account for units
>   	 */
> -	tau4 = ((1 << x_w) | x) << y;
> +	tau4 = (u64)((1 << x_w) | x) << y;
>   
>   	/* val in hwmon interface units (millisec) */
>   	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> @@ -338,7 +338,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>   	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>   	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> -	tau4 = ((1 << x_w) | x) << y;
> +	tau4 = (u64)((1 << x_w) | x) << y;
>   	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>   
>   	if (val > max_win)
