Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34B4C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 14:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8EC1138D3;
	Fri,  8 Mar 2024 14:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dE7uo3hZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97F1138D2
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709908660; x=1741444660;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7HsJ0nVb964er3hM3khpmhdAK2xwmXsloFjn8l1yzpM=;
 b=dE7uo3hZHfBG8Pq5tbKaA+fsZOxEaeeo+i0yBtHOljxKxhWNRQOHH7f3
 skPq1r+9KCQ/UwRuguox2Sv1Q8smu/oWwdpov+AIWYuL5oipyJYmDQG94
 vL8itbbirgUChLkUs4Y8kMcJZ8KmlNK53+fxSCAbTmYwliprRG+ClyG3b
 k2oaJlZGecROtOkg5ymhocNmpfZHuYKIQtZi9vF/Nz3LAZLxw+r13GmHX
 Vm+VzN+A6FDyhF6xUSlpFz/zezqVV8MAR8YouJ7XxEvlQFcgquv2SGvVZ
 gaO43ey3mI9OEK55HrhrttwGstuQAsKNnOGiZ25aO0CXX+A1+WaGiudvb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4757376"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4757376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="11028773"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 06:37:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 06:37:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 06:37:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 06:37:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 06:37:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ia/fGuGb6CTsIldQr++w7WhLwGYPo8tJA/kZyIXTxsIQSXYmPZM7kLBnedqF1EGGgeY50lx+N8KADLRiJNACwbcRr57pMl6JUIspqT3fEgLmJ1NQub3a/EzLsYgSYIaCRdxifqkliF6Wjazc5fZBVxjNOymdy53cRxQB8ufJYC0jILNkfX8OhvABo+VRuVyrg71ft2kByZnl7G35sXAOKkyCdGBWHXecOL5ZYk3K77Ui/p/p/5IEx7J7NWKJUOgBwJOgDIDVGyYNWTcZDgG7Xm7zVtiORgB689XaQ7RNYcIuP3VPT7K9tGOFGeAmd9WJKWI4pyZghPAqK7RZ6Cr+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwb1Q5UK5ulSXwtEWuS8G9p35ziedVscaKAH5Hwn+Uk=;
 b=KsXX7/iQnJ3ASKkHzOLdVGVmPDrZOqfJicouc0L9RrC/q6Ee1Jh+oMG3ReMY24el15VKxfCQ/FSrd3RcP2hy/1SGAOSIVPa8NKI0jrJRdNIjrRklCRY+dIf9b4eKxHoRtepOaAxmxyge/ZBgLhRsVoKaxdVel5FInH+aTI3zJ9fyIzGxdzZPZJO0GF4JDysWV7wMlCms3moG5dmvtBQ5JqjYNfw4wGG3G7xwWDF54/s+46Jdk3XFCl/1gI6JFnTSpT6fvIxPcLqxR8hB+aA2T8llScJ4OhbS4716gHx12RdTijic0ZbrteA3BPwUgb/KBQb2xXsEXeg0dJrF73QiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Fri, 8 Mar
 2024 14:37:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 14:37:36 +0000
Date: Fri, 8 Mar 2024 09:37:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <badal.nilawar@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: check pcode init status only on root gt
 of root tile
Message-ID: <ZesirH8C1mDsC6If@intel.com>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240308085517.2030484-2-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f8d7bd-75dc-43bf-857a-08dc3f7d4c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjVUdIZ5vougZznc0ApwkLGT3IvG44toOySdQgu+EL2BaUKGP88GdT0F9t0uH/DymrSKO2+Jb9XXm9EbFd7X7XUJXivzJyuBWa41LK5oioijY1R1N4K9AZTOu2lzH4XnlhQRkjjrRkmCZ5f1N99ONb3g9z/fC5eBi5A0sQJWayosZGLakwLD79xbPHB7x5VT8xVh85/TawD5ECRkRj/fPVGC+2zsdfT8MfMYAniXSPNMvUpvw1FyH/KjMVSDvCVvIRX3any0Dgrt73M+RSor8Prsjq23t5TY8KTjsLpG8FB6dNHQS//iX7psy6euBK0YyM0/ZppGPpWkPOQUErpQWSYsqP6LHzNx3u4j2k87rfcaQnky3NND4LYzmpnfkEpJ99WdX8DlEVsN3SOEGarpI2AdWMCujd37OQcSd0GYMurNhi1wFsB94zvqPCl5ccO7tn3/kixspgLI9zYtVKuP26DXWpCYL8Ptu1dh9WQZl2wGU+gbwZqhrxtMKt6AGFGlbqBcdLRRQsPCoaShWekmw6rUd/kK6NPQBjWIuQt3MXVAJVLiOr0nabfBXxcquPBMdE7w+WYVd3ClAxJxVAwlAZaOalUxuIQcF+XGyBYBqF2HS+qWRJTgSxppMhiEL/3rW1kqGoeuZGPths6pB30qvCSX3hGM4BDq3+QvqbwTpyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6rvhKao9sRfLNB//zuWh87EgAu9v54BO/xv1bNAvYoSpp23Rh4cZhbez/N9?=
 =?us-ascii?Q?f+K/MqBsbg232QCWpcmXHHAVxAANuICpmyqecIhKSUZa7IQ+vIU0PfDtDEDX?=
 =?us-ascii?Q?8dnYAjQkTQkPHabb91jUpcJBzByUcAef+fzbsL5bZaBWAIm2YeyIqNam2NLD?=
 =?us-ascii?Q?9ACri7n5ZBZn9dnnyAIucnoBed1l8OcYVrRPsYgVFJf8X7RM2wIICm5Wqcqe?=
 =?us-ascii?Q?eQGowrRnCAgtD+9lp6FrO4RCRXnl2yQiEBiylFauC7cKe9347O0+Sk/gxC7r?=
 =?us-ascii?Q?/pkPknWerrFgZ/XP2SN+aeRZKKa4uLgqmKqBG/l1542q7xbHVgyntL0LrfNA?=
 =?us-ascii?Q?QZTcTkTCOt/3LkyCkAFL5IWD1+23NzclaPDhmEy/6/MIR48s9TkW9GZMVhZA?=
 =?us-ascii?Q?8wl8OqESJr+H8j4AERdgH1YsCJzwibUU8/gxi4Vr0+G0U1DYeFSTkDLRa3yf?=
 =?us-ascii?Q?S2plwzI06nFnzT83+xX1yo/PigIywkSXpRmLzTNk0WUifJEYQhULm0uNQzE5?=
 =?us-ascii?Q?/tyRUqHssuyDS1djNHKS85wu+iuxuDj/IlmmsoLe/uOI+t5wqpSipw54u/+6?=
 =?us-ascii?Q?HoiZkXjuR9IMA86qsjfZRqQ+E9PQ9O8j5QOobFsUgeWwD4ufnYQH5K6LhOVm?=
 =?us-ascii?Q?2Wu/RVzHUOELMzirOto+1SJNNfpdPRMrh/x3zOo3zcbMGrOWKDUKriiaa6sQ?=
 =?us-ascii?Q?XAQJd4ay9RYGuLnmWwbd+g/KZas8h2mThiiaWTBA6d82l2Fya2O/L2fJ/gJ3?=
 =?us-ascii?Q?39Dno0PHyZ9k2fTFDop0B1eZcFJ5ehPkhT5f0S2yvrKi/1DyL7C4baaDTNcn?=
 =?us-ascii?Q?92PWW3wun4MkA408+jvolmL4YySNM074SwA3VpF/fm1S8WlmTMyG7OquIKfr?=
 =?us-ascii?Q?J/9rN9YgtRRLO+6Wlfp9Lmkltqtk+bC/SKILfZPqsyArRFPKZcnP0l+0JWgX?=
 =?us-ascii?Q?6ydJf0hwupjLOIuXPcmHqITV1WdSxYUvc/NrL/EC73t5ValJ9yj34yJgtGCh?=
 =?us-ascii?Q?Mwqw+1elInwD6K2xSKZ/0i/WwMCAbmJUQy1cgnnV/seb+Bl9TC6CNxW4Hqoc?=
 =?us-ascii?Q?panaxFzgpM6YI+TijA0w+Hi1/sr/ddC7Q9OBsSXXZWac0F5DjNRbQKbaeYpR?=
 =?us-ascii?Q?xJ7kkiGtIM6MZxiw2DH2qwlnKsjcxkkTyU+pHBq8XkWO62DOBbrhmtcaii4b?=
 =?us-ascii?Q?Wm1ZFxtcT0M59BQkX6tqdJ6BKfvkMLAjfijwypWs53QAZSApb5oep5/HaXKJ?=
 =?us-ascii?Q?oacb6TCeK0r/Bjh3J2k8LdbkoaqJamM3wY3yFNf45FFPjGN/MjiV6WwuoUE0?=
 =?us-ascii?Q?CnZpIrfs6GQVI/dpU/vDIIQBAjKTrKhLU4hwQ9JCw106YqqsNQZL2N1+ZiQP?=
 =?us-ascii?Q?qdNYEGDE9H2LiUG3hqPjthoTP9dx+coolrrkdmL0uMFg1Bg1pzqcLLE8ap8O?=
 =?us-ascii?Q?mOQz00jOdoiDxPpglpgVlZPfFXZGG61mRO5gs4rlnffge1Xt40erQH15AM4L?=
 =?us-ascii?Q?Y08AK7CLfOTtcKDM577nkZ10QEdbPUOHv7zY+xIpLaKGiTaWfZwDlUBSyjJp?=
 =?us-ascii?Q?l7wU6h4H2nJcmFzixjKUs/60g2msrTkCfiLpXYBH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f8d7bd-75dc-43bf-857a-08dc3f7d4c2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 14:37:36.3821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE7yA6QSCofkCh3+h31YmnjRAADexYJ+hzNzIaa8gA2keunJr5YFSSXNM1bTl/GAnbBsJSJRV7Mygr+NNJX4pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
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

On Fri, Mar 08, 2024 at 02:25:16PM +0530, Riana Tauro wrote:
> The root tile indicates the pcode initialization is complete
> when all tiles have completed their initialization.
> So the mailbox can be polled only on the root tile.
> Check pcode init status only on root tile and move it to
> device probe early as root tile is initialized there.
> Also make similar changes in resume paths.
> 
> v2: Add lock/unlocked version of pcode_mailbox_rw
>     to allow pcode init to be called in device
>     early probe (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 21 +++++---
>  drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
>  drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
>  4 files changed, 78 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 919ad88f0495..83dd60f68566 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> -/*
> - * Initialize MMIO resources that don't require any knowledge about tile count.
> +/**
> + * xe_device_probe_early: Device early probe
> + * @xe: xe device instance
> + *
> + * Initialize MMIO resources that don't require any
> + * knowledge about tile count. Also initialize pcode
> + *
> + * Return: 0 on success, error code on failure
>   */
>  int xe_device_probe_early(struct xe_device *xe)
>  {
> @@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);

my first thought here was that we should also put a comment on why
it is okay to use only root tile. A simpler version of what you
told in the commit message above.

But then, looking further below, I started asking myself about
the names.

what about have a

xe_pcode_probe_early(xe)
that calls xe_pcode_ready(xe, false);

and inside the xe_pcode_ready you do the xe_root_mmio_gt(xe).

and you use the bool to grab (or not) the lock inside xe_pcode_ready.

then xe_pcode_probe continue to be only the lock initialization
although that could also be named xe_pcode_init.

And then on the resume paths you call xe_pcode_ready(xe, true).
There on resume paths we also only need the root tile check.

But only some extra thoughts that I had now seeing the final patch,
but since this already is a good movement towards our goal and is
correct, if you add the code comment about the root-tile being
enough, you can feel free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	for_each_gt(gt, xe, id) {
> -		err = xe_pcode_probe(gt);
> -		if (err)
> -			return err;
> -	}
> +	for_each_gt(gt, xe, id)
> +		xe_pcode_probe(gt);
>  
>  	err = xe_display_init_noirq(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index b324dc2a5deb..6c0009fcd2fe 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>  		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
>  	};
>  
> -	lockdep_assert_held(&gt->pcode.lock);
> -
>  	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>  	if (err) {
>  		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
> @@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> -			    unsigned int timeout_ms, bool return_data,
> -			    bool atomic)
> +static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> +			      unsigned int timeout_ms, bool return_data,
> +			      bool atomic)
>  {
>  	int err;
>  
>  	if (gt_to_xe(gt)->info.skip_pcode)
>  		return 0;
>  
> -	lockdep_assert_held(&gt->pcode.lock);
> -
>  	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
>  		return -EAGAIN;
>  
> @@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>  	return pcode_mailbox_status(gt);
>  }
>  
> +static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> +			    unsigned int timeout_ms, bool return_data,
> +			    bool atomic)
> +{
> +	if (gt_to_xe(gt)->info.skip_pcode)
> +		return 0;
> +
> +	lockdep_assert_held(&gt->pcode.lock);
> +
> +	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
> +}
> +
>  int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
>  {
>  	int err;
> @@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>  	return err;
>  }
>  
> -static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
> -				u32 request, u32 reply_mask, u32 reply,
> -				u32 *status, bool atomic, int timeout_us)
> +static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> +			     u32 request, u32 reply_mask, u32 reply,
> +			     u32 *status, bool atomic, int timeout_us, bool locked)
>  {
>  	int slept, wait = 10;
>  
>  	for (slept = 0; slept < timeout_us; slept += wait) {
> -		*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> -					   atomic);
> +		if (locked)
> +			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> +						   atomic);
> +		else
> +			*status = __pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> +						     atomic);
>  		if ((*status == 0) && ((request & reply_mask) == reply))
>  			return 0;
>  
> @@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  
>  	mutex_lock(&gt->pcode.lock);
>  
> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> -				   false, timeout_base_ms * 1000);
> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> +				false, timeout_base_ms * 1000, true);
>  	if (!ret)
>  		goto out;
>  
> @@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  		"PCODE timeout, retrying with preemption disabled\n");
>  	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
>  	preempt_disable();
> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> -				   true, timeout_base_ms * 1000);
> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> +				true, timeout_base_ms * 1000, true);
>  	preempt_enable();
>  
>  out:
> @@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>  }
>  
>  /**
> - * xe_pcode_init - Ensure PCODE is initialized
> + * xe_pcode_ready - Ensure PCODE is initialized
>   * @gt: gt instance
> + * @locked: true if lock held, false otherwise
>   *
> - * This function ensures that PCODE is properly initialized. To be called during
> - * probe and resume paths.
> + * This function ensures that PCODE is properly initialized. Can be called
> + * without locks only in early probe.
>   *
>   * It returns 0 on success, and -error number on failure.
>   */
> -int xe_pcode_init(struct xe_gt *gt)
> +int xe_pcode_ready(struct xe_gt *gt, bool locked)
>  {
>  	u32 status, request = DGFX_GET_INIT_STATUS;
>  	int timeout_us = 180000000; /* 3 min */
> @@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
>  	if (!IS_DGFX(gt_to_xe(gt)))
>  		return 0;
>  
> -	mutex_lock(&gt->pcode.lock);
> -	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
> -				   DGFX_INIT_STATUS_COMPLETE,
> -				   DGFX_INIT_STATUS_COMPLETE,
> -				   &status, false, timeout_us);
> -	mutex_unlock(&gt->pcode.lock);
> +	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
> +				DGFX_INIT_STATUS_COMPLETE,
> +				DGFX_INIT_STATUS_COMPLETE,
> +				&status, false, timeout_us, locked);
>  
>  	if (ret)
>  		drm_err(&gt_to_xe(gt)->drm,
> @@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
>  }
>  
>  /**
> - * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
> + * xe_pcode_init - initialize pcode
>   * @gt: gt instance
>   *
> - * This function initializes the xe_pcode component, and when needed, it ensures
> - * that PCODE has properly performed its initialization and it is really ready
> - * to go. To be called once only during probe.
> + * This function initializes pcode. Used in resume paths
>   *
>   * It returns 0 on success, and -error number on failure.
>   */
> -int xe_pcode_probe(struct xe_gt *gt)
> +int xe_pcode_init(struct xe_gt *gt)
>  {
> -	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
> +	int ret;
>  
> -	if (gt_to_xe(gt)->info.skip_pcode)
> -		return 0;
> +	mutex_lock(&gt->pcode.lock);
> +	ret = xe_pcode_ready(gt, true);
> +	mutex_unlock(&gt->pcode.lock);
>  
> -	if (!IS_DGFX(gt_to_xe(gt)))
> -		return 0;
> +	return ret;
> +}
>  
> -	return xe_pcode_init(gt);
> +/**
> + * xe_pcode_probe - Prepare pcode component
> + * @gt: gt instance
> + *
> + * This function initializes the xe_pcode component.
> + * To be called once only during probe.
> + */
> +void xe_pcode_probe(struct xe_gt *gt)
> +{
> +	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 08cb1d047cba..e597dcc8ad9f 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -9,8 +9,9 @@
>  #include <linux/types.h>
>  struct xe_gt;
>  
> -int xe_pcode_probe(struct xe_gt *gt);
> +void xe_pcode_probe(struct xe_gt *gt);
>  int xe_pcode_init(struct xe_gt *gt);
> +int xe_pcode_ready(struct xe_gt *gt, bool locked);
>  int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>  				 u32 max_gt_freq);
>  int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9fbb6f6c598a..83c316254e43 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
>  	for_each_tile(tile, xe, id)
>  		xe_wa_apply_tile_workarounds(tile);
>  
> -	for_each_gt(gt, xe, id) {
> -		err = xe_pcode_init(gt);
> -		if (err)
> -			return err;
> -	}
> +	err = xe_pcode_init(xe_root_mmio_gt(xe));
> +	if (err)
> +		return err;
>  
>  	xe_display_pm_resume_early(xe);
>  
> @@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> -		for_each_gt(gt, xe, id) {
> -			err = xe_pcode_init(gt);
> -			if (err)
> -				goto out;
> -		}
> +		err = xe_pcode_init(xe_root_mmio_gt(xe));
> +		if (err)
> +			goto out;
>  
>  		/*
>  		 * This only restores pinned memory which is the memory
> -- 
> 2.40.0
> 
