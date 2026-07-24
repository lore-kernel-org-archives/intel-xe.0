Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1900C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 12:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DFC10E054;
	Fri, 24 Jul 2026 12:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBe5pgTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962F810E054
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784897459; x=1816433459;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7OycSMolmf1RtlsL133yrrS7yAo5M6JPVbX/D+D6CPc=;
 b=BBe5pgTYAvG1zac6B3IhvB/drF8x9+rfz0esKWaFk2gb9pta8Ele8Qxm
 3cedLoyq8FkpMkUr2xle5cs7deLBpDEJMhe3EykV9KMbh6v6iGmVBMrnv
 Uz1f9RmgQvMT4ZnjbGAsYIVOp2WkhKbP/sDHRJ7jQEJGX8K5aFdPo1Yba
 UZ9SIfi7krSuEhYvbdUDW2XW9uVFqKfi1WPgd/8Vr+oxHfYi/j8Zw/WKy
 89ZPp4VivYNJe+hZVKR9wl5kmlEzbdztxByXV1hNcTFOINkaZPcLKav7f
 FDFqK6zMD84Dq78q8MqqIig9YYPWq6ioPXBuNkVxDJ5EMigET7QizpnpT w==;
X-CSE-ConnectionGUID: mNvCckt4Q6qoPtcpWF+Vqg==
X-CSE-MsgGUID: I04HqcleTO2StRE/8WAwaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73104315"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="73104315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 05:50:58 -0700
X-CSE-ConnectionGUID: O5+ugMYmTPWVJtL7Srd3TQ==
X-CSE-MsgGUID: U2PNpUN1RhewoX6KIJGcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="256049679"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.7])
 ([10.245.245.7])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 05:50:56 -0700
Message-ID: <ce4d7230-237f-4256-b3de-219b791417b4@intel.com>
Date: Fri, 24 Jul 2026 13:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/mmio_gem: fix destroy flow
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, meny.yossefi@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, matthew.brost@intel.com
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-7-ilia.levi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260723161832.137153-7-ilia.levi@intel.com>
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
> xe_mmio_gem_destroy() currently frees the GEM object directly, bypassing
> reference counting.  Since existing VMAs hold a reference and the fault
> handler accesses the object through vma->vm_private_data, this is
> use-after-free.  Additionally, nothing prevents the fault handler from
> installing PTEs to the real MMIO after destroy.
> 
> Fix this with proper synchronization and refcounting. Also, do not set
> vm_pgoff to zero. Many DRM drivers do this because helpers like
> dma_mmap_pages() interpret vm_pgoff as an intra-buffer page offset;
> leaving the DRM fake offset there would break these helpers.
> Those drivers can get away with zeroing it because they map eagerly -
> all PTEs are established before mmap returns, so vm_pgoff is never
> consulted again. Our driver does not use such helpers and the newly
> introduced call to drm_vma_node_unmap() relies on vm_pgoff being untouched.
> 
> v2: (Matt Auld)
> - use dma_resv lock to serialize fault handler with destroy
> - SIGBUS on access after destroy
> 
> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio_gem.c | 42 ++++++++++++++++++++++++++------
>   1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index 5bd2759fc876..ef48642a0733 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -38,6 +38,7 @@ struct xe_mmio_gem {
>   	struct drm_gem_object base;
>   	phys_addr_t phys_addr;
>   	struct page *dummy_page; /* protected by the GEM's dma_resv */
> +	bool destroyed; /* protected by the GEM's dma_resv */
>   };
>   
>   static int xe_mmio_gem_vm_may_split(struct vm_area_struct *area, unsigned long addr)
> @@ -150,8 +151,22 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
>    */
>   void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file)
>   {
> -	drm_vma_node_revoke(&gem->base.vma_node, file);
> -	xe_mmio_gem_free(&gem->base);
> +	struct drm_gem_object *base = &gem->base;
> +	struct drm_device *dev = base->dev;
> +
> +	drm_vma_node_revoke(&base->vma_node, file);
> +
> +	dma_resv_lock(base->resv, NULL);
> +	gem->destroyed = true;
> +	dma_resv_unlock(base->resv);
> +	/*
> +	 * Setting 'destroyed' under lock takes care of the subsequent faults.
> +	 * Zap the existing PTEs to cut off access to the real MMIO through
> +	 * currently mapped pages.
> +	 */
> +	drm_vma_node_unmap(&base->vma_node, dev->anon_inode->i_mapping);
> +
> +	drm_gem_object_put(base);
>   }
>   
>   static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> @@ -162,8 +177,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>   	if ((vma->vm_flags & VM_SHARED) == 0)
>   		return -EINVAL;
>   
> -	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
> -	vma->vm_pgoff = 0;
>   	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>   	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>   		     VM_DONTCOPY | VM_NORESERVE);
> @@ -176,10 +189,9 @@ static int alloc_dummy_page_if_needed(struct drm_gem_object *base)
>   {
>   	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>   
> -	dma_resv_lock(base->resv, NULL);
> +	dma_resv_assert_held(base->resv);
>   	if (!obj->dummy_page)
>   		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -	dma_resv_unlock(base->resv);
>   
>   	return obj->dummy_page ? 0 : -ENOMEM;
>   }
> @@ -200,7 +212,7 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
>   				   vm_get_page_prot(vma->vm_flags));
>   }
>   
> -static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> +static vm_fault_t xe_mmio_gem_vm_fault_locked(struct vm_fault *vmf)
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct drm_gem_object *base = vma->vm_private_data;
> @@ -210,6 +222,10 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>   	unsigned long addr, pfn;
>   	int idx;
>   
> +	dma_resv_assert_held(base->resv);
> +	if (obj->destroyed)
> +		return VM_FAULT_SIGBUS;
> +
>   	if (!drm_dev_enter(dev, &idx)) {
>   		/*
>   		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
> @@ -232,3 +248,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>   	drm_dev_exit(idx);
>   	return ret;
>   }
> +
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct drm_gem_object *base = vma->vm_private_data;
> +	vm_fault_t ret;
> +
> +	dma_resv_lock(base->resv, NULL);

Not completely sure if locking order matters here with dma-resv -> 
drm_unplug_srcu, or if that should be inverted.

Also, wondering if this patch should go earlier in the series. The 
Sashiko report is hard to read since it complains about existing issues 
earlier in the series which are fixed later in the same series (this patch).

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	ret = xe_mmio_gem_vm_fault_locked(vmf);
> +	dma_resv_unlock(base->resv);
> +	return ret;
> +}

