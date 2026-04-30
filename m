Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E59FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 03:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB3610E08B;
	Thu, 30 Apr 2026 03:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+uov/sQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188C10E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 03:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777520681; x=1809056681;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BotF4NCSIOo3SS1hxdxF/i6G/QnF6yJ6vg87ZSlEnHA=;
 b=S+uov/sQJkhPR4VEXL+IPCi6TBMPf8cUooy517GCOITmT0FWcmMdUpBA
 9Rta1MadXN+4hNu/2CCAb4d3bmTFr/NAbMta4y1yTIUoyLRVX6OMRSId5
 IOVk6gx8L4WK8gX8AZST26+zdZVUqSkXtk8kNOPpwGIZvbSal1PIrDP7S
 YtPwc5ejt0fqgHXw2VAslH2k9t91khm9iuLpeCDn8oc4LnXr3EfsI8k1T
 1Xt4Em4n7Nyg2Lc9gVoZnfc1EOha9BMN1EYzyTvSOQyfs4tr4edkl9Zw7
 7fKYBV4TPQ7hEMm84A5SPFkl/Vy4flk6AxctfG09tOtMZgRoBZBb38m6t g==;
X-CSE-ConnectionGUID: vUQhD7UoTra29FUT7HqObw==
X-CSE-MsgGUID: lEynSiOQTP6v91/B0SKg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82326106"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="82326106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:44:40 -0700
X-CSE-ConnectionGUID: Zmf/hRWURHKfZNUzWNQ9GQ==
X-CSE-MsgGUID: tDGEm+qERp6qghwi0No4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="234343177"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:44:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:44:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:44:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:44:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFZHb2z3AzZCXYMJpEwRRPln1hsq9nuASjoUnXu/ai/lnLBev2TirYxTIKy+J04KeVZ41rUR85/9scRaGJvA77SrDPIT4WKdi7jMz+QciPhpFhsnRfpnR/3UsYb+ywneLFBj37U8VqtZvkHarGWcuqeOLxokZ9k+yMljdK1doxAd2b+rkq1XdZZxOLKQ0eM8TexgOLf+oBgC+4dQr0Ha0JH5N5/EVGXiByl6TTpa4Q63jaPwPQqOzet+pXyBGhMTnB/CUvi6dGx2SSloOLOpx81s9E8wtOwu6HutVTMfh5g08meb33x3oW7XCtPJ7AjHB9IzidBGXORHy/W6qS5UKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMk4kLeZAazVVh/Kxsgn+ZbP30isjGKN7k8fu/YHMZo=;
 b=J6oM6Hg91eGfybyM5Vmutn42HewAiEcq4KD3IV3UlnKF3lO70LQqGLhczmmPjgyJbYRDEkYG5o2tiiEEexbEOF0KfZGQwuINlWlGD1fT6mLIbw8Nqkandi2GVyVX1M9YLT/3OwAVLqTeA8QOLf3Tb4NCpbczmOG6rurXmKe8YyMsl3gdzpfGsAOZSc5RcnogrWllM9Q6DyIGF8JB3pPbnO5kM5Z/D/dW5vjxpGT4RR7GnIrfVORzZyWqU/x3tUC6g09G+6bWGtbeNKeidnhuIUnfx7wwT928GMJ1+FTnRTWpJN6jub6vrsjxe+G5cpI0/3rqgMvH4eTzq/wMIQ8ViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 03:44:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 03:44:29 +0000
Date: Wed, 29 Apr 2026 20:44:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V7 05/10] drm/xe: Extend BO purge to handle vram
 pages as well
Message-ID: <afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-17-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260416074958.3722666-17-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 739d665d-3138-450d-5cba-08dea66ac85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: cVhPwjZQSyIN1dQKHDvog7js+nTmdGLf9RFr4bmBcMOlCco8w4ZpUlYocs7ielrzKndZEF/X5bvs26E6zZ+pERALenoyA2wrqaX5Bbmz/EQh9K8e0eYRpI3QYpKnaoBF1TCzVcHeO/mGw6tk5Kiy7mQbWX46lTQXVxfRiy4bgigo8ENRdbiru0P8jYqc2wFpGi7qGN4tmqEi+X0uxumEF+ElUFAmPXsQI7IoJj47IEExKGiARpL382mEjoVQJYeWxWamYQmNcag233DPbo8lfaHTQCuUL4ABssjXjksV7Tpt/tR2tbmH/BO5GpgwYpPesaC6DAdlWfLwu6VrPdijjsTLmwy+QDHsw0VhvcF8tRUFzebDqeC0LL11Gx9TxIvBkkmtiTJw35vN+C+8xWndS5/1JJvr0EnKigm8bFrnXobp0T4c3Dt7qiqvAXq0o43nuLIymleuf+TA+vbex9LKsq/vkyS7TVnx1T8Qjx/3VM3309Y7bkl4zmWkeh5go+dAFQL5CPuamw2bzJtgzrVDUqite6JgPJE17O+ayeiTmYLxGlb9/y4X7nFuIK9dEbLz3gAKqmbeSzYjoTQAWCV3N1E1Z/onn2eeTbEPPjRVgn2tQofu805WiaxKcTOiByB46EWnso9SlETkl2aHTX7mNAsg4t0her46jJbh2wbN+q9Ie0chwuyLoJefYe8FlD4ZeYfC5iQkupRgX33FTtu7ZjX1yAWaKpbwCqgm29z/QME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Le2qQFmj7E7eKPiVDOhtmbaQge1ysV7x/xuu3LvULrFnx93DawHL7eKlCGcJ?=
 =?us-ascii?Q?xwnE1kRCm37utcPGIza+26CDfi0NF1YPUjyHtgMxuAibLVQtq/UThJU1xPmZ?=
 =?us-ascii?Q?PQ+4S5h2bixUG+ZhLgSCBlv3zI7iHKY1ObYzZ05W7Tc9T9XZ9IMR/IbCiS1g?=
 =?us-ascii?Q?dnLWGcCNgnzs2jtSOmZzQzBOyCcf9LyB9547iluJkHPw9Yc7Qg/y++KNGsOV?=
 =?us-ascii?Q?DR2gWtMl0sjEyA+xb6wiit1yjOAU7yle+jA6F90fE81GyiCOdRGdxpH1QAsG?=
 =?us-ascii?Q?lvP+f28yRFEfBtRG8SR0KYcN49ezZ5+yr1STeEHWvgNW6sSrbFW3GbKQvIh8?=
 =?us-ascii?Q?1PiZ39HCAC2jrIrtg05kReD+6+CJa7qRoeBbJYnTeMW/EpDvtnvrYw7i5iRS?=
 =?us-ascii?Q?U5z7OEL95mBhkkNiqJvzeS+AE+0POUXtWxcHBkautdjYWqkuQ75qb5ZXOgfR?=
 =?us-ascii?Q?taEvoRRZSwo/TeIPeM2bRTgH54cCtkNWmA30MryTkqc3VnCvZqVGcYYP6DYw?=
 =?us-ascii?Q?Y10FbajKuFI5B4B1wvSnB16s5hmsTNVSh73RGNVlRmE51kQZWf9sNRQK+NNu?=
 =?us-ascii?Q?K1gZupA6UUMXfefKodXW+mppynPWhFuZzw/RU0mBwkPggyb/jlVjN9qN1QeS?=
 =?us-ascii?Q?XhkzyBj/1i9DpGa4gIoOfwS2UclcM0+K9QVJVNc4Z8JSQlbB6c/D858uhZuo?=
 =?us-ascii?Q?sTYZ66WGzmL01iGIRslAZpyhNzfiuZK6JYKeBUhbaM2pGkh/kt8UELz6kfQf?=
 =?us-ascii?Q?QLZJ2VuoFgc9EFnM1Ldq0zG4/+VC8owff7NrEjI2wDW42dm8+G3Atm/HR/Zc?=
 =?us-ascii?Q?LRp/mJx/Ojtm41PDP9U9iRmmEZys1Bf8QDke1a2EZX3HHqZ/6ZxjBUcJ1Syw?=
 =?us-ascii?Q?fvA03T6AvrbUf5O5TNvgLch7OWKA7Am2iMv7mauSMtM53jWqMjPMzdC22yK4?=
 =?us-ascii?Q?OoOv+9OWeul7HazhsOxIX80flEWuPn069J6bh0fzfY5LVDGmWtjK44OrHpDO?=
 =?us-ascii?Q?6AIB60V4HAEJs7oZa65LbAG8v8AZlrLvRsTQI8YLcTYok9oUqZ0Ck8a/kXeM?=
 =?us-ascii?Q?z7UGG851rjCi9WANB2XGl7mqyjSnCk91fT3Y3EgXUzy5e5aFfJT2EKLzTTbO?=
 =?us-ascii?Q?+WYlnCc2h/p0iU7T/g8TY2d4ZWgDTtdNa+k+CqfGllwSkaglsc3OvRqPLtkU?=
 =?us-ascii?Q?2XqHV92loZts1t2TOn6wzYwxyjxNHZpvgVG6rAKkADmXWpJ8K5HLePy89XCU?=
 =?us-ascii?Q?tRNYO+/4tw/yonOYPytVAVJ5fOuh6QhcEdBhZ7IOpxWNszRq+vP2IM6+Vef8?=
 =?us-ascii?Q?3BlvON1iXTmZAaJx27YqygGJEL2qM6EbId/UroBG016IgvPZ2JlwgbtKLydo?=
 =?us-ascii?Q?+FXVdcOLQmkm+TBPyOHY7TOUGmdJ1JPbiEoJgwAw1TuUdSjRdKwSENSdRlRS?=
 =?us-ascii?Q?pv01edZwcvCwLQ5H4eH/UuXggiGQ6UaR4hBTkaVVD5wMasHHComA88d0Wotn?=
 =?us-ascii?Q?ugZ89E/lAzrbhqBigcaKeJETEM1+Cp6PH/e2yIt8H9qedGUbW7D2yuqSPBjz?=
 =?us-ascii?Q?eOxFPVIVj6CpAxppekxpFWT7ycsgEHcL9MRc6Gyq48uvjIYvNbIYUoNZspQ+?=
 =?us-ascii?Q?SC/+TPTRX/z5MOQ0O+pRdZ8+whbXxbpf7lx6B6yPu0XYRa/VSyCLw47dev0U?=
 =?us-ascii?Q?Y3837geKp2NRm6kQPML4pceLaoIQjo/Jga+3P6wdHStJSiqQKmrxQyvnxber?=
 =?us-ascii?Q?6ZxRvS52Bw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Qgl0//2MUt8xc6HbbWrNBzv8nwFII7KUdNoQrqAs3TW4EYpOIg2Ym+vzc2elgmp408XDu5R9JnOFCIJ8pHs+W+W80ypNV7w6cV7IjFzjYz208jJl4i8VuPIIWSWbCOO5Egdxh0yw1Ms41MPdIkbi495v4k6cmXWnySQkmSQZ+beaAfpAlhwVze6GH4NIe92i/7EZ7ULT6UgUISUz0iRIU/GOSSHwJLZerRB9Y7aDUo9+Td2otcEXBvMSWeYjjusKAgGx1bWCFOL9gbdJLluTIks7p+fIgnO0U2jNipJguT2TYMUlAaeb6KIefX6eHSpuucVvafIYrE53xZNz8N0LmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 739d665d-3138-450d-5cba-08dea66ac85a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:44:29.2756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDgpHMETrVVe/NQu+JAHIoRY1eGnjZY8DaUzA2JToet9j7u7J0l3hDqzJRUOQS6rJWjwy/9jHxMxmLNUsUqvKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

On Thu, Apr 16, 2026 at 01:19:54PM +0530, Tejas Upadhyay wrote:
> Recent driver update introduce support for purgeable buffer
> objects (BOs), extending the API to include VRAM pages to
> better manage memory pressure and enable memory offlining.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 5 +----
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5ce60d161e09..04d3b25c7c8e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -903,7 +903,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>   *
>   * Return: 0 on success, negative error code on failure
>   */
> -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>  {
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct ttm_placement place = {};
> @@ -911,9 +911,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
>  
>  	xe_bo_assert_held(bo);
>  
> -	if (!ttm_bo->ttm)
> -		return 0;
> -

I think blindly deleting this is fine but I'd run this by Arvind to make
sure in normal purge flow this won't do anything bad but afiak in normal
purge flows ttm_bo->ttm will never be NULL.

If not then adjust the existing call...

@@ -978,7 +978,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
         * The move_notify callback will handle invalidation asynchronously.
         */
        if (evict && xe_bo_madv_is_dontneed(bo)) {
-               ret = xe_ttm_bo_purge(ttm_bo, ctx);
+               if (ttm_bo->ttm)
+                       ret = xe_ttm_bo_purge(ttm_bo, ctx);
                if (ret)
                        return ret;

Matt 

>  	if (!xe_bo_madv_is_dontneed(bo))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 68dea7d25a6b..9f55b3589caf 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -500,6 +500,7 @@ struct xe_bo_shrink_flags {
>  long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>  		  const struct xe_bo_shrink_flags flags,
>  		  unsigned long *scanned);
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
>  
>  /**
>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
> -- 
> 2.52.0
> 
