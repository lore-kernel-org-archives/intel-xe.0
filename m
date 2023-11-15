Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A22C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 19:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A5510E154;
	Wed, 15 Nov 2023 19:04:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DF110E154
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 19:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700075087; x=1731611087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lrEDroIgGs8DLFoI0CnnvZS7ZtDP6ZG1d8QtJDwkW/Q=;
 b=Vnrw5LYxpXpdFlFOxnLg1omTDVGYLCAqKH3pdGJNbkwp2cdZB5n47rlO
 cQhe0n8j6FEqMdYYRgSxPEUaK15bluUt7V+VOA81o5bGYDe5z/TxWPADn
 gUCny0cy7V1OtSaRUnvQK5aPnfNGEvcHXfry4/jc/403etI7YDpYpvXL9
 SrSUHulnoZLCbKY6902lUuukshfGWtrzOnboclczl8ZkXDY2z45WfGIh+
 Q4wItqYIRoaLneM6Dc6lBLxLSebMvJcL8wp8fOfhOkKc9fGHLd4gEykWA
 6ZqRvB4PRce9h3JKQk5sBUz2fRO8y7iKpFcGDHJhXvMwpZ70JDv1KCoQv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457430595"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="457430595"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 11:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831023532"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="831023532"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 11:04:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:04:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:04:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 11:04:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 11:04:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZLJIdhNUBhSTwt+sXBjtQjTzPDLlBSVB9L90Ao1bOGXZr2TFplbrcHyixm82qlfqpsm3imQ6gIAh2Kff14WzINWyzhBZTrfqNHKDKksYXnlrtPeh9Usq1xXC2/G1WPWrRNethPXc8nRWkba3nslpMoqLYpIxz5tKx4hfG+TUk4tDhlVtTiLzt3PqpJoqHW4jvq8cl/5HmgCZWTn7qW/CeACc/sZVBFSGo1Ji4avGgl5LSY6Bw8DXWLLFJJwNNyt+i57JgekR3kYH6YXsz9qB7Ud3f9FznMrTsTSw7QDoYAI2O2lr1OOaqV0HrO6i3KYHzAADcZlFjDO2/lPCXzvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDgejzCH5szopLcND7FyTYSDataEZysxJhYSHdmaQ6w=;
 b=eDE1tSpA0YOhN7GGC3Xj7RqOUdbiMyvGsX+0F6av7MYomwp3taCD0jM4OYbJQNvjmMhZ0NzJzt8/nIQV7Q00Abz8NMJLpMaoFLPOSensgf+oCyJgKERFhxII9QpYUM76LmPs7dM+tfthpOlt7YCak2iP7EmWAuVgr2ttlPlybJpP3piv0V3OPETd4xZ3HSqrCmU2BvelGmGXLtaSizV60NKSwLP5/DQYe9ivYnh81tgQ3mU4++rzSxqHUT5uqpb8HdOJhzL43h9rudCVXgwD1ucPGJs3IeGiH6+qCDjw7qe7i3m9PQiR2QKFg1Hm5D9Zp/NcmjLszQ9L+7znvAv3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7699.namprd11.prod.outlook.com (2603:10b6:806:338::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 19:04:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 19:04:43 +0000
Date: Wed, 15 Nov 2023 11:04:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231115190440.GJ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114133434.7-9-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: cd195884-cf4b-4fad-fb0e-08dbe60dba2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/FidTW7s0DhjtfDIvgTle2IhGRb/Ej3uy/NBKV/bewuhqnu/dRKCJQukRkhwKHVusr8sF2xeFBVuvKEWfg/6eRnFPFSDpVH2bMpDyvmwrVIiwvYgAo024MbXllkrWYVTeAqZiCk0jm5BhTdL6Q8OD99yTY7F+TWZYbOGRKVqvW8qpK/CVhFYO5TTqTwd+8yxwv5BdseS55x40ReTLhVvU//9/oI6z0JCOlV7C8kIjVCw2e2uC86iLuQa/riK9BrTX6JvPpP6E0aVyPchHlQOtEq0Xu3UYezc3XSx4GN6ETkW5MogWdYhPLz5guD5rbfO888i2yd0Zy8G6fb4s8yPp/ZtyEJa4CbczNsuvFw7NlfuNXalXP/KrjEmBU27r34xEgHAwAX1HRJrkk5Wxw7aMFfSBhnkkVHVV5m0OTnQLQlg3bYWRVI6RoaXnDH/HJcd/TptxEZjSyJIdJhI98yi22DcfcsWDISd+1x14/p/hbtwxuYr+MrnaKa32dpiTJyJVmBc64OEGi7SXIcUMyzyt+S8l3Rrj0swOcPGg85T52SLF+73geAuxR43yeH4HSA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(107886003)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(6512007)(6506007)(478600001)(6486002)(66946007)(8676002)(6636002)(4326008)(66476007)(66556008)(2906002)(6862004)(8936002)(316002)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W0eWNCPa7b1uoRCpOhe82Xg+anERX8QquwHBk1Zz4wNy/zx3Ci8k8naPmPbo?=
 =?us-ascii?Q?ATzR3OUoWPAMzPQ0TKQtB8l8O6cQSGoReMb6iVRx8sONgBRcIB7+tx4eT8Oh?=
 =?us-ascii?Q?+SBnIZz6c/rnXMXBtluN1BPUtBKtx+TV40LZ2Uj7wl4Po/U3PiaR9IsOlKd2?=
 =?us-ascii?Q?lZVmxpY+JnIdTqZx1FEFS80ihhrLZ6uM2b5phaI1n6Js1rrp07KSHAPyeR2K?=
 =?us-ascii?Q?ZdxwHQ1dbjVPgEpHQDSOwBE2/zIoGTq6+6vUybBnM23D5RE8fmJiYwbQGjue?=
 =?us-ascii?Q?/c/k+FAXmDIwFOQkU7wk3/dqnT2xgnR0zkPqXZfd51scOROjjXMsLxQ6GV1R?=
 =?us-ascii?Q?1cMz1vPGi3Fm1mXSnkEzQx1kSowPJXrSP0Gl2OB6XvMszqrkKW0fBhaREU9R?=
 =?us-ascii?Q?kgkgP02tJ6REWfJPP+WS6LFD/d+rcr+Y/AxckuzpzBFxEobhz6jN/rMTBgZx?=
 =?us-ascii?Q?RSCEWUtTEYtU9V82iIe/F7IJMUNa9H7PhPRlHTk2Xlctckrvpomq2wperg/7?=
 =?us-ascii?Q?pQ03LLyKoP8pGIhCu1QY6WIAc7nPoKFnH9bem3ynvsv5ai1fgvrSQGH0Ev+h?=
 =?us-ascii?Q?U+ZlcPK04IQgCZlrtdMo7FgVSl68Pe8t282Gp6ynb42AmTjisroNHG0Accdr?=
 =?us-ascii?Q?C+8z9K+n7XZR3z4fPunjf9Wi9nhYre2i26lBibzABHtK21D0T862bRN/8k9y?=
 =?us-ascii?Q?r6/EVfwclx3d6ltctbmg1fyTT399qYZKQWELYfMA58mWQEFMBFiA+oMkoIzW?=
 =?us-ascii?Q?68PvVMNdIwn8pq1SQD8CtdpylkTlmugD+6X1j8HgiiFF/hwEDLwn/3SB9i/s?=
 =?us-ascii?Q?jrQfErmrgkxBE9SOtxy5Ive0w4Q67fd1PQmkZwuufXUY7NUAb2Oc2WGhkD2A?=
 =?us-ascii?Q?ZDgBFUiaSdtt68HSDaeNA0sN6pTuc9aBgrk7Q3lzrWqg3eZHbHQmItqKbNmi?=
 =?us-ascii?Q?Qxe2KtwhF4HWV1gLceqOs/ORljHASP10enTdW9qs0M9Lc/fsLabC1noQb+MO?=
 =?us-ascii?Q?ZRIMuFhPl21ehsdXbINqx+GzWGNwNOXq27xyWGQIfVZyjisF0YUEF/ihAKgA?=
 =?us-ascii?Q?YKQPo3xVug2hFkBb+cBU/A7FoPiowNg+/5XVtJWyoaMMw6pmxuw9/zFxQBho?=
 =?us-ascii?Q?osPkAvgEK6XBvQalrfqjm3fPxvb8UeXanwYLxemWmi5vRjmSQMfpIxI1I2wU?=
 =?us-ascii?Q?900GzaPOfuQC6kWfygC9hnHwyjkQ19ckTQD1VwCxugcE5DsGjWUv5f2w+skG?=
 =?us-ascii?Q?mBRx/Ln/RokMToF85iGiv0j9VKhRtbMjeGBi0TJQnCHnKefvIIQZbPA5ZVuG?=
 =?us-ascii?Q?ViuMiD17Ow1ujakGLYreJ1TQ/d9wl0MAqplQ63NddONz4V/v5VnR/xdDz00t?=
 =?us-ascii?Q?Bkg5ZLAzT1o8r10pSolNHKWKW4N17nYUHu2mp/CxjBhBztMQDQSBwL3H5pBR?=
 =?us-ascii?Q?rF9IyzKSwOI5Oi+VkI6A7l8xePpE0RFmOTiYGPWd4vThR8/Jsxm1QwOoO5Zl?=
 =?us-ascii?Q?DbRFbDB5NhISS1v3B52zQ4q7jIgRa1MFoKF+jXYOfn2GAAjfDVdgOMkGPaJ2?=
 =?us-ascii?Q?JvjW7/Mkk5W9G8oprjeYca9Kobgcx9HYkwYRASM+oe5kXTNXt6ubE/MzaK+B?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd195884-cf4b-4fad-fb0e-08dbe60dba2f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 19:04:43.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ov99tyQ0IyolIAH7K8/1KaEuA4peLuZMD5ysxCqDaui74uHBiFGeGBRUr6O2bjBEWAgIaUwOOydtW10SaolZ/x2E9sUov3uS8qc8uDt5shQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7699
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 8/8] drm/xe/uapi: Be more specific about
 the vm_bind prefetch region
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

On Tue, Nov 14, 2023 at 01:34:34PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Let's bring a bit of clarity on this 'region' field that is
> part of vm_bind operation struct. Rename and document to make
> it more than obvious that it is a region instance and not a
> mask and also that it should only be used with the prefetch
> operation itself.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 15 ++++++++-------
>  include/uapi/drm/xe_drm.h  |  8 ++++++--
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 76926ee756c7..f8559ebad9bc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2167,7 +2167,8 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u32 flags, u8 tile_mask, u32 region)
> +			 u32 operation, u32 flags, u8 tile_mask,
> +			 u32 prefetch_region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct drm_gpuva_ops *ops;
> @@ -2221,7 +2222,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
>  			op->tile_mask = tile_mask;
> -			op->prefetch.region = region;
> +			op->prefetch.region = prefetch_region;
>  		}
>  		break;
>  	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
> @@ -2881,7 +2882,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		u32 flags = (*bind_ops)[i].flags;
>  		u32 obj = (*bind_ops)[i].obj;
>  		u64 obj_offset = (*bind_ops)[i].obj_offset;
> -		u32 region = (*bind_ops)[i].region;
> +		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
>  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  
>  		if (i == 0) {
> @@ -2915,9 +2916,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, region &&
> +		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, !(BIT(region) &
> +		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
>  				       xe->info.mem_region_mask)) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
> @@ -3099,11 +3100,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 flags = bind_ops[i].flags;
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u8 tile_mask = bind_ops[i].tile_mask;
> -		u32 region = bind_ops[i].region;
> +		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, flags,
> -						  tile_mask, region);
> +						  tile_mask, prefetch_region);
>  		if (IS_ERR(ops[i])) {
>  			err = PTR_ERR(ops[i]);
>  			ops[i] = NULL;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 675194886851..d66e8dc72e96 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -672,8 +672,12 @@ struct drm_xe_vm_bind_op {
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
> -	__u32 region;
> +	/**
> +	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
> +	 * It is a region instance, not a mask.
> +	 * To be used only with %DRM_XE_VM_BIND_OP_PREFETCH operation.
> +	 */
> +	__u32 prefetch_mem_region_instance;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
