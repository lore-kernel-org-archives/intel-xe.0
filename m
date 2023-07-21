Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619D6EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 11:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC0010E659;
	Fri, 21 Jul 2023 11:17:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAD010E658
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689938271; x=1721474271;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DgBwTKW4v62aC59WpJFOrC0XwYmrwB5E3PwKQ9pV2eU=;
 b=ebD7yf4e6AfcsCivV3bbuczGRh3hjfHvHJrehpKPpXaZsHEgZVsFJC56
 PsTo49mQd5FF7z1ABisPdAOVbMF88xWvpG+MzjFJGzWMx04R9Vrdf2i8h
 FR40032bXbDzasHOZhMhkqopYlOOqhG7kJ2fQaCgPSlXicQRqxzI1wcX7
 DvSPSdcMKGOi+OUpSACgRUv48XE0po9j88kFzcnQymaVl0rGpL8LrmmQA
 Tit2UDsp+gWKW4p8/KmhNblMHfLZKHylpG5PjUmSO73Z/GrKzIwG27OF6
 jYp+uup1k50DOKCT0y0d6Wnc7EFKVrpkWsYPcMFzRGHki7crY64jT6+74 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346594643"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="346594643"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971411309"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="971411309"
Received: from rtrejoca-mobl1.ger.corp.intel.com (HELO [10.252.30.22])
 ([10.252.30.22])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:17:49 -0700
Message-ID: <37cb1b64-95ff-2f0d-f802-27e79fc55574@intel.com>
Date: Fri, 21 Jul 2023 12:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
 <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com> <ZLkiAmNuvjdUi+09@intel.com>
 <adbd55cd-b75b-6b65-7c10-500bb1992850@intel.com> <ZLlV8lFWhwdl9hA7@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZLlV8lFWhwdl9hA7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On 20/07/2023 16:42, Rodrigo Vivi wrote:
> On Thu, Jul 20, 2023 at 01:38:18PM +0100, Matthew Auld wrote:
>> On 20/07/2023 13:01, Rodrigo Vivi wrote:
>>> On Thu, Jul 20, 2023 at 10:11:00AM +0100, Matthew Auld wrote:
>>>> On 19/07/2023 20:27, Rodrigo Vivi wrote:
>>>>> xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.
>>>>>
>>>>> The lock was created to protect the gt irq handlers, and not
>>>>> the irq.enabled. Since suspend/resume and other places touching
>>>>> irq.enabled are already serialized they don't need protection.
>>>>> (see other irq.enabled accesses).
>>>>>
>>>>> Then with this spin lock around xe_irq_reset, we will end up
>>>>> calling the intel_display_power_is_enabled() function, and
>>>>> that needs a mutex lock. Hence causing the undesired
>>>>> "[ BUG: Invalid wait context ]"
>>>>>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_irq.c | 5 -----
>>>>>     1 file changed, 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>>> index eae190cb0969..df01af780a57 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>>> @@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
>>>>>     void xe_irq_suspend(struct xe_device *xe)
>>>>>     {
>>>>> -	spin_lock_irq(&xe->irq.lock);
>>>>>     	xe->irq.enabled = false;
>>>>>     	xe_irq_reset(xe);
>>>>> -	spin_unlock_irq(&xe->irq.lock);
>>>>
>>>> Do we not need something like:
>>>>
>>>> spin_lock_irq(&xe->irq.lock);
>>>> xe->irq.enabled = false; /* no new irqs */
>>>> spin_unlock_irq(&xe->irq.lock);
>>>>
>>>> synchronize_irq(...); /* flush irqs */
>>>> xe_irq_reset(); /* turn off irqs */
>>>> ....
>>>>
>>>> And then at the start of the irq handler:
>>>>
>>>> spin_lock_irq(&xe->irq.lock);
>>>> if (!xe->irq.enabled) {
>>>>       spin_unlock_irq(&xe->irq.lock);
>>>>       return ....;
>>>> }
>>>>
>>>> Or did something happen prior to xe_irq_suspend() to ensure proper
>>>> serialisation with irq and the above steps are not really needed?
>>>
>>> the suspend and resume calls should be serialized by itself, no?!
>>
>> Is it not possible for IRQs to still be firing or potentially be in-progress
>> here as we are preparing to suspend?
> 
> yes, it is. We are letting the rpm to run with irq enabled otherwise
> we will face the same invalid wait bug that this patch is trying to solve.
> 
> But I don't believe the right way is to use the lock to protect the irq.enabled.
> 
> Taking a look around I believe that what we are missing is the
> synchronize_irq() call right after the reset. So we ensure that all the
> racy handlers were properly processed before we allow the suspend.
> 
> So I believe we need something like i915 that would be:
> 
> xe_irq_suspend()
> {
> 	xe_irq_reset(xe);
> 	xe->irq.enable = false;
> 	synchronize_irq(pdev->irq);
> }
> 
> xe_irq_resume()
> {
> 	xe->irq.enabled = true;
> 	xe_irq_reset(xe);
> 	xe_irq_postinstall(xe);
> 
> 	for_each_gt(gt, xe, id)
> 			xe_irq_enable_hwe(gt);
> }

Ok, but tbh I'm not completely sure what is going on with irq.enabled. 
AFAICT it looks to also be exposed into i915/display with 
intel_irqs_enabled() and that seems to have various callers. Are they 
not holding the lock? Also the write here is to shared memory so without 
the lock it's unclear what is going on here wrt barriers and unmarked 
accesses (missing READ_ONCE/WRITE_ONCE?). I don't want to block you here 
since "Invalid wait context" is breaking CI, so I guess just go with the 
simplest thing for now.

> 
>>
>>>
>>> no other place touching or inspecting irq.enable uses this lock
>>> anyway, since it was created to serialize the gt_handler.
>>>
>>>>
>>>>>     }
>>>>>     void xe_irq_resume(struct xe_device *xe)
>>>>> @@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
>>>>>     	struct xe_gt *gt;
>>>>>     	int id;
>>>>> -	spin_lock_irq(&xe->irq.lock);
>>>>>     	xe->irq.enabled = true;
>>>>>     	xe_irq_reset(xe);
>>>>>     	xe_irq_postinstall(xe);
>>>>>     	for_each_gt(gt, xe, id)
>>>>>     		xe_irq_enable_hwe(gt);
>>>>> -
>>>>> -	spin_unlock_irq(&xe->irq.lock);
>>>>>     }
