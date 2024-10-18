Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD8D30016
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 14:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F399310E93E;
	Fri, 18 Oct 2024 14:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgzQE70t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C14210E052
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729263203; x=1760799203;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xI+TNI4wiGqZ5pXiCd0GNIb8+1qjoxKOyFpLpUU/J9M=;
 b=IgzQE70tCWzoBXrlojUwcw68t8rcGg+NsyZRsG4m05BXzI4mXghDjQrR
 OD4kU0MPHHD99vxarIUO6ZdKUb0gyTe6f+HNP0Zjr8SEP7OnUHLqjNC5d
 SqENwM5z+65q6EiryFACsRS7cjvE0FDV5KdZElOic+5e4hesdg1FoQjSX
 9ImByxLPEJRxGIsqWtRg5iJu+cHzfgLmbhBW2ajw0S/Tf2uE1T3jaOsHc
 mxZWPQkoi34aIzE14yTbd9kPzJDnEpUUBBpbeSgqkvobYoeIhmQ3AeXNb
 djj55xqdkAHz1lDvNJMmZV0b+w7DCXwqHmxtBQemHDp3xScVZDY3xf1nj A==;
X-CSE-ConnectionGUID: cvEeh2+VQGi8jv4f5pgh1A==
X-CSE-MsgGUID: KEr3kGxhRQ60xzvGX76LCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="39385301"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="39385301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:53:22 -0700
X-CSE-ConnectionGUID: wZhSK3P0S+aQX0nsx5umoQ==
X-CSE-MsgGUID: HmygQq4cSb+UtCF+gHbciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="102199319"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.226])
 ([10.245.244.226])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:53:15 -0700
Message-ID: <9fb1e3a2-c4ab-4520-996f-b5d20f634093@intel.com>
Date: Fri, 18 Oct 2024 15:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
 <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
 <52c18f08-0d8a-4419-ab36-9f072c54f9cf@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <52c18f08-0d8a-4419-ab36-9f072c54f9cf@intel.com>
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

On 18/10/2024 15:40, Nirmoy Das wrote:
> 
> On 10/18/2024 4:23 PM, Matthew Auld wrote:
>> On 18/10/2024 13:47, Nirmoy Das wrote:
>>> If the backing fence is signaled then signal ufence immediately.
>>> This should reduce load from the xe ordered_wq and also won't block
>>> signaling a ufence which doesn't require any serialization.
>>>
>>> v2: fix system_wq typo
>>> v3: signal immediately instead of queuing in system_wq (Matt B)
>>>
>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> gc: Matthew Brost <matthew.brost@intel.com>
>>
>> s/gc/Cc
>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
>>>    1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>>> index c6cf227ead40..069c1e4ebea5 100644
>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>> @@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>>>        return ufence;
>>>    }
>>>    -static void user_fence_worker(struct work_struct *w)
>>> +static void signal_user_fence(struct xe_user_fence *ufence)
>>>    {
>>> -    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>>> -
>>>        if (mmget_not_zero(ufence->mm)) {
>>>            kthread_use_mm(ufence->mm);
>>>            if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
>>
>> This can end up in a CPU fault handler? There might be some locking issues if caller is say holding dma-resv. For example the caller in xe_exec which is holding dma-resv. If it can indeed hit this path, then we might get some splats/deadlocks, I think.
> 
> 
> What is the connection between writting into ufence addr  and dma-resv  ? Trying to understand this locking problem.

Basically the user can have the ufence be an mmap address from a BO, so 
it can basically hit xe_gem_fault() here. The mmap lock should already 
be tainted with dma-resv, so might_fault() should complain.

> 
> 
> it looks like I have to use a worker anyway to do kthread_use_mm(), https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

Yes, exactly that just with might_fault() in copy_to_user. Good to see 
that CI caught this. From the logs we can also see the exact dma-resv 
splat as per above:

4> [233.110447] xe_exec_balance/3613 is trying to acquire lock:
<4> [233.110457] ff11000100085998 (&mm->mmap_lock){++++}-{3:3}, at: 
__might_fault+0x43/0x90
<4> [233.110481]
but task is already holding lock:
<4> [233.110491] ff110001231a1da0 
(reservation_ww_class_mutex){+.+.}-{3:3}, at: 
drm_exec_lock_obj+0x88/0x2b0 [drm_exec]
<4> [233.110517]
which lock already depends on the new lock.
<4> [233.110530]
the existing dependency chain (in reverse order) is:
<4> [233.110540]
-> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
<4> [233.110558]        __ww_mutex_lock.constprop.0+0xe1/0x14d0
<4> [233.110574]        ww_mutex_lock+0x3c/0xa0
<4> [233.110586]        dma_resv_lockdep+0x1a4/0x340
<4> [233.110599]        do_one_initcall+0x76/0x3e0
<4> [233.110615]        kernel_init_freeable+0x3dc/0x690
<4> [233.110632]        kernel_init+0x1b/0x200
<4> [233.110645]        ret_from_fork+0x3a/0x60
<4> [233.110658]        ret_from_fork_asm+0x1a/0x30
<4> [233.110671]
-> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
<4> [233.110689]        dma_resv_lockdep+0x180/0x340
<4> [233.110699]        do_one_initcall+0x76/0x3e0
<4> [233.110713]        kernel_init_freeable+0x3dc/0x690
<4> [233.110728]        kernel_init+0x1b/0x200
<4> [233.110740]        ret_from_fork+0x3a/0x60
<4> [233.110752]        ret_from_fork_asm+0x1a/0x30
<4> [233.110764]
-> #0 (&mm->mmap_lock){++++}-{3:3}:
<4> [233.110780]        __lock_acquire+0x1623/0x2800
<4> [233.110794]        lock_acquire+0xc5/0x2f0
<4> [233.110807]        __might_fault+0x63/0x90
<4> [233.110818]        _copy_to_user+0x23/0x70
<4> [233.110830]        signal_user_fence+0x46/0xd0 [xe]
<4> [233.111108]        xe_sync_entry_signal+0x14e/0x1b0 [xe]
<4> [233.111366]        vm_bind_ioctl_ops_execute+0x3f8/0x910 [xe]
<4> [233.111665]        xe_vm_bind_ioctl+0x1623/0x22a0 [xe]
<4> [233.111951]        drm_ioctl_kernel+0xb1/0x120 [drm]
<4> [233.112052]        drm_ioctl+0x2e8/0x5a0 [drm]
<4> [233.112140]        xe_drm_ioctl+0x53/0x80 [xe]
<4> [233.112331]        __x64_sys_ioctl+0x95/0xd0
<4> [233.112342]        x64_sys_call+0x1089/0x2060
<4> [233.112355]        do_syscall_64+0x87/0x140
<4> [233.112365]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [233.112380]

> 
> 
> Regards,
> 
> Nirmoy
> 
>>
>>> @@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
>>>        user_fence_put(ufence);
>>>    }
>>>    +static void user_fence_worker(struct work_struct *w)
>>> +{
>>> +    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
>>> +                            worker);
>>> +
>>> +    signal_user_fence(ufence);
>>> +}
>>> +
>>>    static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>>>    {
>>>        INIT_WORK(&ufence->worker, user_fence_worker);
>>> @@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>>            err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>>                             user_fence_cb);
>>>            if (err == -ENOENT) {
>>> -            kick_ufence(sync->ufence, fence);
>>> +            /* signal the ufence immediately if fence is already signalled */
>>> +            signal_user_fence(sync->ufence);
>>>            } else if (err) {
>>>                XE_WARN_ON("failed to add user fence");
>>>                user_fence_put(sync->ufence);
