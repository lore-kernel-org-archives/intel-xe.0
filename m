Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE04C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351B410E09E;
	Wed, 17 Jul 2024 19:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtBgyfAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B985210E09E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245809; x=1752781809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lYxsgpW5lj7LdGSJjdU4TJL3frqNHqcxZId6A7kJz1I=;
 b=HtBgyfAv2a62WRH0Q9h1tX6Fs5DbQRsTXJyqNTX6ROrHCT0qofJ6Ds9m
 NL7PQvufe34qWkgI4YsjS7QTGCrlzAacnvtvl/32NfWRIZkT4p0xcaGcx
 i6mCme4IVGtxf8FOb9mkAYOVN2rOeKm/R/UZUa4dJ0ubV0HcsEqQH47PA
 MMmJIJ2eOrEehR5WPaluCXQMlue3/3278lwULlsC+3OodShRCvNlHEGw3
 oOz4Ub9whCvdC1fwwPmRnTRmrVGkekOYN9R6lATa3rkvJgphzpveWKsaB
 qNJfQyiljdBOF/Y1PrBdwYK7BNqTZoHuLiJyXU9xPtoR0BnPaITerju/O g==;
X-CSE-ConnectionGUID: Xmql6ElGT/uLBIU4X/e4gw==
X-CSE-MsgGUID: zpwjSOTJQSWqUvpTutaE/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12595031"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12595031"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:50:08 -0700
X-CSE-ConnectionGUID: tJXeX1exRiKWkU4r69fIKQ==
X-CSE-MsgGUID: vCXCxCcESxOJnoSxNlnp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="55348498"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:50:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:50:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:50:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:50:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaEsuDkGRx0R8jHawnzD6ERDEWuG5sOWS+UUNnW+FEc8Xwu9HF1hd5dZ3xHeW8QB84vSneTMmV7czYzMvXzEPtAX/duTdUeuac6kenI0VuBVLtcwfZEHNi51EvDmpvqfb4l4CLM7yJBKM4xckiDtv3EP1UB2lb+E2x811A5xw+2XZ07MYjXWda2BtzbLJfvUuXkkKi3I+3K/c3kD5AOtUuyU/TD3dEs3p6nuuhTre6gBerkwSEw3zkZ8bD0gpPS/lkxW4sd5gkyLfKpfr576mzLmcwx7GyOTHr73tm4s5puNrO4uKDtWewQTDZG7WMgXEvHhtwkHLbikLjyapWTVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdKOnRDZy2rxJE2zLvl+Hd58nFZsr2TurxmxCVCKrlk=;
 b=Kz8jZ8cu8VRjN6sXyG0cVJkCaWA9wcotlgZ6Zbc3BcmIOTexW4saKSAcLWnDjhexaXTmSU8bGb3+/p0Ehu2STgMrMSl8xWtI3wcEy4UR4G4ErHehK0jyiAfFC/GUt520Dz0/V63BC4OLdKk3cTwltlKY4NR8mqHqi2/okxZqwi1dtfiZZMufnpi6O9LwNjfwxFd/ZrQ06j0skBuMDhra+hB7tOAR1ZVlcG6Ld8fLEwRA9dMqHEJapz9Upda9+9UfS1X74LGfYCXhYZILY33+o12ccNUwv56BQzqXsQwDrG75g8t8K9nntiUw8ax7joi2jCzBvHrmm4/dyE89kaf4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 19:50:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 19:50:04 +0000
Date: Wed, 17 Jul 2024 19:49:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 4/9] drm/xe/hw_engine_group: Add helper to suspend LR jobs
Message-ID: <ZpggOax+fTveEaNF@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-5-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e30eb25-fc65-41b5-fb52-08dca699a6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w5sRZnsYIEyionVRQi80O7i1TO1bTpxyoC1Fch/GvjxckhmXyfeyunZtuHKF?=
 =?us-ascii?Q?VCA6htIiewt+l9EiDUsDJTaLU/sPbkeajaIt0hSb35+x9A4Wg155L63S++uQ?=
 =?us-ascii?Q?T/reSjfQSpyfqcsMEaLasHiVaUzwQTr3ec6kRAmVR5k0YtVw7+oRpbqnVrYo?=
 =?us-ascii?Q?Eg76xRHQtjAJsxMKqStxqbQlhV0Bj66jzaPfPyvOQk2V5yBV8py1FtCB8kbY?=
 =?us-ascii?Q?AwdvsXDhXDlftF8LFguk8xfmKFUWNE2RtI5V6IDvmV3CUOISgWICstZuEFMt?=
 =?us-ascii?Q?mipqw0WFya9WTX9diCuZ0oLIJIeXj/1pkvzE/6jpHPE2FoaTpooQxIOHImg4?=
 =?us-ascii?Q?kx+pJ+YS291PaIT1RAhLVLCJRGBvmQyIoYYruYbSkW8NCYZJYDAZr+VfxWIb?=
 =?us-ascii?Q?85XcyoLJVWku8R5jTQTSjxapKsioMYUuvfipz5Vzy4GXIuevGHAQ07V3C+9F?=
 =?us-ascii?Q?hTAiS9MU8I2dDUdBT1FHEy0ctJbDSjlPPj3C+X2i4fVgQVy2GC3nzAPS5h08?=
 =?us-ascii?Q?y5RipcSEn9SPgeXbdZHWjMZsesq8oJutFyeTAhIHh442Iqx5xuIxLWbHSlxj?=
 =?us-ascii?Q?VhUiz2ZfCM2/EfkKdVsDc8ig4Djl2CeOsxF7JV+32i+4teHYOOfiMxNP+Oxj?=
 =?us-ascii?Q?ZPfeJC3rGxcR/LfvpUiG9iF9xQ1hmz8h5Jo9Muqo/SXIMoxbaTaNruQfr0/w?=
 =?us-ascii?Q?gXhW0yjZ9fD8563aVoAGQuyhRRFDSCCrOSLpIkzwbTg48Mbosdh9hbdydezA?=
 =?us-ascii?Q?GeqmvW2XTXRSNO6j8+SdnRV9yZzjpILhVO8X2PjJ+/ai695r6EFDir9ONwQ3?=
 =?us-ascii?Q?GGIPhA4gNLtcrF7mcEsk10UMgf352Vm37MagOFyhIy4DsASGTPUHtQfOfbyA?=
 =?us-ascii?Q?eGw1OXT7GnIveFCjuNlbFoYtFuX1oKiL2uEQNURvKjZV5M/AFfJTeLHJNu4d?=
 =?us-ascii?Q?ubaQrBdEii3zYT6TjIx25TpTzh5fq8xaKr0CqwQA+KFrEyQ6WSiZqVjTuwwG?=
 =?us-ascii?Q?VEhlcxwRyj65JkryUr6JFwgXhIzdrlbB1mvHxRrAPnzSTRieYGjKS93YDRlG?=
 =?us-ascii?Q?ociCAxSiRXgQNhP+3L6p9LuSS7BYyvqc0QoQJ3zmGeugDpHsJFdTazLqINdH?=
 =?us-ascii?Q?vPoatKfTlNESviLWrjq4dqAXDLTVM7b9/an465aT0Z25KEhNmepnjCwvaRWp?=
 =?us-ascii?Q?raTXqqdB4rJWRudZOvLs7HJHs3GhJrNwQPR4qRb/to9FqPMXjGN/7itYVT8E?=
 =?us-ascii?Q?2/1Y3K8j6OzyZfz9ywxTKmtezZ+AAPN33RUYiQyNh1R9cnWMUX7f04cEnnD5?=
 =?us-ascii?Q?YiPM8ZySlgUjOCGJ9hsXtdfm9mayIbUc8YUkQPsQOw0oPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V4Ey9A3csz0+/vFWDpyVMI1FLCexjptWbbzK6r4hanr4Rg/9VHcbXWw1CwLb?=
 =?us-ascii?Q?QXnPtq4IN31vmJpD8vp6FKulR6RKKHj0cBHeZeoLt58MEH9Ex42X8x8Px+3r?=
 =?us-ascii?Q?aePGe2xZmP5hW6zu820/C1xjncE7uioNyuVdVilNOvX/nyRpYEaxPjMprTSK?=
 =?us-ascii?Q?Q2ivaAsl0k8yGe0E3XRBltGdbOfOVQVybR20r6XGwI6WJ1SwNvd/IiJpBFti?=
 =?us-ascii?Q?9bxZha+SmEU7VRNGADIcaMtYE+Rq3XWkZPCCXVpUspmboLxxu3ZlNDZPabDC?=
 =?us-ascii?Q?iym1BPGnWuxU5YqIgRhWi9hIomsHMc91AwmPZF+yNkjJqlgTPkostZ/OJa4W?=
 =?us-ascii?Q?ImBAdbm358J/HHoytyMViOh1HFZ0eSRv/Gb0igZbzCGGIXm991bYnKb/Vwv4?=
 =?us-ascii?Q?C7pQ+xVKNvuVLVBlmn0pyEMbUCIl47fLqNLl8w51z6e3thBrV0yJ60cV872t?=
 =?us-ascii?Q?MwyB6HSetaZnncK6yxkHI6HGWIO5F3MOhYZrZ52YalPBZxgsRZmi+YURcVUV?=
 =?us-ascii?Q?3IRD8jx+H/gy+m6t7at9BdotfXWcO8AS8Rqad4i869W+UPXgEDCHP9vcM8CS?=
 =?us-ascii?Q?CgEhz5wlT5y0Q6BzXY2D/BEHAC61GxLLZ2ks7nti90AJfY/GR0LfjGL+vmbp?=
 =?us-ascii?Q?IoQ25YaRG4FTn1mRTajLagotVDUAbw8LNHdjfa6i/gq2nOJifMYQxIhaQrzf?=
 =?us-ascii?Q?oRbQ8x8kxt807PdMZ67oea6xv/qf+o/oHQp6iOyM5rfuhryfdJxtRIR2GCRZ?=
 =?us-ascii?Q?gg19sT8PsxelUUMWaI8Q25E4nTMkv5JodkkEp6VcqoKtLVcQGRKuGQRDjR8f?=
 =?us-ascii?Q?HKclcT6KhfX66O6qowcOyQuq37/06Mz37qeFFbWmIeP5WNJAlSRU8smGXmar?=
 =?us-ascii?Q?1Uu0n6WMGCInTfA4dBUeEcEA8ztLc1MzjXM0WWmPhkc/Bn4IzC+3QXRVKm/g?=
 =?us-ascii?Q?8SLe59kYxeABLyebxqTSdQ8Azb8LRTaY2cRtG1WOwZuz3IspsoW/ANLaTKAJ?=
 =?us-ascii?Q?f88xikN4zMcoj/RtJOpckhCWsVP/kNtnA0tA16vMNU3/gzB7yYsF5m1efRIR?=
 =?us-ascii?Q?OfuzLQwrtLZ6bFpBTkQC2BJFeB/eWIpAmkfdhOd3dCtRp1NTuvMJh3xkzSzx?=
 =?us-ascii?Q?XbnNVeyc1Z2jjdekMt4d21F71r8o5RPFFXg4gKZKfP+OG3/UDtOO5LQUVv8R?=
 =?us-ascii?Q?pnARsxmh46TlRoDASGlXg2271PKiix33J168lcvvjqZOA2DBIQVxXe4TChC7?=
 =?us-ascii?Q?Qmj1g3Iw4hSe7wUgGLX6mnxVsN2O4Kd1Sccy0lPh5L54KDJaFhmC4vkSeIDo?=
 =?us-ascii?Q?RTMafe1riIBhTBB/PJ1P0fEE2vtomMT8LFApC0SueZ14RtyMCxopo5uBW6H2?=
 =?us-ascii?Q?eSqI6CDF2Nmz4aqgayFhFDQ2m7YiMP1IsQyG8D9dngURXSAYIPvnficJfF0f?=
 =?us-ascii?Q?YpH9Ls+J2HH49tt5hTDWMXJrgUOoc+C1L2R4iY4f2G1ExznwIZG2h+aV8g6j?=
 =?us-ascii?Q?v/VkWIfb98UcxfFUBWgpJh9QgbfivoT7o7XCDb/jLD5oZ/81HX9ulVjrFlW/?=
 =?us-ascii?Q?rf0rD47S0cNYcRwDeDH3IaL5+s+emU3HidKgxZzf8fUyO3nSj217E0jX7Ekk?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e30eb25-fc65-41b5-fb52-08dca699a6e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:50:04.2203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTnPJ9mHtTj321H4AxK6L56MSc7WT5QCrG1U26TFOAjWGXUU99EMLPXySLPo4TJJ9sJFsiEa1WK7IGKwzOEfGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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

On Wed, Jul 17, 2024 at 03:07:25PM +0200, Francois Dugast wrote:
> This is a required feature for dma fence jobs to preempt long running
> jobs in order to ensure mutual exclusion on a given hw engine group.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4dcc885a55c8..850f7b15b154 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1223,3 +1223,31 @@ int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct x
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_hw_engine_group_suspend_lr_jobs() - Suspend the long running jobs of this hw engine group
> + * @group: The hw engine group
> + *
> + * Return: 0 on success,
> + *	   -EINVAL if one jobs could not be suspended
> + */
> +static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	int err;
> +	struct xe_exec_queue *q;
> +
> +	lockdep_assert_held(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_lr_mode(q->vm))
> +			continue;
> +
> +		err = q->ops->suspend(q);
> +		if (err)
> +			return err;

Hmm, this error handling might not be correct. I think it ok for a kill
/ wedge / reset to race here and we'd still want to continue this loop.
Perhaps just add a drm_warn message for now and continue the loop.

Also same deal if suspend_wait() fails.

> +
> +		q->ops->suspend_wait(q);

Pipeline these as suspend() takes a non-zero ammount of time and the GuC
does the suspend async AFIAK (e.g. it issues a suspend, then moves onto
something else, so multiple suspends can be running in parallel).

So...

list_for_each_entry()
	q->ops->suspend(q);

list_for_each_entry()
	q->ops->suspend_wait(q);

Matt

> +	}
> +
> +	return 0;
> +}
> -- 
> 2.43.0
> 
