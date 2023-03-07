Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B831C6FD1B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 12:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B726A10E10B;
	Tue,  7 Mar 2023 12:23:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904E810E10B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678191817; x=1709727817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kY6X9sBvQcDomoinGBHAYXAX2jxHPunMX8ay2FanFZU=;
 b=Z/4s9m9cXl1Oc5IRQAMbf9B0NXc9R8sVHH5wGtigGq2hEQTykj8+tACa
 fNtS6OTYtkJ3JgOEF696MFA14o60UZdalCDDaQkRh9RRH4roW6mHk/c6q
 JU8J0FULMXJ0jzca8+Gg94O0QX7RXN2P8dvIBVDvxYv+KiAtdeYdSomU7
 NYhP1eOXRqJesjZgdmeaDxp/u2XjUrG1FVbqNsqcUyUFCeYoVh67SWQKS
 VfAufyWUK2Afd1mUNkx8WegmkBP+S5nnTxWZ/3qkzujy0pBR2YDnFaDwk
 m0MMi6UWuyGYQ7w4vpoOkHPEYt9fZriVqBbmoTmyenZz+Z4ia59KQqJTc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316236850"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="316236850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626519870"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="626519870"
Received: from avocking-mobl1.ger.corp.intel.com (HELO [10.252.12.120])
 ([10.252.12.120])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:23:35 -0800
Message-ID: <f1a1c0ed-5f3c-caa9-37c7-5b5ba7d9fab5@intel.com>
Date: Tue, 7 Mar 2023 12:23:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-4-matthew.auld@intel.com>
 <246c8dd1-3ee0-4992-dff8-66542cb220ef@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <246c8dd1-3ee0-4992-dff8-66542cb220ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/vram: start tracking the io_size
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 07/03/2023 11:55, Gwan-gyeong Mun wrote:
> 
> 
> On 3/1/23 4:48 PM, Matthew Auld wrote:
>> First step towards supporting small-bar is to track the io_size for
>> vram. We can longer assume that the io_size == vram size. This way we
>> know how much is CPU accessible via the BAR, and how much is not.
>> Effectively giving us a two tiered vram, where in some later patches we
>> can support different allocation strategies depending on if the memory
>> needs to be CPU accessible or not.
>>
>> Note as this stage we still clamp the vram size to the usable vram size.
>> Only in the final patch do we turn this on for real, and allow distinct
>> io_size and vram_size.
>>
>> v2: (Lucas):
>>    - Improve the commit message, plus improve the kernel-doc for the
>>      io_size to give a better sense of what it actually is.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h | 14 +++++++--
>>   drivers/gpu/drm/xe/xe_gt_types.h     | 14 +++++++--
>>   drivers/gpu/drm/xe/xe_mmio.c         | 44 ++++++++++++++++++++--------
>>   3 files changed, 55 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 9743987fc883..9e998b4738e1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -173,9 +173,19 @@ struct xe_device {
>>       struct {
>>           /** @vram: VRAM info for device */
>>           struct {
>> -            /** @io_start: start address of VRAM */
>> +            /** @io_start: IO start address of VRAM */
>>               resource_size_t io_start;
>> -            /** @size: size of VRAM */
>> +            /**
>> +             * @io_size: IO size of VRAM.
>> +             *
>> +             * This represents how much of VRAM we can access via
>> +             * the CPU through the VRAM BAR. This can be smaller
>> +             * than @size, in which case only part of VRAM is CPU
>> +             * accessible (typically the first 256M). This
>> +             * configuration is known as small-bar.
>> +             */
>> +            resource_size_t io_size;
>> +            /** @size: Total size of VRAM */
>>               resource_size_t size;
>>               /** @mapping: pointer to VRAM mappable space */
>>               void *__iomem mapping;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index b01edd3fdc4d..00c43f3a33a2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -143,9 +143,19 @@ struct xe_gt {
>>            * (virtual split), can be subset of global device VRAM
>>            */
>>           struct {
>> -            /** @io_start: start address of VRAM */
>> +            /** @io_start: IO start address of this VRAM instance */
>>               resource_size_t io_start;
>> -            /** @size: size of VRAM */
>> +            /**
>> +             * @io_size: IO size of this VRAM instance
>> +             *
>> +             * This represents how much of this VRAM we can access
>> +             * via the CPU through the VRAM BAR. This can be smaller
>> +             * than @size, in which case only part of VRAM is CPU
>> +             * accessible (typically the first 256M). This
>> +             * configuration is known as small-bar.
>> +             */
>> +            resource_size_t io_size;
>> +            /** @size: size of VRAM. */
>>               resource_size_t size;
>>               /** @mapping: pointer to VRAM mappable space */
>>               void *__iomem mapping;
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index e5bd4609aaee..5cacaa05759a 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -182,7 +182,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>       u8 id;
>>       u64 vram_size;
>>       u64 original_size;
>> -    u64 current_size;
>>       u64 usable_size;
>>       int resize_result, err;
>> @@ -190,11 +189,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>           xe->mem.vram.mapping = 0;
>>           xe->mem.vram.size = 0;
>>           xe->mem.vram.io_start = 0;
>> +        xe->mem.vram.io_size = 0;
>>           for_each_gt(gt, xe, id) {
>>               gt->mem.vram.mapping = 0;
>>               gt->mem.vram.size = 0;
>>               gt->mem.vram.io_start = 0;
>> +            gt->mem.vram.io_size = 0;
>>           }
>>           return 0;
>>       }
>> @@ -212,10 +213,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>           return err;
>>       resize_result = xe_resize_vram_bar(xe, vram_size);
>> -    current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>       xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>> -
>> -    xe->mem.vram.size = min(current_size, vram_size);
>> +    xe->mem.vram.io_size = min(usable_size,
>> +                   pci_resource_len(pdev, GEN12_LMEM_BAR));
> Hi Matt,
> xe_mmio_total_vram_size() calculates usable_size, why is there an 
> additional check here?

You mean the min() here? We are just clamping the io_size to always be 
<= usable_size. On small-bar it will be < usable_size, and on full-bar 
is will be >= usable_size. Also it can even be larger than the probed 
size since BAR size must always be power-of-two, but VRAM can be 
non-power-of-two like 6G DG2.

> 
> G.G.
>> +    xe->mem.vram.size = xe->mem.vram.io_size;
>>       if (!xe->mem.vram.size)
>>           return -EIO;
>> @@ -223,15 +224,15 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>       if (resize_result > 0)
>>           drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to 
>> %lluMiB\n",
>>                (u64)original_size >> 20,
>> -             (u64)current_size >> 20);
>> -    else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
>> +             (u64)xe->mem.vram.io_size >> 20);
>> +    else if (xe->mem.vram.io_size < usable_size && 
>> !xe_force_vram_bar_size)
>>           drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. 
>> Consider enabling 'Resizable BAR' support in your BIOS.\n",
>>                (u64)xe->mem.vram.size >> 20);
>>       if (xe->mem.vram.size < vram_size)
>>           drm_warn(&xe->drm, "Restricting VRAM size to PCI resource 
>> size (0x%llx->0x%llx)\n",
>>                vram_size, (u64)xe->mem.vram.size);
>> -    xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, 
>> xe->mem.vram.size);
>> +    xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, 
>> xe->mem.vram.io_size);
>>       xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>>       drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", 
>> &xe->mem.vram.io_start, &xe->mem.vram.size);
>> @@ -239,7 +240,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>       /* FIXME: Assuming equally partitioned VRAM, incorrect */
>>       if (xe->info.tile_count > 1) {
>>           u8 adj_tile_count = xe->info.tile_count;
>> -        resource_size_t size, io_start;
>> +        resource_size_t size, io_start, io_size;
>>           for_each_gt(gt, xe, id)
>>               if (xe_gt_is_media_type(gt))
>> @@ -249,15 +250,31 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>           size = xe->mem.vram.size / adj_tile_count;
>>           io_start = xe->mem.vram.io_start;
>> +        io_size = xe->mem.vram.io_size;
>>           for_each_gt(gt, xe, id) {
>> -            if (id && !xe_gt_is_media_type(gt))
>> -                io_start += size;
>> +            if (id && !xe_gt_is_media_type(gt)) {
>> +                io_size -= min(io_size, size);
>> +                io_start += io_size;
>> +            }
>>               gt->mem.vram.size = size;
>> -            gt->mem.vram.io_start = io_start;
>> -            gt->mem.vram.mapping = xe->mem.vram.mapping +
>> -                (io_start - xe->mem.vram.io_start);
>> +
>> +            /*
>> +             * XXX: multi-tile small-bar might be wild. Hopefully
>> +             * full tile without any mappable vram is not something
>> +             * we care about.
>> +             */
>> +
>> +            gt->mem.vram.io_size = min(size, io_size);
>> +            if (io_size) {
>> +                gt->mem.vram.io_start = io_start;
>> +                gt->mem.vram.mapping = xe->mem.vram.mapping +
>> +                    (io_start - xe->mem.vram.io_start);
>> +            } else {
>> +                drm_err(&xe->drm, "Tile without any CPU visible VRAM. 
>> Aborting.\n");
>> +                return -ENODEV;
>> +            }
>>               drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
>>                    id, gt->info.vram_id, &gt->mem.vram.io_start,
>> @@ -266,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>       } else {
>>           gt->mem.vram.size = xe->mem.vram.size;
>>           gt->mem.vram.io_start = xe->mem.vram.io_start;
>> +        gt->mem.vram.io_size = xe->mem.vram.io_size;
>>           gt->mem.vram.mapping = xe->mem.vram.mapping;
>>           drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
