Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC6AC4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1D10E8E4;
	Thu,  9 Nov 2023 16:31:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEC810E8E0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699547487; x=1731083487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wtbe4ESStHAVnCqIzeLbCwHxNhCMZ8JDWU9dvuhbNlg=;
 b=BVZgRRX0DlsKvoc/bCb1YGbLAysf5AgUJdjCEn0S9ANxGBTwCj+hFNm/
 k2hBdcA9F7rYLvov5SzNJXNLlBgKW2Kf7ZBSibtJIBFSydQODId3ZZcgX
 SJtq81CFxbPYqdOmoPD0tgIJ/AF7UN0pdIZf3t4N/h3hli1tU0zq0IgAB
 b8sALjTWDx4KqMH0RlHcRgz2b10blxxAivACxnUGlpZWDVqOHTo1xQZt0
 skOJKB18P9H1+G1o6XEuseNkcMyemfwkGHuF8FK2te8s2N/3kxrvmR/LY
 wt6TZ0eP1Hm3/67ru+1nBCc7LBHpeYXJpikVOtfkF0dkQYzKixzsLShEY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392890753"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="392890753"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767055692"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="767055692"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 08:30:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 08:30:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 08:30:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 08:30:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 08:30:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I64gvMn2oTHNDkZWUtajefZoesJnJ2s9+JIcqDYNIqgyMY7QkJbSHEk/tlg8zPf174w0vz08dw/5SBATUYcEwsgUYOYAG97tmipiMTKSmLgkys6exP0HxCl0X6dvXoUWfcbz994uYuatN1neGA/52BcDVZmhDoqQKxZ9i+SsI1qsIN/twtI+wi60ogivfDqtni4Y7QjvCjD6OI1FxkCHleI7H6VX/HMq0F8wTc6XF+QAmYRlpDQMbvYHUoPUn4riCQgyWU85uCUQk4M8lGEm3fYuHd2gbQvPBs9GIw1BrqNJd3U6u/jvSTvFJTfwvfU2VJ0IEryKWyRUrpHnd8paiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idFSED48zYyIa7j40vXwlXlNmrKCEks877kSphj84v4=;
 b=LJeWw0Y1RKgtGxCfOY5UrgJdf9suap8KOkCJrIC2MIV3ihSKZ9vFPmfwPuw5ZSj+ESFgk2Adasjx4/l7sLrwGmpRnddehIXY9WizKJPJ2mw9FqMDmqgr3Tr3zVLXDwQyK3JE5EpHSjgRVRZo9PtiribkIrlVW8U0BnFiQPPLqJxDcbv0vuUI4mtGqhfxzoLkZnHQuJVRBCmBeA84+X1t2Uq4yS5m7PyX28hRYnJ6CweixfJn9A/a9kmlyHmt6+dUQWiJmuK88rYRiE8qTinx1ZM+uUnUjBRMoaiC96S/ln4RvaqFvdsidJOfTiHSL8cRu4kgAwbd/kcrIG8UzfSLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 16:30:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 16:30:42 +0000
Date: Thu, 9 Nov 2023 09:29:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZUymje2SlXQuDzH3@DUT025-TGLU.fm.intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
 <20231109154457.7-34-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109154457.7-34-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba6e741-ec42-4e16-7e65-08dbe141374c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzf1HZSUwB3NbDPb4ZPw1K9HfGhCIaKmFgVcH41XhIm5TlagvJIj6aUWmSq+xzca9jgB/nZ6MToF+6He+cfaWi/KwEvSUQVIf4ipUTy3M7LusRlFi68enHPzHgJkLE4wVQbPrByAHbnElNrOlMLmHwW/CkDwyysm5bIgisjqNj+CyiLymI0xQ7smimX/Ge5tbDFWYbZF0kfzhnH8d6pnfcsqfaPr4eaRB3LDK9y29Qu3WTKaEANUYJwBfbCEbBWSNNaSQu9Pl+XYE0czrWzveZBnU4DAuaNJ+pQ/HQpSRkPXTKiGcpZHiDuMC76wGUXloZqIcmIsE4ICBZpIme99e9vWcw1v+hK0O7DwyVCFZVQaOzdlzQZ+aNfK5eF4JMtMiu4VaNMjiKAuEcyA/N3estO3Pinbp0SVezR7yan7MPcsFz036OzRiZFnP2c/bLN1hFmncRAc7kAsZt7RLFwLlgEKfbbQM4NRv7/Ac6G+NeHcOpRfrblN23h3/ABZ8LEr3vcigSCKYe6CLsvkdEjciWoALG+Bv3v4FrYRy5Vg1tUsT6HlQjOie9+NGIJXuOes
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(26005)(107886003)(6512007)(41300700001)(83380400001)(8676002)(8936002)(6862004)(44832011)(4326008)(5660300002)(2906002)(316002)(6486002)(6636002)(478600001)(66946007)(66476007)(66556008)(86362001)(82960400001)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?856NT45RiUmxYEVtJSgRRgwOZxY5dlaruZxAE6NAfzZNCyFO1bOoBmpWGApI?=
 =?us-ascii?Q?8RvOpkCvpJPHZx9XeKI/Ig9OndopgIUCSF5aPskTxH45a8zHdlwcu20zScpI?=
 =?us-ascii?Q?lopjTC2m3TP7pHupNjLytNgV8y/ab0AhgLLHsixch4gsJt/BeqhrQMQBs3td?=
 =?us-ascii?Q?jFDs2DhTuwo6qXAEt1IG/4oOC0gxocBdcoatMNqVasF0USI9X2i6o/9ECqMO?=
 =?us-ascii?Q?1m2/JnqKIML9fxlW8S/gf/91s/ye5s1fUdXW0WMj0AjiEHpvv32+4g7E4ARH?=
 =?us-ascii?Q?AlS+khLc31dRX4Ia3zQir/cG72ad+8f241CaJJSiGGSh9k2M0pu0TIywmaw1?=
 =?us-ascii?Q?WKxWL3Ze2ZnYUiY2dsk69e37V7JG+fHK5mq0MuSamD52QcLF4jfVNUt4uwu+?=
 =?us-ascii?Q?SH4PSKxH7WsSYKypf3uNJKWBxbrB7TaLs1fhMyM+DT6L7ThNlJ8Y0TZKBrEr?=
 =?us-ascii?Q?Ejr6U0MUVlD+EVPMI1gxMH7Jx3Q7yOV5K6GJwEISVTR++Mg78UlbrBVQiNlI?=
 =?us-ascii?Q?Iaa3MkyYqYa1B2opA1mDqcazoA6n9Ps91UxG1AG6n1FtGOwPahBLMoVQZGUg?=
 =?us-ascii?Q?nCqxIaEjqw6gY0/tXL92YuTUqAXJRzGzWVUExTUndHHKQOHg9VZC2MSJmPlR?=
 =?us-ascii?Q?g/FfCNcjeYj8KPvU8uOG8BSuAGKiHHqVhmTyMlnoRfEQg8/7OrOzugmUP+/9?=
 =?us-ascii?Q?D9a7vh3s3vooE0WThsgs49yAf2oD5Rav1bze9KxPqZntLNi/ErclLJ3kYlV5?=
 =?us-ascii?Q?S0DnkWBnaba2t4Qt0rHgERcyjq2W5hBn3qXptx5zOnKzIK8KyfhUYXmBboaL?=
 =?us-ascii?Q?64ewCz4cZq1lK1VjMcQCw4SwK6ZNcaIKCkgKvJ38sLIScLConZ2UlAIYUUsW?=
 =?us-ascii?Q?VD/rAtdMq2DoSfmUW4vRfs8EzC4c5dvrQ6rZ8JIQbcrc8Y4B/PsrkSgEPN8x?=
 =?us-ascii?Q?GJwTC5XQINhCFWZ7lLaRRQmGw/u1sOIY5kk2Pnwbe8RuZ+Mjma4SZTJwt6sm?=
 =?us-ascii?Q?KBD8agCiwckoVvJB+N013aK9+Evxr3f0pRpDFsYi5q9dJSaxYr3KyMdXig1h?=
 =?us-ascii?Q?CMP9auSwyAQsEMgs9O27Wh95WPIikXHLWg26H+I7uTtU/HVzvNCwDmh30KMk?=
 =?us-ascii?Q?d1Bf7pZ9iaixdeLkwLgEnCyJDjvkEnDeC4/5imAqj4tZbTzIQIy2GhcygPOh?=
 =?us-ascii?Q?KF1XlEn/tSSL4S8riALa/1FU0tO1HvgkkU0LYQthV4WKmKas5kMf4srHZ/ak?=
 =?us-ascii?Q?bY5tkHloYJHaYYKNHyKRl+MxfA2ZKjauTrVs01sjMR3ozMqCgydxpUat5IzS?=
 =?us-ascii?Q?8cgxqDQ7jiq/eoRCw3xUMR3SfPA7E0QEyZJ1H5/Y0HUjpa+P5q8azFVKiiuK?=
 =?us-ascii?Q?xWjQXgMOJlnjoYnz24WTOYNsW03y7YVVpRAt3/0vRGZ8sA5vrt5r6X+yAY93?=
 =?us-ascii?Q?YBSGTFl+fsLK5LHIQui+fBiY5ZTPQ9opvKpLu8UJO17yAyWCiCZolH0qRc2D?=
 =?us-ascii?Q?rDR5sf+SbqgVv25P/CFRSS4UncY9rDIzc+V3IV5+2MF9uu9k59+J2xq2qdHe?=
 =?us-ascii?Q?Wvd4etk/j86hMgLe5i+z+QxjhPwvD+2Rp1uJP7ZflnDzn6Ho/nHcV9ODb8Jz?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba6e741-ec42-4e16-7e65-08dbe141374c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 16:30:42.1307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1scT3i9hsBNiK6PTDGK++jcvR8RcZd2EJrWmqFa6ZMGReiPKcqyOCmP/XT0M8eJQBqOqnSyAohpsXDWWCBnRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 33/43] drm/xe/uapi: Convert tile_mask to a
 pt_placement_hint
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 03:44:47PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> The previous tile_mask was also an optional hint, and only used
> for the page-table tree placement. However, it was so tied
> with the tile concept itself. Let's clarify things up and make
> this generic enough. So accept any valid memory region mask.
> It could even be a direct near_mem_region gotten from the engine_info.
> pt stands for page table.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

I thought we landed on converting tile_mask to sched_group_mask? I do
not like pt_placement_hint at all as I've statede what we actually care
about is creating mappings for exec queues. The sched_group_mask is
still a hint basically saying at minimum you must create a mapping for
these sched groups perhaps more. The driver is free to place a PPGTT (or
multiple) anywhere it wants to based on the platform.

e.g. On PVC we have two scheduling groups, and two PPGTT (one per tile in VRAM)
e.g. On MTL we have two scheduling groups, and one PPGTT (sysmem)
e.g. On a unified memory hypothetical future platform we have two scheduling groups, and one PPGGT (shared across tiles in unified VRAM)

Matt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 14 ++++++++++----
>  include/uapi/drm/xe_drm.h  | 16 +++++++++++++---
>  2 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f8559ebad9bc..ad3b5ea6f91a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3018,11 +3018,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto release_vm_lock;
>  		}
>  
> -		if (bind_ops[i].tile_mask) {
> +		if (bind_ops[i].pt_placement_hint) {
>  			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
> +			/*
> +			 * System memory is currently ignored from this hint,
> +			 * which gets entirely converted to a tile_mask
> +			 */
> +			u8 system_memory = 0x1;
>  
> -			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
> -					 ~valid_tiles)) {
> +			if (XE_IOCTL_DBG(xe, bind_ops[i].pt_placement_hint &
> +					 ~valid_tiles & ~system_memory)) {
>  				err = -EINVAL;
>  				goto release_vm_lock;
>  			}
> @@ -3099,7 +3104,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 op = bind_ops[i].op;
>  		u32 flags = bind_ops[i].flags;
>  		u64 obj_offset = bind_ops[i].obj_offset;
> -		u8 tile_mask = bind_ops[i].tile_mask;
> +		/* Remove the system memory bit when converting to tiles */
> +		u8 tile_mask = bind_ops[i].pt_placement_hint & ~0x1;
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 3cbfc17d9ffa..144a423868cf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -853,10 +853,20 @@ struct drm_xe_vm_bind_op {
>  	__u64 addr;
>  
>  	/**
> -	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
> -	 * only applies to creating new VMAs
> +	 * @pt_placement_hint: An optional memory_region bit-mask hint, which
> +	 * only applies when creating new VMAs. Default value '0' is the
> +	 * recommended value.
> +	 *
> +	 * It hints the optimal placement for the page-table tree for this VMA.
> +	 * For instance, when userspace is using engines living in a secondary
> +	 * tile with allocated BOs near those engines, that same
> +	 * @near_mem_region could be used in this hint field.
> +	 *
> +	 * Since it is a hint, the Xe kernel driver is free to ignore this mask
> +	 * and choose the best location for the page-table, taking into
> +	 * consideration the running hardware and runtime constrains.
>  	 */
> -	__u64 tile_mask;
> +	__u64 pt_placement_hint;
>  
>  #define DRM_XE_VM_BIND_OP_MAP		0x0
>  #define DRM_XE_VM_BIND_OP_UNMAP		0x1
> -- 
> 2.34.1
> 
