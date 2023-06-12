Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4096AC7EE2E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 15:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B9F10E2B0;
	Mon, 12 Jun 2023 15:55:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4286C10E2B0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686585354; x=1718121354;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OzBeWvYQoNIrK93+VdQoSqrYC+IOfoAZ+uh0AJ13roY=;
 b=IzIqykburZbDRHZjbVO7wOQTHbnBlrYykn6FuP5scCQcVGV8Fta2LIqS
 /rkEClPMgqF04ohUTXVwHevS0z4XhWNwpI7qaWW8RcdcxMqYzKSLUR/9R
 Fs+S9OFFBZzIg7Zj/MPMH3A5ECPlmNdF8Fc9/HTWJpmovLAfuzmVLOu87
 9NZh2nqaKHsKwM+YJE/L9usO/JvtpnATY3TDrmaV+dGuhR/Q1SQrAXnWQ
 kzOYA8rZFWKGdN7+e2wemWUEMZyllkmoc5g+k1gJUoJNl4/u8cmrYZKYB
 pSlUtjvRTfWP0STs2tRzhojvm2f6eVMJIXQ6dH3R/rI+ftD1PpoCox1YM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444463847"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444463847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="661633704"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="661633704"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO [10.252.22.12])
 ([10.252.22.12])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:55:51 -0700
Message-ID: <bbedf796-f393-5da6-ee5d-9d476aaf5225@intel.com>
Date: Mon, 12 Jun 2023 16:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.1
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
 <20230609185249.2032370-2-aravind.iddamsetty@intel.com>
 <IA1PR11MB6418E0AF6621EE62DF042E06C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <bfa7f6cd-3cca-7c3f-413b-25f8c50b41dc@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <bfa7f6cd-3cca-7c3f-413b-25f8c50b41dc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size
 calculation
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 12/06/2023 16:04, Iddamsetty, Aravind wrote:
> 
> 
> On 12-06-2023 19:59, Ruhl, Michael J wrote:
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>> Aravind Iddamsetty
>>> Sent: Friday, June 9, 2023 2:53 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>>> Subject: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size calculation
>>>
>>> The stolen memory base should be derived from GSMBASE or
>>> FLAT_CCS_BASE_ADDR when flat ccs is applicable.
>>>
>>> Fixes: acf067c2f5a5 ("drm/xe: Implement stolen memory.")
>>>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 +++----
>>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> index 21ecc734f10a..29ce69bf8200 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> @@ -54,7 +54,6 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct
>>> xe_device *xe)
>>> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr
>>> *mgr)
>>> {
>>> 	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> -	struct xe_gt *mmio = xe_root_mmio_gt(xe);
>>> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> 	u64 stolen_size;
>>> 	u64 tile_offset;
>>> @@ -66,12 +65,12 @@ static s64 detect_bar2_dgfx(struct xe_device *xe,
>>> struct xe_ttm_stolen_mgr *mgr)
>>> 		return 0;
>>> 	}
>>>
>>> -	/* Use DSM base address instead for stolen memory */
>>> -	mgr->stolen_base = (xe_mmio_read64(mmio, DSMBASE) & >BDSM_MASK) - tile_offset;
>>> +	/* stolen base should be at end of usable vram */
>>> +	mgr->stolen_base = vram_size;
>>
>> Hi Arvind,
>>
>> The stolen memory in i915 is not calculated like this.  It uses the DSMBASE for the offset like the
>> current code.
>>
>> The lmem size includes the CSS sizing, but that is for the LMEM memory region.
>>
>> This is calculating and creating the "stolen" region for use in kernel space.  If the offset includes the CSS space,
>> won't the DSM usage be in the wrong place?
> 
> I didn't realize until you mentioned here we wanted to carve out usable
> stolen in which case what I did is wrong, makes sense.
> 
> but why is that we are doing only on root tile even remote tile has
> stolen area right?

I think the main reason is because there is no user in the driver for it 
outside of display stuff, and display only cares about root tile atm. If 
we can actively utilise it outside of display (like some per tile 
resource needed by the driver) then maybe it makes sense to probe it for 
all tiles, assuming it's still present on such platforms.

> 
> Thanks,
> Aravind.
>>
>>> 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
>>> 		return 0;
>>>
>>> -	stolen_size = tile_size - mgr->stolen_base;
>>> +	stolen_size = tile_size - vram_size;
>>
>> The tile size was picked to work with devices that do not have tile information (pci_resource _len used).  vram_size
>> can be wrong in those instances.
>>
>> My original patch set used the vram_size, but that was not accurate for this usage.
>>
>> Are you seeing an issue with the current code?
>>
>> Thanks
>>
>> Mike
>>
>>> 	/* Verify usage fits in the actual resource available */
>>> 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, >GEN12_LMEM_BAR))
>>> --
>>> 2.25.1
>>
