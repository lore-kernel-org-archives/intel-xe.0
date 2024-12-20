Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8ACE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23C910E2D6;
	Fri, 20 Dec 2024 21:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8dG1A24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5C610E2D6
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734729487; x=1766265487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dX8Lg1ezpeQk4djepw6jIe4a+Mo/Rc4IqELnqp4PLO8=;
 b=M8dG1A24c/EGzjPicXxR9s/ymMmZ7icIWdxSGVYBo7LmrovhNx9ysS/T
 pxOlAaitmotkHPEUUwO+LtHn2QKSISdYGCoUPeXBBQAHLS4yRY+PeBfvi
 FXq2QoEJDYAbMsFklrlSCcD+UxkwP17G6aT7CAXYMRGL6vw+6L+GWWvEq
 dA+IiSDV0vQGCi7k6gSp4bSYn9yTzd3qvYExuibvuhuxiiqsKHnaBaXDf
 Pcm5Rt2xofhwCnFt4PGHO7bp6btcckBxzNlLkuWRF6hrnJhkTg6cfNeTN
 hOi4of5S04ooxOwZrEPV6plNAC22pU7rLEnPjAPzBvMweUYgJvoNqAQ58 Q==;
X-CSE-ConnectionGUID: xsKXqPCiQk+YERlNbMytbQ==
X-CSE-MsgGUID: ruyjC7P8TQe2NNTnoNt3lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34607827"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34607827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:18:06 -0800
X-CSE-ConnectionGUID: mXeg3JdNSOacU2y2uDVniQ==
X-CSE-MsgGUID: PfhFxb1HRFikPotBxkntTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98822693"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:18:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:18:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:18:05 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:18:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saaOBkrWB9p96gA5iN4j7i+0F4JbS++adUbf50FXkRoAT7GTKULCIYxPT3MXfKnHnqbOst6Sk14/CV5hTMGUDz9g5OZJ4pO3Q2NK7Hj2BYDJ+i5gzruoCS2JXI1AoE7KBPahj5sB/n3jnsu+ZZonkhO26hC5dtvYiVYJHmSE7hlTmkSi5Hbx3/m5b9LMen0hDFLUAO4+R4jxjoHdGzsSWbVC4PqQ3shoEXhiq5oHxhWeyFReZNz00Xz90H15hzvjhUNYPtifZYUARCc+KT1yN1pOaohzSl/9YPlVdmRXOL/4tpmpKmMN4w5cDJDGjXldV5YoMtdseyucJsUym1PN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL7keIzulXksfDqjbN46Jb2t/rEcwG6h7w/RFCeMG6s=;
 b=xj//qvs5jF2oT90WBy/0c5oB5xW2g4/4KhY5QqNIWhp5yO0rQlPr1qxDngRm0usjU9uRROSIlV98jffnu0t6DMX3mBDAXHWpm7gJOiAjbLg7hktI5pC/NhG1AWpTLmJL3w3vokCxELgBt3/LgHslqux13sjAAuI1UZiuGPneKzFBUW+Tf6+tXdjrxm5HV7daL4qA9zxQeXVZWth4wAdd2KGFoc3F+x7DgEmJNcOHQDO9SZ/Kvsd4n8KIh78NhPRXHk33gpZZhdpGs1S6msvBHsTBuRyMsJYsp/IHajl5WVaUwlnpaUg9fYY2DyUrMLTvO2IoREnw+h3NQUIsYlkK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 21:17:59 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:17:59 +0000
Date: Fri, 20 Dec 2024 16:17:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v10 4/4] drm/xe/pmu: Add GT frequency events
Message-ID: <Z2XfA0u32v3tvKiC@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-5-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220011910.103280-5-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe3b789-ce48-49e5-8d9c-08dd213bc783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uo/q+paAS6s7M2fGBq2t4tur4y1G2rSsmwdo0UtsN9Teb7hk5ogQTzcmXRoH?=
 =?us-ascii?Q?VJKrJvZgZ19fbKhEaCGVpurFc4f56aagPpYAxeNlH++kyJaZKUFYeoNN0qOy?=
 =?us-ascii?Q?GMlPON1saHgyYQwi6GA4IuvMq0xYIcwARxRno1an6S5TANqJMuFYrJoykV9C?=
 =?us-ascii?Q?BXPKrdemsfVW8Plzj7fN0WLgUHr4Rjj1FtPYW5oRcv0sVvxI7MAahIjY8J1o?=
 =?us-ascii?Q?h/SMDw7c/1h9H7GSzWjiOiMCM0NZxEpTM01m+8C4Nsa+EbOapZXE+souzc+6?=
 =?us-ascii?Q?+3DzMUdQNthKbHIcunn+1yKufdqd66ocBFCmZdBGEjYCrveh+C7/HNQzd47F?=
 =?us-ascii?Q?SI3Nt4KyX6FSSgmKRboMMRavW+ktzsMrKgs89wwvNnFNoZeFJVT6PPPuPFR2?=
 =?us-ascii?Q?ftkPjqWvh6VZRqeDtmnBwubCX+DE4cCRJR0Sdz2cHhyFMDb4C6y4Vy58Iypq?=
 =?us-ascii?Q?e4SnP82vUoxREWM+ajor1BzbHIpir3qse/clhC4X21cGv60DOKLhfUfMuQe5?=
 =?us-ascii?Q?nReuut3ztFasEdY2ofnscDHzGuXKevsARxLsIXcdfLkH0Dx6hnKFPDk5qzEW?=
 =?us-ascii?Q?tT7DOfvl5ivHawbAPoS14VxvmCYhjxvdeR4iVhET9hL2DrVIt3VUJnzZHB30?=
 =?us-ascii?Q?BwrRWQE0LMbBEIunLmof5q2F4U1Ml1Vu2O9IAlruuolmmcqtPK+gkeaclDLm?=
 =?us-ascii?Q?OD1t7m4MKpZoj7xGsnbqdzc3f51tks9uKyPigQrxfcCoyy66HfzJRfIN5b/w?=
 =?us-ascii?Q?KvVIRvZkMmIeVMB29xKOJqmhhK21Ao26Jhmy7EqqSj5cyqMLCTpgXvOutcpZ?=
 =?us-ascii?Q?VTHG/+WvlotHeiSNvfkL4nw17rr6HnnrtaLC8w21NKyj5oMlX1ruqAPCUDxO?=
 =?us-ascii?Q?K7h4EZOGXGtoJoIWsx/Tvq9lEwYwFaGT/pEC/ipdkfCenTNt4T9VntC0IXEM?=
 =?us-ascii?Q?zqtA7C2LbKCqNWZAWiBLUQvzDRa4Am4JvrvMQtcPeUNcq8hbLwzB3PAf2IlZ?=
 =?us-ascii?Q?FCmTSZS6mgUEIx2iuB+qqNlLefF0R8AG7DMv8JUypGW05OMyZIuusZKwpfJH?=
 =?us-ascii?Q?EztptH/aYB0mQpPG/clZtuA1O3sGMag2P4ntICP7wCuBrj4GmZYsYYNyqJbd?=
 =?us-ascii?Q?7zFzzuUtnPl/Cn5vUHoxKpuXn0b0FeZG0utEB1lFxHK7dRzy0mhzjMq7/yvA?=
 =?us-ascii?Q?fZsUozTI0kgvqlYO69Mz06YYUG4iStFfw/xcZx3mf354+Ff66miuC3jQqZBp?=
 =?us-ascii?Q?nZ6MRM81rSImU/zQOUNCM6QVgtE08S3XGw9WZmTUIoUbB7axDp4H8sTB2Yf8?=
 =?us-ascii?Q?kRV0INmSbuoOvv+n6hjYrTPSRJlaL4tLJeChcPSfLIAy8d+j8WGthd7/7Yer?=
 =?us-ascii?Q?hLDUlnD6CnGHa02e7en+Rod2pCdm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NSOp4FAvO2v2XfRijcoSCTLjbagntqJiCIXbPU4Y3NXWGnsYoGwMVVzvYK8y?=
 =?us-ascii?Q?a3lJOassTq77d8PjXcbTe9t21Hzot9Mo4MuLgUSmmmD0nA5VTyQbf6MCeS1t?=
 =?us-ascii?Q?47SocXIAPMqfNtAviCMTefEPkX2ybb44GpYtdmu1UcBnq3fncRZCFqQ8rxQr?=
 =?us-ascii?Q?An7W0kc+sAifiLoimbQmhdAHedhfgyrGxBb3RvWN2NURiqKaC9yY6QFFtr6B?=
 =?us-ascii?Q?lXctXXqYX19eyms/4Tb49uPJq4COOcHFS4AhjvSL2W/FLQGcl6xWeV7Nh5vK?=
 =?us-ascii?Q?XfUGXAR9Th1c1LYCWc+8D98Al0pFpalinSx1L/Zxnk+SvZDfqpOLoUhfYAbB?=
 =?us-ascii?Q?uvfjD1nhbf8rkdtvrIWi7zs3u4CO2AKnsW5A7FL4tCfHKwe/DcpB8UWZVB7Z?=
 =?us-ascii?Q?w+YS87Ga9SDF3BxdoSclFJ6gXCgBmrZ7Fnt+nkiUlSri5HgHhckKJ5T4GDcb?=
 =?us-ascii?Q?WsJQ+7kzJCHdIQxab3QbmKcduK+Yt4I+5X8QX4LLzbrBnim9mXsMMdGWHzUX?=
 =?us-ascii?Q?1ITywoSiBa0oBLmPyYNaKrDCuJ0nWJpncQzc0yeVh+491Ads3myYv25I/aVq?=
 =?us-ascii?Q?/180vnUUPFayOigDRanUDzQrlFVkfZc20Hw3+W5KGpBoDToTRiqeQ0TywOSA?=
 =?us-ascii?Q?SNgIelMOZD4kZ0dPCMPgpbcSBjBcxYja0ZA5jtFKBfPHSZgZIkPesi7t+d4w?=
 =?us-ascii?Q?Q7a9SeBI/lH9q+WrakUowQ7H71bwDBLVdF8BklHlmQupV4UVuFOSrPLnfnRo?=
 =?us-ascii?Q?du+Df/c3IBRpL7Wi3bSHvAx+3NeXERklOOtl2yO9kR/4MriOsExveSewjGIT?=
 =?us-ascii?Q?5TsEjI7kD8MzZeNYmwlFboPl17ANI/ToS0Vgqp6h5pe9D4cOaWTHbbMQGAqK?=
 =?us-ascii?Q?YTovLuMaU7ouZGP6EKzrlKkrVl3lZE2vF3zjwc79/AjEDmqstE5Wq0tOrlJz?=
 =?us-ascii?Q?SIf3xmF51IssXVyOxYrdH8qYoE8ZwF+b/sCCQKbX8D1UeZJLUdKguD5EBl2x?=
 =?us-ascii?Q?6x2Vf7N8YwNvO0hAEHXUpfOhhr+lzdoAQhJeNsiTzCx0kjITmXQUXr2pjEHx?=
 =?us-ascii?Q?0WJeroKNNBUAmLrZCAxkLvCPdD09dc+HhM2sQ4xAFU+3KiPCod+bsn1udJA6?=
 =?us-ascii?Q?5v5tZEmcvmSGCyvpisZhiq7IBZ3UGe2jqxWXvFpcYfGo+yw1QjQkG/8r0xWB?=
 =?us-ascii?Q?OzyOfG3FkpRg9B2kmzXssLPnb3kXrKIpXCJHwpLDOoCkGBnst6E9Jhwnas4Q?=
 =?us-ascii?Q?6ZcPCOwz3OCvEwO22u2lmJ+aquCG85qYJp80ka79EHvsNmsqwbFpydE5rw07?=
 =?us-ascii?Q?K2dqtmjJTsbWTRMTx2kpwlyy3xjziLm2avT1RexMgoOOnxW7JjjvzbCK3YOt?=
 =?us-ascii?Q?kI19m065FLMn9uQFeUTDsgXZq8mR0dlj37yM/jCRpelGI9XaZH1HNJy+4jle?=
 =?us-ascii?Q?NEaKo2RUWIRF10sjF61vTdg1HMbDFK8AjI+odwcdiwMciU1R30DL2TsxkcSc?=
 =?us-ascii?Q?48X9/yyhAZ0ycjynRK4AhGOYC7hb7Iau8zyaLSmZ8S2u2TVdvF2qq4gTEXVQ?=
 =?us-ascii?Q?Z/le0rxOcan/od/dk8sVTOCmeDuQnmKWUI6EZJFtWKpDrlflCJLzgyCmYgXt?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe3b789-ce48-49e5-8d9c-08dd213bc783
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:17:59.3412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS7Od8hlVr2vWmrn5RDxccX01hm7xyT3Y2vlG3pR9+nMUwNy7GYJt+UvgRNkZPCrHiDT+XZ2ld0YblZN3uz5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
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

On Thu, Dec 19, 2024 at 05:19:10PM -0800, Vinay Belgaumkar wrote:
> Define PMU events for GT frequency (actual and requested). This is
> a port from the i915 driver implementation, where an internal timer
> is used to aggregate GT frequencies over certain fixed interval.
> Following PMU events are being added-
> 
>   xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
>   xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
> 
> Standard perf commands can be used to monitor GT frequency-
>   $ perf stat -e xe_0000_00_02.0/requested-frequency,gt_id=0/ -I1000
> 
>      1.001175175                700 M    xe/requested-frequency,gt_id=0/
>      2.005891881                703 M    xe/requested-frequency,gt_id=0/
>      3.007318169                700 M    xe/requested-frequency,gt_id=0/
> 
> Actual/requested frequencies will be 0 when GT is suspended.
> 
> v2: Checkpatch fix, moved timer code to this patch
> v3: Fix kunit issue
> v4: Checkpatch warning fixes
> v5: Make PMU events per device (Lucas)
> v6: Reuse bits from config mask for gt_id (Lucas)
> v7: Fix bug in pmu_enable (Riana)
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c        |   2 +
>  drivers/gpu/drm/xe/xe_pmu.c       | 259 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>  drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++
>  4 files changed, 288 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 64e60bcf131a..88ce52c63018 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -939,6 +939,8 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_gt_idle_enable_pg(gt);
>  
> +	xe_pmu_resume(gt);
> +
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_gt_dbg(gt, "resumed\n");
>  
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 1115724a580d..7b0921ef8a1b 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -26,6 +26,8 @@
>  static cpumask_t xe_pmu_cpumask;
>  static unsigned int xe_pmu_target_cpu = -1;
>  
> +#define FREQUENCY 200

this is too generic... please add a better name to represent what this is for...
specially in a case that is adding gt frequency stuff this can get very confusing...

> +
>  /**
>   * DOC: Xe PMU (Performance Monitoring Unit)
>   *
> @@ -65,6 +67,29 @@ static unsigned int xe_pmu_target_cpu = -1;
>   *      2352945
>   *
>   * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
> + *
> + * PMU frequency events use a software timer to aggregate GT freq values over the time of capture.
> + * This allows us to calculate a rough average over the timespan. This is why sysfs is the best way
> + * to obtain instantaneous frequency if accuracy is intended. Advantage of using PMU is that it
> + * results in lesser CPU utilization as compared to dumping sysfs entries repeatedly.
> + *
> + * To list GT frequency events, use the following-
> + *
> + * $ perf list | grep frequency
> + *   xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
> + *   xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
> + *
> + * $ perf stat -e xe_0000_00_02.0/requested-frequency,xe_gt_id=0/ -I1000
> + *             time             counts unit events
> + *      1.001189056               1950 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
> + *      2.006388494               1960 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
> + *      3.007930311               1959 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
> + *
> + * Dumping requested freq from sysfs-
> + * $  while true; do cat /sys/class/drm/card0/device/tile0/gt0/freq0/cur_freq ; sleep 1; done
> + *    1950
> + *    1950
> + *    1950
>   */
>  
>  static struct xe_pmu *event_to_pmu(struct perf_event *event)
> @@ -90,6 +115,12 @@ static unsigned int pm_bit(const u64 config)
>  	case XE_PMU_C6_RESIDENCY:
>  		val = __XE_PMU_C6_RESIDENCY_ENABLED;
>  		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		val =  __XE_PMU_ACTUAL_FREQUENCY_ENABLED;
> +		break;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		val = __XE_PMU_REQUESTED_FREQUENCY_ENABLED;
> +		break;
>  	default:
>  		/*
>  		 * Events that do not require sampling, or tracking state
> @@ -106,6 +137,22 @@ static unsigned int config_bit(const u64 config)
>  	return pm_bit(config);
>  }
>  
> +static u32 config_mask(const u64 config)
> +{
> +	unsigned int bit = config_bit(config);
> +
> +	if (__builtin_constant_p(config))
> +		BUILD_BUG_ON(bit >
> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
> +							 enable)) - 1);
> +	else
> +		WARN_ON_ONCE(bit >
> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
> +							 enable)) - 1);
> +
> +	return BIT(config_bit(config));
> +}
> +
>  static unsigned int event_bit(struct perf_event *event)
>  {
>  	return config_bit(event->attr.config);
> @@ -134,6 +181,10 @@ config_status(struct xe_device *xe, u64 config)
>  		if (xe->info.skip_guc_pc)
>  			return -ENODEV;
>  		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		fallthrough;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -198,6 +249,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>  	pmu->event_sample[gt_id][sample].cur = val;
>  }
>  
> +static void
> +add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
> +{
> +	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
> +}
> +
>  static u64 get_c6(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -243,6 +300,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  {
>  	struct xe_device *xe =
>  		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
>  	const u64 config = event->attr.config;
>  	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
>  	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> @@ -252,6 +310,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	case XE_PMU_C6_RESIDENCY:
>  		val = get_c6(gt);
>  		break;
> +	case XE_PMU_ACTUAL_FREQUENCY:
> +		val =
> +		   div_u64(read_sample(pmu, gt_id,
> +				       __XE_SAMPLE_FREQ_ACT),
> +			   USEC_PER_SEC /* to MHz */);
> +		break;
> +	case XE_PMU_REQUESTED_FREQUENCY:
> +		val =
> +		   div_u64(read_sample(pmu, gt_id,
> +				       __XE_SAMPLE_FREQ_REQ),
> +			   USEC_PER_SEC /* to MHz */);
> +		break;
>  	default:
>  		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>  	}
> @@ -280,11 +350,153 @@ static void xe_pmu_event_read(struct perf_event *event)
>  	local64_add(new - prev, &event->count);
>  }
>  
> +static u32 frequency_enabled_mask(void)
> +{
> +	unsigned int i;
> +	u32 mask = 0;
> +
> +	for (i = 0; i < XE_PMU_MAX_GT; i++)
> +		mask |= config_mask(__XE_PMU_ACTUAL_FREQUENCY(i)) |
> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(i));
> +
> +	return mask;
> +}
> +
> +static bool
> +frequency_sampling_enabled(struct xe_pmu *pmu, unsigned int gt)
> +{
> +	return pmu->enable &
> +	       (config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt)) |
> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt)));
> +}
> +
> +static void
> +frequency_sample(struct xe_gt *gt, unsigned int period_ns)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	int ret;
> +	u32 cur_freq;
> +
> +	if (!frequency_sampling_enabled(pmu, gt_id))
> +		return;
> +
> +	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (!device_awake)
> +		return;
> +
> +	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
> +		u32 val;
> +
> +		/*
> +		 * We take a quick peek here without using forcewake
> +		 * so that we don't perturb the system under observation
> +		 * (forcewake => !rc6 => increased power use). We expect
> +		 * that if the read fails because it is outside of the
> +		 * mmio power well, then it will return 0 -- in which
> +		 * case we assume the system is running at the intended
> +		 * frequency. Fortunately, the read should rarely fail!
> +		 */

I'm just wondering here if we could/should use the latest know valid freq
when we read 0...?!

> +		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
> +
> +		add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_ACT,
> +				val, period_ns / 1000);
> +	}
> +
> +	if (pmu->enable & config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt_id))) {
> +		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
> +		if (!ret)
> +			add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_REQ,
> +					cur_freq,
> +					period_ns / 1000);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
> +{
> +	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
> +	unsigned int period_ns;
> +	struct xe_gt *gt;
> +	unsigned int i;
> +	ktime_t now;
> +
> +	if (!READ_ONCE(pmu->timer_enabled))
> +		return HRTIMER_NORESTART;
> +
> +	now = ktime_get();
> +	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
> +	pmu->timer_last = now;
> +
> +	/*
> +	 * Strictly speaking the passed in period may not be 100% accurate for
> +	 * all internal calculation, since some amount of time can be spent on
> +	 * grabbing the forcewake. However the potential error from timer call-
> +	 * back delay greatly dominates this so we keep it simple.
> +	 */
> +
> +	for_each_gt(gt, xe, i) {
> +		if (!(pmu->active_gts & BIT(i)))
> +			continue;
> +		frequency_sample(gt, period_ns);
> +	}
> +
> +	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static bool pmu_needs_timer(struct xe_pmu *pmu)
> +{
> +	u32 enable;
> +
> +	/*
> +	 * Only some counters need the sampling timer.
> +	 *
> +	 * We start with a bitmask of all currently enabled events.
> +	 */
> +	enable = pmu->enable;
> +
> +	/*
> +	 * Mask out all the ones which do not need the timer, or in
> +	 * other words keep all the ones that could need the timer.
> +	 */
> +	enable &= frequency_enabled_mask();
> +
> +	/*
> +	 * If some bits remain it means we need the sampling timer running.
> +	 */
> +	return enable;
> +}
> +
> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
> +{
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
> +
> +	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
> +		pmu->timer_enabled = true;
> +		pmu->timer_last = ktime_get();
> +		hrtimer_start_range_ns(&pmu->timer,
> +				       ns_to_ktime(period), 0,
> +				       HRTIMER_MODE_REL_PINNED);
> +	}
> +}
> +
>  static void xe_pmu_enable(struct perf_event *event)
>  {
>  	struct xe_pmu *pmu = event_to_pmu(event);
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
>  	const unsigned int bit = event_bit(event);
>  	unsigned long flags;
> +	bool device_awake;
> +	unsigned int i;
>  
>  	if (bit == -1)
>  		goto update;
> @@ -302,6 +514,18 @@ static void xe_pmu_enable(struct perf_event *event)
>  	pmu->enable |= BIT(bit);
>  	pmu->enable_count[bit]++;
>  
> +	/*
> +	 * Start the sampling timer if needed and not already enabled.
> +	 */
> +	__xe_pmu_maybe_start_timer(pmu);
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (device_awake) {
> +		for_each_gt(gt, xe, i)
> +			pmu->active_gts |= BIT(gt->info.id);
> +		xe_pm_runtime_put(xe);
> +	}
> +
>  	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>  update:
>  	/*
> @@ -331,8 +555,10 @@ static void xe_pmu_disable(struct perf_event *event)
>  	 * Decrement the reference count and clear the enabled
>  	 * bitmask when the last listener on an event goes away.
>  	 */
> -	if (--pmu->enable_count[bit] == 0)
> +	if (--pmu->enable_count[bit] == 0) {
>  		pmu->enable &= ~BIT(bit);
> +		pmu->timer_enabled &= pmu_needs_timer(pmu);
> +	}
>  
>  	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>  }
> @@ -497,6 +723,8 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *unit;
>  	} events[] = {
>  		__event(0, "c6-residency", "ms"),
> +		__event(1, "actual-frequency", "M"),
> +		__event(2, "requested-frequency", "M"),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -705,6 +933,31 @@ void xe_pmu_suspend(struct xe_gt *gt)
>  	raw_spin_unlock_irq(&pmu->lock);
>  }
>  
> +/**
> + * xe_pmu_resume() - Restart the timer if needed
> + * @gt: GT object
> + */
> +void xe_pmu_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	raw_spin_lock_irq(&pmu->lock);
> +
> +	/*
> +	 * Re-enable sampling timer when GPU goes active.
> +	 */
> +	if (pmu->active_gts == 0)
> +		__xe_pmu_maybe_start_timer(pmu);
> +
> +	pmu->active_gts |= BIT(gt->info.id);
> +
> +	raw_spin_unlock_irq(&pmu->lock);
> +}
> +
>  /**
>   * xe_pmu_unregister() - Remove/cleanup PMU registration
>   * @arg: Ptr to pmu
> @@ -722,6 +975,8 @@ void xe_pmu_unregister(void *arg)
>  
>  	pmu->registered = false;
>  
> +	hrtimer_cancel(&pmu->timer);
> +
>  	xe_pmu_unregister_cpuhp_state(pmu);
>  
>  	perf_pmu_unregister(&pmu->base);
> @@ -769,6 +1024,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>  		return;
>  
>  	raw_spin_lock_init(&pmu->lock);
> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	pmu->timer.function = xe_sample;
>  	pmu->cpuhp.cpu = -1;
>  
>  	pmu->name = kasprintf(GFP_KERNEL,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index 17f5a8d7d45c..fb6e3819d7bc 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -16,12 +16,14 @@ void xe_pmu_exit(void);
>  void xe_pmu_register(struct xe_pmu *pmu);
>  void xe_pmu_unregister(void *arg);
>  void xe_pmu_suspend(struct xe_gt *gt);
> +void xe_pmu_resume(struct xe_gt *gt);
>  #else
>  static inline int xe_pmu_init(void) { return 0; }
>  static inline void xe_pmu_exit(void) {}
>  static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>  static inline void xe_pmu_unregister(void *arg) {}
>  static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index f47a6e1b109c..5d873bae4a0d 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -12,6 +12,8 @@
>  enum {
>  	__XE_SAMPLE_C6,
>  	__XE_SAMPLE_C6_LAST_REPORTED,
> +	__XE_SAMPLE_FREQ_ACT,
> +	__XE_SAMPLE_FREQ_REQ,
>  	__XE_NUM_PMU_SAMPLERS
>  };
>  
> @@ -28,7 +30,11 @@ enum {
>  #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>  
>  #define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
> +#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_PM(1)
> +#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_PM(2)
>  #define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
> +#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_PM(gt, 1)
> +#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_PM(gt, 2)
>  
>  /*
>   * Non-engine events that we need to track enabled-disabled transition and
> @@ -36,6 +42,8 @@ enum {
>   */
>  enum xe_pmu_tracked_events {
>  	__XE_PMU_C6_RESIDENCY_ENABLED,
> +	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
> +	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
>  	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>  };
>  
> @@ -116,6 +124,24 @@ struct xe_pmu {
>  	 * @sleep_last: Last time GT parked for C6 estimation.
>  	 */
>  	ktime_t sleep_last[XE_PMU_MAX_GT];
> +	/**
> +	 * @timer: Timer for internal Xe PMU sampling.
> +	 */
> +	struct hrtimer timer;
> +	/**
> +	 * @timer_last:
> +	 *
> +	 * Timestmap of the previous timer invocation.
> +	 */
> +	ktime_t timer_last;
> +	/**
> +	 * @timer_enabled: Should the internal sampling timer be running.
> +	 */
> +	bool timer_enabled;
> +	/**
> +	 * @active_gts: GT active mask.
> +	 */
> +	unsigned int active_gts;
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
