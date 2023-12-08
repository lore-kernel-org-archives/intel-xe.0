Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C5C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 09:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795B510E9E9;
	Fri,  8 Dec 2023 09:27:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FF110E9E9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702027670; x=1733563670;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xy0EJeAc0L32A9yHApgx8eTEE/oODFkzeTMnlLDRtVo=;
 b=f+qF7CTih09fAuFyU4CYV+eReIZk/pcU4RSSH1tuTZvTlzQnF9Zl3HDB
 zOof8o5ZYsXv2NaiQPjGZNlscU7zJyZqIFVlbadpzpJadEoBs+cMsAb4Z
 o4l6pO8zsfdXEkWFt+BhF3j9k8JUb3DpUolyrWFT571nXUg8s5Qen0o1Z
 lHmDeSZaxT3YEMU3qfxHu4p/8mjUHpHOWLW9anMMoK/vteE9TjeIkV9Qt
 4hipdpln/xjl9/4QGabUaJmvjg6QesKRcQw6PIl+LGe3s/W+QAlLDkfGV
 v3CXOmCUI2VqalWLdV3UJCRBULVCAU2eicc0kvsNv8TBS45RpiZkoe37s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1462569"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1462569"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 01:27:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="862798998"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="862798998"
Received: from asiderx-mobl.ger.corp.intel.com (HELO [10.252.10.239])
 ([10.252.10.239])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 01:27:47 -0800
Message-ID: <ece11e07-576b-46be-a49e-24d5257fc3c4@intel.com>
Date: Fri, 8 Dec 2023 09:27:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/dgfx: Block rpm for active mmap mappings
To: "Nilawar, Badal" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
 <20231206133421.3295163-2-badal.nilawar@intel.com>
 <c3e2e04f-7cb3-4d68-b19a-5c7271a0c626@intel.com>
 <23b21834-61e1-4926-9e1b-8b233771e1b5@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <23b21834-61e1-4926-9e1b-8b233771e1b5@intel.com>
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

On 08/12/2023 07:17, Nilawar, Badal wrote:
> 
> 
> On 07-12-2023 16:56, Matthew Auld wrote:
>> On 06/12/2023 13:34, Badal Nilawar wrote:
>>> Block rpm for discrete cards when mmap mappings are active.
>>> Ideally rpm wake ref should be taken in vm_open call and put in vm_close
>>> call but it is seen that vm_open doesn't get called for xe_gem_vm_ops.
>>> Therefore rpm wake ref is being get in xe_drm_gem_ttm_mmap and put
>>> in vm_close.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 35 +++++++++++++++++++++++++++++++++--
>>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 72dc4a4eed4e..5741948a2a51 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -15,6 +15,7 @@
>>>   #include <drm/ttm/ttm_tt.h>
>>>   #include <drm/xe_drm.h>
>>> +#include "i915_drv.h"
>>
>> Do we need this?
> This is needed in patch 2 I will remove from this patch.
>>
>>>   #include "xe_device.h"
>>>   #include "xe_dma_buf.h"
>>>   #include "xe_drm_client.h"
>>> @@ -1158,17 +1159,47 @@ static vm_fault_t xe_gem_fault(struct 
>>> vm_fault *vmf)
>>>       return ret;
>>>   }
>>> +static void xe_ttm_bo_vm_close(struct vm_area_struct *vma)
>>> +{
>>> +    struct ttm_buffer_object *tbo = vma->vm_private_data;
>>> +    struct drm_device *ddev = tbo->base.dev;
>>> +    struct xe_device *xe = to_xe_device(ddev);
>>> +
>>> +    ttm_bo_vm_close(vma);
>>> +
>>> +    if (tbo->resource->bus.is_iomem)
>>> +        xe_device_mem_access_put(xe);
>>> +}
>>> +
>>>   static const struct vm_operations_struct xe_gem_vm_ops = {
>>>       .fault = xe_gem_fault,
>>>       .open = ttm_bo_vm_open,
>>> -    .close = ttm_bo_vm_close,
>>> +    .close = xe_ttm_bo_vm_close,
>>>       .access = ttm_bo_vm_access
>>>   };
>>> +int xe_drm_gem_ttm_mmap(struct drm_gem_object *gem,
>>> +            struct vm_area_struct *vma)
>>> +{
>>> +    struct ttm_buffer_object *tbo = drm_gem_ttm_of_gem(gem);
>>> +    struct drm_device *ddev = tbo->base.dev;
>>> +    struct xe_device *xe = to_xe_device(ddev);
>>> +    int ret;
>>> +
>>> +    ret = drm_gem_ttm_mmap(gem, vma);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    if (tbo->resource->bus.is_iomem)
>>> +        xe_device_mem_access_get(xe);
>>
>> Checking is_iomem outside of the usual locking is racy. One issue here 
>> is that is_iomem can freely change at any point (like at fault time) 
>> so when vm_close is called you can easily get an an unbalanced RPM ref 
>> count. For example io_mem is false here but later becomes true in 
>> bo_vm_close and then we call mem_access_put even though we never 
>> called mem_access_get.
>>
>> Maybe check the possible placements of the object instead since that 
>> is immutable?
> Sure will check bo placements
>      struct ttm_place *place = &(bo->placements[0]);
>      if (mem_type_is_vram(place->mem_type))

Yeah, something like that. Although we need to consider all the 
placements. Maybe just bo->flags & XE_BO_CREATE_VRAM_MASK, which would 
indicate that it can potentially be placed in VRAM at some point.

> Or can we check tbo resource memtype
>      if (mem_type_is_vram(tbo->resource->mem_type))

We can't touch tbo->resource (or any state within it like is_iomem) here 
without the proper locking. For example it could be NULL or various 
other scary things if we are unlucky. But even with the lock it can 
change at any point after you drop it.

> 
> Regards,
> Badal
>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>>       .free = xe_gem_object_free,
>>>       .close = xe_gem_object_close,
>>> -    .mmap = drm_gem_ttm_mmap,
>>> +    .mmap = xe_drm_gem_ttm_mmap,
>>>       .export = xe_gem_prime_export,
>>>       .vm_ops = &xe_gem_vm_ops,
>>>   };
