Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBEBC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB3489622;
	Tue, 21 Jul 2026 09:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpLHzDdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27D489622
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784625315; x=1816161315;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=wsIZz4+P5tt5Jc63531KxJ+Cs5pIzwr/Z1Euh4C+uyY=;
 b=TpLHzDdYQPH521PHDYT0kEr5MhR0HPuh9vnNVfbSEAl04rJHIE5Z854m
 M+w8BPpwQnYkd52iC96xwpOy/YTgFdQ5vuHMF6Qg+KfQGvZbxxe3mPeSm
 SFZ2hU6SmWiEsnPMZiXy/bBSoEXMYMG5sjth61KpHpuCN86z63xjYubUv
 pA+4SGkH58CIaYjY1RRTUms0/4N/9GY0kBeMy3XyGAKPy72pPsUtAjHem
 xx/xefw1Tt9lCJX+3zyEYwt961J99eXSfPf/rBAIb0TqzEtuKqXMxnEoZ
 PvUoEOXtBHrkZT14FE2tBsVuXQMbujD3/3NStnWgT8wZsVHZqaO/zSK0K Q==;
X-CSE-ConnectionGUID: 20uQUiPzS/Opiug7/0xLIA==
X-CSE-MsgGUID: Ggo1m/B9QwezsBCB6PpoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96579472"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="96579472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:15:14 -0700
X-CSE-ConnectionGUID: KmY1xTMGTdOIX/VS0PNaaQ==
X-CSE-MsgGUID: SJkgXtGSSPaz/e/GbtqUSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255920826"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.58])
 ([10.245.245.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:15:11 -0700
Message-ID: <b0b43e2c-e6a5-4082-82be-216ec7d56942@intel.com>
Date: Tue, 21 Jul 2026 10:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/xe/mmio_gem: fix destroy flow
From: Matthew Auld <matthew.auld@intel.com>
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, Matthew Brost <matthew.brost@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-12-ilia.levi@intel.com>
 <ad9d424d-9b9a-4c27-bbec-58a293fed39c@intel.com>
Content-Language: en-GB
In-Reply-To: <ad9d424d-9b9a-4c27-bbec-58a293fed39c@intel.com>
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

On 16/07/2026 16:22, Matthew Auld wrote:
> On 26/05/2026 13:51, Ilia Levi wrote:
>> xe_mmio_gem_destroy() currently frees the GEM object directly, bypassing
>> reference counting.  Since existing VMAs hold a reference and the fault
>> handler accesses the object through vma->vm_private_data, this is
>> use-after-free.  Additionally, nothing prevents the fault handler from
>> installing PTEs to the real MMIO after destroy.
>>
>> Use SRCU to ensure the fault handler sees the 'destroyed' flag
>> (mirroring the drm_dev_enter/exit pattern for hot-unplug), then zap
>> existing PTEs to prevent continued access to the real MMIO. Use
>> drm_gem_object_put() to respect the reference count.
> 
> Couple questions here:
> 
> 1) Can we not just use the dma-resv for synchronisation? We wrap the 
> mmio_gem with a gem buffer, so the dma-resv is already there. This has 
> the added benefit of looking more similar to the normal bo fault path. 
> Also same question for dummy_page_lock in the previous patch.
> 
> 2) Should we not just SIGBUG, if something faults on this post destroy? 
> Is this not a userspace issue? Re-routing to the dummy page on unplug 
> makes sense, since userspace did nothing wrong, so we want to give it a 
> chance to recover.

For 2) other option is maybe just to drop the gem->destroyed handling 
for now. For PCI_BARRIER and anything else tied to the xe_file, there 
shouldn't be any weird lifetime issues, so it should be impossible to 
see something "destroyed" in the fault handler. It's otherwise hard to 
judge without seeing a real user for this special "destroyed" flow with 
the re-routing to a dummy page.

> 
>>
>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++++++++++++-
>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/ 
>> xe_mmio_gem.c
>> index 2f2ebc4fd901..b91704c51a93 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>> @@ -5,11 +5,15 @@
>>   #include "xe_mmio_gem.h"
>> +#include <linux/srcu.h>
>> +
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_gem.h>
>>   #include "xe_device_types.h"
>> +DEFINE_STATIC_SRCU(xe_mmio_gem_srcu);
>> +
>>   /**
>>    * DOC: Exposing MMIO regions to userspace
>>    *
>> @@ -39,6 +43,7 @@ struct xe_mmio_gem {
>>       unsigned long pgoff;
>>       struct mutex dummy_page_lock; /* protects dummy page allocation */
>>       struct page *dummy_page;
>> +    bool destroyed;
>>   };
>>   static const struct vm_operations_struct vm_ops = {
>> @@ -145,8 +150,23 @@ static void xe_mmio_gem_free(struct 
>> drm_gem_object *base)
>>    */
>>   void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file 
>> *file)
>>   {
>> +    struct drm_gem_object *base = &gem->base;
>> +    struct drm_device *dev = base->dev;
>> +
>>       drm_vma_node_revoke(&gem->base.vma_node, file);
>> -    xe_mmio_gem_free(&gem->base);
>> +
>> +    gem->destroyed = true;
>> +    synchronize_srcu(&xe_mmio_gem_srcu);
>> +
>> +    /*
>> +     * At this point every subsequent fault handler will see that the
>> +     * object has been destroyed and provide the dummy page.
>> +     * Now just zap existing PTEs to prevent continued access to the 
>> real
>> +     * MMIO.
>> +     */
>> +    drm_vma_node_unmap(&base->vma_node, dev->anon_inode->i_mapping);
>> +
>> +    drm_gem_object_put(base);
>>   }
>>   static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct 
>> vm_area_struct *vma)
>> @@ -196,6 +216,11 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct 
>> vm_fault *vmf)
>>       unsigned long pgoff;
>>       int idx;
>> +    guard(srcu)(&xe_mmio_gem_srcu);
>> +
>> +    if (obj->destroyed)
>> +        return xe_mmio_gem_vm_fault_dummy_page(vmf);
>> +
>>       if (!drm_dev_enter(dev, &idx)) {
>>           /*
>>            * Provide a dummy page to avoid SIGBUS for events such as 
>> hot-unplug.
> 

