Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C75DCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD7E10F14F;
	Mon, 12 Oct 2026 14:21:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3B10E129
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791814895; x=1823350895;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XZ0dKY4Df7cZUKuJho2oJ5mStFH3m99vOaVDsfTZIFg=;
 b=UOm9Ay0fIKayvNcFdMTH3kGFveGnZMQowY2i7RzUdCtT36PwFZCxbMST
 6leQUcWbBbqZBiP+GpwytyLpkSYekZZ4EOlS255KaM4I/Twr2C+ohnT3P
 OoP+OoC8Ig3P0tGYWDTSW0kNS+6OoLbw6Zz8fdL//ks5ZnXmKtGOMQIRS
 J0Ct3yDIptOqEpLfXrZEIyYYOGMGKFX9+DO9laaezqU9KrOyTelFsNUIn
 vGjrA+11xlm7RlJ8mABZ4xZxqPYD7zglBpvrUGTK8Bm1159BBf11DmY2b
 9r2o10Kmr1yMZ1yfbu+tUmQKJ4ow8arT9JX1OD98MvYzIW75hi1AMiF9i w==;
X-CSE-ConnectionGUID: GVNjqn+RSx+HhV1DkUVtIA==
X-CSE-MsgGUID: jws7r0BoSYKAItwZlQ32ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="628578"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="628578"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:21:35 -0700
X-CSE-ConnectionGUID: pKq+O+XaRsCwpWLeIoiA8A==
X-CSE-MsgGUID: GtYniodkSPK1yQAZW9wH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="999109"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.217])
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:21:34 -0700
Message-ID: <dd0ad60b-c6a2-45c1-b85d-0368415526da@intel.com>
Date: Mon, 12 Oct 2026 15:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Bump LRU for external objects on exec and rebind
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20261012132607.21387-1-thomas.hellstrom@linux.intel.com>
 <aszkZLFG57cmurw3@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aszkZLFG57cmurw3@gsse-cloud1.jf.intel.com>
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

On 12/10/2026 14:45, Matthew Brost wrote:
> On Mon, Oct 12, 2026 at 03:26:07PM +0200, Thomas Hellström wrote:
> 
> Yikes, not sure how we missed this one and this is certainly not the
> intent and will be large issue for compositor buffers.
> 
> I'd honestly lean towards this being a fixes.

+1

> 
>> The VM's private BOs get their LRU position refreshed in bulk via
>> ttm_lru_bulk_move_tail() on vm->lru_bulk_move, both after a successful
>> non-LR exec and after the LR preempt-fence rebind worker runs. External
>> objects (BOs potentially shared across VMs) are never added to that
>> per-VM bulk move list, so their LRU position is never refreshed by
>> either path. This makes external objects in active use look more
>> evictable than they are.
>>
>> Add xe_vm_bump_lru(), which, under a single lru_lock critical section,
>> performs the bulk move of the VM's private BOs and bumps each external
>> object locked by the drm_exec transaction. Use it from both the non-LR
>> exec path and the LR rebind worker, replacing the open-coded bulk move.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Consider the above:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
>> Assisted-by: LLM
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec.c |  7 ++-----
>>   drivers/gpu/drm/xe/xe_vm.c   | 31 ++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_vm.h   |  2 ++
>>   3 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index d5293bc33a67..7dc9a0a1f569 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -346,11 +346,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	xe_sched_job_push(job);
>>   	xe_vm_reactivate_rebind(vm);
>>   
>> -	if (!err && !xe_vm_in_lr_mode(vm)) {
>> -		spin_lock(&xe->ttm.lru_lock);
>> -		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>> -		spin_unlock(&xe->ttm.lru_lock);
>> -	}
>> +	if (!err && !xe_vm_in_lr_mode(vm))
>> +		xe_vm_bump_lru(vm, exec);
>>   
>>   	if (mode == EXEC_MODE_LR)
>>   		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index ef369df4aa26..095f762bbb6f 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -413,6 +413,33 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_vm_bump_lru() - Bump the LRU position of BOs used by a submission
>> + * @vm: The vm for which we are bumping LRUs.
>> + * @exec: The struct drm_exec with the locked GEM objects.
>> + *
>> + * Move the VM's private BOs, and all external objects locked by @exec,
>> + * to the LRU tail. Private BOs are moved in bulk using @vm's
>> + * &xe_vm.lru_bulk_move. External objects, which may be shared with other
>> + * VMs, are not part of that bulk move and are bumped individually.
>> + */
>> +void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
>> +{
>> +	spinlock_t *lru_lock = &vm->xe->ttm.lru_lock;
>> +	struct drm_gem_object *obj;
>> +
>> +	spin_lock(lru_lock);
>> +	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>> +	drm_exec_for_each_locked_object(exec, obj) {
>> +		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
>> +			continue;
>> +
>> +		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
>> +		cond_resched_lock(lru_lock);
>> +	}
>> +	spin_unlock(lru_lock);
>> +}
>> +
>>   static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>>   				 bool *done)
>>   {
>> @@ -563,9 +590,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   
>>   #undef retry_required
>>   
>> -	spin_lock(&vm->xe->ttm.lru_lock);
>> -	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>> -	spin_unlock(&vm->xe->ttm.lru_lock);
>> +	xe_vm_bump_lru(vm, &exec);
>>   
>>   	/* Point of no return. */
>>   	arm_preempt_fences(vm, &preempt_fences);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 89c4f95984a2..06138c3c4315 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -284,6 +284,8 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>>   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>>   			  unsigned int num_fences);
>>   
>> +void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec);
>> +
>>   struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>>   				       struct xe_exec_queue *q, u64 addr,
>>   				       enum xe_cache_level cache_lvl);
>> -- 
>> 2.56.0
>>

