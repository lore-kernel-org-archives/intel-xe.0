Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9655FC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FE510E62A;
	Wed, 29 Nov 2023 16:09:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DA010E62A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701274165; x=1732810165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kiqW+07hRIl0pU7hxu7ln8zskv0Lt4OVD8QEczJHw1U=;
 b=gBcEUDmHq2ibegiNKqvTuF6jI2CGddVADuqUGt1vXe8B2c/8tWGE80Z/
 oWdzFqwpeaJImdsT6wvZUohaqqCB0qEihnWT27e2upFzYcXAVzALtz+Yw
 9LCjJNOagCr8RGpzTXWoax7u55dsdnuNuCGo8t6mHd54CC6YDgpbmIIsv
 5g4bW05pEXwh+wEgGjzeQiDGnXzT6uJpuC9VctlIW5RheUpssRd/KX4TM
 v2AkgEKjQ/7766hCdGDC6yP1DzbDSQ63DRRQ7BWjh9Oq3TO1hGHlKYH2K
 6xt+RI/EvQNMH/nf1kKcMDWQnP5l9zPbD8c9xnETAyX7FW0b92Goa8ww4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372561605"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="372561605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="17059412"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:08:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:08:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:08:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:08:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:08:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9m3Q27cP08V1WpXRfapHRQu5Wnv2lNVjJgN9Hz1ueYPUFsjIusxAT47qSz2p5xHzhjSQP9DjXTBZknsMKuWAqSMQRRtyb29mlzlrGWDlL9gjSKlsvkTNAa8tXQO6fPx3zJjZHq+YhBQZ4sVWUc7G3fI2g4MqLwAMhny2aqMrEZ/ncz5CES/hmW5OdaEiPOgWSXSnL/4ITqW1CsfKmkIXWBVmldBTqKxr0OmGruI6Isljv0mDIiYYVafZOPHGhCGGvwielqFr2pjbBajUvDEBjKtYI0ORAvclRiUzEsfMxIyID0TvXfYId5HSIuI2VzPamtm+P5rCN2xBLX7FTDZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku1SoL0CO5uu6ix4Jx0MJZ+EjVyC7t6XuBrcdTTRLKE=;
 b=MuDtdyWhtmSs+kcpcsz1QBUx0s1dRWCqJjj7n9mXfiulmbHZkxG96hx7Vwk9wj8w5Vi/twZKxA8OuRI53/beibadnJfkUxPC+h+bIkEMnpOajBlK5DOVBpLhfgf/IPFh36uZP0tkxs3YIdwpDo5Q1n2OI9HdL0zOrD/qBnCnE8Nd2Q3lK9lm3j3UX+kphmJQYEIHhaNIyC4qb1BGaLogTkyPIJ4GiCu39zC92O0mw37A4iJqAD+sMHFzGmmsFkB2Js8ZC4wASRFJ+NVHnB27yluIkAkUQdIosRgDzRoy9+WCvc5egCvhU/PT+8aQCPbJL8ubJn0y1V9D3PY7WIrtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6475.namprd11.prod.outlook.com (2603:10b6:510:1f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 16:08:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 16:08:53 +0000
Date: Wed, 29 Nov 2023 09:07:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWb/Rf8+3KLXig1m@DUT025-TGLU.fm.intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-10-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122143833.7-10-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: c4996b44-e926-422c-c549-08dbf0f57ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4mu7B4UzCrUR9c9ccmNj8kLOKSfJbJvkKv1ScTkXkigUYINTJ1kR2SV8xXVYzWqr7+dNlfEEAXJsEFDEDEYKIu8QTb+4S/4ar4gF9Ijw7ljKAXN1YxvWLtzouVTsoQlFg65bG0HjwStJ2f1O5IiVAqdZ0XDP0QkI9HNuZOtWSwFnuctGGGBr2YZVNkumB7KWUWGIQiqnxzKKAmMUZ2z/RcAku0uRGxSmKGyKfb2ohQeVlTtFEMSFYGoZqHwzSm4ICAugw66IfomYuDCgwsfXKXGIm/7cVwkttb0bf37vlFp//bapDKNkBAvzkNWl9ZKAhJTCCi0LDcshcjL72Yyut1XyAh4PIxlxWysql9AiLxB4PXs8e4gNPHLWfutXHfdk8FoH/dHPk7WpvtwW5kugr7YKzKhqChWiD9fR8kVKUb6ADoDMPcIQGy9hGVXwHS+kw911IhdShqVS08d0JOwZ49ZvVQzzxAdUdNpwkRtn1KkUWV+7k88Z9sGh7THBqWXLaR6Zg8NwU3gYt0WKOoaLPd5RkVzXqmw/iONFyWsCSpL1GVl+0gBr7nzv5/zFLBk2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(6666004)(5660300002)(82960400001)(8936002)(6862004)(8676002)(66556008)(316002)(66946007)(6636002)(66476007)(4326008)(44832011)(86362001)(478600001)(6486002)(2906002)(41300700001)(6512007)(6506007)(107886003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dtnx5d3rHbYgHx4R4fiVrh1Gfjw8Y5NK5OLUjmy1xjrm+7H0r5l+ePRoimML?=
 =?us-ascii?Q?66UBssPo3mn4cpy6j9uRg6M7ylp6rtjEGMJbZQ0MprjRYJJzAUBtj/lEqmXb?=
 =?us-ascii?Q?69drVeF7eyTvB3A+yCnqY3/mvuWqTBOgW9b1VzwOqeOgk0wn7UGx3BE3bqIV?=
 =?us-ascii?Q?CKIIPa54mcMCSiZHzbLjAxwEbSSnMJvh9pRG5QVxYwn3wS54GSTzHq7P9m+D?=
 =?us-ascii?Q?HY6wMEfq3dr32gIr4hRLDxWJsX8HlebwWErBETGgMho5bJG/MFxlUuKo/LDr?=
 =?us-ascii?Q?crpbgD3b9Opv7EnqpR2AxsQATPCCX2GsWoQ/UcOwzwdvXPm7yi7zg12Lp0JP?=
 =?us-ascii?Q?HtQAzTRRNStmAr1fHvqn3L6NkFeMh9WRd/LaxsZ50POHCX7Xex1voFz8nlBD?=
 =?us-ascii?Q?dUuEwXD549JD0CXDi4kLx5BaWLHF+JkHDBMcLFhUQyvGMk5LiU6GGDw7rqYz?=
 =?us-ascii?Q?azFO4/tRnEI+Lvpu9Q3lVNax4tqAavk+NfVYXh+nzy+xI6gu6WtBC5O1dMQB?=
 =?us-ascii?Q?fOmSVQJyRQsZOpqWYuO/Q2SHnz/8YcC8jUw+tONBS0iJEIiQaToAFyhV4MX3?=
 =?us-ascii?Q?jwpgL7opwG9DQCIuHkxiMhu5mHIvpNdHop34C4VQ43xXdXS2uz87gAvqFCsa?=
 =?us-ascii?Q?x3i5WWW5FEGk5QNFgJRCvhzX+RLMxE3ERLOygRugIwWI8MGrrg0YiZOQ2HU+?=
 =?us-ascii?Q?IT/wWUfzo2aNrXH3b1zeUvPtd7pnFsHgSRQKoz8JM0jtromuR0CnvC5FytfY?=
 =?us-ascii?Q?VzxTg0vwCql2oRhmAUjSlYUHzCrtAhI247eAybi11IbAYroFcP89ze/VUwOC?=
 =?us-ascii?Q?p4njTOhlY4esoy5VbCnfFhmLNAczqvon2AJOSA48cR9IU2xyUPasI+fH4Fw3?=
 =?us-ascii?Q?UKwdeNC2yAI+gEdm9tPF8sGGGV8frgiDZAhJ67qVKTojahkTzGU/KjzOYmCa?=
 =?us-ascii?Q?9m24RgEIzYF41LZol7ngPNLWKC0uc2Uw6NJ1p+QPYanIAdZCQOkAOmJ16DUo?=
 =?us-ascii?Q?//4K1Wd1ITaGGOoHZz+jy+b2ENCks3YCT7bwXqsX0BWfEjQwv7WSqPPbEvgE?=
 =?us-ascii?Q?6JCbHnHiWzCQ5Sm10075xBY/YQqoKwwbcuHVsiSkI6AbmothoNIGCsEtgcga?=
 =?us-ascii?Q?LJop0eX4q1qJVTCtbIUd2lYX21xAlpTgTxVhGTjcD/VGsv5MlAtNB9pZHI7R?=
 =?us-ascii?Q?kNNvK82LlvOf7HOeEFtyPEDBQjig4HmcQfv37DwmHeZq6d6jbTuZ6dkPKlqZ?=
 =?us-ascii?Q?DEYY/8TM6aKVncrVX2Qcxj1+bRuJpoc7Qfp1wAALyhW+ZmD5TExQPL23/E8e?=
 =?us-ascii?Q?gUk+WTJKh1/0USXf7FAz5L9QQY9kcaR7a5vLjT8T1/MOXwFj+pH5gIRpqCZ5?=
 =?us-ascii?Q?7RUR37IOdSdjIguolKSmlgxvSYHjWiDrUQoImhA3sqUIyRorV/D98doqvc0n?=
 =?us-ascii?Q?bc1mQbJ8n7yHgBeWgWmG3kMrZ5Qr0vAfEaU7Q4rCvwZGizp3TODLuCSFpjNa?=
 =?us-ascii?Q?jeKGUh9nRAff3/+yP1WonrH9obh6+UKpSKIcUvg052FZlcUTdrejZJ8xaJ+Q?=
 =?us-ascii?Q?CzB9cRsg963/P2Wq0zHe3lO1VhMQhyuOyEFzyp1rtOnOoFZoZQvNP/M/i7Il?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4996b44-e926-422c-c549-08dbf0f57ba0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:08:53.6194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoarutdHN0nVJnB4JBGggf+TJN69kwC9BwGTKqcoqP4zsQLHaJpyQDaXZeKirUQc8Wh0TU37RBSZaEEwM/2bdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6475
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/14] drm/xe/uapi: Kill tile_mask
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

On Wed, Nov 22, 2023 at 02:38:28PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> It is currently unused, so by the rules it cannot go upstream.
> Also there was the desire to convert that to align with the
> engine_class_instance selection, but the consensus on that one
> is to remain with the global gt_id. So we are keeping the gt_id
> there, not converting to a generic sched_group and also killing
> this tile_mask and only using the default behavior of 0 that is
> to create a mapping / page_table entry on every tile, similar
> to what i915.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 41 ++++++++------------------------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 --
>  include/uapi/drm/xe_drm.h        |  8 +------
>  3 files changed, 11 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b39c6f43f01f..ccd2821e61f8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -863,8 +863,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    u64 bo_offset_or_userptr,
>  				    u64 start, u64 end,
>  				    bool read_only,
> -				    bool is_null,
> -				    u8 tile_mask)
> +				    bool is_null)
>  {
>  	struct xe_vma *vma;
>  	struct xe_tile *tile;
> @@ -896,12 +895,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (is_null)
>  		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
>  
> -	if (tile_mask) {
> -		vma->tile_mask = tile_mask;
> -	} else {
> -		for_each_tile(tile, vm->xe, id)
> -			vma->tile_mask |= 0x1 << id;
> -	}
> +	for_each_tile(tile, vm->xe, id)
> +		vma->tile_mask |= 0x1 << id;
>  
>  	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> @@ -2167,7 +2162,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u32 flags, u8 tile_mask,
> +			 u32 operation, u32 flags,
>  			 u32 prefetch_region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> @@ -2223,7 +2218,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
> -		op->tile_mask = tile_mask;
>  		if (__op->op == DRM_GPUVA_OP_MAP) {
>  			op->map.immediate =
>  				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> @@ -2241,7 +2235,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  }
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u8 tile_mask, bool read_only, bool is_null)
> +			      bool read_only, bool is_null)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> @@ -2256,8 +2250,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, read_only, is_null,
> -			    tile_mask);
> +			    op->va.range - 1, read_only, is_null);
>  	if (bo)
>  		xe_bo_unlock(bo);
>  
> @@ -2401,8 +2394,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  		{
>  			struct xe_vma *vma;
>  
> -			vma = new_vma(vm, &op->base.map,
> -				      op->tile_mask, op->map.read_only,
> +			vma = new_vma(vm, &op->base.map, op->map.read_only,
>  				      op->map.is_null);
>  			if (IS_ERR(vma))
>  				return PTR_ERR(vma);
> @@ -2427,8 +2419,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  					op->base.remap.unmap->va->flags &
>  					DRM_GPUVA_SPARSE;
>  
> -				vma = new_vma(vm, op->base.remap.prev,
> -					      op->tile_mask, read_only,
> +				vma = new_vma(vm, op->base.remap.prev, read_only,
>  					      is_null);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
> @@ -2461,8 +2452,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  					op->base.remap.unmap->va->flags &
>  					DRM_GPUVA_SPARSE;
>  
> -				vma = new_vma(vm, op->base.remap.next,
> -					      op->tile_mask, read_only,
> +				vma = new_vma(vm, op->base.remap.next, read_only,
>  					      is_null);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
> @@ -2994,16 +2984,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			err = -EINVAL;
>  			goto release_vm_lock;
>  		}
> -
> -		if (bind_ops[i].tile_mask) {
> -			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
> -
> -			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
> -					 ~valid_tiles)) {
> -				err = -EINVAL;
> -				goto release_vm_lock;
> -			}
> -		}
>  	}
>  
>  	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> @@ -3076,12 +3056,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 op = bind_ops[i].op;
>  		u32 flags = bind_ops[i].flags;
>  		u64 obj_offset = bind_ops[i].obj_offset;
> -		u8 tile_mask = bind_ops[i].tile_mask;
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, flags,
> -						  tile_mask, prefetch_region);
> +						  prefetch_region);
>  		if (IS_ERR(ops[i])) {
>  			err = PTR_ERR(ops[i]);
>  			ops[i] = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index aaf0c7101019..9a2f2f23dabd 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -400,8 +400,6 @@ struct xe_vma_op {
>  	u32 num_syncs;
>  	/** @link: async operation link */
>  	struct list_head link;
> -	/** @tile_mask: gt mask for this operation */
> -	u8 tile_mask;
>  	/** @flags: operation flags */
>  	enum xe_vma_op_flags flags;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f2bdc6e323e4..85b0affc9f89 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -683,12 +683,6 @@ struct drm_xe_vm_bind_op {
>  	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
>  	__u64 addr;
>  
> -	/**
> -	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
> -	 * only applies to creating new VMAs
> -	 */
> -	__u64 tile_mask;
> -
>  #define DRM_XE_VM_BIND_OP_MAP		0x0
>  #define DRM_XE_VM_BIND_OP_UNMAP		0x1
>  #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
> @@ -723,7 +717,7 @@ struct drm_xe_vm_bind_op {
>  	__u32 prefetch_mem_region_instance;
>  
>  	/** @reserved: Reserved */
> -	__u64 reserved[2];
> +	__u64 reserved[3];
>  };
>  
>  struct drm_xe_vm_bind {
> -- 
> 2.34.1
> 
