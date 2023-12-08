Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E1C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 09:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607510EA3B;
	Fri,  8 Dec 2023 09:11:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B786310EA31
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702026688; x=1733562688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bl5Wca6yRRbzQ7GJbTfQHHvPtlHe2eUWPeagjWIkOeM=;
 b=fY4gqoeDh8n1jh5QZdZnfCLsa1L1qUZS/NYg+pBBWAiJxrsyf6y/jNiz
 AW8zuKNeAwUmslzZPWnTzSHYiWdZZBnOiXTINoD6Bh5MKObVHLKCCrWpt
 xnc7Xe2vOon5X3jeBYUYXws+K4oH/pqrDj/LYRss2B3vrVm8OgghnIwiQ
 c//JDA0XJ50CZ0SYe4aA7q/avALVFPf3Uo/g9BLpNSxa+xeun3e0TXqIq
 D781Ukcz6ZPwf60o9ZwRF21MAq0Jyx74+KH2LVPYK9743pFpBHOQtKARU
 io+PVEFQC3gd38CkE3MF08s0wCcggJKKjb9DoKC+Mu54x97bRZn0QGEhd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398249718"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="398249718"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 01:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772069223"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="772069223"
Received: from asiderx-mobl.ger.corp.intel.com (HELO [10.252.10.239])
 ([10.252.10.239])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 01:11:26 -0800
Message-ID: <3bcc4520-bb04-4cb5-8568-50306f2e3f3c@intel.com>
Date: Fri, 8 Dec 2023 09:11:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/dgfx: Block rpm for active mmap mappings
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
 <20231206133421.3295163-2-badal.nilawar@intel.com>
 <c3e2e04f-7cb3-4d68-b19a-5c7271a0c626@intel.com>
 <381b6034-cdbf-4259-ab28-e7858fd750dd@intel.com>
 <a2a11619-faca-4fb6-b6d1-4aa09a6d8070@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <a2a11619-faca-4fb6-b6d1-4aa09a6d8070@intel.com>
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 08/12/2023 07:29, Nilawar, Badal wrote:
> 
> 
> On 07-12-2023 18:36, Matthew Auld wrote:
>> On 07/12/2023 11:26, Matthew Auld wrote:
>>> On 06/12/2023 13:34, Badal Nilawar wrote:
>>>> Block rpm for discrete cards when mmap mappings are active.
>>>> Ideally rpm wake ref should be taken in vm_open call and put in 
>>>> vm_close
>>>> call but it is seen that vm_open doesn't get called for xe_gem_vm_ops.
>>>> Therefore rpm wake ref is being get in xe_drm_gem_ttm_mmap and put
>>>> in vm_close.
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_bo.c | 35 +++++++++++++++++++++++++++++++++--
>>>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 72dc4a4eed4e..5741948a2a51 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -15,6 +15,7 @@
>>>>   #include <drm/ttm/ttm_tt.h>
>>>>   #include <drm/xe_drm.h>
>>>> +#include "i915_drv.h"
>>>
>>> Do we need this?
>>>
>>>>   #include "xe_device.h"
>>>>   #include "xe_dma_buf.h"
>>>>   #include "xe_drm_client.h"
>>>> @@ -1158,17 +1159,47 @@ static vm_fault_t xe_gem_fault(struct 
>>>> vm_fault *vmf)
>>>>       return ret;
>>>>   }
>>>> +static void xe_ttm_bo_vm_close(struct vm_area_struct *vma)
>>>> +{
>>>> +    struct ttm_buffer_object *tbo = vma->vm_private_data;
>>>> +    struct drm_device *ddev = tbo->base.dev;
>>>> +    struct xe_device *xe = to_xe_device(ddev);
>>>> +
>>>> +    ttm_bo_vm_close(vma);
>>>> +
>>>> +    if (tbo->resource->bus.is_iomem)
>>>> +        xe_device_mem_access_put(xe);
>>
>> Are you sure this works as expected? Say if the user partially unmaps 
>> something?
>>
>> map = mmap(obj, size);
>> unmap(map, size/2);
>> unmap(map, size);
>>
>> That would be one mmap but multiple vm_close calls leading to an 
>> imbalance in the RPM ref. I think we need the access_get in the 
>> vm_open also?I haven't tried partial mmap but for single mmap-unmap I 
>> observed
> equal number of xe_drm_gem_ttm_mmap and vm_close call. Will try partial 
> mmap.
> 
> For mem_access_get in vm_open, initially we were trying the same but 
> observed that vm_open never get called.

Yeah, if you do:

mmap(obj, size)
munmap(obj, size)

That will do mmap and one vm_close, no vm_open AFAICT. But that looks to 
be fine here.

> In fact i915 i915_gem_mman.c we found this comment for vm_open.
>          /*
>           * When we install vm_ops for mmap we are too late for
>           * the vm_ops->open() which increases the ref_count of
>           * this obj and then it gets decreased by the vm_ops->close().
>           * To balance this increase the obj ref_count here.
>           */
> Does similar reason applicable for xe vm_open as well?

I think so. If you do:

mmap(obj, size)
munmap(obj, size/2)
munmap(obj, size)

That will do one mmap, one vm_open for the newly split vma and finally 
two vm_closes, AFAICT.

> 
> Regards,
> Badal
>>
>>>> +}
>>>> +
>>>>   static const struct vm_operations_struct xe_gem_vm_ops = {
>>>>       .fault = xe_gem_fault,
>>>>       .open = ttm_bo_vm_open,
>>>> -    .close = ttm_bo_vm_close,
>>>> +    .close = xe_ttm_bo_vm_close,
>>>>       .access = ttm_bo_vm_access
>>>>   };
>>>> +int xe_drm_gem_ttm_mmap(struct drm_gem_object *gem,
>>>> +            struct vm_area_struct *vma)
>>>> +{
>>>> +    struct ttm_buffer_object *tbo = drm_gem_ttm_of_gem(gem);
>>>> +    struct drm_device *ddev = tbo->base.dev;
>>>> +    struct xe_device *xe = to_xe_device(ddev);
>>>> +    int ret;
>>>> +
>>>> +    ret = drm_gem_ttm_mmap(gem, vma);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    if (tbo->resource->bus.is_iomem)
>>>> +        xe_device_mem_access_get(xe);
>>>
>>> Checking is_iomem outside of the usual locking is racy. One issue 
>>> here is that is_iomem can freely change at any point (like at fault 
>>> time) so when vm_close is called you can easily get an an unbalanced 
>>> RPM ref count. For example io_mem is false here but later becomes 
>>> true in bo_vm_close and then we call mem_access_put even though we 
>>> never called mem_access_get.
>>>
>>> Maybe check the possible placements of the object instead since that 
>>> is immutable?
>>>
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>>>       .free = xe_gem_object_free,
>>>>       .close = xe_gem_object_close,
>>>> -    .mmap = drm_gem_ttm_mmap,
>>>> +    .mmap = xe_drm_gem_ttm_mmap,
>>>>       .export = xe_gem_prime_export,
>>>>       .vm_ops = &xe_gem_vm_ops,
>>>>   };
