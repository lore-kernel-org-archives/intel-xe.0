Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D1AC5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 13:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBD210E7F0;
	Fri, 30 May 2025 13:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/15vEEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D903010E07D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748611396; x=1780147396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/ZPfCURgN7frbcpv6LR6zTgMDZr3ccfxe4x2TpwCTg8=;
 b=I/15vEEL4gZP7KSR+saN8KXH8f1Bq/DnZ5SuUcsaZWoeUjxonBBMb2QT
 ZX5IC2zMyzNRkENeGAsbBG6PZVkOTu822sIGlpBf2uZLowl7XXnljGfRq
 42EVN+dtbEIRZKAfpveYlRFMJmqzj762Gh12+wa5dR/cacsunzaSxvwyb
 iyH0ZQhRjfZBITHmGkXC6NeQVrV5znSxB7K3LSJvUuUmrwYOAqAIIG8MU
 vKpFHAAzU7ofjzlHuP0Srz3nfyVOd2lmqM8R2fLYdUSXknYwIceToKMZU
 3edcfzf17DqYXCzPFI3ZIUpXKWQSGecA7l/coFHpEPYmpwo7/RymuAKqo Q==;
X-CSE-ConnectionGUID: qrGzUo4ITHKb3rGHRGgjWQ==
X-CSE-MsgGUID: PJyKDUyySWasfbQPO9ZLig==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50853672"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50853672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:23:12 -0700
X-CSE-ConnectionGUID: He2h47T1RveWWLvgdd1juQ==
X-CSE-MsgGUID: pxIcLuHJQU6Tq/PBw60D8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="149143306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:23:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 06:23:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 06:23:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 06:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM/oI9al4n5OgTwYm05XSBp0AxUu5h0CSKw1bxjVtzMEfJLn39bYciepypl9zvDbMBHXUX1uFHVeK1NwFMd+5cly1EXuS2yWhBYM9mCVcYtkRWjEnSchJx4ZBjvf4wgu2v2DqFofAu3t4NGQGnu8giIwD3Yd0LKYsqvziqur/l/H2ajTqobcTRzvuB7L181mE/fYIOaOgyjhjzpQfrS2UDpcsmSkAyyiyY42HHRH1SbwGHzkOWzP04fkklqK6qrDp/mBeCjuJtNr9ndpQexXdGXxNFFIZMzfFBoeGNQjfFrcs5jM/3eDj2bSVCqaXnJPJ/n6mS/I5KyJetCHWA6CYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t30HWFz5GmVToCjfRu1diERfL0LNaKoRn61YpiMZ+OM=;
 b=YTBXxVw8Cmgi7y+8WHXmB0cF7nNLyn3tXgzQw0ChbsEPfKrg2kpi4SKscUpppvTw3p19SAABzS+pQSRSPMOjwi0EPiXFGjl0bYDnD83hYd592SZdU0B71gTTHwiyJhWDIN3C8ILjp87ZA9ZK3R2pA+l6qM+rH/N1UM9ng5l2qTqvIUMhjdDAzJRt2/cL4UeRI1nN9Tpfp0HTcQ85NAEnpBbgv+rycvPBdRPArknUjPhyj0N93nUTNj30Lhz08VnP0JXKp3k2ehvNMFqIWnX4yk09a19uNyzw2D6hUa+hXRwUfcAZ16higpZL7/JZgywfuxe/ETrMTIvyPTjyPkbcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 13:23:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%7]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 13:23:09 +0000
Date: Fri, 30 May 2025 09:23:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/bmg: Update Wa_14022085890
Message-ID: <aDmxOehCEY2KMwgv@intel.com>
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
 <20250530082047.742183-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530082047.742183-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 02501db3-044e-482c-ab70-08dd9f7d1e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jjkJLyly9JOL6PqB7B3RO/t2mE+nUKS8SJQEqicZlQ4uj/KKvxhyiqZJLLgU?=
 =?us-ascii?Q?PYruZfFxSrfmFXmDKpgNzjknRTYoHPX3hk6ifEcUI773Cu3mqwiErbZ1EAc0?=
 =?us-ascii?Q?Pc6uQS9OWYHKZ7WywQAIqZCienLx4qrLI4H6hMFWlmXTW6OfMD36yK+D+Qat?=
 =?us-ascii?Q?914EG7sa4z70l3MPTB2LUDTERupfhcf6DhH6O1O3FtKgutXyMWBVIfyMT2c2?=
 =?us-ascii?Q?3NuyGqZAvxEjyDWYjflJb73EByQd7UtuhiE2HcAeG+f2s+cBvyv+GfeQm1mr?=
 =?us-ascii?Q?EtealIc6jI4t99e3G+/tX9Vkjt5NUnufzHzZgeTDDJt/I5nfDR4htU1koXJd?=
 =?us-ascii?Q?earBXzT1euI7CLZBiiUTnKvUVHMD8JWMtuYnHNR2d3flnzITB8G3NEL4phvH?=
 =?us-ascii?Q?nGxF5quYq5yjS3QX2YioWVNz8oP4pplyZaJN6dmCrIAe4BM2CmiIZ0JFDeX9?=
 =?us-ascii?Q?GptIS7FFXeXVIynic8TUOKschdH8eueUugN36v6HKRxcCTkrJ19vngApXoq8?=
 =?us-ascii?Q?QCjvsy8lJV6Ymlh8eYWp4JgA5763TwqPpLnzp8E8c4YPWHEsgFLV31RvDVRI?=
 =?us-ascii?Q?C6Fe85dtg8BTlJmftOrFpSiCmFuFT1F/smb9i0ETNO0zKcesOAMPktk8fobs?=
 =?us-ascii?Q?SD7SGqj9oqm5ue4dWraG9Ese7Y3mTXjC2GkjrWlyq9ejWIJWpeR0huTwEZLP?=
 =?us-ascii?Q?5h8K57i2FhWFuqstxhP1fuyeXLiHHyy0/K92vvx/a3I7bYkrH4CbPB2BAsMU?=
 =?us-ascii?Q?D5ehwzChv9VXz/Nwy/vYHFIUOzeQC8Y6pgr7Au6dFyqejbZHwBntX/kkd6H7?=
 =?us-ascii?Q?CNVL0Yp965csoJoLs03R2hWqAA5nEa603lG2592HF7PNH9g2vpuicRpapuvU?=
 =?us-ascii?Q?fSX3i4IFJ82D9pII+zH90QJukLs4MKhYWofWUKJ3sIjhJlrkZIdk62kJu/gF?=
 =?us-ascii?Q?b+z6B7uYByJjjhUKHM2QEa6SeA6WfAJRaN7oXppbqtASt9JsOtSpBx0cSpST?=
 =?us-ascii?Q?1YkJ61KOxddIfmeOo7SLn/zdXXzMfbjmmM5IQ8WVciZL+qCsMPpZiP9Ol8fo?=
 =?us-ascii?Q?fS8VDqjBiOJ/iKQ3q+c/8pKykfHIfZE+5pEVdv/M0OdSmf+Ph/8FjCS6rk7y?=
 =?us-ascii?Q?nMrsAGmV8npkaykTYaKqIU3ORUTRFPbvx3okFGMfa1k3IroIUJJ+yN1E5KGq?=
 =?us-ascii?Q?hXtp4NAroDYO7lE0sqnT6TTfef6VRKDpA5ojB3wwmoCOZ52DKZEL5NeC+BuK?=
 =?us-ascii?Q?eig4zcnlZAossvYXZbZjtgWXhT0MNVLZ7IayIh+alj7y8EZNuV3WmSO4/rZa?=
 =?us-ascii?Q?d/6QlOs+UJrtpVI5US6HJ6nrJ4TZ/coSKEqapXCko1+kXqgBkUD2q43d8K3e?=
 =?us-ascii?Q?vQnrFzkGg4MEMYFsZFjNnSMTuOa3CON9LFeOblciq39SDgnWIBf0iSMsRWpH?=
 =?us-ascii?Q?Sb/cR9ckD/A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t6u4dI6DJO37I9+h8svHh6bca/jlKH6ut24zYFd8NjzMEJ+K5YY0G+Yza2cU?=
 =?us-ascii?Q?pnS2ccL2L8x5QOyeGBdwQb3ltv3TnNX3YiUC8dpAaO7TWO3raKD6i41G0kRn?=
 =?us-ascii?Q?8/sF6JJkONnwYLqc82qGLMbVnJ3yBDSqOP4I56rX3gY1U64zgFuoFMHY3Q7T?=
 =?us-ascii?Q?sZXbPKjbOD0x32wa95i3QDA8lkPBKLomjSmPwrAQbmVaA1xAM5xbufntkCgB?=
 =?us-ascii?Q?khMqlOhNjJC1Ub2Kb0xF/bH+8plkPk1tPA333R0gPJq/ZnIBelT5m6g8QBDh?=
 =?us-ascii?Q?YD80qT9fH2ty3v3AnBOX65aqRJNT69IT8Vc7+9sN5S6noMfxiJnrnio/MOBt?=
 =?us-ascii?Q?Bx+3MrfK4lStdO5CWGRh2WgkT+BhapjB0WY62+NfjNjU358RuJwniZafkDQG?=
 =?us-ascii?Q?6k5Eg1rjb7Q/QOfwibjp+j44bukNY4qrwANq5J27MkgHx8sIYOn3ZcZPIJTD?=
 =?us-ascii?Q?SnsDmQp/mLQWi1oqkJhPaeyQmAhKz7UhRj/p0xL4O0pVbJNi//fUgd6GpBUc?=
 =?us-ascii?Q?PT6mTZWB0kq60QA6a6OTjsbcgv0bOVYeMmZBAEldWMabSFLHKpaxEVGlvzpY?=
 =?us-ascii?Q?vy4hBMVJE/a+vvjO3ui4SWYpR+hVYpI8H5anhrWJzYVsA7cK3EcRu6hJhzCk?=
 =?us-ascii?Q?mahpbsRmKvCL+KFPMY50xAgoqcfpNV1n/oDJzTa7wUpVMpW+hpinXbaePU7+?=
 =?us-ascii?Q?qZiSAYskQTcvUC7YgQr6Mk4yPbJhd6QbhLX120y6FMK+uXSrs1jejpQyAO3R?=
 =?us-ascii?Q?xgOqFUs1fgqzivbO4NhVQ2ywx58bVcGivBlZZVALBoVaMUpCAN9S03r0uZZ6?=
 =?us-ascii?Q?G1ih0zdHdCX4Ct6RuZveaPjwl5iN2T4+9t/zW/e0vOI/LhW0/dowc1GaDq1q?=
 =?us-ascii?Q?fbJIAOy8TaJbLInMUkn1K1Q+pQ5KYyMgybWnlNukM8hwKRPEu/cj/Ktln9No?=
 =?us-ascii?Q?tkjyb31n8ATw5PuA2WiwQbGIyWOAhEt81kSo+T0aTfEJEuXRCcEPfmfAG6tO?=
 =?us-ascii?Q?4Za7in6+Heig3PUyCEdmXBnVoE3M50zABzNSgXbKZuc2XFloEcCjcVM8qM1r?=
 =?us-ascii?Q?t4ZxeR00IaYncgO7gNQSTDu8PmvpJqEwylFMwidKAYHYNIwwqMsFt7Nio1Dr?=
 =?us-ascii?Q?IhO54swU1l8jAOtcjPCS67SsxGd2bsr16r7zYdomNm9nutM4ZJwROPf2iZIe?=
 =?us-ascii?Q?pooRnQyyRISLgPzAUKnO8I6fTfv5ydqkwVBtI3xHtjz9gvO4RprrinEA3Rxe?=
 =?us-ascii?Q?5ULiydUOAHyqVp4VlJIsp4eysvI/fvJ3PIFEM0Mmw09pZE6rc7xDIZMK4B1F?=
 =?us-ascii?Q?9eGKVAYi5IzuWftTfhwj2KZ9VdD0UXwbzPIeT0AQj3BknyvJvQA/aGRdiS+C?=
 =?us-ascii?Q?qSsizIHcfHN6MfEc+xwMsBDFlDpSZSsrDLqcJL4QX7NDvytvtJGGIR6LmWLR?=
 =?us-ascii?Q?hJnB3yMTl6XD1vG1wn9A3NA7VsLk2B8pse2gVbl3f08RlyLc1ojbbMSkVRQ8?=
 =?us-ascii?Q?8RjZv8ggNnlxFtVhDGtK+XI5+FBACHzCLHq7ZvzCBqYhVrQz+XWv6XHRlsKy?=
 =?us-ascii?Q?JexWsDbg8nhzkOo4EEUi6a16EyQXC6P3y3YSkAniCmWsp5Ihe4CGubJExKz+?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02501db3-044e-482c-ab70-08dd9f7d1e9d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:23:09.1980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrjpdEAtMhQ8mD+IMtth54e/ErnFs0iZvRPWyUn+lYmnUrC5MpNbAvJiBWN4f7gvd55v/k38WwCsHVjqQp6SHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
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

On Fri, May 30, 2025 at 01:20:45AM -0700, Vinay Belgaumkar wrote:
> Set GT min frequency to 1200Mhz once driver load is
> complete.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c     | 9 +++++++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 18c623992035..513657154dbe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -51,6 +51,7 @@
>  
>  #define LNL_MERT_FREQ_CAP	800
>  #define BMG_MERT_FREQ_CAP	2133
> +#define MIN_FREQ_WA_14022085890	1200

Perhaps something more generic like BMG_MIN_FREQ is better.
Then make this the default and stashed instead of setting at that point below...

>  
>  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> @@ -911,8 +912,12 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  
>  	mutex_lock(&pc->freq_lock);
>  	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> -	if (!ret)
> -		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> +	if (!ret) {
> +		if (XE_WA(pc_to_gt(pc), 14022085890))
> +			ret = pc_set_min_freq(pc, MIN_FREQ_WA_14022085890);
> +		else
> +			ret = pc_set_min_freq(pc, pc->stashed_min_freq);

shouldn't we make in a way that the stashed min freq is the 1200?

> +	}
>  	mutex_unlock(&pc->freq_lock);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..75fbdab68d44 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -59,3 +59,4 @@ no_media_l3	MEDIA_VERSION(3000)
>  		MEDIA_VERSION_RANGE(1301, 3000)
>  16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
>  		MEDIA_VERSION_RANGE(1300, 3000)
> +14022085890	GRAPHICS_VERSION(2001)
> -- 
> 2.38.1
> 
