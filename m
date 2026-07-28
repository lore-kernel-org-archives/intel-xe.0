Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E4DC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7891410E5C0;
	Tue, 28 Jul 2026 16:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWUBIh7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B1510E5C0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785256421; x=1816792421;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mcQSkgMfzsyEUy+mR7JKnGmWhdI4p2elWVdG/5ZGszI=;
 b=WWUBIh7vruMZp42gNoTI7BYPsBajd2U9Oe2zgB80CUP3ClbszZktNmVb
 uWeYdr/yLaNDTvrUdwfE5+RTbr1tmNA6nNyHcjTwqRXpwNgyo79csX+6U
 YXV4iZnt8xv9UQgrd29xzV0aFwBxyRlbqjWAxKtc8m9xuT41xxoTI5/93
 pHJaYXRKqdV13Rsb5S5+lEYTNm1KGJcYjWjctRqBIum5sOaGUeW1FEUf+
 YBfHZCvnXr8D0AdwbNX9U4gwdF+x7PClLNzf7aCKOXzLh8r/lNqylQtir
 AWfbDP84cyeonaav3I2LsVQfuaHoyXqRgcmf0M3izsii3yExbAUAaozH0 w==;
X-CSE-ConnectionGUID: 3GktjGoLTYWJZwZZDuASgg==
X-CSE-MsgGUID: 8luFM6PaTBOBbnazCO57GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96203019"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96203019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:33:40 -0700
X-CSE-ConnectionGUID: xVAPUzjCRUmkRmteO7FvKQ==
X-CSE-MsgGUID: 5gsNoIqtSxubTIQM3K9jNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="253415157"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.120])
 ([10.245.244.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:33:38 -0700
Message-ID: <6f9b4590-2738-4f19-8909-a42f6c5b4d4a@intel.com>
Date: Tue, 28 Jul 2026 17:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/xe/mmio_gem: cache the dummy page per object
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, meny.yossefi@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, matthew.brost@intel.com
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-6-ilia.levi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260723161832.137153-6-ilia.levi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/07/2026 17:18, Ilia Levi wrote:
> Currently, when the fault handler provides a dummy page, it
> allocates a new one on every invocation and ties its lifetime to
> the drm_device via drmm_add_action_or_reset(). Concurrent faults
> after hot-unplug therefore accumulate pages that persist until
> device teardown.
> 
> Cache a single dummy page in the xe_mmio_gem object and use dma_resv
> lock to protect its allocation. Free it with the object.
> 
> v2: use dma_resv lock to protect the allocation (Matt Auld)
> 
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Do we anticipate this be a real issue in practice? I think normal BO 
mmap path just allocates a new page without caching? Is that also a concern?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index 2838fcb4ff9f..5bd2759fc876 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -5,9 +5,9 @@
>   
>   #include "xe_mmio_gem.h"
>   
> +#include <linux/dma-resv.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem.h>
> -#include <drm/drm_managed.h>
>   
>   #include "xe_device_types.h"
>   
> @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>   struct xe_mmio_gem {
>   	struct drm_gem_object base;
>   	phys_addr_t phys_addr;
> +	struct page *dummy_page; /* protected by the GEM's dma_resv */
>   };
>   
>   static int xe_mmio_gem_vm_may_split(struct vm_area_struct *area, unsigned long addr)
> @@ -131,6 +132,8 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
>   {
>   	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>   
> +	if (obj->dummy_page)
> +		__free_page(obj->dummy_page);
>   	drm_gem_object_release(base);
>   	kfree(obj);
>   }
> @@ -169,27 +172,29 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>   	return 0;
>   }
>   
> -static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
> +static int alloc_dummy_page_if_needed(struct drm_gem_object *base)
>   {
> -	__free_page((struct page *)res);
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> +
> +	dma_resv_lock(base->resv, NULL);
> +	if (!obj->dummy_page)
> +		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	dma_resv_unlock(base->resv);
> +
> +	return obj->dummy_page ? 0 : -ENOMEM;
>   }
>   
>   static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct drm_gem_object *base = vma->vm_private_data;
> -	struct drm_device *dev = base->dev;
> -	struct page *page;
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>   	unsigned long pfn;
>   
> -	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -	if (!page)
> -		return VM_FAULT_OOM;
> -
> -	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
> +	if (alloc_dummy_page_if_needed(base))
>   		return VM_FAULT_OOM;
>   
> -	pfn = page_to_pfn(page);
> +	pfn = page_to_pfn(obj->dummy_page);
>   
>   	return vmf_insert_pfn_prot(vma, vmf->address, pfn,
>   				   vm_get_page_prot(vma->vm_flags));

