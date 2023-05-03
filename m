Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD30CC77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C12B10E30F;
	Wed,  3 May 2023 15:42:02 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35AB10E30F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683128520; x=1714664520;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=TOtqRH2B1ArArWSjcwMeDF7HqMHypvhT0cki/Hx5vGY=;
 b=jhdlMSGhQe/YhVYu1PCaP/USQvQ4Hke+dH3ioiIKW8Tg7PgQI3rPLAwz
 W6667kyiFAN0ZIt+969vVNdLjj+6I/gkZRVV/WtawyDQbaoUO2MVQwKRg
 FVfU5E8HIdJsQfcMSGkzxeUGrk2rKOOCBq9mclhKFzkfiuARS4EzBLUAV
 Sr/u7zhIutmqe4pS/TKW//h13kAxozC4LFkWqAYDGEMGHVMivKa5TJbj8
 x16L/iYYJpIh4SEDaaZvBQ3c4Xfc9i1DfiqLbNSyuvDYH5mOt/wBBLS/W
 LffFb76X+SPASM715V5O321JfNzy1sAiPSoS2RfLye14etvkErYU1xqBy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376752493"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="376752493"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729380826"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="729380826"
Received: from dmadorsx-mobl2.ger.corp.intel.com (HELO [10.252.12.249])
 ([10.252.12.249])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:41:57 -0700
Message-ID: <220ced9d-3c49-6a2f-467c-9d02c55122fa@intel.com>
Date: Wed, 3 May 2023 16:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
From: Matthew Auld <matthew.auld@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
 <20230501115826.4191472-2-michael.j.ruhl@intel.com>
 <99f50c6f-3a8d-ee47-31f8-b54d94826289@intel.com>
 <DM5PR11MB13243086FBC7FC7CC5008F27C16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <454307c4-6022-1016-61fb-93aad208a8d6@intel.com>
 <DM5PR11MB13246AAE5466673DE597B63DC16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <DM5PR11MB13246AAE5466673DE597B63DC16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Rework size helper to be a
 little more correct
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
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 03/05/2023 15:38, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Wednesday, May 3, 2023 10:30 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Kershner, David
>> <david.kershner@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: Re: [PATCH 1/4] drm/xe: Rework size helper to be a little more
>> correct
>>
>> On 03/05/2023 15:14, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: Wednesday, May 3, 2023 6:41 AM
>>>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Kershner, David
>>>> <david.kershner@intel.com>; Ghimiray, Himal Prasad
>>>> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
>>>> <tejas.upadhyay@intel.com>
>>>> Subject: Re: [PATCH 1/4] drm/xe: Rework size helper to be a little more
>>>> correct
>>>>
>>>> On 01/05/2023 12:58, Michael J. Ruhl wrote:
>>>>> The _total_vram_size helper is device based and is not complete.
>>>>>
>>>>> Teach the helper to be tile aware and add the ability to size
>>>>> DG1 correctly.
>>>>>
>>>>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 +-
>>>>>     drivers/gpu/drm/xe/xe_mmio.c           | 73 +++++++++++++++++---------
>>>>>     drivers/gpu/drm/xe/xe_mmio.h           |  2 +-
>>>>>     drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 28 +++++-----
>>>>>     4 files changed, 64 insertions(+), 41 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> index 68e89d71cd1c..780edd4dc1bd 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> @@ -74,7 +74,7 @@
>>>>>     #define VE1_AUX_NV				XE_REG(0x42b8)
>>>>>     #define   AUX_INV				REG_BIT(0)
>>>>>
>>>>> -#define XEHP_TILE0_ADDR_RANGE
>> 	XE_REG_MCR(0x4900)
>>>>> +#define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900
>>>> + (_idx) * 4)
>>>>>     #define XEHP_FLAT_CCS_BASE_ADDR
>>>> 	XE_REG_MCR(0x4910)
>>>>>
>>>>>     #define CHICKEN_RASTER_1			XE_REG_MCR(0x6204,
>>>> XE_REG_OPTION_MASKED)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>>>> b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> index 3b719c774efa..7d53d382976c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> @@ -148,34 +148,56 @@ static bool xe_pci_resource_valid(struct pci_dev
>>>> *pdev, int bar)
>>>>>     	return true;
>>>>>     }
>>>>>
>>>>> -int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size,
>> u64
>>>> *usable_size)
>>>>> +/**
>>>>> + * xe_mmio_tile_vram_size - Collect vram size and off set information
>>>>> + * @gt: tile to get info for
>>>>> + * @vram_size: available vram (size - device reserved portions)
>>>>> + * @tile_size: actual vram size
>>>>> + * @tile_offset: physical start point in the vram address space
>>>>> + *
>>>>> + * There are 4 places for size information:
>>>>> + * - io size (from pci_resource_len of LMEM bar) (only used for small bar
>>>> and DG1)
>>>>> + * - TILEx size (actual vram size)
>>>>> + * - GSMBASE offset (TILEx - "stolen")
>>>>> + * - CSSBASE offset (TILEx - CSS space necessary)
>>>>> + *
>>>>> + * NOTE: CSSBASE is always a lower/smaller offset then GSMBASE.
>>>>> + *
>>>>> + * The actual available size of memory is to the CCS or GSM base.
>>>>> + * NOTE: multi-tile bases will include the tile offset.
>>>>> + *
>>>>> + */
>>>>> +int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64
>>>> *tile_size, u64 *tile_offset)
>>>>>     {
>>>>> -	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>>>>> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>> +	u64 offset;
>>>>>     	int err;
>>>>>     	u32 reg;
>>>>>
>>>>> -	if (!xe->info.has_flat_ccs)  {
>>>>> -		*vram_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>>>> -		if (usable_size)
>>>>> -			*usable_size = min(*vram_size,
>>>>> -					   xe_mmio_read64(gt,
>>>> GSMBASE.reg));
>>>>> -		return 0;
>>>>> -	}
>>>>> -
>>>>>     	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>     	if (err)
>>>>>     		return err;
>>>>>
>>>>> -	reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE0_ADDR_RANGE);
>>>>> -	*vram_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
>>>>> -	if (usable_size) {
>>>>> +	/* actual size */
>>>>> +	if (unlikely(gt->xe->info.platform == XE_DG1)) {
>>>>> +		*tile_size = pci_resource_len(to_pci_dev(gt->xe->drm.dev),
>>>> GEN12_LMEM_BAR);
>>>>> +		*tile_offset = 0;
>>>>> +	} else {
>>>>> +		reg = xe_gt_mcr_unicast_read_any(gt,
>>>> XEHP_TILE_ADDR_RANGE(gt->info.id));
>>>>> +		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) *
>>>> SZ_1G;
>>>>> +		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) *
>>>> SZ_1G;
>>>>> +	}
>>>>> +
>>>>> +	/* minus device usage */
>>>>> +	if (gt->xe->info.has_flat_ccs) {
>>>>>     		reg = xe_gt_mcr_unicast_read_any(gt,
>>>> XEHP_FLAT_CCS_BASE_ADDR);
>>>>> -		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) *
>>>> SZ_64K;
>>>>> -		drm_info(&xe->drm, "vram_size: 0x%llx usable_size:
>>>> 0x%llx\n",
>>>>> -			 *vram_size, *usable_size);
>>>>> +		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) *
>>>> SZ_64K;
>>>>> +	} else {
>>>>> +		offset = xe_mmio_read64(gt, GSMBASE.reg);
>>>>>     	}
>>>>>
>>>>> +	/* remove the tile offset so we have just the available size */
>>>>> +	*vram_size = offset - *tile_offset;
>>>>> +
>>>>>     	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>     }
>>>>>
>>>>> @@ -183,11 +205,12 @@ int xe_mmio_probe_vram(struct xe_device
>> *xe)
>>>>>     {
>>>>>     	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>     	struct xe_gt *gt;
>>>>> -	u8 id;
>>>>> -	u64 vram_size;
>>>>>     	u64 original_size;
>>>>> -	u64 usable_size;
>>>>> +	u64 tile_offset;
>>>>> +	u64 tile_size;
>>>>> +	u64 vram_size;
>>>>>     	int err;
>>>>> +	u8 id;
>>>>>
>>>>>     	if (!IS_DGFX(xe)) {
>>>>>     		xe->mem.vram.mapping = 0;
>>>>> @@ -212,25 +235,25 @@ int xe_mmio_probe_vram(struct xe_device
>> *xe)
>>>>>     	gt = xe_device_get_gt(xe, 0);
>>>>>     	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>>>>
>>>>> -	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
>>>>> +	err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size,
>>>> &tile_offset);
>>>>>     	if (err)
>>>>>     		return err;
>>>>>
>>>>>     	xe_resize_vram_bar(xe, vram_size);
>>>>>     	xe->mem.vram.io_start = pci_resource_start(pdev,
>>>> GEN12_LMEM_BAR);
>>>>> -	xe->mem.vram.io_size = min(usable_size,
>>>>> +	xe->mem.vram.io_size = min(vram_size,
>>>>>     				   pci_resource_len(pdev,
>>>> GEN12_LMEM_BAR));
>>>>>     	xe->mem.vram.size = xe->mem.vram.io_size;
>>>>>
>>>>>     	if (!xe->mem.vram.size)
>>>>>     		return -EIO;
>>>>>
>>>>> -	if (usable_size > xe->mem.vram.io_size)
>>>>> +	if (vram_size > xe->mem.vram.io_size)
>>>>>     		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource
>>>> size (%lluMiB->%lluMiB)\n",
>>>>> -			 (u64)usable_size >> 20, (u64)xe->mem.vram.io_size
>>>>>> 20);
>>>>> +			 (u64)vram_size >> 20, (u64)xe->mem.vram.io_size >>
>>>> 20);
>>>>>
>>>>>     	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe-
>>>>> mem.vram.io_size);
>>>>> -	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>>>>> +	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, vram_size);
>>>>>
>>>>>     	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe-
>>>>> mem.vram.io_start, &xe->mem.vram.size);
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h
>>>> b/drivers/gpu/drm/xe/xe_mmio.h
>>>>> index 1a32e0f52261..556cf3d9e4f5 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>>> @@ -120,6 +120,6 @@ static inline bool xe_mmio_in_range(const struct
>>>> xe_mmio_range *range, u32 reg)
>>>>>     }
>>>>>
>>>>>     int xe_mmio_probe_vram(struct xe_device *xe);
>>>>> -int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size,
>> u64
>>>> *flat_ccs_base);
>>>>> +int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64
>>>> *tile_size, u64 *tile_base);
>>>>>
>>>>>     #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>> index 9ce0a0585539..a329f12f14fe 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>> @@ -51,27 +51,27 @@ bool
>> xe_ttm_stolen_cpu_access_needs_ggtt(struct
>>>> xe_device *xe)
>>>>>     	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
>>>>>     }
>>>>>
>>>>> -static s64 detect_bar2_dgfx(struct xe_device *xe, struct
>>>> xe_ttm_stolen_mgr *mgr)
>>>>> +static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr
>>>> *mgr)
>>>>>     {
>>>>> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>> -	struct xe_gt *gt = to_gt(xe);
>>>>> -	u64 vram_size, stolen_size;
>>>>> -	int err;
>>>>> +	u64 stolen_size;
>>>>> +	u64 tile_offset;
>>>>> +	u64 tile_size;
>>>>> +	u64 vram_size;
>>>>>
>>>>> -	err = xe_mmio_total_vram_size(xe, &vram_size, NULL);
>>>>> -	if (err) {
>>>>> -		drm_info(&xe->drm, "Querying total vram size failed\n");
>>>>> +	if (xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset))
>>>> {
>>>>> +		drm_info(&gt->xe->drm, "Querying total vram size failed\n");
>>>>>     		return 0;
>>>>>     	}
>>>>>
>>>>>     	/* Use DSM base address instead for stolen memory */
>>>>> -	mgr->stolen_base = xe_mmio_read64(gt, DSMBASE.reg) &
>>>> BDSM_MASK;
>>>>> -	if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
>>>>> +	mgr->stolen_base = (xe_mmio_read64(gt, DSMBASE.reg) &
>>>> BDSM_MASK) - tile_offset;
>>>>> +	if (drm_WARN_ON(&gt->xe->drm, tile_size < mgr->stolen_base))
>>>>>     		return 0;
>>>>>
>>>>> -	stolen_size = vram_size - mgr->stolen_base;
>>>>> -	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, 2))
>>>>> -		mgr->io_base = pci_resource_start(pdev, 2) + mgr-
>>>>> stolen_base;
>>>>> +	stolen_size = tile_size - mgr->stolen_base;
>>>>> +
>>>>> +	if (mgr->stolen_base + stolen_size <= tile_size)
>>>>
>>>> I think needs to be the pci_len() here.
>>>
>>> For a PVC that would be 128GB for length.  That will encompass both tiles,
>> and I think that the
>>> this will not check correctly.
>>>
>>> tile_size == pci_len() for DG1...
>>>
>>> Is that your concern?
>>>
>>> I think that he "stolen" area has to be constrained to the tile size, not the
>> complete area.
>>> Am I missing something here?
>>
>> Just that we want mgr->io_base here to be zero on small-bar, which then
>> signals that stolen is not directly CPU accessible. Also we only care
>> about the root tile here.
> 
> Ahh, ok.
> 
> Umm, so
> 
> size = min(gt.vram.io_size, tile_size)

I think gt->vram.io_size is the per-GT io_size clamped to the usable 
VRAM size, so is always < tile_size. We want the entire tile based 
io_size which we don't seem to track, but since we only care about root 
tile here we can just use pci_len() I think (as per the old behaviour).

> 
> ?
> 
> The stolen area is defined per GT, so I updated for the possibility of others... Should we
> restrict it for GT0 only?

Yeah, existing code assumes GT0 it seems. IIRC stolen is mostly used for 
display stuff and multi-tile tends to lack display. Not sure if we ditch 
DSM altogether for PVC like platforms?

> 
> M
> 
>>>
>>> Thanks
>>>
>>> Mike
>>>
>>>>> +		mgr->io_base = gt->mem.vram.io_start + mgr->stolen_base;
>>>>>
>>>>>     	/*
>>>>>     	 * There may be few KB of platform dependent reserved memory at
>>>> the end
>>>>> @@ -139,7 +139,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device
>> *xe)
>>>>>     	int err;
>>>>>
>>>>>     	if (IS_DGFX(xe))
>>>>> -		stolen_size = detect_bar2_dgfx(xe, mgr);
>>>>> +		stolen_size = detect_bar2_dgfx(to_gt(xe), mgr);
>>>>>     	else if (GRAPHICS_VERx100(xe) >= 1270)
>>>>>     		stolen_size = detect_bar2_integrated(xe, mgr);
>>>>>     	else
