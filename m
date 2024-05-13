Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB69EC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6559F10E52F;
	Mon, 13 May 2024 08:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cioFCo2Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF7D10E52F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715589458; x=1747125458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9fVyVU9fT64lyg3AUW3fSwMGk92Zs8YnqBqq6JAqc4c=;
 b=cioFCo2QIYMT04UeAm5jYlukZ//qZPpvIo1uUXQstdV0N/dT5w+oyuIY
 fN45Tq8byPHxIadksm+xb+LzuhrZ887biB4muKsp5c1OxDriicnk5WCBn
 MkO0QekD7j/KvG+pYTtJOqYomhR02PYlSDHQ5cRF2qNyuBW7NoEPaADj6
 v1WeM8V6FhyqPP3Kw0KNhEHjUoULhk5yN9BpgbCuhFtkJvaPz3lrzUWd+
 ndTgHYlONTkhz0LjLyzh346ZHaxfjZtJ8UbFXvgFh/QoPwBmJjzFSXfj6
 PIUUK/26JG7kY9Xg0BbDkUVM5s7m3h9gHpP0IYhNLNPA3zo+OAh1W1R9k g==;
X-CSE-ConnectionGUID: D5SqSsU/S42xKQuNf0owKw==
X-CSE-MsgGUID: ic4zKyW4Tbq2+kXR+5qwGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11637599"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11637599"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:37:38 -0700
X-CSE-ConnectionGUID: QlEZA5M2QQCPXwCGWhboYQ==
X-CSE-MsgGUID: qpK3xo91QIez0aaHaV+AVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30821542"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.243])
 ([10.245.244.243])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:37:37 -0700
Message-ID: <7adf98aa-610a-4285-bd69-1f53d332fa01@intel.com>
Date: Mon, 13 May 2024 09:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] drm/xe/gt: break out gt_fini into sw vs hw state
To: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-36-matthew.auld@intel.com>
 <6334b1c4-469d-4251-a737-a5ba79b01224@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <6334b1c4-469d-4251-a737-a5ba79b01224@intel.com>
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

On 13/05/2024 08:50, Andrzej Hajda wrote:
> On 10.05.2024 20:12, Matthew Auld wrote:
>> Have a cleaner separation between hw vs sw.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 36c7b1631fa6..3f1826b783ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -57,9 +57,17 @@
>>   #include "xe_wa.h"
>>   #include "xe_wopcm.h"
>> +static void gt_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct xe_gt *gt = arg;
>> +
>> +    destroy_workqueue(gt->ordered_wq);
> 
> Do we need this wq after unbind? It seems to be used by hw stuff:
> - gt_reset
> - xe_guc_exec_queue_trigger_cleanup

Yeah, my thinking is that for stuff like exec queue we might need to 
clean it up after unplug? Plus it's just sw state. I can drop for now if 
you prefer?

> 
> Regards
> Andrzej
> 
>> +}
>> +
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>   {
>>       struct xe_gt *gt;
>> +    int err;
>>       gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
>>       if (!gt)
>> @@ -68,6 +76,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>>       gt->tile = tile;
>>       gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>> +    err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>> +    if (err)
>> +        return ERR_PTR(err);
>> +
>>       return gt;
>>   }
>> @@ -90,15 +102,9 @@ void xe_gt_sanitize(struct xe_gt *gt)
>>    */
>>   void xe_gt_remove(struct xe_gt *gt)
>>   {
>> -    xe_uc_remove(&gt->uc);
>> -}
>> -
>> -static void gt_fini(struct drm_device *drm, void *arg)
>> -{
>> -    struct xe_gt *gt = arg;
>>       int i;
>> -    destroy_workqueue(gt->ordered_wq);
>> +    xe_uc_remove(&gt->uc);
>>       for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>           xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>> @@ -567,7 +573,6 @@ int xe_gt_init(struct xe_gt *gt)
>>       if (err)
>>           return err;
>> -    return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>   }
>>   static int do_gt_reset(struct xe_gt *gt)
> 
