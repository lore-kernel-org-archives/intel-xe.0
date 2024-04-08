Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF96C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 21:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E875311289B;
	Mon,  8 Apr 2024 21:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBEqh8eb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D4111289B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 21:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712612748; x=1744148748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uLeXesi4OKNZM3PICJj6odDE9grBfwlqfWJ8g3El+7c=;
 b=GBEqh8ebjam5M7ssfU8EcO9yBYM0hch3le3ZBwilql+F+XyWZOouqExL
 XvagYjEUeO+sLhWGYQx7w6AWpiIAhcpviQXFReWn2RrawpOJzMqxTMrEd
 d5KXAGqUtc8s5CQswu8LrGrkOap/yvJ73GhoVymjLyuLI1QjyGPuN+w4Q
 mNN1aJs/Qc5xnr5SKWWsdv+VN4ikr1Rs62xe0O80IGrZ9VWslPSZN4Z67
 jRiib7rt1aDyBj+C/TOsPfJ2XlvZD7hd5Bq3p9qhDqbXn1UriMzRbhboR
 t5EKNH3Cn9ldQFBhIjzEqC1y0ImFb3RFmBSKwTjGHeDVmRiYuZ0AdUK0W A==;
X-CSE-ConnectionGUID: 8+CcSCeNQKy3Y+4nkMCyfQ==
X-CSE-MsgGUID: 1Dm6BqgsR4SY8VBBLzbUrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30399781"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="30399781"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 14:45:47 -0700
X-CSE-ConnectionGUID: vpHdZME6ThSOyIJBInN8OA==
X-CSE-MsgGUID: nVtreNvpT7qGMHSfAr8jbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="51204153"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 14:45:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 14:45:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 14:45:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 14:45:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 14:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLbWesIR81rOUlhssQuWwr2SosdLRkY44AmKJCWo/dEWFaIJR9PqjcV0SZqWoSpNPyPciVGT2bCp33FcxX4uMGnPqgMri9tXgXlaPL9vPVbVd0GpjkYMCssIniAqBIrndSG0g5lu3EFGpOeWY1QVVOPasa+LwLbQbkK5JJ8X0kRJdf5UFWaKMjX6ufDkpY/M9oseVaQHgx7MK7FmxllVPKJneeDh82NOe3Ybvahlmgv55WBrAS3FDJDWk47HauqXJ6e1lklQbdlmBZoL2nvRQvHIEP2Enzi2B1K/24n8HglEi9GShERYxhkhzLzqH5HeEpuc6bHp0tnQDyzQ/9Y+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epew50LeQRQkFsyhOf5Vj3lizKUl1Lf5d02ChTTXOAM=;
 b=dIMO8HoR+GEroshDOoB8HOUymtb9K3M/Qm/SF74OUaI18Vb88ewGV6P5ClYuCSRN3LumlAbiQ2Zqy8uDmNXrn6pXB2cabHYOo63X2YeQRQXm5/+oqD6bvOlFcT1x28FY4tEbvMavnaRQwDXY48ROMBxGV5amQSs+NpAMGnVe+SLW1RFA/zFepGxc8e712P2eBYUzSoGMl7IMosRV6kCU/+nmSmu5a+VwyfWs8pV3wMSnwZ/qJ1VTIRHwlfgF2Vd3iI95CQWJ5awHQUeLj2QBP2UHJf2jTzMqjqzb7nRZUjHGJs1OHllTNt6ZQRdZrgY8Enz147pYNNgFm6hTuJm7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Mon, 8 Apr
 2024 21:45:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 21:45:37 +0000
Date: Mon, 8 Apr 2024 17:45:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
Subject: Re: [CI 2/2] drm/xe: re-order lmem init check and wait for
 initialization to complete
Message-ID: <ZhRlfCMWT-YkuVB0@intel.com>
References: <20240328060257.3690986-1-riana.tauro@intel.com>
 <20240328060257.3690986-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240328060257.3690986-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4794:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlvSRmUB3GLvg6vUv4IQxF86BRxuAO8isFAT4Cf1ISyeSl3PQaKzxpERmOoVfd7ii8godZc4VXXcEGaR/FkiBW+qq+AWcTWDzt9W/VjJAYUfysk/hBNCuJ4NduuhnlW0NYpe7rJyqfOECIZkQ67dhHAY+5gV1etU4g23PQTp5ec1Z8ivag9xbBtoG5B0rr2EPKhioB2+km9XZ/Rq7393B/egAWFdlKvtTWlKGnbN8/MEmx808EKakL/nrVo6VSY7C8me1JX89/JccyGrUOYUvLLKyzk1G4hPt+mEsDL2icaL0SBegxN0arrERiPWfrvCCsLDzDPFOst7lwvnwLrvW9u7lUHyizadaYwRl9AQPbDOMulb0DUt938TNuS7zuBLOgl7GIaiQOeSsZvQKNE1nm61r6PPy32IZlCo2WQOOPObm5qZVeBRCCv6awu3K6YBL0uYaKVN+kGAI7GFWEendBxCJhoCldxFNakJrweV4IylSXIuL/hA7iOj1LojWP5X6ytBB0hgcQhOBMhqSJs65AOExTRpruEzPKu7TclmoNXhpB+Y72licf8xpDT7FTHomrnS2iZC2zTc/Qd/rNz3IbRvH89QAm8BQtIVd694/4Q4zN0pgL112VqWFzhOUentGQYk2kiB/AgVU6GZpjfB/mVDidmE/+Ffo88oGuS3VPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ViWcRcDhT1fuceHtnWYgYjoqb9t85EC+e8VayzZtrHYJd63d2MhdCtgO4qVn?=
 =?us-ascii?Q?Rgg/dkNrvOyi0iUC2Eww6szCCqz+WjI6x+LbcGZrbvt9uZHsXSXVb8MqiDvj?=
 =?us-ascii?Q?0CkFSB+wTY6rJnZcRsPcD0M7MarQud6v9LUu10Yu+oj06SnVYs+rw2oUxY19?=
 =?us-ascii?Q?h72R1PUM3lLiv/AH9e0tM23trXKZEu4eMh47A3jdiB8J3gvC8MjoVI0iquen?=
 =?us-ascii?Q?GipKpMg4SoehYkpT0cwUbKcxMR/eqJlss8QvJiEslxeE/6PMuk4dLQG83KGZ?=
 =?us-ascii?Q?McVI9MdklwqgEaQ8PneKP7chyZMh17nUxNqmg0U6xCw3jt6eMFYgZKOf98MR?=
 =?us-ascii?Q?i/Y60bWusvDBaJuMR75y+bMmpWa2mVdHp2MMQ3bf0l5ynUqjxNj8FRyKeNwN?=
 =?us-ascii?Q?VRCI5rtSLCi17brJlxXAqWWUXCDh4Ph6B2smW/Ca6YioK/G3lLxvdQacTyqE?=
 =?us-ascii?Q?T3SXGmC/1qWAYQn9zl6FFJd7Wapk2b1Tw+CK0rRiznuwZ+0pkMzVo7L4kBsc?=
 =?us-ascii?Q?cJ2xJAzfZ9YaObtovHDrBUk3+TknNzHiSPala9O04VZr2v6/WgaVxw67OG4v?=
 =?us-ascii?Q?OlXs1odWoKSSEg7EZz/imD/cRyqjanSOXy8WbtaS2GfRJh0aYlK+oJpw8odX?=
 =?us-ascii?Q?DMfCJ6cz9p+SRQTCsyAo1ispkG6dV7axE7ArUeiMbnRUjVEMRYJgSk3EbHMJ?=
 =?us-ascii?Q?XPOzIESbNvKj8/BBT1X8Z3bOpuyyAQTTkaubOJlU7ijgGEb1+NC55AzZDCdf?=
 =?us-ascii?Q?mPmuTZHaZpHj6/SSuZ1jT6xiFzbenZwKu0yD7b6avL6Im0RukI6mplzL7eAe?=
 =?us-ascii?Q?31p+9fKf+0AFJyb6KOc8DHq/olOx+IuN021MytcYDri6JVePwcQOXHoEZYgS?=
 =?us-ascii?Q?/88mt+2P3IrzjhP9QOailZo8ixj9uxTXHcnhePgXFNkfPY8EWKtilr47ORH/?=
 =?us-ascii?Q?hW1GLEx6QlRN/ClEhS6FhFM3afhwR7CRzDAn+V29zz3Z7LceMc+8ynB5MIMo?=
 =?us-ascii?Q?zwXAX/oDyMX2EzwEhnYpZaUbbGC5RkaTejN2V7HrU3L2i96G8ppousQeAXRU?=
 =?us-ascii?Q?iQHNrv6CMW1knOSmvs8isLZNj+Bcqahk9T10VZwtQ7rYRh7jFZAtV7qptg/T?=
 =?us-ascii?Q?kBAR574FRK0P8/zmW9hyVJezkPT7sCSYIdHkKpngxh56rW8qvT/yJ22MmfQW?=
 =?us-ascii?Q?xKbf2bcj4R7Ec+3RgvILjGMDIHwj45rlx7AaVWBuyWMgaZh61DWVR6y7OyYP?=
 =?us-ascii?Q?duJGlf8+49RaNN/nEfvXfQ9+zViTdeYniQg3bS+bEhS4mHAV/ubj+mE096nk?=
 =?us-ascii?Q?ToFBJ4YtBn0N4YP+4c0/bw2Qr3nnK1culvJzuHCfSniAp6Jr07uZMujzesw8?=
 =?us-ascii?Q?Yshabthy6yNX9uQy+vQ22+YuJvVrFcjZRFZdh2CS1xCEbqxRDxnCfWg7RLag?=
 =?us-ascii?Q?nB+msx3pOXcEH2XxWfqpJafxilCKTr40ga6mG8rsT3wTiOs+omYEeSPd2bnm?=
 =?us-ascii?Q?Up5uvnJHOql/5kJfNseAWl0krNevsaMnCfRusmyNqK3zHykqkLbX2AdvBIuN?=
 =?us-ascii?Q?9OflNL3OyTXDfIU0MGrvq74wXgYZlDQn6CZCnXY8Qt/Xze6i40FsAdExHc9T?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e08fc8a6-e0fb-4035-1cc5-08dc58153a0f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 21:45:37.4697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojl5DWzhS36vHg6gBgFPnfln1k88CaYY4s0R9leowxpLFNZ6LlshyUHQayu6XLouzaSxODSOwkDA1TD2eND8YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Thu, Mar 28, 2024 at 11:32:57AM +0530, Riana Tauro wrote:
> Lmem init check should be done only after pcode initialization
> status is complete. Move lmem init check after pcode status
> check. Also wait for a short while after pcode status check
> to allow completion of the task.
> 
> Failing to do so, can lead to aborting the module load
> leaving the system unusable. Wait until the lmem initialization
> is complete within a timeout (60s) or till the user aborts.
> 
> v2: use bool as return type
>     re-order the code comment (Rodrigo)
>     add comment for deferring probe (Himal)

unfortunately this doesn't apply cleanly anymore.
Could you please send another version? And wet try to merge it quickly next time.

Sorry,
Rodrigo.

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 62 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_mmio.c   | 29 ----------------
>  2 files changed, 61 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 69d05e610f03..be60fa5c05fc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -413,12 +413,68 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> +static bool verify_lmem_ready(struct xe_gt *gt)
> +{
> +	u32 val = xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
> +
> +	return !!val;
> +}
> +
> +static int wait_for_lmem_ready(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	unsigned long timeout, start;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	if (verify_lmem_ready(gt))
> +		return 0;
> +
> +	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> +
> +	start = jiffies;
> +	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
> +
> +	do {
> +		if (signal_pending(current))
> +			return -EINTR;
> +
> +		/*
> +		 * The boot firmware initializes local memory and
> +		 * assesses its health. If memory training fails,
> +		 * the punit will have been instructed to keep the GT powered
> +		 * down.we won't be able to communicate with it
> +		 *
> +		 * If the status check is done before punit updates the register,
> +		 * it can lead to the system being unusable.
> +		 * use a timeout and defer the probe to prevent this.
> +		 */
> +		if (time_after(jiffies, timeout)) {
> +			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
> +			return -EPROBE_DEFER;
> +		}
> +
> +		msleep(20);
> +
> +	} while (!verify_lmem_ready(gt));
> +
> +	drm_dbg(&xe->drm, "lmem ready after %ums",
> +		jiffies_to_msecs(jiffies - start));
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
>   *
>   * Initialize MMIO resources that don't require any
> - * knowledge about tile count. Also initialize pcode
> + * knowledge about tile count. Also initialize pcode and
> + * check vram initialization on root tile.
>   *
>   * Return: 0 on success, error code on failure
>   */
> @@ -438,6 +494,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = wait_for_lmem_ready(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 1de9de4f94b6..06d507998d3c 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  		iounmap(xe->mem.vram.mapping);
>  }
>  
> -static int xe_verify_lmem_ready(struct xe_device *xe)
> -{
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> -
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
> -	/*
> -	 * The boot firmware initializes local memory and assesses its health.
> -	 * If memory training fails, the punit will have been instructed to
> -	 * keep the GT powered down; we won't be able to communicate with it
> -	 * and we should not continue with driver initialization.
> -	 */
> -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> -		return -ENODEV;
> -	}
> -
> -	return 0;
> -}
> -
>  int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
>  int xe_mmio_root_tile_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	int err;
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	root_tile->mmio.size = SZ_16M;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	err = xe_verify_lmem_ready(xe);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
>  
> -- 
> 2.40.0
> 
