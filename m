Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF3C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 09:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15EC10E554;
	Mon, 13 May 2024 09:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVtGDbaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1B310E560
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715591993; x=1747127993;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rBX6mkCI2wHNtQJlkpWBNdiV5pv46+IxEDKVx1B0zr4=;
 b=eVtGDbaYFtN+GrGpkRNSACzIA8l2xB4oWt9z+zXvSU/AIDaNFaxItVcj
 vVFjnfhMHkJl5j971K4yrpT86UFHROL1aecs2NWWWMcBc9XObaSwj7SGP
 BVygHilUZ+9QlVkprpgdEh+0MG61teQa1SNp/nJmNGQ3g4WzaG+QTNGay
 W01IOB6XysiPh2tB1sLAFiHy5vuirJ++MANz1bSiUBDkDBX9bcM7WkA+F
 lYVPZt65t8e4Zb4fpWzZdoHk7WMHmnhdGoRyxcLlz3d5gKlj1OfigmRi+
 8gHp/ZWoWAUufmmqRtMz8Jv3yD0zIO8uDKibRmFwaqmxMcdfzRxrMqnAp w==;
X-CSE-ConnectionGUID: 87ndFfoBTDa/9Z5DoFUuMA==
X-CSE-MsgGUID: 7DLiU2BGQuGIyNKAwAgSKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11338824"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11338824"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:19:52 -0700
X-CSE-ConnectionGUID: eKyoLdV5R4yKk+qlPaSqLQ==
X-CSE-MsgGUID: C7zPkz31TzekpoS+vcHsiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34789093"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:19:51 -0700
Message-ID: <d6d907b9-4606-4a55-b6d9-f71dbe6d93ca@intel.com>
Date: Mon, 13 May 2024 11:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] drm/xe/gt: break out gt_fini into sw vs hw state
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-36-matthew.auld@intel.com>
 <6334b1c4-469d-4251-a737-a5ba79b01224@intel.com>
 <7adf98aa-610a-4285-bd69-1f53d332fa01@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7adf98aa-610a-4285-bd69-1f53d332fa01@intel.com>
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



On 13.05.2024 10:37, Matthew Auld wrote:
> On 13/05/2024 08:50, Andrzej Hajda wrote:
>> On 10.05.2024 20:12, Matthew Auld wrote:
>>> Have a cleaner separation between hw vs sw.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt.c | 21 +++++++++++++--------
>>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 36c7b1631fa6..3f1826b783ad 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -57,9 +57,17 @@
>>>   #include "xe_wa.h"
>>>   #include "xe_wopcm.h"
>>> +static void gt_fini(struct drm_device *drm, void *arg)
>>> +{
>>> +    struct xe_gt *gt = arg;
>>> +
>>> +    destroy_workqueue(gt->ordered_wq);
>>
>> Do we need this wq after unbind? It seems to be used by hw stuff:
>> - gt_reset
>> - xe_guc_exec_queue_trigger_cleanup
>
> Yeah, my thinking is that for stuff like exec queue we might need to 
> clean it up after unplug? Plus it's just sw state. I can drop for now 
> if you prefer?

OK, no strong feelings.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>
>>
>> Regards
>> Andrzej
>>
>>> +}
>>> +
>>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>>   {
>>>       struct xe_gt *gt;
>>> +    int err;
>>>       gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), 
>>> GFP_KERNEL);
>>>       if (!gt)
>>> @@ -68,6 +76,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>>       gt->tile = tile;
>>>       gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>>> +    err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>> +    if (err)
>>> +        return ERR_PTR(err);
>>> +
>>>       return gt;
>>>   }
>>> @@ -90,15 +102,9 @@ void xe_gt_sanitize(struct xe_gt *gt)
>>>    */
>>>   void xe_gt_remove(struct xe_gt *gt)
>>>   {
>>> -    xe_uc_remove(&gt->uc);
>>> -}
>>> -
>>> -static void gt_fini(struct drm_device *drm, void *arg)
>>> -{
>>> -    struct xe_gt *gt = arg;
>>>       int i;
>>> -    destroy_workqueue(gt->ordered_wq);
>>> +    xe_uc_remove(&gt->uc);
>>>       for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>>           xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>>> @@ -567,7 +573,6 @@ int xe_gt_init(struct xe_gt *gt)
>>>       if (err)
>>>           return err;
>>> -    return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>>   }
>>>   static int do_gt_reset(struct xe_gt *gt)
>>

