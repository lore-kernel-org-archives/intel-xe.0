Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A514BC77B7F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 11:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DAF10E0DC;
	Mon, 23 Jun 2025 11:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJeeDRRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD0510E0DC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750677605; x=1782213605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+Mp4WKdpXSOHfViu/qyAWwlvQD6xPWqqloZY4ndKuCs=;
 b=JJeeDRRZoFFxRj4oZq9XWumyPfEGWWQfxx1Bq3HRZ73mkrN/ugGl7qB9
 MA9aYmTkrFIkYIWGuQizG/OSrrFjIlBAanQHZVpq5YY4L1duSKeU6QfJ3
 LY6jfPqYFEMCkQxQ3cAh5CVyXn17tWu8+3ROVocB6cNHl4ui1+84dBqO8
 kd+YaN5JGyWLFYoonX4S+Br3owK7hiUbEQSIgfi5eEMZHQSVmlNFxsFe6
 lI/n2CdpTHr9dTaBMyb9dIE8u5RSybRvUSmseKGjGgmRzapDw4acynSfq
 /IAzfZ/Z2Oyw9G6FU7ARDneQd9R0l7jxFySZdL5Vk8QJFt3PUjnbFw+LE Q==;
X-CSE-ConnectionGUID: j1FTAB3sROCkTWryRenPvA==
X-CSE-MsgGUID: rZwZ+no2RouMYBfxZgIzjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52746721"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52746721"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:20:05 -0700
X-CSE-ConnectionGUID: mhpaQbJjTqCTXj9WP2y+Fw==
X-CSE-MsgGUID: 0CvPVoQERXqTKfNiaA9FEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="150998736"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.244.101])
 ([10.245.244.101])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:20:03 -0700
Message-ID: <124acf5a-d6e6-41ea-b231-6bdcd63666ae@intel.com>
Date: Mon, 23 Jun 2025 12:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: "Levi, Ilia" <ilia.levi@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Haimovski, Moti" <moti.haimovski@intel.com>,
 "Freiman, Didi" <didi.freiman@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <SJ1PR11MB6204EF8ECD2EAE0F8F5AB93C816BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <47547e84-4d10-4037-9f9b-d1b02fa3fbac@intel.com>
 <SJ1PR11MB620443CA7F483CE7F4995250816AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <97dcc6e6-66c3-487f-b912-d343afe3bb56@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <97dcc6e6-66c3-487f-b912-d343afe3bb56@intel.com>
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

On 23/06/2025 11:31, Levi, Ilia wrote:
> On 10/06/2025 15:58, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Levi, Ilia <ilia.levi@intel.com>
>>> Sent: 10 June 2025 15:09
>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Cc: Elbaz, Koby <koby.elbaz@intel.com>; Sinyuk, Konstantin
>>> <konstantin.sinyuk@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.com>;
>>> Haimovski, Moti <moti.haimovski@intel.com>; Freiman, Didi
>>> <didi.freiman@intel.com>
>>> Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
>>>
>>> On 09/06/2025 17:20, Upadhyay, Tejas wrote:
>>>>> -----Original Message-----
>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>>> Ilia Levi
>>>>> Sent: 09 June 2025 15:30
>>>>> To: intel-xe@lists.freedesktop.org
>>>>> Cc: Levi, Ilia <ilia.levi@intel.com>; Elbaz, Koby
>>>>> <koby.elbaz@intel.com>; Sinyuk, Konstantin
>>>>> <konstantin.sinyuk@intel.com>; Avizrat, Yaron
>>>>> <yaron.avizrat@intel.com>; Haimovski, Moti
>>>>> <moti.haimovski@intel.com>; Freiman, Didi <didi.freiman@intel.com>
>>>>> Subject: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
>>>>>
>>>>> Allow the driver to expose hardware register spaces to userspace
>>>>> through GEM objects with fake mmap offsets. This can be useful for
>>>>> userspace- firmware communication, debugging, etc.
>>>>>
>>>>> v2: Minor doc fix (CI)
>>>>>
>>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>>>>   drivers/gpu/drm/xe/xe_mmio.c         | 142
>>> +++++++++++++++++++++++++++
>>>>>   drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>>>>   3 files changed, 160 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index ac27389ccb8b..78542de0d48d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -10,6 +10,7 @@
>>>>>
>>>>>   #include <drm/drm_device.h>
>>>>>   #include <drm/drm_file.h>
>>>>> +#include <drm/drm_gem.h>
>>>>>   #include <drm/drm_pagemap.h>
>>>>>   #include <drm/ttm/ttm_device.h>
>>>>>
>>>>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>>>>   	u32 adj_offset;
>>>>>   };
>>>>>
>>>>> +/**
>>>>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>>>>> + *
>>>>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>>>>> + */
>>>>> +struct xe_mmio_gem {
>>>>> +	/** @base: GEM object base */
>>>>> +	struct drm_gem_object base;
>>>>> +
>>>>> +	/** @mmio: The MMIO region to expose */
>>>>> +	struct xe_mmio mmio;
>>>>> +};
>>>>> +
>>>>>   /**
>>>>>    * struct xe_tile - hardware tile structure
>>>>>    *
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>>>>> b/drivers/gpu/drm/xe/xe_mmio.c index 7357458bc0d2..6bfa915a9602
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio
>>> *mmio,
>>>>> struct xe_reg reg, u32 mask, u32 va  {
>>>>>   	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val,
>>>>> atomic, false);  }
>>>>> +
>>>>> +/**
>>>>> + * DOC: Exposing MMIO regions to userspace
>>>>> + *
>>>>> + * In certain cases, the driver may allow userspace to mmap a
>>>>> +portion of the
>>>>> hardware registers.
>>>>> + *
>>>>> + * This can be done as follows:
>>>>> + * 1. Define an xe_mmio instance that represents this portion.
>>>>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an
>>>>> + mmap-able
>>>>> fake offset.
>>>>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to
>>>>> retrieve the fake offset.
>>>>> + * 4. Provide the fake offset to userspace.
>>>>> + * 5. Userspace can call mmap with the fake offset. The length
>>>>> + provided to
>>>>> mmap
>>>>> + *    must match the size of the xe_mmio instance.
>>>>> + * 6. When the region is no longer needed, call
>>>>> + xe_mmio_gem_destroy() to
>>>>> release the GEM object.
>>>>> + *
>>>>> + * Limitations: The exposed xe_mmio must be page-aligned with
>>>>> + regards to
>>>>> its BAR offset and size.
>>>>> + *
>>>>> + * WARNING: Exposing MMIO regions to userspace can have security and
>>>>> stability implications.
>>>>> + * Make sure not to expose any sensitive registers.
>>>>> + */
>>>>> +
>>>>> +static void xe_mmio_gem_free(struct drm_gem_object *); static int
>>>>> +xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct
>>> *);
>>>>> +
>>>>> +static const struct vm_operations_struct vm_ops = {
>>>>> +	.open = drm_gem_vm_open,
>>>>> +	.close = drm_gem_vm_close,
>>>> Should you remap in fault handler, to make sure mapping is there always?
>>>
>>> Hmm, do you see any benefit for lazy mapping here?
>>> When a user maps HW registers (presumably a page or so - not much more) I
>>> think it would be ok to do the mapping immediately on mmap. But let me
>>> know if I'm missing something here.
>>> - Ilia
>> In case user is doing some memory r/w and some event like hotunplug or similar would happen you may need some dummy page map in order allow smoother exit for user. Also for any other case mapping disappears fault handler would help reestablish mapping if device is working fine.
>>
>> Tejas
> 
> 
> With the current patch, the user will receive SIGBUS when writing to the mmio after hot-unplug.
> But during hot-unplug the driver gets unbound, so any fault handler wouldn't be called anyway.
> I guess the fault handler could help if the driver was to intentionally zap the user PTEs, but AFAIK
> we don't do that in Xe. So for a BAR mapping like in this case, I think a fault handler is an overkill.
> I don't see a real-life scenario where mapping re-establishment could occur. Please correct me if I'm wrong.
> There are enough examples in the kernel of drivers that don't establish a fault handler too:
> amdkfd, exynos, mediatek, rockchip to name a few.

I think the backstory was that SIGBUS is very violent and kills the 
userspace, but if you instead map a dummy page you in theory give more 
time for userspace to detect the issue and handle it more gracefully. 
All iocts return an error and I think there is also some uevent or 
something IIRC. For hotunplug the driver instance (drm_device) is still 
alive afterwords, it's only the physical struct pci_device underneath 
that is detached from it, so interacting with the driver is still 
possible, including handling CPU faults etc, but interacting with the HW 
is not allowed.

Not sure about your exact usecase, but AFAIK that was at least the rough 
idea with the dummy page and hotunplug. See xe_gem_fault() and 
ttm_bo_vm_dummy_page(), which should ensure faulting a BO will not 
return SIGBUS after hotunplug. amdgpu should have something similar.


> 
> - Ilia
> 
>>>
>>>>> +};
>>>>> +
>>>>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>>>>> +	.free = xe_mmio_gem_free,
>>>>> +	.mmap = xe_mmio_gem_mmap,
>>>>> +	.vm_ops = &vm_ops,
>>>>> +};
>>>>> +
>>>>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct
>>>>> +drm_gem_object
>>>>> +*obj) {
>>>>> +	return container_of(obj, struct xe_mmio_gem, base); }
>>>>> +
>>>>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio) {
>>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>>> +
>>>>> +	/*
>>>>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the
>>>>> trick below.
>>>>> +	 * In the future we may want to store the physical address in
>>>>> +struct
>>>>> xe_mmio.
>>>>> +	 */
>>>>> +	return pci_resource_start(to_pci_dev(xe->drm.dev),
>>>>> GTTMMADR_BAR) +
>>>>> +		(uintptr_t)(mmio->regs - xe->mmio.regs); }
>>>>> +
>>>>> +/**
>>>>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>>>>> + * @mmio: xe_mmio instance
>>>>> + * @file: DRM file descriptor
>>>>> + *
>>>>> + * This function creates a GEM object with an mmap-able fake offset
>>>>> +that wraps
>>>>> + * the provided xe_mmio instance.
>>>>> + *
>>>>> + * See: "Exposing MMIO regions to userspace"
>>>>> + */
>>>>> +struct xe_mmio_gem *
>>>>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file) {
>>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>>> +	size_t size = mmio->regs_size;
>>>>> +	struct xe_mmio_gem *obj;
>>>>> +	struct drm_gem_object *base;
>>>>> +	int err;
>>>>> +
>>>>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size %
>>>>> PAGE_SIZE != 0))
>>>>> +		return ERR_PTR(-EINVAL);
>>>>> +
>>>>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>>>> +	if (!obj)
>>>>> +		return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +	base = &obj->base;
>>>>> +	base->funcs = &xe_mmio_gem_funcs;
>>>>> +	obj->mmio = *mmio;
>>>>> +
>>>>> +	drm_gem_private_object_init(&xe->drm, base, size);
>>>>> +
>>>>> +	err = drm_gem_create_mmap_offset(base);
>>>>> +	if (err)
>>>>> +		goto free_gem;
>>>>> +
>>>>> +	err = drm_vma_node_allow(&base->vma_node, file);
>>>>> +	if (err)
>>>>> +		goto free_gem;
>>>>> +
>>>>> +	return obj;
>>>>> +
>>>>> +free_gem:
>>>>> +	xe_mmio_gem_free(base);
>>>>> +	return ERR_PTR(err);
>>>>> +}
>>>>> +
>>>>> +static void xe_mmio_gem_free(struct drm_gem_object *base) {
>>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>>> +
>>>>> +	drm_gem_object_release(base);
>>>>> +	kfree(obj);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>>>>> + * @gem: the GEM object to destroy
>>>>> + *
>>>>> + * This function releases resources associated with the GEM object
>>>>> +created by
>>>>> + * xe_mmio_gem_create().
>>>>> + *
>>>>> + * See: "Exposing MMIO regions to userspace"
>>>>> + */
>>>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem) {
>>>>> +	xe_mmio_gem_free(&gem->base);
>>>>> +}
>>>>> +
>>>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct
>>>>> +vm_area_struct *vma) {
>>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>>> +	struct xe_mmio *mmio = &obj->mmio;
>>>>> +
>>>>> +	if (vma->vm_end - vma->vm_start != base->size)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	/*
>>>>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map
>>>>> the
>>>>> +	 * whole buffer from the start.
>>>>> +	 */
>>>>> +	vma->vm_pgoff = 0;
>>>> I am not sure, but is it confirmed this offset wont be used by anything else?
>>>
>>> Yes, I believe it is used to lookup the GEM object in drm_gem_mmap and
>>> that's it.
>>>
>>> Also many (maybe all?) drivers do exactly this, for example see:
>>> mtk_gem_object_mmap
>>> exynos_drm_gem_mmap_buffer
>>> rockchip_drm_gem_object_mmap
>>> __tegra_gem_mmap
>>>
>>> - Ilia
>>>
>>>
>>>>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>>>> +
>>>>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>>> VM_DONTDUMP |
>>>>> +		     VM_DONTCOPY | VM_NORESERVE);
>>>> Do you want to allow cow_mapping?
>>>
>>> Good question... I probably should enforce that the user passed
>>> MAP_SHARED, thanks!
>>> - Ilia
>>>
>>>
>>>> Tejas
>>>>> +
>>>>> +	return remap_pfn_range(vma, vma->vm_start,
>>>>> xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>>>>> +			       base->size, vma->vm_page_prot); }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h
>>>>> b/drivers/gpu/drm/xe/xe_mmio.h index c151ba569003..2990bbcef24d
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>>> @@ -8,6 +8,7 @@
>>>>>
>>>>>   #include "xe_gt_types.h"
>>>>>
>>>>> +struct drm_file;
>>>>>   struct xe_device;
>>>>>   struct xe_reg;
>>>>>
>>>>> @@ -42,4 +43,7 @@ static inline struct xe_mmio
>>>>> *xe_root_tile_mmio(struct xe_device *xe)
>>>>>   	return &xe->tiles[0].mmio;
>>>>>   }
>>>>>
>>>>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio,
>>> struct
>>>>> +drm_file *file); void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>>>>> +
>>>>>   #endif
>>>>> --
>>>>> 2.43.0
> 
> 

