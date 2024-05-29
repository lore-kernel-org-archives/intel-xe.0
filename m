Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8808DC25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 08:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC8310E05E;
	Wed, 29 May 2024 08:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEYyeBm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E9910E05E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 08:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716971196; x=1748507196;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XlKKImE2NUgmnuFIKpFOIGB0DBAgVNaC3lCOH8nCp7I=;
 b=IEYyeBm52WSDUllv/NUtahN3h8w8hLLOheAd24TLrGJsthy3O6QUWCF/
 ClJOdKca6CqWCQ1bLE9rJOf4wIZ9ZJRBhzVZRy2yeM7xTmAhjRti3Sifv
 3p1OGXW1y741X29r/Dv6DoRN9Owwzfkp5F2hssUqg3wQ0LAgYIWyIdW9+
 G5UAiaDRmAqo8MExEJUZNYv4dM3a+hnSBzqwoaGz/PJS+XOOB+d43Ojjo
 3b14FknsmPyTqHFRTq0LGkLp0POTUIu6JkNoRbAfFcKr5tMIThHq3oMjM
 BBpMVJRTsAffXMOoNbfpSTDtdf5+jeLxZUkDBpKQb61TQ/7Ip9g3IvcuH w==;
X-CSE-ConnectionGUID: 7mlRXBKgSjCEPPM5uxjZ2w==
X-CSE-MsgGUID: 3KRZNNZ+TrOcd8dlfAt9mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23969746"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="23969746"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:26:26 -0700
X-CSE-ConnectionGUID: BMFXhqezSnyfG1EDTErO1w==
X-CSE-MsgGUID: zlj51l5dR2OMR/iJFy/Ieg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="66560703"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.45])
 ([10.245.245.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:26:25 -0700
Message-ID: <001d2e4b-e9d2-422f-9f4d-dfe1c7b8bbaa@intel.com>
Date: Wed, 29 May 2024 09:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe: make gt_remove use devm"
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
 <7a949a77-88c2-47e5-aa19-773965181bc0@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <7a949a77-88c2-47e5-aa19-773965181bc0@intel.com>
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

Hi,

On 28/05/2024 19:27, Daniele Ceraolo Spurio wrote:
> 
> 
> On 5/28/2024 11:23 AM, Daniele Ceraolo Spurio wrote:
>> The gt_remove function was explictly added as part of the remove flow
>> instead of using drmm/devm automatic cleanup due to it being illegal
>> to remove a component after the driver has been detached from the pci
>> device; the GSC proxy component is removed as part of gt_remove, so we
>> need to do it in the pci cleanup flow. The function already has a
>> comment above it to explain this.
>>
>> Note that the change to use the devm also caused an invalid pointer
>> deref in the gsc_proxy unbind function, but I didn't bother to debug
>> which pointer was bad since we shouldn't be calling the unbind that
>> late anyway and this revert fixes it.
> 
> Here is the bad pointer deref log in case anyone wants to have a better 
> look:
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/shard-lnl-8/igt@xe_module_load@reload.html

I also ran into this. If we remove the explicit pci_set_drvdata(pdev, 
NULL) in our pci remove callback, and rather let the core driver do it 
for us, it seems to fix the above. But then we trigger:

<4> [69.885925] WARNING: CPU: 2 PID: 1441 at drivers/base/devres.c:690 
devres_release_group+0x103/0x120

Which I am not too sure about.

Anyway, if it is indeed a no-go to use devm here,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> Daniele
> 
>>
>> Both issue were not seen in CI because the GSC loading is temporarily
>> disabled due to a critical bug, which means we're not binding the
>> component.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_gt.c     | 16 +++++++++-------
>>   drivers/gpu/drm/xe/xe_gt.h     |  1 +
>>   3 files changed, 30 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 85c1b0c406a6..4c44f23e58ea 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -549,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
>>       struct xe_tile *tile;
>>       struct xe_gt *gt;
>>       int err;
>> +    u8 last_gt;
>>       u8 id;
>>       xe_pat_init_early(xe);
>> @@ -647,16 +648,18 @@ int xe_device_probe(struct xe_device *xe)
>>           goto err_irq_shutdown;
>>       for_each_gt(gt, xe, id) {
>> +        last_gt = id;
>> +
>>           err = xe_gt_init(gt);
>>           if (err)
>> -            goto err_irq_shutdown;
>> +            goto err_fini_gt;
>>       }
>>       xe_heci_gsc_init(xe);
>>       err = xe_display_init(xe);
>>       if (err)
>> -        goto err_irq_shutdown;
>> +        goto err_fini_gt;
>>       err = drm_dev_register(&xe->drm, 0);
>>       if (err)
>> @@ -672,6 +675,15 @@ int xe_device_probe(struct xe_device *xe)
>>   err_fini_display:
>>       xe_display_driver_remove(xe);
>> +
>> +err_fini_gt:
>> +    for_each_gt(gt, xe, id) {
>> +        if (id < last_gt)
>> +            xe_gt_remove(gt);
>> +        else
>> +            break;
>> +    }
>> +
>>   err_irq_shutdown:
>>       xe_irq_shutdown(xe);
>>   err:
>> @@ -689,12 +701,18 @@ static void xe_device_remove_display(struct 
>> xe_device *xe)
>>   void xe_device_remove(struct xe_device *xe)
>>   {
>> +    struct xe_gt *gt;
>> +    u8 id;
>> +
>>       xe_device_remove_display(xe);
>>       xe_display_fini(xe);
>>       xe_heci_gsc_fini(xe);
>> +    for_each_gt(gt, xe, id)
>> +        xe_gt_remove(gt);
>> +
>>       xe_irq_shutdown(xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 6f4b59a6e710..98c2228b51d0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -93,14 +93,16 @@ void xe_gt_sanitize(struct xe_gt *gt)
>>       gt->uc.guc.submission_state.enabled = false;
>>   }
>> -/*
>> - * Clean up the GT structures before driver removal. This function 
>> should only
>> - * act on objects/structures that must be cleaned before the driver 
>> removal
>> - * callback is complete and therefore can't be deferred to a drmm 
>> action.
>> +/**
>> + * xe_gt_remove() - Clean up the GT structures before driver removal
>> + * @gt: the GT object
>> + *
>> + * This function should only act on objects/structures that must be 
>> cleaned
>> + * before the driver removal callback is complete and therefore can't be
>> + * deferred to a drmm action.
>>    */
>> -static void gt_remove(void *arg)
>> +void xe_gt_remove(struct xe_gt *gt)
>>   {
>> -    struct xe_gt *gt = arg;
>>       int i;
>>       xe_uc_remove(&gt->uc);
>> @@ -566,7 +568,7 @@ int xe_gt_init(struct xe_gt *gt)
>>       xe_gt_record_user_engines(gt);
>> -    return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_remove, 
>> gt);
>> +    return 0;
>>   }
>>   void xe_gt_record_user_engines(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index d0747edfe020..9073ac68a777 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>> +void xe_gt_remove(struct xe_gt *gt);
>>   /**
>>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines 
>> and return the
> 
