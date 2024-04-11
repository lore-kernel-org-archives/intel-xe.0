Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53D8C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 23:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D64010ECB2;
	Thu, 11 Apr 2024 23:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKnbEF1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2910F41D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712877769; x=1744413769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3ZsI/tzaEcfeOGKDAmnnUeYeQFAbwLmF86OHuZa8re0=;
 b=IKnbEF1P1z/9G1AtCIePcqY2Z1RzkdkJBMFgcuDorDzeo97AhcQ4m2bh
 9ykdrLXQRtC4jCyMXVBE4V+Eq4qSy9xAnw3oexOEkioZIIrnt2QqcSUJe
 SEp0XsyrEq58Rm8cOByy2QIvodf0V2ICku8w/SvicrRglk4H/TjQmhRNi
 ri6RuCWWJZYd72bl6QFDNsejXgE89ejZJbvCkcGUVJu4eWezAsJcETm9M
 j5ci3HcZNsTJILXnZ2vm0T8Y+s+oigAiMbsmk+qW25bx2hbSFJ3orQbge
 r2ZCEnQYNOg1yriAbuqP/T67ZCsKaO1zOeqsKXUsU+eAJE7NNqkIlSRIs g==;
X-CSE-ConnectionGUID: ONwXXFs2SUG830gqZMGzgQ==
X-CSE-MsgGUID: uLDeP+kIS2aBoKYAeQ2aIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19714633"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="19714633"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 16:22:48 -0700
X-CSE-ConnectionGUID: 4nCrTfm7RXeUIPqzx195rg==
X-CSE-MsgGUID: Lih3gzy4SBS0m2VGJ73xdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="21144055"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 16:22:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 16:22:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 16:22:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 16:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnDZeCACXrz3WXHP8v+/Vo0A8apv+VkxVkc0MjJZQ2WpktRIkXBjF300ussxNd3dphUcPF0IjTPr7/5ZVT9HyEOBb4x5nKgPbrqz3XzMXJyvfniPP6jeJvQgGuCZBxNO1YB1qD0HUpEYNA7G/iPsHpkQVF3QahmULYOFVOSM/W44TTY1ap/NKUUcvyP8JTixN1eOV0DOyYQfvBNvI3PdNxMCo6PuxU8lwPqxhTWfe9ydgJYXHyyZIZiiOBr+7oO44on6GZYzFADQAuuoQJHDdrgj+OydjbbH3FSqL2u7BLgehsMUHZN0IPfgq9Vckvx7yRhNNVa9oY1lsd5kMcdVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIREZp9Z9PXtz+GD22roT5Xzc83ZK55rtk/FxuZjoro=;
 b=lvHt40/yBp63B11hNErZEDCjvyWdog95DkMi8yTaxw6bGWEiG4d0fOXn4pntsRoiAPX0PTPli/IV8ehm4eD6Z4T8+me/jKYMOhs5w4mEcXgQsdnPNrpGSHTNu3aeL4y30TN7bq3uA66HgnKnSzro/D2oyVeZfQTEKDlYz22msx9V2gphnrPTn3C+Gj4CQzhQ6prb/BFpW09rcID6yNCyd3rTm70vU1/SYVu3Mcbn5F1aLo9K6eW+Y/+BeZ7YPrAwkuPps0QnZykRBs11JUnycgx4uqtH2aij+lABwHNVanTJDl4w1gwechi36KF8d3Tv0iPz4cM2kv/LwJaztCURPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 11 Apr
 2024 23:22:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Thu, 11 Apr 2024
 23:22:46 +0000
Date: Thu, 11 Apr 2024 16:22:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Consolidate setting PTE_AE into one place
Message-ID: <20240411232243.GG6571@mdroper-desk1.amr.corp.intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240410170308.409-2-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b200a5-3441-4346-f66b-08dc5a7e4b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6JEtnDfOHUP2b4aQWcJzOq6q2ZPXYQYrQ/0xClia1Rii9KWFNkH1fZhQICvrxE+hnV/VuTfgDHW83elSK+ShGF1bBgXQBb6wmeVgCqMNR+WlyK5f1dRkZWihYyDqqizmHpuCW4VlzUwu/zRzHW1w9sSSpnNXc2ZWKpVxtbUWrfuCVRDBTI25Ombx5RFL0mzIeVfWMfO4May7b7HCSz4H081EEBdNw/tLc7SLMQ0+CuSmfaA76l9SUuqol5RGfVdss4bilnea64XYUancH8ORUN8ZOHuJT3hjSmGu2xpoiekz0B+Yo0YkJGHC8WTNH+FxOhdXfy2HEyQpjMpHvec4Hf3JVgPZaG0Sjji9xjhl9Mp+bDcQq5aXVpCBhloPI23+Cj75KUNN0FqOvN4VSh6iqkANyLoQ1WFESwkL8Z3pYHNjVHUrZsrUV7WQARmHpiOPUVIVbj7y63FBD6YVNVvaAMnR32DPoLZn88Aolhpt+rGsU5eQcsZmSz7pVgji4u5DhKyFZK0doTIjIz7FQrBARfpMKmktpavClI+fTiz8917WOzbaWS2rCzfzGDmxSZkvjT3Xxwpuqc8s/KxJXwVdpNjurpbCHnYvVKAudHcRYJ+nMLrxiPbVwRsUDgVnQxtv34x7AR5CLynUOYeC2esX3GrAnIAmLSjjucYq0A9eAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UiALmqwjVcFXxK7YrHB5PaJ+rukC7cIPE0uzhQ8ql+zQvCpKd0aA4c+FVn1+?=
 =?us-ascii?Q?5ht5TKhS7olCwIDYosT0yunpYIBJ4flmCVNj7vrzm03lc5X07K96uj8ikefi?=
 =?us-ascii?Q?JaC1JYGwj7B10qsMICJnauEDhVOHJTBGBSnPOYRcUcgqhM7pWS6GWkhuVR1d?=
 =?us-ascii?Q?7QH31RFn6IKUxCJVB4MfqWW77eBtsZIkmsogNxbWe3b1LtuCKBVh9wd0ZZR6?=
 =?us-ascii?Q?+2yw6uuWUNKR1sqTQ3K73zj2qXC6D0ybmLnBOS21u23QGjYddY1pBisLxPDR?=
 =?us-ascii?Q?s3iobUnw3QB70eX1k1m107S+V9Cfd3NkMovkJ4bsLCxAVzJ9W5oXsCNlY6Tf?=
 =?us-ascii?Q?ll8ZsqhOvwCaOCwu8+UdteEvuGNgu+IPG6wpCyFXgWWI+FRLzTEzyncZ23dA?=
 =?us-ascii?Q?W20W/L7u0lc6gvXfWIsGov7SO/VUILJO3psCIGkoFQBt0K2fMUTjzfUD0zRu?=
 =?us-ascii?Q?0q5SL0jrprKw3IFmGE6qL4MYsEMkNF8aIgDp/CNqYpn9p3jpXOjLI0uedrJJ?=
 =?us-ascii?Q?HvnyXM5yNWdjog9inymwZLyHOL4utQxQMCUHOFLVqNdTFqxS8MUzRKmURyWi?=
 =?us-ascii?Q?4NxFbejkrBCttO8ZdBL4dnjbx/6XdVPEGyv25iD7w5kblJG23FKA1fUvGDOo?=
 =?us-ascii?Q?zmm/uA4ZEtxGUWTKwkNrJdu/0Y6aoxSx/5YoLcrhulWMkCaTxLRXjPn6bOeK?=
 =?us-ascii?Q?2UtRCZPRf1SGoePNr11ZXToLzhxbGpnUfyEm80oco4tHi3U/CIO0a5VjQzUZ?=
 =?us-ascii?Q?jxBSOoCNNEbz5ioO+n6G1nvBNLtLxH7NQN58kAXAWhIt5Z8LNl6CK2LjkUwR?=
 =?us-ascii?Q?suVaNUZZXOpM1boiMk0biD43/wqvPjOvU2SIKp499IZPZrke4Z+QDJlnS4QO?=
 =?us-ascii?Q?irVFZcVn7L0AX07gdMYpkr3V87cBE9l9yJ/5u8giRdgVQJhv9my2zrzPQzdd?=
 =?us-ascii?Q?zXny/o4DXnNgKVmVZKkOmruHFpJX5VvT+BpGrcYpvukbeJ/E8YBsXI0Mk+G9?=
 =?us-ascii?Q?62FVeZa/pAH/6qVe59uCbCyHvQPNM3L3kNoRQumqwDzW0DcZJWwH34vQgFXt?=
 =?us-ascii?Q?UpGk8ghYM07Q7bOsVpV8utm1vf/6o8n5VLVItxDgemKL+ZfZMA1hcmOUKeye?=
 =?us-ascii?Q?ukW1hjHMLe1Vtde2fs8Xub12waakudw88WmU5u9DCg5LISWvpPPzzadmniUN?=
 =?us-ascii?Q?YbhspBV85BnJzlX8g17kYcKMdd1EyXKAViLQeUbCdEWxmpcspKoveRG7rcTe?=
 =?us-ascii?Q?3miGgH3lCKmDBBy8Rj2sTFEVIB6iI0OUVIERd6F5npNnKuK7RW7lKd9rsVCj?=
 =?us-ascii?Q?AVXc+bBIXEbYt0yLVj+sexzOFoqjSz8Xe70AAM6BWFS22xobo1CVwvckzHy4?=
 =?us-ascii?Q?SvOEcPQYR4wZtLznJ6XdNHMOVUyh5kdatC6UczvKm6z5Mf0Z3srkLhAjGzAr?=
 =?us-ascii?Q?JYroRvJoyYl3i+VLmcIeba+wcTa+XHNsbxMcdQoOuHYoCUxC30YvpMi5m6fJ?=
 =?us-ascii?Q?0mBsUZKLaC94s7YwGYGke4drafC5jw74t/BGjsmp6Sjbq/QkDhAlzOASOIbN?=
 =?us-ascii?Q?3/Tg+lQDhDLhBwSW72o7nbUxXeFsuv9Xhyr2Pg5zSgh1NIBJUIuRYmRUrxH6?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b200a5-3441-4346-f66b-08dc5a7e4b8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 23:22:46.0940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyPMG7PZJR1aUuOOGiXYagX7oxjNwyWs1XdP1L9RaVdaro2UIvGWOv+6BB5dh0FU392xBRMLIZc6KWFQ2Y+CUWqTXd/0idwRMcXnynixN8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
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

On Wed, Apr 10, 2024 at 07:03:06PM +0200, Nirmoy Das wrote:
> Currently decision to set PTE_AE is spread between xe_pt
> and xe_vm files and there is no reason to be keep it that
> way. Consolidate the logic for better maintainability.

Does this series bisect properly?  I.e., if we run the driver with this
patch applied, but the other two patches missing, isn't it going to turn
on the AE bit in the page table in some BMG SMEM cases where it
shouldn't?  It seems like we should at least mention that in the commit
message to avoid confusion.


Matt

> 
> This also remove the extra care needed for PVC which only
> allows setting PTE_AE for LMEM.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 4 +---
>  drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5b7930f46cf3..7dc13a8bb44f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -597,7 +597,6 @@ static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>  		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> @@ -619,8 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> -	    (is_devmem || !IS_DGFX(xe)))
> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>  		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>  
>  	if (is_devmem) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a196dbe65252..8f3474c5f480 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -904,9 +904,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	for_each_tile(tile, vm->xe, id)
>  		vma->tile_mask |= 0x1 << id;
>  
> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
> -		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> -
>  	vma->pat_index = pat_index;
>  
>  	if (bo) {
> @@ -914,6 +911,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  		xe_bo_assert_held(bo);
>  
> +		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
> +		    !IS_DGFX(vm->xe))
> +			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> +
>  		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>  		if (IS_ERR(vm_bo)) {
>  			xe_vma_free(vma);
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
