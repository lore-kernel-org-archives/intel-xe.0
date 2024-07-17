Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3244C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5634110EAEF;
	Wed, 17 Jul 2024 13:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEXLwBTK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18710EAEF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221687; x=1752757687;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XtDHx4gbpDSGS2d2IfWZzfW7LZCHGPJO5LuslF4KhT4=;
 b=GEXLwBTKUs1TCwZHhumgampXyXQsdHOaYzVl8S+Dr2YbX11yFHfeDytj
 ygKlsGOP3f4NVuE+7vixixeNj10ZR7MIvfEfTj9WlBnTe7OcGgHi5TmqM
 RlVSuGEHT1RWUUrzRqNJEQHC/dpwrbTS0+E3Ur4yj+AXlDl1uCpwxs4+H
 fgIWlDibXvjVPWeu7RoL8vzWp+O6ADI2YeV3qveeLo+MNqnCWdj4gfyUH
 ufKgd9OtstHMyItX5D3S7xdM3kaYb/5mPW3joVXWHMCI7uhWQsgqYU+UG
 a3hq1ilUcPjBSB41F9dbxKG9KrowKf283ESQAWKr/RLeKSZNNVAQjbDBG A==;
X-CSE-ConnectionGUID: LJIHimPlRD+Cusr8qJ4ZWg==
X-CSE-MsgGUID: /hKzYoieT+aqzQyrPjlQ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18831927"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18831927"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:06 -0700
X-CSE-ConnectionGUID: DY8FMJRNRtiv0b659S523Q==
X-CSE-MsgGUID: tIYZVPJ+QO68ABnulATAwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55531907"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:05 -0700
Message-ID: <3ba40443-12cf-444a-b2b1-1d858f3e8294@linux.intel.com>
Date: Wed, 17 Jul 2024 15:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pm: Add trace for pm functions
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240717112908.14394-1-nirmoy.das@intel.com>
 <Zpe7ydKbfUkBpSGG@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zpe7ydKbfUkBpSGG@DUT025-TGLU.fm.intel.com>
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


On 7/17/2024 2:40 PM, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 01:29:08PM +0200, Nirmoy Das wrote:
>> Add trace for xe pm function for better debuggability.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> Example Output:
>>            <idle>-0       [004] d.h2.  3821.138392: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
>>     kworker/u32:0-53314   [001] .....  3821.138411: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
>>            <idle>-0       [004] d.h2.  3821.138439: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
>>     kworker/u32:0-53314   [001] .....  3821.138443: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
>>       kworker/0:1-9       [000] .....  3821.138474: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
>>       kworker/0:1-9       [000] .....  3821.138495: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
>>       kworker/0:0-21730   [000] .....  3821.138503: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
>>       kworker/0:0-21730   [000] .....  3821.138540: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
> Looks very helpful, I didn't know exactly how to get caller function in
> output like this, cool.
>
>>     kworker/u33:0-25711   [002] .....  3821.138601: xe_vm_free: dev=0000:00:02.0, vm=ffff88811185a000, asid=0x00004
>>       kworker/1:6-21907   [001] .....  3822.308942: xe_pm_runtime_suspend: dev=0000:00:02.0 caller_function=xe_pci_runtime_suspend+0x3f/0x120 [xe]
>>       kworker/1:6-21907   [001] .....  3822.309550: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
>>
>>   drivers/gpu/drm/xe/xe_pm.c    |  7 ++++++
>>   drivers/gpu/drm/xe/xe_trace.h | 47 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index de3b5df65e48..a38452ccf033 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_guc.h"
>>   #include "xe_irq.h"
>>   #include "xe_pcode.h"
>> +#include "xe_trace.h"
>>   #include "xe_wa.h"
>>   
>>   /**
>> @@ -87,6 +88,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>   	int err;
>>   
>>   	drm_dbg(&xe->drm, "Suspending device\n");
>> +	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>>   
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_suspend_prepare(gt);
>> @@ -131,6 +133,7 @@ int xe_pm_resume(struct xe_device *xe)
>>   	int err;
>>   
>>   	drm_dbg(&xe->drm, "Resuming device\n");
>> +	trace_xe_pm_resume(xe, __builtin_return_address(0));
>>   
>>   	for_each_tile(tile, xe, id)
>>   		xe_wa_apply_tile_workarounds(tile);
>> @@ -326,6 +329,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	u8 id;
>>   	int err = 0;
>>   
>> +	trace_xe_pm_runtime_suspend(xe, __builtin_return_address(0));
>>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>   	xe_pm_write_callback_task(xe, current);
>>   
>> @@ -399,6 +403,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	u8 id;
>>   	int err = 0;
>>   
>> +	trace_xe_pm_runtime_resume(xe, __builtin_return_address(0));
>>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>   	xe_pm_write_callback_task(xe, current);
>>   
>> @@ -463,6 +468,7 @@ static void pm_runtime_lockdep_prime(void)
>>    */
>>   void xe_pm_runtime_get(struct xe_device *xe)
>>   {
>> +	trace_xe_pm_runtime_get(xe, __builtin_return_address(0));
>>   	pm_runtime_get_noresume(xe->drm.dev);
>>   
>>   	if (xe_pm_read_callback_task(xe) == current)
>> @@ -478,6 +484,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
>>    */
>>   void xe_pm_runtime_put(struct xe_device *xe)
>>   {
>> +	trace_xe_pm_runtime_put(xe, __builtin_return_address(0));
>>   	if (xe_pm_read_callback_task(xe) == current) {
>>   		pm_runtime_put_noidle(xe->drm.dev);
>>   	} else {
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> index baba14fb1e32..73fe28f92d48 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -369,6 +369,53 @@ TRACE_EVENT(xe_reg_rw,
>>   		  (u32)(__entry->val >> 32))
>>   );
>>   
>> +DECLARE_EVENT_CLASS(xe_pm_runtime,
>> +		    TP_PROTO(struct xe_device *xe, void *caller),
>> +		    TP_ARGS(xe, caller),
>> +
>> +		    TP_STRUCT__entry(
>> +			     __string(dev, __dev_name_xe(xe))
>> +			     __field(void *, caller)
>> +			     ),
>> +
>> +		    TP_fast_assign(
>> +			   __assign_str(dev);
>> +			   __entry->caller = caller;
> Does it work drop the 'void *caller' argument and do this?
>
> __entry->caller = __builtin_return_address(0);
>
> Unsure if that will produce the correct output though but worth checking
> on.

I tried that 1st but  it didn't go well:

xe_exec_store-86116   [001] .....  9013.365684: xe_pm_runtime_put: 
dev=0000:00:02.0 caller_function=xe_pm_runtime_put+0x1b1/0x300 [xe]
xe_exec_store-86116   [001] .....  9013.365745: xe_pm_runtime_get_ioctl: 
dev=0000:00:02.0 caller_function=xe_pm_runtime_get_ioctl+0x194/0x240 [xe]

>
>> +			   ),
>> +
>> +		    TP_printk("dev=%s caller_function=%pS", __get_str(dev), __entry->caller)
>> +);
>> +
>> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get,
>> +		TP_PROTO(struct xe_device *xe, void *caller),
>> +		TP_ARGS(xe, caller)
>> +);
>> +
>> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_put,
>> +	     TP_PROTO(struct xe_device *xe, void *caller),
>> +	     TP_ARGS(xe, caller)
> Nit the alignment looks off here.
>
>> +);
>> +
>> +DEFINE_EVENT(xe_pm_runtime, xe_pm_resume,
>> +		TP_PROTO(struct xe_device *xe, void *caller),
>> +		TP_ARGS(xe, caller)
>> +);
>> +
>> +DEFINE_EVENT(xe_pm_runtime, xe_pm_suspend,
>> +		TP_PROTO(struct xe_device *xe, void *caller),
>> +		TP_ARGS(xe, caller)
>> +);
>> +
>> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_resume,
>> +		TP_PROTO(struct xe_device *xe, void *caller),
>> +		TP_ARGS(xe, caller)
>> +);
>> +
>> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_suspend,
>> +	     TP_PROTO(struct xe_device *xe, void *caller),
>> +	     TP_ARGS(xe, caller)
> Nit the alignment looks off here.
>
> Also a few other look off in patchworks too, double check on all of
> these.


I accidentally used vim's auto indent on  portion of code and even 
ignored checkpatch's warning thinking

it must be because of existing tracing code. I will resend soon.


Regards,

Nirmoy

> Matt
>
>> +);
>> +
>>   #endif
>>   
>>   /* This part must be outside protection */
>> -- 
>> 2.42.0
>>
