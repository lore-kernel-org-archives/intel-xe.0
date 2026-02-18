Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69192E9A04D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188ED10E333;
	Wed, 18 Feb 2026 22:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbl/zuDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4E810E325
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771453541; x=1802989541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C9LTB1lQwx2V8fuGPIbF6c8ibsmV7CQih1Ueop7DgY0=;
 b=cbl/zuDwiDTRzwjYin9+ta96LqLpp5RTrVBuh1UBiTSEv9pU7u9LAPF3
 uQzUDKgYqxRsOvUBwK+xyR2AT0JTLS76Qj9aMBHI1Wp3etLnnXN/RLjJC
 M5DqPXoxnljrKif0MtpkG7WRKnTBfJhB18UepOc/ojCXu60I57lgpU50Z
 cwEGtyXuagUGH0Qn2ngeMDMplA/nm5nMuFTvUme1jbt37jfrdYxgvyQFY
 Zpeah6sPlumjrRzrHSGcbDfel9OTtpM4QygRYhgP+9xDuCf6Pk69A6x7M
 X+kKg8c8FmEjLo7QnmHTVokzVwsw4GLWACc3V7uaAegwQXNnUWM4tVew9 w==;
X-CSE-ConnectionGUID: FlryeQ84TuKigbbG16NEjg==
X-CSE-MsgGUID: PQv9WN68T0WZI9xmS+xyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83903465"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83903465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:25:40 -0800
X-CSE-ConnectionGUID: Fix7/t5pTpizrMDarfeX7g==
X-CSE-MsgGUID: qghmclwKTdquTUbz/Gq1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214333806"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:25:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:25:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:25:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRIw0lGLwMGtU8z67SCDzOeykHvz7K+HOfENyavJqoRTEYjdmWlYRLDztUG75pfnd4726IaAILlKAQURMYVC9pvQqwDmy71ZDkw9s4awSNGabQ4F1FHDbtidMvpcSnVUGZgdc8An5cFQ+5O6J6i6GpXhEiHNBZL81YkXevpQHqEMuqs9J2d7/pLCa13XO6b6Tt8loJF5qidoe9rsdMyecertNlFPN+HWxRtruAVcvi6A3YTNvJgL/L6pBc8r5ZfNZhacclB2yHMlVQkCpByS5MuSnAwv8sbv083eSiqbIjt1iufauq81+dEHYxnGrvGFGUsv8W4yv75yJmqvfqKXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXIB5dRG3Kdbp3zbxSRb3WZpX/BOTcTqfgcJQU8h7PY=;
 b=ITwMyjv+gCk9a4z38x9586a7zrpq5mPVGpcBZ70HnHX1q5mUpsx+/ScuufOmI520fQZ8AsVI2byL9d9S/myGHe6qGBoHbyMdzoeVxXoj8TotBjnBw8OMReBAC9y4Gfb83d3uuRzx9zG8ZYwtWBbJv/GdKKdV4KVym1hjz3ML3kBARXn6s4P8UtyGstX0Vkq74BMJUpYXqOZDgRfdn0iE7BrWTFdSl7GLwOANIimBRCiTITwH7wtaXK6S0voRVdlxe8tO3ZAq1JjsslHSNzp67lSDpQOz74/EW1QIBJp+hVXzDOwHuNKYoEU3VA3fZAAEsxMfWaH+uqp2VaeOChwIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 22:25:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:25:36 +0000
Date: Wed, 18 Feb 2026 14:25:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/xe3: Remove SRIOV VF check for Wa_18041344222
Message-ID: <20260218222534.GW4694@mdroper-desk1.amr.corp.intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
 <5879396bf202b64d9b5c4cb8c720f3e65d358fc1.1770760591.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5879396bf202b64d9b5c4cb8c720f3e65d358fc1.1770760591.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL4PR11MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e27ebd-8a0d-4183-218c-08de6f3ca382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j00wo5Ts/yTaV8Vi0M8nT3A1GLxDjpj356PyEiCOf8717FUczYyEU4i6jnCz?=
 =?us-ascii?Q?cgIW3CpgtC4S6SE1/DHXU7hRTKaruUNA8qkSN39dovCTbsf1Z7CqDNhjgr9Q?=
 =?us-ascii?Q?G5gOaMRPhQmtzMRnsuszMrSB+R+eUOc7bn48smfTjW96OgIIW9KN1kQtSIpa?=
 =?us-ascii?Q?izhDt5Qq79jax2uyF4Lv+B0j7dgBNJENEB3KVCY4E7bz5orOByoJ2F+eoVOU?=
 =?us-ascii?Q?sQUsTIxh43mXyxtglHSIiE5OkhWYLNCjBSIx8dv1+KBpkhR4kkmGoCagJLgl?=
 =?us-ascii?Q?fucg8N3oWegXFcfXQ8jSuurGZWgEPvO3d2JKp0LHZWbe3diMMHeXz71jq4m0?=
 =?us-ascii?Q?+aHgl+pYMV+9kB6YxrJb8D0vQqBBe7ZVjobx1+2Afg/sVpDPuUiBpcsBiQNm?=
 =?us-ascii?Q?TN4r11hiSnMp+ywCXEjLnsDY4RD1pNDWzu93MVON5sYMLwVN+vXw/J7bQMwb?=
 =?us-ascii?Q?rcwH/dn66EfeEGHSkfBswTBODodHFpB0WAT25tQd4fOp2m4UoAHskoD16uue?=
 =?us-ascii?Q?qD6Rb54bjtlC2AoOiRD+eoYFg1dGpcM+GTSxrMn3BUVGC0y9olRp3El1vSRX?=
 =?us-ascii?Q?uol6/1KgUkGKFty++KkjeNNAQRW2afRjpu1aqf8say+BwTUFd26xylLTF+UO?=
 =?us-ascii?Q?+8d4ANsqUispJz+Y8IkvK4hfr2Y3RacY9kjSNL21oN/WH2oEdHlh8ylqzRUA?=
 =?us-ascii?Q?8utA0Yks1uBYrYRDn3cyE2xXPIdFEv81HvneXjENX3LbrWfLPi83Z2FwLqEG?=
 =?us-ascii?Q?EVpJvPm+/75lH4bsc0VpIzKFApflI1gur92bUZUJywrnugKOKCXwkT9+0iHj?=
 =?us-ascii?Q?i+q3Eklep60nyDPaXC5iYY7X3BocxETkwpfz6WGpGDd8FPAP/DcenddYU/2E?=
 =?us-ascii?Q?KNacVv6SMkma921VsNDpOIKL0pQNnX3Mex+JrjymxjXa5RoikOYfQ1rJYQ1+?=
 =?us-ascii?Q?1rGNthxqpsrrnMno02E6WyrTPVl4xwDqAMUhk4Wd3RHNfbarl1aDTPf2qgl9?=
 =?us-ascii?Q?ZUWRAwAF0TzgZ3zpEbGHFpfHfdQ3WTxnL+HAXOrZbUFbaZH4Y/T5a0uzwNRb?=
 =?us-ascii?Q?8+lZPg2GVoNsBciaDn+8wmwl4BAO33k8c4QAO+rCQTey9c+zL4eyB0vg1k0M?=
 =?us-ascii?Q?bM0hgRy/8t5OlkvIssNzWnULmtmBsnWqEkkknsM9ldTPf25qnhiLY56q3JWW?=
 =?us-ascii?Q?N+6BE6nxgw5Kcdr1iIJK3yHvHWPtK9fjTlFNVCJiuWrWMvW3srAtBwVZCQVw?=
 =?us-ascii?Q?mj//OKc9L0GBOxRMkp3r3Jg3SZU8GS9Ja6fhgZEu812HJc38SP2Y2dg2eZYP?=
 =?us-ascii?Q?s5PvI966f77pEzWEBsHqurScrFApT9tLU2cIFh2672yULYmJgTvCj3ORvZ1A?=
 =?us-ascii?Q?ptb1twcxH2+4VG5yIIjsWQUV0GYoSP5gsRi8CNJT9gb5wrX6Y9DpiQOBqK3p?=
 =?us-ascii?Q?5IiXZRhuesbo57yAWwWgYTT8+xGetKtJmdS9szVc9FhHc2rAugduSfZnzcpF?=
 =?us-ascii?Q?a+gquuiv9Yw+KUgINQX/prbgmGeweWjLAV+oMYDlV6CbG7nNAmHFFXN9u1M/?=
 =?us-ascii?Q?/cViJ04AmqnneIFf5KY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUp4Pduvv4+sThvRx4IXlxaOlaj9iuMVH3xULhpgSePClcIZL0tKBs5Gn/zT?=
 =?us-ascii?Q?TGchljdrfLYiEIhlef93DxZcuH6wD1Ru9ZrBns/rFGCkx9Pxvh/TUVvkxiKQ?=
 =?us-ascii?Q?SWD9SKurPnSWi0LbwZ723XhY9CoaciprTFb8fJ+rAzz50/SAkXoGW0EbXIVb?=
 =?us-ascii?Q?JdR0Wq4NRp6wAh/BqM62RZcJGvmm8q5DXopSGddv/IY17VAQ4kljx4+dG9/N?=
 =?us-ascii?Q?VKenN7ByplZ+aphKBT/eY4z0Zym71BTqOIBt30sx+X+hTMc0aPy6TjhptCgc?=
 =?us-ascii?Q?Bfo3MhUKJzMIeViDPJMyBF2jxecuQrVaSz+wSnQkLBdM+LMutOKEur76+3BT?=
 =?us-ascii?Q?ReLRad95y1TpT9OTFj4U0TmffXgdThBoiGP3A7BIB+CZU/JJXoLrvSCOeCwD?=
 =?us-ascii?Q?PeuvyYvB7bX8XAaJDZLs3J74b77KijR35V3yH4TVz77dFeY/PWML54prl1IJ?=
 =?us-ascii?Q?xmEMMrueON2KtMp34s7hdkwc+1vwpo83yBYF+10UnyHj7rOmWiLLja24pr+L?=
 =?us-ascii?Q?iTeqez0gThoToNK8KU6VuF4Xg/f6BMZgUMNeIBVsdgGi+qs6xg2TfLvqimqW?=
 =?us-ascii?Q?HbekPzent9tBjmbtcPg9CoHoqNbq6mVdlIHgVd0AhrwvZARf6/4q3H+asF/F?=
 =?us-ascii?Q?7XTwgZvxu4NTqqS42bSVsvCUw6QRl0YZN2R84kOV4yc9cd9gQ7CortgYcZXq?=
 =?us-ascii?Q?ul3kjtMHuv+Hm3xMhknmdfPQX+QAxmOWpi0tXvvSqwYwNuo7oN5w1EblBKDT?=
 =?us-ascii?Q?CRmtg64i4yaVpwoCw1O0K9A0jdPWQa9++boN2C7YQuMNqeuWFYhfLWN2tOCl?=
 =?us-ascii?Q?8kKpALGq7Bbd7BpIdoleDUav6uJ8mrzCefkCEg+CzpOqJG0PD5wpp+GXirbj?=
 =?us-ascii?Q?qtin6hnMeDGVpyTflY5Cit+BHeeVnUf+smCwvlaWtn2K/hwu2UJRukYxVROc?=
 =?us-ascii?Q?VlCNP0PCWzo4IxhGS/nf4UGUGqyedqsVuFb7b2WDpCE52ii+YWxFMCtgnNrV?=
 =?us-ascii?Q?5I3zAiZLff1FUDyYU5/uTswTi/YumFzv8jcvXAxoUzi5p9rSCS7zW/Yd2FVd?=
 =?us-ascii?Q?1B8AOF/xGVuMoWUtgIOUK5UgKR865d2TbcukyaniRkQfTBqFztopgcGq7Fo4?=
 =?us-ascii?Q?rrFe0JBiF/a8+Z5DwYHYCrG3uS2LbAKf+u8jvGX1B1ri8VTKlsu2sviFzMid?=
 =?us-ascii?Q?45j901N8dJprWiYdGT1RYUsGIm8nzxjik7e9wh1dbGsi9hwzYWSIOg73x6Zq?=
 =?us-ascii?Q?QajrCM62Bg4APmJolDkJmZ80nkc/9wj02uzUH4bNI2qD7xZctygsebJxC5ew?=
 =?us-ascii?Q?vxKskzUi6nLwB9VvjA6sf8y63H3jBzhZTvGLKyM26k66kHoWzbTqaIWjn+q3?=
 =?us-ascii?Q?RGVeiW8HdDVUih6isi/YxiEKwruEM7PNptGo695e8cDfXLg9e1C2MBVDrsxl?=
 =?us-ascii?Q?NIqF6V5Qp5aAmoaTUbAr/6H1V+lZ4tkt/P1MDblzUM4sclvputyELt58kiDt?=
 =?us-ascii?Q?5uX4atTj4hpLFtnyT22froJ3JrrLBK1g7pdCy6CbSabSQDBurzdSmq3Dg3Qb?=
 =?us-ascii?Q?k8r08Xt2ohOTVUbTXgsD9HtZ5d9NpFMibwpl/Vte7Avrr6LUQNnJLMEkMNwW?=
 =?us-ascii?Q?1i++231VuCxRmDTJbxv10Rv/oom2+HExIffr0nkEuFL1yeBz2jG6HekMeRDw?=
 =?us-ascii?Q?7ekPIOax61qJLC13LRx+YMNxG/uHz3E0KItMxSWbTLP3DK5QoLLLSJfxJDOB?=
 =?us-ascii?Q?OdZ/jK82RL5zqNCVgffaMbkwrbpffjM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e27ebd-8a0d-4183-218c-08de6f3ca382
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:25:36.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zceV7ZLoHc0FrI/fF2RHqYlo9wDWRzWgK/x1hSkondCsZKJxKpAAulCZdKomj/EKOhIuBL8zOGnRuJ6Qd1gDyYr3V6Q8k00hhD3dJsyJcN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
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

On Tue, Feb 10, 2026 at 01:58:26PM -0800, Harish Chegondi wrote:
> Engine WAs are not applied for SRIOV VF, even though they are processed.
> Remove the SRIOV VF check.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c9ca74cb77f1..d512a9ca82fc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -694,7 +694,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	{ XE_RTP_NAME("18041344222"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
>  		       FUNC(xe_rtp_match_first_render_or_compute),
> -		       FUNC(xe_rtp_match_not_sriov_vf),
>  		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>  	},
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
