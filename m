Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F19EC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5219310FD99;
	Thu, 14 Mar 2024 20:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNxJ3hwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA7210FD99
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710449743; x=1741985743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UpeZ07AJz+PMB58QQMm61IaBqJ5YS1noKCJvUDKyc+A=;
 b=XNxJ3hwMbY5mivPDjdbfyVU7YJQb3thBT66tCssx6onwWdIcEmsOC2FF
 Y/AgAiDXkvboBWHfIQlpm7lQNlhQkuY6ZpbekaRVMl2tmo2/kGhz52Dt3
 BzVfkslM1l2OW9JfqQF81gljmYtrs47zeWZt34e+t7H85d0fOu91ueVKM
 M+r7v2Hu6Buh4kVxLV5vlupShxSgfKKWZ1gxoxXkVe5VOywYTh3VsoGdc
 W/L9cyncp8BAtitGpCCEwolws1m5rYFX8QmC2LELMlAnfdyqdrPEm9y1m
 MDq05uOZtk18EX9y8PrvaSTpuFfspgbRTY5bWjadedKv1n3p/3Cu9O1oq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16024246"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16024246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12453965"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 13:55:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:55:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:55:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 13:55:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 13:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee8GFndgyOJTfkSlidbXfzoBxAFtOjtj1j2i6QyCbheNiw8gwdEOVa2zygKIPnMLiTDq6y2bDcMJYfR9KAbKgDDxaKMotzlsBbdPJpNAClAmT1g2CYWlDhiTq5BsTM/AkVr4jzbv26RQHL8cTG6Xomd2dIvZo+9zV4su3FJoBqoSbl93GVCn3EseNcdpOqeczTgwfgs65o51Li/FA4254UfYo9HR/E0zxqmomR5U0QaMR7ekT8zXK8ZS9WKgw/QMuDfJZf8PIpuB+iQeyDgvuVY2sDfyetIbh2o55wpCiwT8+WRev8j4I+BheE2enKFogxhNay0nzZ3me2EyiBdCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA3odi7PxiVs3qS0FeOVF+XHksQkssrPi3hQjyQkDOc=;
 b=cTUXzhF5lBmQZEUknZTfdu7/THpez7ULMEVu636LXSfd8rTJNDeDtY+kJ9QMEv7ORF3XIMCrFtMh/WAEGXFTB1M0EWrl993pVtlej9WoyK22BZ08n85tJjx9bhRZIO/OlpDfD+HtxkSnOkleg7HhZSIQf4SHoBypMxRaY3uXY0bsBuEQhRrJe7aw9XSyivSzTVFCOeye1KzUXVM0NYqb1i2H98Uj6SUavtFeJ7wpoU2dA/bd3VylBhJhCj4zBAruKCzy5sWnMgt+FvYWt/uOrjGnyLvBdKp5U//kKT08eowca2b54di3l2nsmcdYskYn+YIgXFAY5bAmSyGvuI9IxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 20:55:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 20:55:38 +0000
Date: Thu, 14 Mar 2024 20:54:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <airlied@gmail.com>, <brian.welty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Use hmm_range_fault to populate user pages
Message-ID: <ZfNkE9phLoW5e2Y1@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-6-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314033553.1379444-6-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 71be3457-a908-4328-9bd8-08dc44691a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Sf1cs3e+KI2sU/0l8q7qZM8C7tO0seWN9mkTyEaPfpkZo+s2wshcC/D9v3K3JhC7gM2ge933A/ZsbOVMIvRSqoG7+AM7kZjzuiPENa3tXT3KwaEqTf0EG7x9BkRVFg58nJxKPdw4EXou9L27S8JKQ+cUUwaLm1LhYnnMp/aH/AqTRRYM5oXXmJQ8Ztjl77BdlI93qpcxJPluA8h3Tij0W0OZfg+JT11iDLf4Z82GDOlwWln6ll8yvH9KqgSpLcbO9JyA8+8Xq7pI3pehDTK30oortVR282Df+L781uAgsy+6S+ka2Kv73P2sF+ReMs/wXscYYYbWA9xMiDJVJNjBtFmLSCpvsvMYxjemAIlKlC97LPrkku+nlcD46ik8FLW3YdBD/O/fzIjNGLkXWKtmKrHEnzcG12oBNvlThpMRvBy2qyPEe+dke0VAmycByNp4V1Uz99IVQU64Q8DyCMWCZ+zriNTwbBB09zSrcmsdAFf/GfhbgnXuZkEmNn9H7HKxqe7vyfGVpsyeUgcmFmgSe7S+zeTKtoQSczOWgLrXHaJZnRTVqD9OquY2S4aKszHYikYo55Pm6m15HI5hJsbdW3bud6Bh+je4Hgdnbino/bMqNKJ6tI1cHz3Vx+FriRwVj9/ITiEhFI4uJNcyQJhIDr4YYG3jeVA1OafOTSGlhY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2GAVfH0fZmv/+iQHbx6kf84Ruro0Ho4Bb/2yxxixiQk0nw1J5gjLJayUUs9X?=
 =?us-ascii?Q?TdoM9KwtqNQOV1s5udD7P6Oik1+e4N4Gm2cFMCAx3VOcVjDYZj1jDXCsxKVD?=
 =?us-ascii?Q?1HjpDaM1rDQ4ScMzZ4jbgA+7zToAhECr4FbnEl/u5zqskwWWKTm1Bb3QykWC?=
 =?us-ascii?Q?X0GLZnTXrbB0UYfcD2Lg9IVENKlMtTFX+t/5Z/j2iy+f8RX8+1ajTx5xHfO2?=
 =?us-ascii?Q?Eao/8NCH4riWPS4SIBOEVE0a7gPKxRscKlx9hxT2xYESBQIMbGmgc/v5TpMa?=
 =?us-ascii?Q?KstcSHEYXWwf6C/wuv1sowZOKRSYpRyEz1PoVV4Ed1YkXzdXVQhBcPsALyRs?=
 =?us-ascii?Q?kws9mLpFSEYAFieTfma3wNDTxNDyPIZ2Cpz+jIuxgMR2vcY3bo4WH0Z7vtap?=
 =?us-ascii?Q?uaka1oPCGcji14ZBRb4qqAEhdzf5AMvgDWqEf6R/P0HnTwzq7bgNo+8ZBUI4?=
 =?us-ascii?Q?Rzx/1UcKV+pYaz9ZnmiHjDAjkIOL0zx9Nz0/rt3jxlsd6ftqsdVilhIJPhYl?=
 =?us-ascii?Q?SwvmGkmi9LZN5h0zWxKLhR9JL+6LbSTPpZAk033SnaIOLGOD/9CGAY4//6ZO?=
 =?us-ascii?Q?iWRmtyV0+0V38uA8qSizdT1vdSIDvz9HyYLJ+BQA5LsGMo+W8v2KT28gUhQy?=
 =?us-ascii?Q?QrVRFmxnBlcxp6cM2WCi8jTG5DvhXRVaIpAk2YKW9yWpQFuhHv3arMjT+fBt?=
 =?us-ascii?Q?sGNK4aa8AZABunmi8MuEYJEIlBZOSzngtPFgzl18aLRgSZPK5qXXW0n5wuNf?=
 =?us-ascii?Q?hzikUxx/MmQraEKg0Hm7PgCwHPbW2ad9PH/K0y/NZPUMd2cE4wAyDUZIV17Q?=
 =?us-ascii?Q?dGiBIM9h0nUqxtebvnzJ3kHdtr8pY7RkIzEcAyS7oy/SO7e8M/I6K5wzXiTt?=
 =?us-ascii?Q?MiK6bgwJy3Yd/P2v7Xnv8Az/fbfVHue2CJP6Jt8xKmUJg3xKYcsML4L+3kTT?=
 =?us-ascii?Q?L9REs1J9IbtABf/bHVVymsVPlRTYBlMv4co27hvpueJVY2WhZt2LtTaWAPy/?=
 =?us-ascii?Q?bcV3Ayrn+FUuB1c0+TTCUT7vIF9KMqzQD+k5awlHx4HgjCgvL8Yh59xfnjyw?=
 =?us-ascii?Q?TkUnf9uA3BnNgBKmggK4da5bPYvodkiJLsuURpHU80pvIr9/e1o77hDuboYQ?=
 =?us-ascii?Q?2Oe67GwR7aV/8bvIb2Wh023CyJmrqondHlQBMWkAdshrKSaThybotNkRzn5W?=
 =?us-ascii?Q?HhLwI6xZZz3QRikdk/cQxSs8wEk3Lg8eImIUP+Wx9coOPCsiD9en4I2G9GAk?=
 =?us-ascii?Q?UB0O1aHaW3Cu//IXkjlYOigEHQ5iV4TXK5g4bUqSkz/+9Vb9PcxOUAOmXM9C?=
 =?us-ascii?Q?mGp3LqmDu0NlYh9nMjenDaDfX3yBIyQAKy72uO9LwALYKeQ/QSXiW/9EOUEz?=
 =?us-ascii?Q?dMcMhTvxIeoT2IatbDhleOSH6GZw1GmvOCHdnCmmLtUG4Gl4x6VOG6L2mrsR?=
 =?us-ascii?Q?nNn69UeSaSyezFDFnUV9TNJnECjS+98VMhbPecWMkUR3EFc7RqdSg0l6IQlf?=
 =?us-ascii?Q?oqSCkeARYWAacmnQ+7s0T6ZAmLdsXngtctNTaAaCxEGgfD5BEelilS1e4GsQ?=
 =?us-ascii?Q?4UziBGxh2NA4Pye7dEw2fnyk/a/SSVU/g/ukQjzGzZsV/fI5sqYRbmG+kf9S?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71be3457-a908-4328-9bd8-08dc44691a15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:55:38.1678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4iX4hNyN07zQ+735+KXe0KhL+WSb+A2VyicOZLnYnYGpSY7Wj0nm0aQokg/zzxSA5sq1iIb3Yhs7aK87CrVfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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

On Wed, Mar 13, 2024 at 11:35:53PM -0400, Oak Zeng wrote:
> This is an effort to unify hmmptr (aka system allocator)
> and userptr code. hmm_range_fault is used to populate
> a virtual address range for both hmmptr and userptr,
> instead of hmmptr using hmm_range_fault and userptr
> using get_user_pages_fast.
> 
> This also aligns with AMD gpu driver's behavior. In
> long term, we plan to put some common helpers in this
> area to drm layer so it can be re-used by different
> vendors.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 105 ++-----------------------------------
>  1 file changed, 4 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index db3f049a47dc..d6088dcac74a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -38,6 +38,7 @@
>  #include "xe_sync.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
> +#include "xe_hmm.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -65,113 +66,15 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>  
>  int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)

See my comments in the previous patch about layer, those comments are
valid here too.

>  {
> -	struct xe_userptr *userptr = &uvma->userptr;
>  	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
> -	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
> -	struct page **pages;
> -	bool in_kthread = !current->mm;
> -	unsigned long notifier_seq;
> -	int pinned, ret, i;
> -	bool read_only = xe_vma_read_only(vma);
> +	bool write = !xe_vma_read_only(vma);
> +	struct hmm_range hmm_range;
>  
>  	lockdep_assert_held(&vm->lock);
>  	xe_assert(xe, xe_vma_is_userptr(vma));
> -retry:
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> -		return 0;

^^^
This should not be dropped. Both the vma->gpuva.flags & XE_VMA_DESTROYED
and userptr invalidation check retry loop should still be in here.

> -
> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -	if (notifier_seq == userptr->notifier_seq)
> -		return 0;
> -
> -	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> -	if (!pages)
> -		return -ENOMEM;
> -
> -	if (userptr->sg) {
> -		dma_unmap_sgtable(xe->drm.dev,
> -				  userptr->sg,
> -				  read_only ? DMA_TO_DEVICE :
> -				  DMA_BIDIRECTIONAL, 0);
> -		sg_free_table(userptr->sg);
> -		userptr->sg = NULL;
> -	}

^^^
Likewise, I don't think this should be dropped either.

> -
> -	pinned = ret = 0;
> -	if (in_kthread) {
> -		if (!mmget_not_zero(userptr->notifier.mm)) {
> -			ret = -EFAULT;
> -			goto mm_closed;
> -		}
> -		kthread_use_mm(userptr->notifier.mm);
> -	}

^^^
Nor this.

> -
> -	while (pinned < num_pages) {
> -		ret = get_user_pages_fast(xe_vma_userptr(vma) +
> -					  pinned * PAGE_SIZE,
> -					  num_pages - pinned,
> -					  read_only ? 0 : FOLL_WRITE,
> -					  &pages[pinned]);
> -		if (ret < 0)
> -			break;
> -
> -		pinned += ret;
> -		ret = 0;
> -	}

^^^
We should be replacing this.

> -
> -	if (in_kthread) {
> -		kthread_unuse_mm(userptr->notifier.mm);
> -		mmput(userptr->notifier.mm);
> -	}
> -mm_closed:
> -	if (ret)
> -		goto out;
> -
> -	ret = sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
> -						pinned, 0,
> -						(u64)pinned << PAGE_SHIFT,
> -						xe_sg_segment_size(xe->drm.dev),
> -						GFP_KERNEL);
> -	if (ret) {
> -		userptr->sg = NULL;
> -		goto out;
> -	}
> -	userptr->sg = &userptr->sgt;
> -
> -	ret = dma_map_sgtable(xe->drm.dev, userptr->sg,
> -			      read_only ? DMA_TO_DEVICE :
> -			      DMA_BIDIRECTIONAL,
> -			      DMA_ATTR_SKIP_CPU_SYNC |
> -			      DMA_ATTR_NO_KERNEL_MAPPING);
> -	if (ret) {
> -		sg_free_table(userptr->sg);
> -		userptr->sg = NULL;
> -		goto out;
> -	}
> -
> -	for (i = 0; i < pinned; ++i) {
> -		if (!read_only) {
> -			lock_page(pages[i]);
> -			set_page_dirty(pages[i]);
> -			unlock_page(pages[i]);
> -		}
> -
> -		mark_page_accessed(pages[i]);
> -	}
> -
> -out:
> -	release_pages(pages, pinned);
> -	kvfree(pages);

^^^
Through here (minus existing the kthread) with hmm call. I guess the
kthread enter / exit could be in the hmm layer too.

Matt

> -
> -	if (!(ret < 0)) {
> -		userptr->notifier_seq = notifier_seq;
> -		if (xe_vma_userptr_check_repin(uvma) == -EAGAIN)
> -			goto retry;
> -	}
> -
> -	return ret < 0 ? ret : 0;
> +	return xe_hmm_populate_range(vma, &hmm_range, write);
>  }
>  
>  static bool preempt_fences_waiting(struct xe_vm *vm)
> -- 
> 2.26.3
> 
