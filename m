Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C415BC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 11:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC4210E2C7;
	Wed, 10 May 2023 11:54:33 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937E110E2C7
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683719672; x=1715255672;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aloxWRwNXUKBCTHF7nX/V8TDZfRK1jQrF3aa+2f+7qA=;
 b=HCqEYm5OjuvC3YcHBmjNZtyiMTuPf564JeZRsVG44RdFLuJciz1N2sXy
 p64m2AgaUTDia21MMs82hvz2anQSCRJ422MG7C8U18Z2f9GnDLoGx3GDg
 3zWc6M5TMSAdzAiPOLekxbUGvBdZI+ICGzLfJFC2uC66GyiZQ3BQ/XJcr
 yvbMBtI73mHKCiH4OhkWKhrrnzsPr5Q9T1ay5i1DNnEfAkpEVq1CyApEs
 Bs4G0YyDkXE4j1OOUnJUCqz/jnRUYsWYKW+nJwc4BWXJMm4w6VhZofVHc
 8+mQmNsy241eh/K9lylyJ1viR7JXPVtatrbz2H5k+sqGw3GkBnIJzeTm5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329814042"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="329814042"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 04:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="1029190157"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="1029190157"
Received: from respir1x-mobl1.ger.corp.intel.com (HELO [10.252.14.125])
 ([10.252.14.125])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 04:54:30 -0700
Message-ID: <47f0df51-ea7e-b206-5de0-3582cb397e2d@intel.com>
Date: Wed, 10 May 2023 12:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-GB
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20230504205250.3898282-1-michael.j.ruhl@intel.com>
 <20230504205250.3898282-3-michael.j.ruhl@intel.com>
 <fa8a800c-2db5-f87d-dae8-879c580c831b@intel.com>
 <DM5PR11MB1324261720D85804F7D28FAEC1729@DM5PR11MB1324.namprd11.prod.outlook.com>
 <CAM0jSHNw3Q7g5VkpC2Xf1f0WRr8tfGqhFm5DTC04dqssX4SsgQ@mail.gmail.com>
 <DM5PR11MB1324FC107C0A0A457D93C72BC1719@DM5PR11MB1324.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DM5PR11MB1324FC107C0A0A457D93C72BC1719@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 08/05/2023 21:45, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Matthew Auld <matthew.william.auld@gmail.com>
>> Sent: Friday, May 5, 2023 4:40 PM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Cc: Auld, Matthew <matthew.auld@intel.com>; intel-
>> xe@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
>>
>> On Fri, 5 May 2023 at 20:59, Ruhl, Michael J <michael.j.ruhl@intel.com> wrote:
>>>
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: Friday, May 5, 2023 6:36 AM
>>>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Kershner, David
>>>> <david.kershner@intel.com>; Ghimiray, Himal Prasad
>>>> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
>>>> <tejas.upadhyay@intel.com>
>>>> Subject: Re: [PATCH 2/4] drm/xe: Simplify rebar sizing
>>>>
>>>> On 04/05/2023 21:52, Michael J. Ruhl wrote:
>>>>> "Right sizing" the PCI BAR is not necessary.  If rebar is needed
>>>>> size to the maximum available.
>>>>>
>>>>> Preserve the force_vram_bar_size sizing.
>>>>>
>>>>> Update associated code for consistency.
>>>>>
>>>>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_device_types.h |  14 +--
>>>>>    drivers/gpu/drm/xe/xe_migrate.c      |   2 +-
>>>>>    drivers/gpu/drm/xe/xe_mmio.c         | 139 +++++++++++++++------------
>>>>>    3 files changed, 88 insertions(+), 67 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index 1cb404e48aaa..2eeb10e97381 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -193,15 +193,15 @@ struct xe_device {
>>>>>                       /**
>>>>>                        * @io_size: IO size of VRAM.
>>>>>                        *
>>>>> -                     * This represents how much of VRAM we can access
>>>> via
>>>>> -                     * the CPU through the VRAM BAR. This can be smaller
>>>>> -                     * than @size, in which case only part of VRAM is CPU
>>>>> -                     * accessible (typically the first 256M). This
>>>>> -                     * configuration is known as small-bar.
>>>>> +                     * This represents how much of VRAM the CPU can
>>>> access
>>>>> +                     * via the VRAM BAR.
>>>>> +                     * On systems that do not support large BAR IO space,
>>>>> +                     * this can be smaller than the actual memory size, in
>>>>> +                     * which case only part of VRAM is CPU accessible
>>>>> +                     * (typically the first 256M).  This configuration is
>>>>> +                     * known as small-bar.
>>>>>                        */
>>>>>                       resource_size_t io_size;
>>>>> -                    /** @size: Total size of VRAM */
>>>>> -                    resource_size_t size;
>>>>>                       /** @mapping: pointer to VRAM mappable space */
>>>>>                       void *__iomem mapping;
>>>>>               } vram;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> index f40f47ccb76f..a1d507db0098 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> @@ -270,7 +270,7 @@ static int xe_migrate_prepare_vm(struct xe_gt
>> *gt,
>>>> struct xe_migrate *m,
>>>>>                * Use 1GB pages, it shouldn't matter the physical amount of
>>>>>                * vram is less, when we don't access it.
>>>>>                */
>>>>> -            for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs +=
>>>> 8)
>>>>> +            for (pos = 0; pos < xe->mem.vram.io_size; pos += SZ_1G, ofs
>>>> += 8)
>>>>
>>>> Can we somehow keep this as the total amount of GPU addressable
>> VRAM?
>>>> Just realised with small-bar this would need to be changed again.
>>>> Otherwise I think looks good.
>>>
>>> Matt,
>>>
>>> For this patch (because of the min() usage, this is the total amount of
>> addressable
>>> VRAM (.size was eliminated).  So I think that this is doing what you want.
>>>
>>> However, for the next patch, this value will expand to the total IO space for
>> all tiles.
>>
>> With small-bar we will eventually (once that code lands) end up with
>> 256M io_size, but then the VRAM size will be say 16G. And here we want
>> to map the whole 16G.
> 
> The original code sets xe->mem.vram.size = min(usable_size, resource_len())
> 
> So the current mapping will only get the available vram, i.e. below GSM, or the available
> PCI size.
> 
> It does NOT map the entire available vram.

Right, we just want to map the *GPU* accessible VRAM (either the 
usable_size or everything), so nothing to do with io_size.

> 
> Note that the current code only maps the vram from tile0, so adding tile1 memory
> (the new patches) is extending the current mapping.....
> 
> Do we need to verify the NUM_PT_SLOTS value for 128GB memory space?

You mean check if it fits? I haven't looked at this code in detail, but 
AFAICT that is only for accessing system memory. We can't identity map 
the whole thing so we just have some fixed sized window or so somewhere 
in the VM pointing at some of its own PTEs, which we can then remap on 
the fly.

> 
>>>
>>> This code will "map" the whole space, gaps included (stolen, GTT space etc).
>>>
>>> So if we need to map only the available VRAM for both tiles, we would need
>>> to probably do this on a GT level up to the GSMBASE "size" with something
>> like this:
>>>
>>>          for_each_gt() {
>>>                  for pos = gt->vram.base; pos < gt->vram.io_size + gt->vram.base;
>>>                   ...
>>>          }
>>>
>>> Does this make sense?
>>
>> Yeah, the gaps are fine I think, even the stolen portion since we
>> never actually touch it, so it's fine to map it.  We could maybe just
>> keep the xe->mem.vram.size which just gets the total_size from patch
>> 2.
> 
> For the "new code", the io_size is the maximum allowable PCI access size.
> The total size of the vram is not "stored", other than walking the GT list
> and adding up each gt->mem.vram.size.
> 
> I do display the accumulated total, but did not store it.
> 
> So I see two mappings here:
> 
> 	for_each_gt(gt, xe, id) {
> 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8 + gt->mem.vram.base;
> 		for (pos = 0; pos < gt->mem.vram.size; pos += SZ_1G, ofs += 8) {
> 			entry = pos + xe->mem.vram.base + gt->mem.vram.base;
> 			xe_map_wr(xe, &bo->vmap, ofs, u64, entry | flags);
> 	}
> 
> This will map the available memory for each available tile.  This would be ony the "usable" vram,
> or this mapping: (current patch version):
> 
> 	for (pos = 0; pos < xe->mem.vram.io_size; pos += SZ_1G, ofs += 8) {
> 		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> 
> which only maps the space available to the CPU... so if we have a "small bar", this mapping
> would not be "accurate".
> 
> Umm, I could add a xe->mem.vram.size third mapping) which would be the accumulated tile sizes and then
> do this:
> 
> 	for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs += 8) {
> 		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> 
> This would map everything in the vram address space?

Yes, and hopefully that's all we need here.

> 
> Thoughts?
> 
> M
> 
>>
>>>
>>> I am not clear on what this mapping is for.  Can you explain a bit?
>>
>> I think it's just the usual trick to 1:1 map all of VRAM to matching
>> addresses in some special ppGTT. Like say we have VRAM
>> phys_addr=0x100000 we would then also have gtt_addr=0x100000, which
>> maps the same VRAM address in the PTE. We do that for all VRAM and for
>> every tile, and since we use 1G GTT entries we can do that very
>> cheaply. The idea is that we can now access any part of VRAM using the
>> GPU, and can trivially get the GTT address, without needing to worry
>> about dynamically allocating and binding any page-tables on the fly,
>> which is useful when clearing, copying/evicting, writing page-tables
>> etc. Also since the addresses we touch here must belong to an object,
>> we can be sure they never touch anything out of bounds, like stolen
>> etc, which is important since we map all of VRAM, and not just the
>> usable portion.
>>
>>
>>>
>>> Thoughts?
>>>
>>> m
>>>
>>>
>>>>
>>>>>                       xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>>>>>       }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>>>> b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> index bc6835d67352..8ec044473886 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> @@ -1,8 +1,10 @@
>>>>>    // SPDX-License-Identifier: MIT
>>>>>    /*
>>>>> - * Copyright © 2021 Intel Corporation
>>>>> + * Copyright © 2021-2023 Intel Corporation
>>>>>     */
>>>>>
>>>>> +#include <linux/minmax.h>
>>>>> +
>>>>>    #include "xe_mmio.h"
>>>>>
>>>>>    #include <drm/drm_managed.h>
>>>>> @@ -20,6 +22,8 @@
>>>>>    #define XEHP_MTCFG_ADDR            XE_REG(0x101800)
>>>>>    #define TILE_COUNT         REG_GENMASK(15, 8)
>>>>>
>>>>> +#define BAR_SIZE_SHIFT 20
>>>>> +
>>>>>    static int xe_set_dma_info(struct xe_device *xe)
>>>>>    {
>>>>>       unsigned int mask_size = xe->info.dma_mask_size;
>>>>> @@ -60,50 +64,65 @@ _resize_bar(struct xe_device *xe, int resno,
>>>> resource_size_t size)
>>>>>       if (ret) {
>>>>>               drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe).
>>>> Consider enabling 'Resizable BAR' support in your BIOS\n",
>>>>>                        resno, 1 << bar_size, ERR_PTR(ret));
>>>>> -            return -1;
>>>>> +            return ret;
>>>>>       }
>>>>>
>>>>>       drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 <<
>>>> bar_size);
>>>>> -    return 1;
>>>>> +    return ret;
>>>>>    }
>>>>>
>>>>> -static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t
>>>> vram_size)
>>>>> +/*
>>>>> + * if force_vram_bar_size is set, attempt to set to the requested size
>>>>> + * else set to maximum possible size
>>>>> + */
>>>>> +static int xe_resize_vram_bar(struct xe_device *xe)
>>>>>    {
>>>>> +    u64 force_vram_bar_size = xe_force_vram_bar_size;
>>>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>       struct pci_bus *root = pdev->bus;
>>>>> -    struct resource *root_res;
>>>>> -    resource_size_t rebar_size;
>>>>>       resource_size_t current_size;
>>>>> +    resource_size_t rebar_size;
>>>>> +    struct resource *root_res;
>>>>> +    u32 bar_size_mask;
>>>>>       u32 pci_cmd;
>>>>>       int i;
>>>>>       int ret;
>>>>> -    u64 force_vram_bar_size = xe_force_vram_bar_size;
>>>>>
>>>>> -    current_size = roundup_pow_of_two(pci_resource_len(pdev,
>>>> GEN12_LMEM_BAR));
>>>>> +    /* gather some relevant info */
>>>>> +    current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>>>> +    bar_size_mask = pci_rebar_get_possible_sizes(pdev,
>>>> GEN12_LMEM_BAR);
>>>>>
>>>>> +    if (!bar_size_mask)
>>>>> +            return 0;
>>>>> +
>>>>> +    /* set to a specific size? */
>>>>>       if (force_vram_bar_size) {
>>>>> -            u32 bar_sizes;
>>>>> +            u32 bar_size_bit;
>>>>>
>>>>>               rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>>>>> -            bar_sizes = pci_rebar_get_possible_sizes(pdev,
>>>> GEN12_LMEM_BAR);
>>>>>
>>>>> -            if (rebar_size == current_size)
>>>>> -                    return 0;
>>>>> +            bar_size_bit = bar_size_mask &
>>>> BIT(pci_rebar_bytes_to_size(rebar_size));
>>>>>
>>>>> -            if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
>>>>> -                rebar_size >= roundup_pow_of_two(vram_size)) {
>>>>> -                    rebar_size = vram_size;
>>>>> +            if (!bar_size_bit) {
>>>>>                       drm_info(&xe->drm,
>>>>> -                             "Given bar size is not within supported size,
>>>> setting it to default: %lluMiB\n",
>>>>> -                             (u64)vram_size >> 20);
>>>>> +                             "Requested size: 0x%llx is not supported by
>>>> rebar sizes: 0x%x. Leaving default: 0x%llx\n",
>>>>> +                             (u64)rebar_size >> 2, bar_size_mask,
>>>> (u64)current_size >> 20);
>>>>> +                    return 0;
>>>>>               }
>>>>> +
>>>>> +            rebar_size = 1ULL << (bar_size_bit + BAR_SIZE_SHIFT);
>>>>> +
>>>>> +            if (rebar_size == current_size)
>>>>> +                    return 0;
>>>>>       } else {
>>>>> -            rebar_size = current_size;
>>>>> +            rebar_size = 1ULL << (__fls(bar_size_mask) +
>>>> BAR_SIZE_SHIFT);
>>>>>
>>>>> -            if (rebar_size != roundup_pow_of_two(vram_size))
>>>>> -                    rebar_size = vram_size;
>>>>> -            else
>>>>> +            /* only resize if larger than current */
>>>>> +            if (rebar_size <= current_size) {
>>>>> +                    drm_info(&xe->drm, "Rebar size: 0x%llx vs. actual
>>>> size: 0x%llx\n",
>>>>> +                             rebar_size, current_size);
>>>>>                       return 0;
>>>>> +            }
>>>>>       }
>>>>>
>>>>>       drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
>>>>> @@ -147,6 +166,31 @@ static bool xe_pci_resource_valid(struct pci_dev
>>>> *pdev, int bar)
>>>>>       return true;
>>>>>    }
>>>>>
>>>>> +static int xe_determine_lmem_bar_size(struct xe_device *xe)
>>>>> +{
>>>>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>> +    int err;
>>>>> +
>>>>> +    if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
>>>>> +            drm_err(&xe->drm, "pci resource is not valid\n");
>>>>> +            return -ENXIO;
>>>>> +    }
>>>>> +
>>>>> +    err = xe_resize_vram_bar(xe);
>>>>> +    if (err)
>>>>> +            return err;
>>>>> +
>>>>> +    xe->mem.vram.io_start = pci_resource_start(pdev,
>>>> GEN12_LMEM_BAR);
>>>>> +    xe->mem.vram.io_size = pci_resource_len(pdev,
>>>> GEN12_LMEM_BAR);
>>>>> +    if (!xe->mem.vram.io_size)
>>>>> +            return -EIO;
>>>>> +
>>>>> +    /* set up a map to the total memory area. */
>>>>> +    xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe-
>>>>> mem.vram.io_size);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * xe_mmio_tile_vram_size - Collect vram size and off set information
>>>>>     * @gt: tile to get info for
>>>>> @@ -202,59 +246,36 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt,
>> u64
>>>> *vram_size, u64 *tile_size, u64
>>>>>
>>>>>    int xe_mmio_probe_vram(struct xe_device *xe)
>>>>>    {
>>>>> -    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>       struct xe_gt *gt;
>>>>> -    u64 original_size;
>>>>>       u64 tile_offset;
>>>>>       u64 tile_size;
>>>>>       u64 vram_size;
>>>>>       int err;
>>>>>       u8 id;
>>>>>
>>>>> -    if (!IS_DGFX(xe)) {
>>>>> -            xe->mem.vram.mapping = 0;
>>>>> -            xe->mem.vram.size = 0;
>>>>> -            xe->mem.vram.io_start = 0;
>>>>> -            xe->mem.vram.io_size = 0;
>>>>> -
>>>>> -            for_each_gt(gt, xe, id) {
>>>>> -                    gt->mem.vram.mapping = 0;
>>>>> -                    gt->mem.vram.size = 0;
>>>>> -                    gt->mem.vram.io_start = 0;
>>>>> -                    gt->mem.vram.io_size = 0;
>>>>> -            }
>>>>> +    if (!IS_DGFX(xe))
>>>>>               return 0;
>>>>> -    }
>>>>> -
>>>>> -    if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
>>>>> -            drm_err(&xe->drm, "pci resource is not valid\n");
>>>>> -            return -ENXIO;
>>>>> -    }
>>>>>
>>>>> +    /* Get the size of the gt0 vram for later accessibility comparison */
>>>>>       gt = xe_device_get_gt(xe, 0);
>>>>> -    original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>>>> -
>>>>>       err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size,
>>>> &tile_offset);
>>>>>       if (err)
>>>>>               return err;
>>>>>
>>>>> -    xe_resize_vram_bar(xe, vram_size);
>>>>> -    xe->mem.vram.io_start = pci_resource_start(pdev,
>>>> GEN12_LMEM_BAR);
>>>>> -    xe->mem.vram.io_size = min(vram_size,
>>>>> -                               pci_resource_len(pdev,
>>>> GEN12_LMEM_BAR));
>>>>> -    xe->mem.vram.size = xe->mem.vram.io_size;
>>>>> -
>>>>> -    if (!xe->mem.vram.size)
>>>>> -            return -EIO;
>>>>> +    err = xe_determine_lmem_bar_size(xe);
>>>>> +    if (err)
>>>>> +            return err;
>>>>>
>>>>> -    if (vram_size > xe->mem.vram.io_size)
>>>>> -            drm_warn(&xe->drm, "Restricting VRAM size to PCI resource
>>>> size (%lluMiB->%lluMiB)\n",
>>>>> -                     (u64)vram_size >> 20, (u64)xe->mem.vram.io_size >>
>>>> 20);
>>>>> +    /* small bar issues will only cover gt0 sizes */
>>>>> +    if (xe->mem.vram.io_size < vram_size)
>>>>> +            drm_warn(&xe->drm, "Restricting VRAM size to PCI resource
>>>> size (0x%llx->0x%llx)\n",
>>>>> +                     vram_size, (u64)xe->mem.vram.io_size);
>>>>>
>>>>> -    xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe-
>>>>> mem.vram.io_size);
>>>>> -    xe->mem.vram.size = min_t(u64, xe->mem.vram.size, vram_size);
>>>>> +    /* Limit size to available memory to account for the current memory
>>>> algorithm */
>>>>> +    xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size,
>>>> vram_size);
>>>>>
>>>>> -    drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe-
>>>>> mem.vram.io_start, &xe->mem.vram.size);
>>>>> +    drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe-
>>>>> mem.vram.io_start,
>>>>> +             &xe->mem.vram.io_size);
>>>>>
>>>>>       /* FIXME: Assuming equally partitioned VRAM, incorrect */
>>>>>       if (xe->info.tile_count > 1) {
>>>>> @@ -267,7 +288,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>>>>
>>>>>               XE_BUG_ON(!adj_tile_count);
>>>>>
>>>>> -            size = xe->mem.vram.size / adj_tile_count;
>>>>> +            size = xe->mem.vram.io_size / adj_tile_count;
>>>>>               io_start = xe->mem.vram.io_start;
>>>>>               io_size = xe->mem.vram.io_size;
>>>>>
>>>>> @@ -300,7 +321,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>>>>                                &gt->mem.vram.size);
>>>>>               }
>>>>>       } else {
>>>>> -            gt->mem.vram.size = xe->mem.vram.size;
>>>>> +            gt->mem.vram.size = xe->mem.vram.io_size;
>>>>>               gt->mem.vram.io_start = xe->mem.vram.io_start;
>>>>>               gt->mem.vram.io_size = xe->mem.vram.io_size;
>>>>>               gt->mem.vram.mapping = xe->mem.vram.mapping;
