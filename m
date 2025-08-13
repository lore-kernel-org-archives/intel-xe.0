Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584B3CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 08:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EE389343;
	Wed, 13 Aug 2025 08:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKw997rc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821F89343
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755073730; x=1786609730;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8/qTLQXBbnZiziZERqEUDszkZs3R6DvGs8LGdbbRTqY=;
 b=ZKw997rcucxL+9GJm6OW9vhC0q/y+3RaeKWoFSXZ83sNRgcQ0qBeGu2r
 LRmaiEyKKKaVMk7yvRaOM1BExNlNX0vVIKY6id8VMRrdS0D7wyDxR1fU6
 cxHK+QwdQXJubWh5lg2tlsdR9yVgQhaC512fwTaACpAD96Slb2in9EKf9
 lpp2+MkVEkTvrYdTmEZwLSDEMOTTa9MIogiUaQUShh+Pmbbaz6aDkIpIS
 BEiLO+nMTvbO0FV6bnacHsP0JzkeIXxeNBV7RYOU3BanGSx6o1iapS+le
 PT+RTnW551En5ejGq22J6zRbVmoJ2dq1QDm7WsyeNJAxqOpz+m3PO9SKn w==;
X-CSE-ConnectionGUID: IU3maPC2Qvq4Ywp9il1pPw==
X-CSE-MsgGUID: AhMUBd+sTISEMGAYKDRSlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68435459"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68435459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:28:50 -0700
X-CSE-ConnectionGUID: /e4quWP8TfyTvHI+c6XJeg==
X-CSE-MsgGUID: 5SMdjDMJSbK4/d8T1WVHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="171670513"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.67])
 ([10.245.246.67])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:28:47 -0700
Message-ID: <d6af254b-87e9-4b6e-84a6-82f5465c7417@intel.com>
Date: Wed, 13 Aug 2025 10:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Untangle vm_bind_ioctl cleanup order and fix
 double free bug
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
References: <20250812131728.42314-1-christoph.manszewski@intel.com>
 <20250812131728.42314-2-christoph.manszewski@intel.com>
 <aJuhBHks6FWf60Wh@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aJuhBHks6FWf60Wh@lstrano-desk.jf.intel.com>
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

Hi Matt,

On 12.08.2025 22:16, Matthew Brost wrote:
> On Tue, Aug 12, 2025 at 03:17:28PM +0200, Christoph Manszewski wrote:
>> If the argument check during an array bind fails, the bind_ops are freed
>> twice as seen in [1]. While at it, fix the ordering of resource cleanup
>> to align with reverse allocation order.
>>
>> [1]:
>> ==================================================================
>> BUG: KASAN: double-free in xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>> Free of addr ffff88813bb9b800 by task xe_vm/14198
>>
>> CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)
>> Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x82/0xd0
>>   print_report+0xcb/0x610
>>   ? __virt_addr_valid+0x19a/0x300
>>   ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>>   kasan_report_invalid_free+0xc8/0xf0
>>   ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>>   ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>>   check_slab_allocation+0x102/0x130
>>   kfree+0x10d/0x440
>>   ? should_fail_ex+0x57/0x2f0
>>   ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>>   xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>>   ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>>   ? __lock_acquire+0xab9/0x27f0
>>   ? lock_acquire+0x165/0x300
>>   ? drm_dev_enter+0x53/0xe0 [drm]
>>   ? find_held_lock+0x2b/0x80
>>   ? drm_dev_exit+0x30/0x50 [drm]
>>   ? drm_ioctl_kernel+0x128/0x1c0 [drm]
>>   drm_ioctl_kernel+0x128/0x1c0 [drm]
>>   ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>>   ? find_held_lock+0x2b/0x80
>>   ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
>>   ? should_fail_ex+0x57/0x2f0
>>   ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>>   drm_ioctl+0x352/0x620 [drm]
>>   ? __pfx_drm_ioctl+0x10/0x10 [drm]
>>   ? __pfx_rpm_resume+0x10/0x10
>>   ? do_raw_spin_lock+0x11a/0x1b0
>>   ? find_held_lock+0x2b/0x80
>>   ? __pm_runtime_resume+0x61/0xc0
>>   ? rcu_is_watching+0x20/0x50
>>   ? trace_irq_enable.constprop.0+0xac/0xe0
>>   xe_drm_ioctl+0x91/0xc0 [xe]
>>   __x64_sys_ioctl+0xb2/0x100
>>   ? rcu_is_watching+0x20/0x50
>>   do_syscall_64+0x68/0x2e0
>>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> RIP: 0033:0x7fa9acb24ded
>> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
>> RSP: 002b:00007fff189e1370 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: ffffffffffffff68 RCX: 00007fa9acb24ded
>> RDX: 00007fff189e19f0 RSI: 0000000040886445 RDI: 0000000000000003
>> RBP: 00007fff189e13c0 R08: 0000000000000000 R09: 00005561d3fb47d0
>> R10: 00007fa9ace29be0 R11: 0000000000000246 R12: 00007fff189e19f0
>> R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000000003
>>   </TASK>
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d40d2d43c041..0bfc32fd8399 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3442,6 +3442,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>>   free_bind_ops:
>>   	if (args->num_binds > 1)
>>   		kvfree(*bind_ops);
>> +	bind_ops = NULL;
> 
> This should be *bind_ops = NULL, right?

Oops, yes indeed!


> 
> Or we could just simply delete the kvfree here are let's there be a
> single free at the caller too. I'd slightly leanr towards this option.

Hmm, isn't it a bit weird to expect the caller to free allocated memory 
if the allocation function failed?


> 
>>   	return err;
>>   }
>>   
>> @@ -3548,7 +3549,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	struct xe_exec_queue *q = NULL;
>>   	u32 num_syncs, num_ufence = 0;
>>   	struct xe_sync_entry *syncs = NULL;
>> -	struct drm_xe_vm_bind_op *bind_ops;
>> +	struct drm_xe_vm_bind_op *bind_ops = NULL;
>>   	struct xe_vma_ops vops;
>>   	struct dma_fence *fence;
>>   	int err;
>> @@ -3566,7 +3567,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>>   		if (XE_IOCTL_DBG(xe, !q)) {
>>   			err = -ENOENT;
> 
> All of the following changes are not strickly required, given kvfree is
> NULL safe? Rather this is just a preferred style cleanup. Since this is
> a fixes patch we'd want to backport, I'd split this patch into 2 distink
> patches - one which fixes the double free, one which cleans up the
> style.

Ok, I will split into two patches then.

Thanks,
Christoph

> 
> Matt
> 
>> -			goto put_vm;
>> +			goto free_bind_ops;
>>   		}
>>   
>>   		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
>> @@ -3612,7 +3613,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   			       __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>   		if (!ops) {
>>   			err = -ENOMEM;
>> -			goto release_vm_lock;
>> +			goto free_bos;
>>   		}
>>   	}
>>   
>> @@ -3746,17 +3747,20 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   put_obj:
>>   	for (i = 0; i < args->num_binds; ++i)
>>   		xe_bo_put(bos[i]);
>> +
>> +	kvfree(ops);
>> +free_bos:
>> +	kvfree(bos);
>>   release_vm_lock:
>>   	up_write(&vm->lock);
>>   put_exec_queue:
>>   	if (q)
>>   		xe_exec_queue_put(q);
>> -put_vm:
>> -	xe_vm_put(vm);
>> -	kvfree(bos);
>> -	kvfree(ops);
>> +free_bind_ops:
>>   	if (args->num_binds > 1)
>>   		kvfree(bind_ops);
>> +put_vm:
>> +	xe_vm_put(vm);
>>   	return err;
>>   }
>>   
>> -- 
>> 2.47.1
>>

