Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A9EC44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB2A10E831;
	Mon, 20 Jul 2026 09:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkaPmu7H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709A110E830
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538162; x=1816074162;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QBc5TXV8iKCZrJn1OwV7l/CFZf2Zq6LmzxLtssuGiiI=;
 b=LkaPmu7Hkquc9FNaQeCSumLEK9xSVQN8WOxpvzaiqrTLQrVG4QoL4GhJ
 Hen3lPeuP9Y7e4dWoIVnEiNIdLXzNGrJC7SEc5T7l8Em1icw/j14xk9RE
 UH05KCM5B9JtwltEMLDCkmg6vtbSS8RoTNghY2hd/LmW8koNeCPkM+gK+
 PLEP9dXRyFA7tS5alaK/0FH+ieWZQNi/a54eT4WHLwRvrOAe9+c87AYcz
 ZjvsTLbdSoNWj4dl2jfByS9NMhPcCvZ+Mt/6XxzAlVPfIkAhmsLAd4w/g
 cnrlcndu6s8s54i+0zmxwr4yJ1GHyMNdkNnFEq3kqdYUq0JL/ShwPp5QW A==;
X-CSE-ConnectionGUID: jVnZxMaPRWKfPa/UPnpCEg==
X-CSE-MsgGUID: MaEYrdjNQiSQdFqqqJLUnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="96478557"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="96478557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:02:41 -0700
X-CSE-ConnectionGUID: ys84T+SBQ064tdCYIwjv6A==
X-CSE-MsgGUID: 12blbhfQQEexEXZVkD7orA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="262366149"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.155])
 ([10.245.244.155])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:02:40 -0700
Message-ID: <52742ec7-d151-4bf4-8825-12d281cca959@intel.com>
Date: Mon, 20 Jul 2026 10:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ilia Levi <ilia.levi@intel.com>
References: <20260717112455.840392-2-matthew.auld@intel.com>
 <alqv2b+dt/KaxEKi@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <alqv2b+dt/KaxEKi@gsse-cloud1.jf.intel.com>
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

On 17/07/2026 23:42, Matthew Brost wrote:
> On Fri, Jul 17, 2026 at 12:24:56PM +0100, Matthew Auld wrote:
>> Convert the PCI barrier mmap over to use xe_mmio_gem, which is a good
>> match for this functionality. This has the following advantages:
>>
>>   1) Removes a bunch of code.
>>   2) Replaces the fragile hard coded fake offset design.
>>   3) Adds the first user for xe_mmio_gem, which is preferred over nuking
>>      it.
>>
>> There shouldn't be any big functional change here. From userspace pov,
>> they still query the fake offset like before, just that now it is no
>> longer hard coded in the KMD.
>>
>> TODO: We still need to fixup all existing mmio_gem issues.
> 
> This patch itself looks sane enough but Sashiko did point out several
> valid issues with mmio_gem. What is the plan here? I would think while
> we are here clean those up too as part of this series?
> 
> The big ones I think are:
> 
> - Leaking a VMA node
> - Honor GEM refcount (i.e., xe_mmio_gem_destroy should be a put)
> - Add some permission control to mmio_gem

Yes, I think pretty much all of those are known issues:

https://patchwork.freedesktop.org/series/167217/

Except for two new mmio_gem flagged issues. I will add a comment for those.

Ilia, maybe we just bolt this patch to the end of your series, when you 
send the next revision?

> 
> Matt
> 
>>
>> Assisted-by: Gemini:gemini-3.1-pro-preview
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Ilia Levi <ilia.levi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           |  24 +++++--
>>   drivers/gpu/drm/xe/xe_bo.h           |   1 -
>>   drivers/gpu/drm/xe/xe_device.c       | 102 +++------------------------
>>   drivers/gpu/drm/xe/xe_device_types.h |  12 ++++
>>   4 files changed, 39 insertions(+), 100 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index c266fa6bade1..16ddbdf7628f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -28,6 +28,7 @@
>>   #include "xe_ggtt.h"
>>   #include "xe_map.h"
>>   #include "xe_migrate.h"
>> +#include "xe_mmio_gem.h"
>>   #include "xe_pat.h"
>>   #include "xe_pm.h"
>>   #include "xe_preempt_fence.h"
>> @@ -3503,18 +3504,31 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>   		return -EINVAL;
>>   
>>   	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
>> +		struct xe_file *xef = file->driver_priv;
>> +
>>   		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
>>   			return -EINVAL;
>>   
>>   		if (XE_IOCTL_DBG(xe, args->handle))
>>   			return -EINVAL;
>>   
>> -		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
>> -			return -EINVAL;
>> +		guard(mutex)(&xef->mmio_gem.lock);
>> +		if (!xef->mmio_gem.pci_barrier) {
>> +			phys_addr_t phys_addr;
>> +			int err;
>>   
>> -		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
>> -			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
>> -		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
>> +#define LAST_DB_PAGE_OFFSET 0x7ff000
>> +			phys_addr = pci_resource_start(to_pci_dev(dev->dev), 0) +
>> +				LAST_DB_PAGE_OFFSET;
>> +			xef->mmio_gem.pci_barrier = xe_mmio_gem_create(xe, file, phys_addr, SZ_4K);
>> +			if (IS_ERR(xef->mmio_gem.pci_barrier)) {
>> +				err = PTR_ERR(xef->mmio_gem.pci_barrier);
>> +				xef->mmio_gem.pci_barrier = NULL;
>> +				return err;
>> +			}
>> +		}
>> +
>> +		args->offset = xe_mmio_gem_mmap_offset(xef->mmio_gem.pci_barrier);
>>   		return 0;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 7ae1d9ac0574..82a4666ca51e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -85,7 +85,6 @@
>>   
>>   #define XE_BO_PROPS_INVALID	(-1)
>>   
>> -#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>>   
>>   /**
>>    * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 4eed9a251e65..35a701980061 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -49,6 +49,7 @@
>>   #include "xe_irq.h"
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_mmio.h"
>> +#include "xe_mmio_gem.h"
>>   #include "xe_module.h"
>>   #include "xe_nvm.h"
>>   #include "xe_oa.h"
>> @@ -110,6 +111,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>   	mutex_init(&xef->exec_queue.lock);
>>   	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>>   
>> +	mutex_init(&xef->mmio_gem.lock);
>> +
>>   	file->driver_priv = xef;
>>   	kref_init(&xef->refcount);
>>   
>> @@ -132,6 +135,8 @@ static void xe_file_destroy(struct kref *ref)
>>   	xa_destroy(&xef->vm.xa);
>>   	mutex_destroy(&xef->vm.lock);
>>   
>> +	mutex_destroy(&xef->mmio_gem.lock);
>> +
>>   	xe_drm_client_put(xef->client);
>>   	kfree(xef->process_name);
>>   	kfree(xef);
>> @@ -188,6 +193,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>   	xa_for_each(&xef->vm.xa, idx, vm)
>>   		xe_vm_close_and_put(vm);
>>   
>> +	if (xef->mmio_gem.pci_barrier)
>> +		xe_mmio_gem_destroy(xef->mmio_gem.pci_barrier);
>> +
>>   	xe_file_put(xef);
>>   }
>>   
>> @@ -257,95 +265,6 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>>   #define xe_drm_compat_ioctl NULL
>>   #endif
>>   
>> -static void barrier_open(struct vm_area_struct *vma)
>> -{
>> -	drm_dev_get(vma->vm_private_data);
>> -}
>> -
>> -static void barrier_close(struct vm_area_struct *vma)
>> -{
>> -	drm_dev_put(vma->vm_private_data);
>> -}
>> -
>> -static void barrier_release_dummy_page(struct drm_device *dev, void *res)
>> -{
>> -	struct page *dummy_page = (struct page *)res;
>> -
>> -	__free_page(dummy_page);
>> -}
>> -
>> -static vm_fault_t barrier_fault(struct vm_fault *vmf)
>> -{
>> -	struct drm_device *dev = vmf->vma->vm_private_data;
>> -	struct vm_area_struct *vma = vmf->vma;
>> -	vm_fault_t ret = VM_FAULT_NOPAGE;
>> -	pgprot_t prot;
>> -	int idx;
>> -
>> -	prot = vm_get_page_prot(vma->vm_flags);
>> -
>> -	if (drm_dev_enter(dev, &idx)) {
>> -		unsigned long pfn;
>> -
>> -#define LAST_DB_PAGE_OFFSET 0x7ff001
>> -		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
>> -				LAST_DB_PAGE_OFFSET);
>> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
>> -					  pgprot_noncached(prot));
>> -		drm_dev_exit(idx);
>> -	} else {
>> -		struct page *page;
>> -
>> -		/* Allocate new dummy page to map all the VA range in this VMA to it*/
>> -		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> -		if (!page)
>> -			return VM_FAULT_OOM;
>> -
>> -		/* Set the page to be freed using drmm release action */
>> -		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
>> -			return VM_FAULT_OOM;
>> -
>> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
>> -					  prot);
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>> -static const struct vm_operations_struct vm_ops_barrier = {
>> -	.open = barrier_open,
>> -	.close = barrier_close,
>> -	.fault = barrier_fault,
>> -};
>> -
>> -static int xe_pci_barrier_mmap(struct file *filp,
>> -			       struct vm_area_struct *vma)
>> -{
>> -	struct drm_file *priv = filp->private_data;
>> -	struct drm_device *dev = priv->minor->dev;
>> -	struct xe_device *xe = to_xe_device(dev);
>> -
>> -	if (!IS_DGFX(xe))
>> -		return -EINVAL;
>> -
>> -	if (vma->vm_end - vma->vm_start > SZ_4K)
>> -		return -EINVAL;
>> -
>> -	if (is_cow_mapping(vma->vm_flags))
>> -		return -EINVAL;
>> -
>> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
>> -		return -EINVAL;
>> -
>> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
>> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
>> -	vma->vm_ops = &vm_ops_barrier;
>> -	vma->vm_private_data = dev;
>> -	drm_dev_get(vma->vm_private_data);
>> -
>> -	return 0;
>> -}
>> -
>>   static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>>   {
>>   	struct drm_file *priv = filp->private_data;
>> @@ -354,11 +273,6 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>>   	if (drm_dev_is_unplugged(dev))
>>   		return -ENODEV;
>>   
>> -	switch (vma->vm_pgoff) {
>> -	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
>> -		return xe_pci_barrier_mmap(filp, vma);
>> -	}
>> -
>>   	return drm_gem_mmap(filp, vma);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 56c17cca79c0..932aabb16570 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -38,6 +38,7 @@
>>   struct drm_pagemap_shrinker;
>>   struct intel_display;
>>   struct intel_dg_nvm_dev;
>> +struct xe_mmio_gem;
>>   struct xe_ggtt;
>>   struct xe_i2c;
>>   struct xe_pat_ops;
>> @@ -638,6 +639,17 @@ struct xe_file {
>>   
>>   	/** @refcount: ref count of this xe file */
>>   	struct kref refcount;
>> +
>> +	/** @mmio_gem: MMIO GEM objects for this xe file */
>> +	struct {
>> +		/**
>> +		 * @mmio_gem.lock: Protects allocation and attach of MMIO GEM
>> +		 * objects (singleton).
>> +		 */
>> +		struct mutex lock;
>> +		/** @mmio_gem.pci_barrier: MMIO GEM object for PCI barrier mmap. */
>> +		struct xe_mmio_gem *pci_barrier;
>> +	} mmio_gem;
>>   };
>>   
>>   #endif
>> -- 
>> 2.55.0
>>

