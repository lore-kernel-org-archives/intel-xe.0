Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E68C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 11:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9856E10E14F;
	Tue,  7 Mar 2023 11:27:11 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B1B10E14F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678188430; x=1709724430;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N41Cqcw5EfHA67bpu2U5V7PRV75HiBLwl+Nm/XzxS14=;
 b=Mk97U0nwzt6fIXOrr96oZMFLWgMYn6JGSX++NKgZO1hHXd/obuXTXMbF
 sLEFgbw3PeffcdURc5iaGo9XvR2irkXIjs/HJqvC0RkJnx8FqvZsagDWz
 /O+hlXMAroaxiNweS3nQ+Dhv6oepqDpK+TCB8ok9+Tv/Rnu9A28bX3u1V
 HLQbR4Qumvn80RuLMZxyfl8NFCbs7ofqmjDTGfCkNtDtWxxDPd4FPtiyE
 ZJy5YTek3T8HXNs0ib5vkMJ2vYePJK2qddvZJaUDFj9G5n9tf6EYJL+Y6
 nm//zA0wF/HOB0gH4ZpvJ2LZsaROhQPveXJtydOW6MrxoxNgJRFtp9mbB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334542299"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="334542299"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678898401"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="678898401"
Received: from avocking-mobl1.ger.corp.intel.com (HELO [10.252.12.120])
 ([10.252.12.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:27:09 -0800
Message-ID: <fac73afc-c489-bf22-47a5-aef8bb0333a6@intel.com>
Date: Tue, 7 Mar 2023 11:27:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-3-matthew.auld@intel.com>
 <f4fbb52e-0b6b-36de-eb45-616236d4587f@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <f4fbb52e-0b6b-36de-eb45-616236d4587f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/mmio: s/lmem/vram/
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

On 07/03/2023 10:03, Gwan-gyeong Mun wrote:
> Looks good to me.
> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Thanks.

> 
> In addition, in the code of the function below, a variable or string 
> named lmem is used. Is the code intentionally not modified?
> 
> drivers/gpu/drm/xe/xe_bo.c
>      xe_bo_pin()
> 
> drivers/gpu/drm/xe/tests/xe_migrate.c
>      test_copy()

Yeah, it seems there are a bunch more places. But here since I was only 
really touching xe_mmio.c, adding the plumbing for io_size, I figured to 
limit to here for now. Also there were some existing user level prints 
and modparams directly related to this series (like lmem_bar_size), so 
seemed worth fixing those in particular.

I suppose I can re-resend with s/lmem/vram/ for the whole driver.

> 
> Br,
> G.G.
> 
> On 3/1/23 4:48 PM, Matthew Auld wrote:
>> This seems to be the preferred nomenclature in xe.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio.c   | 40 +++++++++++++++++-----------------
>>   drivers/gpu/drm/xe/xe_module.c |  6 ++---
>>   drivers/gpu/drm/xe/xe_module.h |  2 +-
>>   3 files changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 65b0df9bb579..e5bd4609aaee 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -68,7 +68,7 @@ _resize_bar(struct xe_device *xe, int resno, 
>> resource_size_t size)
>>       return 1;
>>   }
>> -static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t 
>> lmem_size)
>> +static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t 
>> vram_size)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>       struct pci_bus *root = pdev->bus;
>> @@ -78,31 +78,31 @@ static int xe_resize_lmem_bar(struct xe_device 
>> *xe, resource_size_t lmem_size)
>>       u32 pci_cmd;
>>       int i;
>>       int ret;
>> -    u64 force_lmem_bar_size = xe_force_lmem_bar_size;
>> +    u64 force_vram_bar_size = xe_force_vram_bar_size;
>>       current_size = roundup_pow_of_two(pci_resource_len(pdev, 
>> GEN12_LMEM_BAR));
>> -    if (force_lmem_bar_size) {
>> +    if (force_vram_bar_size) {
>>           u32 bar_sizes;
>> -        rebar_size = force_lmem_bar_size * (resource_size_t)SZ_1M;
>> +        rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>>           bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>>           if (rebar_size == current_size)
>>               return 0;
>>           if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
>> -            rebar_size >= roundup_pow_of_two(lmem_size)) {
>> -            rebar_size = lmem_size;
>> +            rebar_size >= roundup_pow_of_two(vram_size)) {
>> +            rebar_size = vram_size;
>>               drm_info(&xe->drm,
>>                    "Given bar size is not within supported size, 
>> setting it to default: %llu\n",
>> -                 (u64)lmem_size >> 20);
>> +                 (u64)vram_size >> 20);
>>           }
>>       } else {
>>           rebar_size = current_size;
>> -        if (rebar_size != roundup_pow_of_two(lmem_size))
>> -            rebar_size = lmem_size;
>> +        if (rebar_size != roundup_pow_of_two(vram_size))
>> +            rebar_size = vram_size;
>>           else
>>               return 0;
>>       }
>> @@ -117,7 +117,7 @@ static int xe_resize_lmem_bar(struct xe_device 
>> *xe, resource_size_t lmem_size)
>>       }
>>       if (!root_res) {
>> -        drm_info(&xe->drm, "Can't resize LMEM BAR - platform support 
>> is missing\n");
>> +        drm_info(&xe->drm, "Can't resize VRAM BAR - platform support 
>> is missing\n");
>>           return -1;
>>       }
>> @@ -168,7 +168,7 @@ int xe_mmio_total_vram_size(struct xe_device *xe, 
>> u64 *vram_size, u64 *usable_si
>>       if (usable_size) {
>>           reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
>>           *usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * 
>> SZ_64K;
>> -        drm_info(&xe->drm, "lmem_size: 0x%llx usable_size: 0x%llx\n",
>> +        drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
>>                *vram_size, *usable_size);
>>       }
>> @@ -180,7 +180,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>       struct xe_gt *gt;
>>       u8 id;
>> -    u64 lmem_size;
>> +    u64 vram_size;
>>       u64 original_size;
>>       u64 current_size;
>>       u64 usable_size;
>> @@ -207,29 +207,29 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>       gt = xe_device_get_gt(xe, 0);
>>       original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>> -    err = xe_mmio_total_vram_size(xe, &lmem_size, &usable_size);
>> +    err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
>>       if (err)
>>           return err;
>> -    resize_result = xe_resize_lmem_bar(xe, lmem_size);
>> +    resize_result = xe_resize_vram_bar(xe, vram_size);
>>       current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>       xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>> -    xe->mem.vram.size = min(current_size, lmem_size);
>> +    xe->mem.vram.size = min(current_size, vram_size);
>>       if (!xe->mem.vram.size)
>>           return -EIO;
>>       if (resize_result > 0)
>> -        drm_info(&xe->drm, "Successfully resize LMEM from %lluMiB to 
>> %lluMiB\n",
>> +        drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to 
>> %lluMiB\n",
>>                (u64)original_size >> 20,
>>                (u64)current_size >> 20);
>> -    else if (xe->mem.vram.size < lmem_size && !xe_force_lmem_bar_size)
>> +    else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
>>           drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. 
>> Consider enabling 'Resizable BAR' support in your BIOS.\n",
>>                (u64)xe->mem.vram.size >> 20);
>> -    if (xe->mem.vram.size < lmem_size)
>> +    if (xe->mem.vram.size < vram_size)
>>           drm_warn(&xe->drm, "Restricting VRAM size to PCI resource 
>> size (0x%llx->0x%llx)\n",
>> -             lmem_size, (u64)xe->mem.vram.size);
>> +             vram_size, (u64)xe->mem.vram.size);
>>       xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, 
>> xe->mem.vram.size);
>>       xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>> @@ -360,7 +360,7 @@ int xe_mmio_init(struct xe_device *xe)
>>        * and we should not continue with driver initialization.
>>        */
>>       if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL.reg) & 
>> LMEM_INIT)) {
>> -        drm_err(&xe->drm, "LMEM not initialized by firmware\n");
>> +        drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>>           return -ENODEV;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 5a51a9959eff..6860586ce7f8 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -22,9 +22,9 @@ bool enable_display = true;
>>   module_param_named(enable_display, enable_display, bool, 0444);
>>   MODULE_PARM_DESC(enable_display, "Enable display");
>> -u32 xe_force_lmem_bar_size;
>> -module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
>> -MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
>> +u32 xe_force_vram_bar_size;
>> +module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
>> +MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>>   int xe_guc_log_level = 5;
>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>> b/drivers/gpu/drm/xe/xe_module.h
>> index 2c6ee46f5595..86916c176382 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -8,6 +8,6 @@
>>   /* Module modprobe variables */
>>   extern bool enable_guc;
>>   extern bool enable_display;
>> -extern u32 xe_force_lmem_bar_size;
>> +extern u32 xe_force_vram_bar_size;
>>   extern int xe_guc_log_level;
>>   extern char *xe_param_force_probe;
