Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77478EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E1510E8D3;
	Tue, 10 Sep 2024 18:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+xvk7gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AD010E8D3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991901; x=1757527901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JDtLhrovGkvIS3vsxFMCUmfQALjzfaVie6fbAyEl6BA=;
 b=J+xvk7gxZMaeJdx70f0DHfkTbWbphaa5hv9RvdhxILOPWSVbrFrY9sN2
 RHnyJvFgfKzyOPkemlfFm1DxljpL5ejHXkKb+2iVDTxJq70aPUVVnrB3f
 cNoi4HgPst8IQ4FDR4zB24OKCB9iHIDdCkRbxDwHwzGkji0ZOPsbfcZ5s
 40G+B0umRfGpSuedaiCvMV4fvzxOqbfDtmWNBvrt8shI1Zws5ExIBDvjA
 /6OajSgpdX4w0gASAW8/8BokcUuZOqHkzxGcnXG7FHn8ictcb/gInKhr0
 wvqg3NVMM5i0/nLIU+tXbGJMAj/FBUkL9DA7xbb8ynYtJP40Q3c+USZaF w==;
X-CSE-ConnectionGUID: cysRHSuuTvKb6XrgwwguOQ==
X-CSE-MsgGUID: jjYCzxH/QrWcNevKvCuP+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="47280333"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="47280333"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:11:40 -0700
X-CSE-ConnectionGUID: qutapvX1QiO/slnkUFPTJw==
X-CSE-MsgGUID: siRxBV/DRDy3LtageuinVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97805533"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:11:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:11:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmFPXZg3rGW0Q03pYVZbGcohjk2RtTnmrI1e4Ot9ythp/9Go/da4Hs+8sFpCZ9EJCnvhFnfQofuZ2vwOBq3IC0b8/64y18CPpE0TCgjyxGGk1p79YqRW9WEr5qKwwGNrry7Rtz/tEZnyqjtLghPVZjemif7i9HZGIIF+8UyRz41aWTt0tatK6emgMW2pIerxiCFPg0kdQ6q/sqmPMmtfjwLyapfnGUbW24rAqA6xtUZIP6vAsYVralz5bHd9eec0x0jdQOTbppN6Ca62ojxKJwyFdtvnr1vte28RRxwpfccTPYe+nD4ILBxdh2DSyciF01Wa4aGlgjoPOq24XCaK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLEw+PhO6ELnjMKS6vGHRQOddw3NX0pvZmqNEz+7rIM=;
 b=h8Z/i37hsoCtSutEVeEjlU99d71AxXM83/PgwzDlB9WyDnboT9FoJWEXUW5y7/AM8jD38oLnO4FPprbo1t9XdyR8DRXGBskxLIUFFQ91dFifMKlH3k1y3+XtWYAGoOIOHQIZlllwjtDgff7ZTTIpSWLemAzQLczP4jU2FAS7ajHTW/wdqcu0D1Dqf3Pxg9ZaJi9mia88QbqZLvr1biBOE/MGQh3uVxtIZSeZJsrYI+6K+ueF4JTHg5PlMJaLG47aGf2rR6k9eiedtmiAq89fMxk+OefYQ5MXI9cvsPw9A7jT0Ujj8qbF7s8lbErLbGMaOvRR5VtbQZLBW2hPkUEWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:11:36 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:11:36 +0000
Date: Tue, 10 Sep 2024 14:11:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 36/43] drm/xe/gt: Convert register access to use xe_mmio
Message-ID: <ZuCL1TvnapJwEos6@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-81-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-81-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 531c9630-795f-4617-d12c-08dcd1c401d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7MS72/ZrOubC1aqBmNfegNFD9g6kx2Z1/Lau9pMvIAfZtQsxfSgUKt64vBH/?=
 =?us-ascii?Q?BZCDBme2ICfeSQTlMUDE1bZRbXLnoTSQHS3APqaWYc0ro9huolFkARhzmRUt?=
 =?us-ascii?Q?9BcMX88Owgopvw8apigjiz4z4ADGhEbMBKyefsv4fkhVtgoS+g9Ilal77IoC?=
 =?us-ascii?Q?QrfYD54arKD80n0N987n5YLqW/PBVZTNsFnvUjZqfYf1GwQeVdof862SWsI4?=
 =?us-ascii?Q?0g8bC78kWVfoQxLTeM5LrfGaA0GHxU2RV/7fCYjl6hjdqRBIFRC+9DdEGkh5?=
 =?us-ascii?Q?h/Z39lUenlu4gwF6CKxeRQ6jBGzUenbpum9QVNjNeNgwny8VtlZa+1FnBsYf?=
 =?us-ascii?Q?/KNC03K+x5uHX9iAGbXu/h5Xx/0ugbYuGbxtu55hugNuXgjK1fxDpvVizYmN?=
 =?us-ascii?Q?GKXuihtg37bfDyARRCQcpvUXIEKQhT0anvMSQWxq3sg5qZsT1Ly+Rd7Otfvv?=
 =?us-ascii?Q?Ac8fHfP95pCn8JKyTrhgCKSea25SuCh/Zd8x7IOUUzf3pVDvKIfuOsSUR+Nd?=
 =?us-ascii?Q?fejY4V7US74+9AZT3BrH80vm2jMZO3Ubsd6p1J9EABENiiWAjR4L9zvUzxfG?=
 =?us-ascii?Q?OI0J3ICrvKXDiUsiiFPgiQ7V+d1azGr6wVviKQkwp3jQRMqUcoPuAy+NK5lA?=
 =?us-ascii?Q?/f1qYt9TkLx9C+kxCkSCBvaqioaKKQMtnf8PXkKsBH2BgFjF9bfzETOe89i6?=
 =?us-ascii?Q?LOzizX70uN7yYGwE8QNghjuEf5i+7wFT5HYCfJMJUKGGV9zbxrZ3DAeep+Po?=
 =?us-ascii?Q?Obg3S8pxt28/zEQqXF99aWLm6x43sM3v8Xe89JNBkEzCoYvhcomZrBNtRaKy?=
 =?us-ascii?Q?GYZRoJ9SYSe6FL/5SpDkaH26l3242yOB2ekFMBgbUzr0AU35TSeQSx38dilb?=
 =?us-ascii?Q?SWTDQvB7xa1PpktAVkLKDoOYrxXI5aaxYhljXbWuf5p+uOb+/mF5A5hXcpMG?=
 =?us-ascii?Q?m9R7fDyXxstnUsJskmhLEIgCBng7Q8mxpGAXVxxOWOA+QzryrfUHLxMKkX8K?=
 =?us-ascii?Q?DBXJmxxJSWtHulSoFzVkNctxEzRKsboaVok/fKb9HVF+3AhJdNOYIwSD6Xki?=
 =?us-ascii?Q?kyrf1q+PJPHUH097wiBjCdWcEYqfhtK7cAXQfJAR7j37UN6ZyFtIovwGB93a?=
 =?us-ascii?Q?0ZED1TvuFlkGgBfpff6HZNGYEN3iLg1apVfnR56bY9HZWrt5lt/7KaSxBnQ0?=
 =?us-ascii?Q?vQcUEL8w50kbIdT6fcPLWwlbUxkUCyJc5glabE6lJyFkUvThZ5VP37fLuNp3?=
 =?us-ascii?Q?/vnb07gx0IJcG01qbiq14kcGPCaVgKT24vVFYCMzBOK/hCheTpxgqIHP7ItF?=
 =?us-ascii?Q?f7ywHpWcTQiT9pZ1mHM8Z3Z+Zkie4QeUROQeVq5Mkiho2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0i4mg+35UibNyyCH5r3nJDhLWA1+d+PNRtdQKkT8kXEcIN+OCRoUHaBpMS5?=
 =?us-ascii?Q?R1c1QBXkJLP4Jx1xnoJfBN7oB3MHgrdE1sTW8MTHHRW2zZ92X0yHVtYudT6O?=
 =?us-ascii?Q?nL7T/QQbYIJ12OEsbY552XmQyizwDDgwUvNLAs4o+JpkKWr6FPLbLyWdGGV0?=
 =?us-ascii?Q?3KgiyBQiGG1ltf1CmGECGmJVpMix6/MslkqjWJJ+fj1rmi6K3cc14oNVcEGv?=
 =?us-ascii?Q?juV8d0l1NUn34iw9a45XUYkEcqCJBdGV92cHTjRz4eXOPDCkw8NprUhRsqMl?=
 =?us-ascii?Q?R5nkAWfJsq4L3ln+TcT5LSm9l/uufXs5dWvYd6jmb+Cc/EGZ/dwMYdd806ZM?=
 =?us-ascii?Q?Uj3CNX3C8TS193CQnASJ7z9h1mVLZnxmJgqo36/EamRSK8jfPILENpWcSqP8?=
 =?us-ascii?Q?VXgMaAxubdfJsjj2tBffDAREHYtq9tMNIzPbQTJ7kGQnI3r6/kUHQl7py3Vf?=
 =?us-ascii?Q?FhmU5SjMU5Zarp4hI9jYuAm7+b59jh18NT0xJelAQ6xa0d0jqB2R1Tlz5UFQ?=
 =?us-ascii?Q?af3bBE7dDxjYbDeplaNf85YrtYRWOpOWFPy31yVkMp+qRZCYU4QDC2WlUm4b?=
 =?us-ascii?Q?nuqN/evcqspMj38ZE0v51cBhmm0vgELsafGP3Gdf49t0qasZVxSda4SDdRyy?=
 =?us-ascii?Q?gqFC/uCZmIzsH8EficA0dCplqFMY86phfiK5dUdb4EMvvxYnDiXbcbEnArny?=
 =?us-ascii?Q?FUCLCSqREKRYXPamZey8Erqv277gJHI0HpuHJVb/j/tJ6ZePeWJZPTv+RO2h?=
 =?us-ascii?Q?dyTZoNJvfcNs7Vcs7mh4iB4zJShrJh6OlKCLbkFpU8Gr5EEiCv7J40zCQfna?=
 =?us-ascii?Q?OG66URGc1hyiOEL/g7yYGQFdZ1m7z47R8tAMDETY9RmDtOV15MwL/e6MVb9E?=
 =?us-ascii?Q?WlrsLtSSCZ/xuIdls0CRFwOJPdiYp5whIe/befUlG8ENbu2KVCItGBUNxz+3?=
 =?us-ascii?Q?SgUy506IdJiz/wdpxbkLGcHAAMBv/TwVHyNQF8wxSDjWhA0yvcZiMzUkH+iN?=
 =?us-ascii?Q?A+Q4A0yMl8TBd0U0tcAxJylWKI/smEirUuFARFHoFEaVgvzEINGI60mL39uX?=
 =?us-ascii?Q?kvKDL9Oc7C4F0OUpJflfQdTAh/qei/7FOeSNPpSTItG0jq910DZ4EF4J+9RM?=
 =?us-ascii?Q?q3NgSCtKSANCdxLEpzbfbaLM5NONbHR8h2N7FKI5J2ZXeGCqdD2RMd82KKQv?=
 =?us-ascii?Q?DvVQbF4CLInS2IffFhtPr+ptHsufZ82q9DpJkWEmeTv5QBt9CBs4I4l0v+h8?=
 =?us-ascii?Q?Y700IR19jbCHmUfFwVV/MTyG57d/B+wYZLPm4In6UoHnnU4hiIGzCF04LoTp?=
 =?us-ascii?Q?14iT5MBRohTovxv6HoSkOyKnWScnE1jigAl945VmoFI1/FKIN1acZIjMPLPi?=
 =?us-ascii?Q?YEYThlnkk3e9S4fqoYR1L5cIAZ7FupFROS2ox/mLrNeobQ088bUJTZII/Enc?=
 =?us-ascii?Q?Y4yumwpPmYEhmqUipmbdVtjJtXDCfYj0mlWx11sq3ZfQbaX6sPYhwLpEFwxu?=
 =?us-ascii?Q?CtscNMTV26wvCqD5Jprtl4uq6bxFz8Hhf82VZm3pYICLGNP+++pzuctsuZLC?=
 =?us-ascii?Q?khlB/SPSvndVhtnPHS6sqMGlkWuPtcu04EfzMhAr+G2lU2dW6O7385K8TOuL?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 531c9630-795f-4617-d12c-08dcd1c401d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:11:36.0995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16/zvQV+BoQh6HSaDt1rSHyr/FTtV4ZT7y0RSZZILpCZhAWhrK8GcFdlQA0SlUcrAcUW8bUsCSRP6m8FD/80lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:25PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index dd96dec95b19..4a768b5f9542 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -110,7 +110,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>  		return;
>  
>  	if (!xe_gt_is_media_type(gt)) {
> -		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
> +		xe_mmio_write32(&gt->mmio, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
>  		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>  		reg |= CG_DIS_CNTLBUS;
>  		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> @@ -247,7 +247,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  			else if (entry->clr_bits + 1)
>  				val = (reg.mcr ?
>  				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> -				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
> +				       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
>  			else
>  				val = 0;
>  
> @@ -442,7 +442,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	 * Stash hardware-reported version.  Since this register does not exist
>  	 * on pre-MTL platforms, reading it there will (correctly) return 0.
>  	 */
> -	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
> +	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>  
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	XE_WARN_ON(err);
> @@ -652,8 +652,8 @@ static int do_gt_reset(struct xe_gt *gt)
>  
>  	xe_gsc_wa_14015076503(gt, true);
>  
> -	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
> -	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
> +	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
> +	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>  	if (err)
>  		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
>  			  ERR_PTR(err));
> -- 
> 2.45.2
> 
