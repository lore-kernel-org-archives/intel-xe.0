Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601E5C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 15:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD7610E489;
	Wed, 26 Jul 2023 15:19:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C7E10E489
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690384787; x=1721920787;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Fw+p7qZoKdjP18LUFv+0Ru8zTWD1XyCtz/1uopCL6Gs=;
 b=N8orAIc4wmqoFHqOMF38JBas0AIKDkwRn9CaDom0dMLKAmOTEYor7bLg
 pJM+ZCPb7nFwS77sR+JArsRO/PobNvk88zyJ0b6A/6rpL7s13RLJfevb6
 I8sy/di+N3YTnr1ObyzJf0nryVoMfCrAcxvWMaAz9Lc70G3vqFkiE4BEH
 gYTsLRD1NLNiobnqmG3RA3s6xSPa0HB2gD3TTAUFIY3Z43Fgx+YsTmi4Z
 pJcG+wMKq8+VZTfyO5ljspPG/08oHkjXruWzJfMrTOt+DVRiQQ9sWRvzf
 pn3dxWxMMdNDLSv4EX3MkRw1x59YBWWAxGpLp+qtmYvCuAH0KsdtU4jiw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371658334"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371658334"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840291716"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="840291716"
Received: from cmchugh-mobl.ger.corp.intel.com (HELO [10.252.31.174])
 ([10.252.31.174])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:19:45 -0700
Message-ID: <4dd56b39-6815-0308-3c28-0fa0e4456407@intel.com>
Date: Wed, 26 Jul 2023 16:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-2-lucas.demarchi@intel.com>
 <20230725224718.GX209733@mdroper-desk1.amr.corp.intel.com>
 <a4ig4q3ytypqnzssnymrxzwpqq2fovr2wonl5lfrqbxghnsobp@3b7vuuaynau3>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <a4ig4q3ytypqnzssnymrxzwpqq2fovr2wonl5lfrqbxghnsobp@3b7vuuaynau3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Fix MTL+ stolen memory mapping
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 26/07/2023 16:13, Lucas De Marchi wrote:
> On Tue, Jul 25, 2023 at 03:47:18PM -0700, Matt Roper wrote:
>> On Tue, Jul 25, 2023 at 01:28:33PM -0700, Lucas De Marchi wrote:
>>> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
>>> mapping"). For stolen on MTL and beyond, the address in the PTE is the
>>> offset from DSM base. While at it, update the comments explaining each
>>> part of the calculation.
>>>
>>> v2: Also change resource_is_stolen_vram() so the right PTE bit is set
>>
>> With a bit more testing locally I noticed that I'm seeing some warnings
>> and crashes on driver unload when display is enabled.  I'm not 100% sure
>> they're tied to this, but it seems like they could be.
>>
>> The first warning is
>>
>>    WARNING: CPU: 10 PID: 4710 at 
>> drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:324 ttm_vram_mgr_fini+0x15e/0x170 
>> [xe]
>>
>> which is
>>
>>        WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>>
>> From there things go downhill --- circular locking detected, slab cache
>> problems, and KASAN use-after-free reports.
> 
> I can only reproduce the warnings above, not the crashes, circular
> lockings etc. They don't seem related to this patch. More below.
> 
>>
>> Without digging through the code in depth, my worry is that by just
>> marking this stolen memory as vram everywhere in the driver, we try to
>> return the framebuffer to the otherwise empty/uninitialized VRAM pool,
>> even though it isn't truly VRAM.
>>
>> Maybe it would be better to make a change with less side effects
>> elsewhere in the code.  E.g., add a "resource_is_stolen_devmem" that
>> only gets called from the pagetable encoding functions to set the DM=1
>> bit and not anywhere else?
> 
> I think it would make it clearer about the intent since the stolen
> memory is not actually vram, it's just accessed through the PCI BAR. I
> did typed this all into new patches for this series, but it I still
> reproduce the warnings above. They seem related to the small BAR
> addition that added the tracking for the visible portion of the BAR.
> 
> For stolen, it's always 100% visible. Loading the driver without
> display (no warning on module removal):
> 
> root@mtl: ~# cat  /sys/kernel/debug/dri/0/stolen_mm
>    use_type: 1
>    use_tt: 0
>    size: 62914560
>    usage: 0
> default_page_size: 4KiB
> visible_avail: 60MiB
> visible_size: 60MiB
> chunk_size: 4KiB, total: 60MiB, free: 60MiB
> ...
> 
> vs loading it with display:
> 
> root@mtl # cat  /sys/kernel/debug/dri/0/stolen_mm
>    use_type: 1
>    use_tt: 0
>    size: 62914560
>    usage: 25165824
> default_page_size: 4KiB
> visible_avail: 36MiB
> visible_size: 60MiB
> chunk_size: 4KiB, total: 60MiB, free: 36MiB
> 
>  From dmesg:
> [ 3026.756075] xe 0000:00:02.0: [drm:xe_ttm_stolen_mgr_init [xe]] 
> Initialized stolen memory support with 62914560 bytes
> [ 3029.670666] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
> [ 3030.009260] xe 0000:00:02.0: [drm:intel_fbc_update [xe]] reserved 
> 16777216 bytes of contiguous stolen space for FBC, limit: 1
> 
> So the allocations that remain on stolen seem to be the fbdev + FBC.
> I wonder if the fini order is correct wrt display and we are returning
> those before destroying the ttm mananger. Cc'ing Matt Auld and Maarten
> to check if they have additional clues. I will send the next version
> since I believe the approach without overriding is_vram is clearer and I
> have several other fixes/cleanups piling there.

Sounds like maybe:
https://patchwork.freedesktop.org/series/120310/

I have been cherry picking that on my local branches, otherwise module 
unload is quite broken.

> 
> I will try it on TGL or ADL-P to see if I can reproduce there too.
> 
> Lucas De Marchi
> 
>>
>> Or maybe these warnings are unrelated; I haven't tried unloading with
>> display on any other platforms recently, so maybe it's a pre-existing
>> problem.
>>
>>
>> Matt
>>
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_bo.c             |  3 ++-
>>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 10858fcf4f62..5379d8e5affb 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
>>>
>>>  static bool resource_is_stolen_vram(struct xe_device *xe, struct 
>>> ttm_resource *res)
>>>  {
>>> -    return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
>>> +    return res->mem_type == XE_PL_STOLEN &&
>>> +        (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
>>>  }
>>>
>>>  static bool resource_is_vram(struct ttm_resource *res)
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> index 21ecc734f10a..271b3fba4129 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> @@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct 
>>> xe_device *xe, struct xe_ttm_stolen_mgr
>>>
>>>      ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>>>
>>> -    /* check GGMS, should be fixed 0x3 (8MB) */
>>> +    /*
>>> +     * Check GGMS: it should be fixed 0x3 (8MB), which corresponds 
>>> to the
>>> +     * GTT size
>>> +     */
>>>      if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>>>          return 0;
>>>
>>> -    mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + 
>>> SZ_8M;
>>> +    /*
>>> +     * Graphics >= 1270 uses the offset to the GSMBASE as address in 
>>> the
>>> +     * PTEs, together with the DM flag being set. Previously there 
>>> was no
>>> +     * such flag so the address was the io_base.
>>> +     *
>>> +     * DSMBASE = GSMBASE + 8MB
>>> +     */
>>> +    mgr->stolen_base = SZ_8M;
>>> +    mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>>>
>>>      /* return valid GMS value, -EIO if invalid */
>>>      gms = REG_FIELD_GET(GMS_MASK, ggc);
>>> -- 
>>> 2.40.1
>>>
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
