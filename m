Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A67C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 15:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9883110E120;
	Tue,  8 Sep 2026 15:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ch/UUO5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912E810E120
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788880050; x=1820416050;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6kHX5lr9Zr2NSQmXQSePoGY+ZeYw4TU8wwKmasgmIro=;
 b=Ch/UUO5YCmNMJm3fmKlnOkYwO72SzNJNsBhElxcAo54347sLFz9Z/Cp9
 V4/NZ0Fy4Fr+t8cZBqyH/bQlZ1s+2tLYMhZeBF4kgh4FzZ8ONyN51ui60
 tyw5gj1aTH6tgEwFO4TU197t/Opw2uVqcs22SkpT6AUGIivHqth99NS6s
 jm37a2tv0mGjvCzm6i89jMP75p6jDl8VnWHNKmqauhZxmTGOd0ttvESuw
 1q7O9cMOGuaxgEYCivTEtlAqGICLQF/lAgLAI3118ePAeECd2u1hyvJHG
 I0DVHnryEMzAobe3HfHDk3Q2Q2902lM5SXERCYtuc5Ya534sNMzNPaPKZ A==;
X-CSE-ConnectionGUID: Czk2vhLCRsqAphtC1jg9sg==
X-CSE-MsgGUID: gMYPMzZmQMeFuptOBhI/Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89315256"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89315256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:07:30 -0700
X-CSE-ConnectionGUID: M/Lcl0B7TEqCt3F9t7Zz5g==
X-CSE-MsgGUID: l2tFUIddSn2LIxtSkDv7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="269283125"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.156])
 ([10.245.244.156])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 08:07:28 -0700
Message-ID: <a06a4f77-1ff2-4083-aad5-9904a7e230bd@linux.intel.com>
Date: Tue, 8 Sep 2026 17:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Ilia Levi <ilia.levi@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
 <20260908134955.1344429-18-matthew.auld@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260908134955.1344429-18-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 9/8/26 15:50, Matthew Auld wrote:
> Convert the PCI barrier mmap over to use xe_mmio_gem, which is a good
> match for this functionality. This has the following advantages:
>
>   1. Removes a bunch of code.
>   2. Replaces the fragile hard coded fake offset design.
>   3. Adds the first user for xe_mmio_gem, which is preferred over nuking
>      it. There are also potentially other upcoming usecases wanting this
>      type of functionality, so having standard component to do this would
>      be good.
>
> There shouldn't be any big functional change here. From userspace pov,
> they still query the fake offset like before, just that now it is no
> longer hard coded in the KMD.
>
> Assisted-by: LLM
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Ilia Levi <ilia.levi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           |  24 +++++--
>   drivers/gpu/drm/xe/xe_bo.h           |   1 -
>   drivers/gpu/drm/xe/xe_device.c       | 104 +++------------------------
>   drivers/gpu/drm/xe/xe_device_types.h |  12 ++++
>   4 files changed, 41 insertions(+), 100 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b162753cebb7..8de1b9a94315 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -28,6 +28,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
> +#include "xe_mmio_gem.h"
>   #include "xe_pat.h"
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
> @@ -3680,18 +3681,31 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   
>   	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		struct xe_file *xef = file->driver_priv;
> +
>   		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
>   			return -EINVAL;
>   
>   		if (XE_IOCTL_DBG(xe, args->handle))
>   			return -EINVAL;
>   
> -		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> -			return -EINVAL;
> +		guard(mutex)(&xef->mmio_gem.lock);

Can we use scoped_guard() to "annotate" the locked region?


> +		if (!xef->mmio_gem.pci_barrier) {
> +			phys_addr_t phys_addr;
> +			int err;
>   
> -		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
> -			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
> -		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
> +#define LAST_DB_PAGE_OFFSET 0x7ff000
> +			phys_addr = pci_resource_start(to_pci_dev(dev->dev), 0) +
> +				LAST_DB_PAGE_OFFSET;
> +			xef->mmio_gem.pci_barrier = xe_mmio_gem_create(xe, file, phys_addr, SZ_4K);
> +			if (IS_ERR(xef->mmio_gem.pci_barrier)) {
> +				err = PTR_ERR(xef->mmio_gem.pci_barrier);
> +				xef->mmio_gem.pci_barrier = NULL;
> +				return err;
> +			}
> +		}
> +
> +		args->offset = xe_mmio_gem_mmap_offset(xef->mmio_gem.pci_barrier);
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index eede678ad303..290ca624e2a7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -87,7 +87,6 @@
>   
>   #define XE_BO_PROPS_INVALID	(-1)
>   
> -#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>   
>   /**
>    * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8583b2e9ecf4..515fae065178 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -50,6 +50,7 @@
>   #include "xe_late_bind_fw.h"
>   #include "xe_log.h"
>   #include "xe_mmio.h"
> +#include "xe_mmio_gem.h"
>   #include "xe_module.h"
>   #include "xe_nvm.h"
>   #include "xe_oa.h"
> @@ -111,6 +112,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	mutex_init(&xef->exec_queue.lock);
>   	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>   
> +	mutex_init(&xef->mmio_gem.lock);
> +
>   	file->driver_priv = xef;
>   	kref_init(&xef->refcount);
>   
> @@ -133,6 +136,8 @@ static void xe_file_destroy(struct kref *ref)
>   	xa_destroy(&xef->vm.xa);
>   	mutex_destroy(&xef->vm.lock);
>   
> +	mutex_destroy(&xef->mmio_gem.lock);
> +
>   	xe_drm_client_put(xef->client);
>   	kfree(xef->process_name);
>   	kfree(xef);
> @@ -189,6 +194,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	xa_for_each(&xef->vm.xa, idx, vm)
>   		xe_vm_close_and_put(vm);
>   
> +	if (xef->mmio_gem.pci_barrier) {
> +		xe_mmio_gem_destroy(xef->mmio_gem.pci_barrier, file);
> +		xef->mmio_gem.pci_barrier = NULL;
> +	}
> +

While we shouldn't be able to race here, Perhaps lock this anyway to 
make static analyzers happy?

>   	xe_file_put(xef);
>   }
>   
> @@ -258,95 +268,6 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>   #define xe_drm_compat_ioctl NULL
>   #endif
>   
> -static void barrier_open(struct vm_area_struct *vma)
> -{
> -	drm_dev_get(vma->vm_private_data);
> -}
> -
> -static void barrier_close(struct vm_area_struct *vma)
> -{
> -	drm_dev_put(vma->vm_private_data);
> -}
> -
> -static void barrier_release_dummy_page(struct drm_device *dev, void *res)
> -{
> -	struct page *dummy_page = (struct page *)res;
> -
> -	__free_page(dummy_page);
> -}
> -
> -static vm_fault_t barrier_fault(struct vm_fault *vmf)
> -{
> -	struct drm_device *dev = vmf->vma->vm_private_data;
> -	struct vm_area_struct *vma = vmf->vma;
> -	vm_fault_t ret = VM_FAULT_NOPAGE;
> -	pgprot_t prot;
> -	int idx;
> -
> -	prot = vma_get_page_prot(vma);
> -
> -	if (drm_dev_enter(dev, &idx)) {
> -		unsigned long pfn;
> -
> -#define LAST_DB_PAGE_OFFSET 0x7ff001
> -		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
> -				LAST_DB_PAGE_OFFSET);
> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> -					  pgprot_noncached(prot));
> -		drm_dev_exit(idx);
> -	} else {
> -		struct page *page;
> -
> -		/* Allocate new dummy page to map all the VA range in this VMA to it*/
> -		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -		if (!page)
> -			return VM_FAULT_OOM;
> -
> -		/* Set the page to be freed using drmm release action */
> -		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
> -			return VM_FAULT_OOM;
> -
> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
> -					  prot);
> -	}
> -
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct vm_ops_barrier = {
> -	.open = barrier_open,
> -	.close = barrier_close,
> -	.fault = barrier_fault,
> -};
> -
> -static int xe_pci_barrier_mmap(struct file *filp,
> -			       struct vm_area_struct *vma)
> -{
> -	struct drm_file *priv = filp->private_data;
> -	struct drm_device *dev = priv->minor->dev;
> -	struct xe_device *xe = to_xe_device(dev);
> -
> -	if (!IS_DGFX(xe))
> -		return -EINVAL;
> -
> -	if (vma->vm_end - vma->vm_start > SZ_4K)
> -		return -EINVAL;
> -
> -	if (vma_is_cow_mapping(vma))
> -		return -EINVAL;
> -
> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
> -		return -EINVAL;
> -
> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> -	vma->vm_ops = &vm_ops_barrier;
> -	vma->vm_private_data = dev;
> -	drm_dev_get(vma->vm_private_data);
> -
> -	return 0;
> -}
> -
>   static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>   {
>   	struct drm_file *priv = filp->private_data;
> @@ -355,11 +276,6 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>   	if (drm_dev_is_unplugged(dev))
>   		return -ENODEV;
>   
> -	switch (vma->vm_pgoff) {
> -	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> -		return xe_pci_barrier_mmap(filp, vma);
> -	}
> -
>   	return drm_gem_mmap(filp, vma);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..0391a20646cf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -40,6 +40,7 @@ struct intel_display;
>   struct intel_dg_nvm_dev;
>   struct xe_ggtt;
>   struct xe_i2c;
> +struct xe_mmio_gem;
>   struct xe_pat_ops;
>   struct xe_pxp;
>   struct xe_ttm_stolen_mgr;
> @@ -676,6 +677,17 @@ struct xe_file {
>   
>   	/** @refcount: ref count of this xe file */
>   	struct kref refcount;
> +
> +	/** @mmio_gem: MMIO GEM objects for this xe file */
> +	struct {
> +		/**
> +		 * @mmio_gem.lock: Protects allocation and attach of MMIO GEM
> +		 * objects (singleton).


... And if so, update the docs here?


> +		 */
> +		struct mutex lock;
> +		/** @mmio_gem.pci_barrier: MMIO GEM object for PCI barrier mmap. */
> +		struct xe_mmio_gem *pci_barrier;
> +	} mmio_gem;
>   };
>   
>   #endif
