Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5B4C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 09:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DA810EA31;
	Wed, 17 Jul 2024 09:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3K9ye+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581C810EA2F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721207529; x=1752743529;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+Cw4iYuwwinlwRkBG10786ufLOT1bf+ZVJRkHCHbZ+A=;
 b=A3K9ye+H+gj5sEfJT6yLjTazMHeuWjOpiS5opZSxU5Ia8Rap1W6R7kuP
 KLg8kFwskjaITpxoR/phK/WZaK9Fb8eGzyaX9dxzaXd2LvjYmL+81ODQ6
 l5NHL6mPgf7304LLclsTLbgtFJ9aVpi7XX71vrtiHIzq88avGq6KxUsyA
 Ftg6WL5wc6GdbDHPvuhYFdXnbmCUEM6SGa2D89pNyH+8mvxT/6FhdtwYd
 2TjZcGpVuAmYnbCqupWVojgiBFZ0Jy65wYPctxj84IBIMXtypMZVDBeN4
 iW1zZyqgU4HveLD38K3c1kXL5pjtsQ3AbaFjGBFylqyYnbxg5vkvQWQ5I A==;
X-CSE-ConnectionGUID: CQ4xskfpSfa7vjoh+zJUtA==
X-CSE-MsgGUID: h8/j/i7ZSeWfdZFyC0nDng==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29851247"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29851247"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 02:12:04 -0700
X-CSE-ConnectionGUID: aL3tBhkuQB+dpM1QlcF8Og==
X-CSE-MsgGUID: ehTxcN4LS3i250crFxOmBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50931573"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 02:12:04 -0700
Message-ID: <b54c2adf-baa5-4b7d-a1be-f11ef0424af5@linux.intel.com>
Date: Wed, 17 Jul 2024 11:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Keep the device awake for TLB inval
To: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
References: <20240716133855.12015-1-nirmoy.das@intel.com>
 <ZpaVlInvZh0XRUMH@DUT025-TGLU.fm.intel.com>
 <a53141c6-7dbc-4558-b134-01dce242e704@linux.intel.com>
 <ZpagjxFtmdhsIka0@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZpagjxFtmdhsIka0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 7/16/2024 6:32 PM, Matthew Brost wrote:
> On Tue, Jul 16, 2024 at 06:25:01PM +0200, Nirmoy Das wrote:
>>     Hi Matt,
>>
> Outlook reply? Prefer a Linux email client for the list for proper threading.


Using Thunderbird on Windows which works most of time but I think 
sometimes it adds HTML when

pasting text.


>
>>     On 7/16/2024 5:45 PM, Matthew Brost wrote:
>>
>> On Tue, Jul 16, 2024 at 03:38:55PM +0200, Nirmoy Das wrote:
>>
>> GT can suspend while TLB invalidation is happening in the background.
>> This would cause a TLB timeout when that happens. Keep the device awake
>> when using fence which doesn't wait for the TLB invalidation to finish.
>>
>> Cc: Matthew Brost [1]<matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das [2]<nirmoy.das@intel.com>
>>
>> + Rodrigo our local PM expert.
>>
>>
>> ---
>> Adding strace here for more information:
>>
>> xe_pm-18095   [001] .....  3493.481048: xe_vma_unbind: dev=0000:00:02.0, vma=fff
>> f8881c3062b00, asid=0x0000f, start=0x0000001a0000, end=0x0000001a1fff, userptr=0
>> x000000000000,
>> xe_pm-18095   [001] .....  3493.481063: xe_vm_cpu_bind: dev=0000:00:02.0, vm=fff
>> f88812a00d000, asid=0x0000f
>> xe_pm-18095   [001] .....  3493.481093: xe_gt_tlb_invalidation_fence_create: dev
>> =0000:00:02.0, fence=ffff88811bf3d000, seqno=0
>> xe_pm-18095   [001] .....  3493.481095: xe_gt_tlb_invalidation_fence_work_func:
>> dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
>> xe_pm-18095   [001] .....  3493.481097: xe_gt_tlb_TL_fence_send: dev=0000:00:02.
>> 0, fence=ffff88811bf3d000, seqno=93
>> xe_pm-18095   [001] d..1.  3493.481097: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x7000, len=8, tail=44, head=36
>> kworker/1:2-17900   [001] .....  3493.481302: xe_exec_queue_stop: dev=0000:00:02
>> .0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
>> kworker/1:2-17900   [001] .....  3493.481303: xe_exec_queue_stop: dev=0000:00:02
>> .0, 3:0x1, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4
>> kworker/1:2-17900   [001] .....  3493.481305: xe_exec_queue_stop: dev=0000:00:02
>> .0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x0, flags=0x0
>> xe_pm-18095   [001] .....  3493.756294: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3003, len=5, tail=5, head=0
>> xe_pm-18095   [001] d..1.  3493.756470: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3003, len=5, tail=10, head=5
>> kworker/u32:1-17912   [006] d..1.  3493.756535: xe_guc_ctb_g2h: G2H CTB: dev=000
>> 0:00:02.0, gt0: action=0x0, len=2, tail=2, head=2
>> xe_pm-18095   [001] .....  3493.756557: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3003, len=5, tail=15, head=10
>> xe_pm-18095   [001] .....  3493.756559: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3004, len=3, tail=18, head=10
>> kworker/1:2-17900   [001] d..1.  3497.951783: xe_gt_tlb_invalidation_fence_timeo
>> ut: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93
>>
>>
>> How do you know from this the device is suspending? I can't tell that is
>> happening. I do think this raises a good point that suspend / resume
>> should be added to ftrace as that is useful information.
>>
>>     xe_exec_queue_stop() was coming from xe runtime suspend code. I am
>>     pretty sure about it but I could double check it.
>>
> That would be a good idea. Any chance you want to try adding some useful
> ftrace points to get full visibility to suspend / resume flows?


Yes, I can look into that.


>   
>>
>>   drivers/gpu/drm/xe/xe_vm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index b6932cc98ff9..241b7ea00d5f 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2700,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>          struct dma_fence *fence;
>>          int err;
>>
>> +       xe_pm_runtime_get(vm->xe);
>>
>> While I agree the device shouldn't enter suspend while TLB invalidations
>> are inflight I don't think this patch will help with this.
>>
>> This code path is called in various places in where we should have PM
>> ref (VM bind IOCTL, exec IOCTL for rebind, or preempt rebind worker). If
>> we don't have PM ref when this function is called, that is a bug that
>> needs to be fixed at the outer most layers. Beyond that, GT TLB
>> invalidations are async and pipelined (e.g. they can be sent after this
>> function returns and completion can returns sometime later).
>>
>> With this, I believe correct place to fix this is either in the CT layer
>> or perhaps hook into GT TLB invalidation fence (Arming of fence
>> takes a ref, signaling of fence drops a ref).
>>
>>     I was planning to send something more simple:
>>
>>     send_tlb_invalidation() -->   xe_pm_runtime_get(xe);
>>
>>     xe_gt_tlb_fence_timeout() --> xe_pm_runtime_put(xe);
>>
>>     __invalidation_fence_signal() --> xe_pm_runtime_put(xe);
> The problem with this fences are currently used everywhere in the
> current code base so we'd have an imbalance. This changes that [2] but
> even with that __invalidation_fence_signal wouldn't be used in same
> places. Thus building it directly into the fence would make sense to me.
> Their are concerns about fences signaling in IRQ contexts though. I've
> pinged Rodrigo about this off the list, let's see what he thinks.


Ok, Waiting for Rodrigo's input.


Nirmoy

>
> Matt
>
> [2] https://patchwork.freedesktop.org/patch/602562/?series=135809&rev=2
>
>>
>>     But that seemed too low layer for power mgmt calls. But if TLB inval is
>>     pipelined then I agree we have to stick to a
>>
>>     lower layer to fix this but probably not down to CT layer.
>>
>>   If we choose the latter
>> option I think following series will help as we will use GT TLB
>> invalidation fences everywhere for waits [1]/
>>
>>     Regards,
>>
>>     Nirmoy
>>
>>
>> Rodrigo - I know we had talked about something like above but it doesn't
>> appear this has gotten implemented. WIP or did this get lost in the PM
>> work?
>>
>> Matt
>>
>> [1] [3]https://patchwork.freedesktop.org/series/135809/
>>
>>
>>          lockdep_assert_held_write(&vm->lock);
>>
>>          drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
>> @@ -2721,6 +2722,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>
>>   unlock:
>>          drm_exec_fini(&exec);
>> +       xe_pm_runtime_put(vm->xe);
>>          return err;
>>   }
>>
>> --
>> 2.42.0
>>
>> References
>>
>>     1. mailto:matthew.brost@intel.com
>>     2. mailto:nirmoy.das@intel.com
>>     3. https://patchwork.freedesktop.org/series/135809/
