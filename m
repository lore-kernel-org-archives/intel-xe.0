Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A24C98328
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 18:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223810E211;
	Fri, 25 Sep 2026 18:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="X4oY0PKB";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA89810E211
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790360778;
 bh=Qu+Kv2Zn4+XUswTe9+Ui+91+HAUwlZ25qja62JeM4Fs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X4oY0PKBV9rtTVt1Np/Z5NP+Prvvc34zgNlVRO1vT5Bs4BfnPZ+GPjgvU+/R3/LGT
 uUoTbtnJSp5vRJKP/getDn5Kur7WMhV4GwNijUCwD/fF4dX82IFrXafq2nzcE04BSp
 J46sb0PWBeBXRc4OkZh3GDUNis4NvJunxJi3Z+wI1DqaGlwOyMIJRmnCiNJOaMhF1U
 ndzZytkOwt9OkM3gEIT/1jlV5OLRqyaFv4VQLJGtSjhNXLFBo8mnUHU4GdsGZeteKy
 la4WLbaTpWPxE2ESntbzxU4AhADr9572iwH7IVPHJAZX2hy4JmTfVX8xU6Rm2i7sJv
 ZMugrDzph1CFA==
Message-ID: <1bea1f8b-19e0-4c4c-8b08-fa1c86e65845@lankhorst.se>
Date: Fri, 25 Sep 2026 20:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-23-matthew.brost@intel.com>
 <d6c5c5b2-781b-46c6-8de0-69d59ccf7988@lankhorst.se>
 <ara6nyX17ARDHBnU@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <ara6nyX17ARDHBnU@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 9/25/26 20:17, Matthew Brost wrote:
> On Fri, Sep 25, 2026 at 07:49:43PM +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> I know this has been reviewed, but can it be changed to have xe_migrate_ulls_enter + xe_migrate_ulls_leave?
>> It decreases the amount of pingponging with debugging enabled.
>>
>> I kept below patch in my tree that did just that, feel free to merge with this patch.
>>
> Ok, I see the potential races where before we get to a copy job in
> either prefetch or a pagefault before the exit period ULLS will disarm
> itself - I'd hope within the default of 5ms that would never happen in
> practice as 5ms is a *really* long time in hot paths (prefetch, SVM).
>
> Is this the issue you are seeing in debug builds, I personally have
> never noticed this but generally run with perf builds.
>
> Are you using ULLS somewhere else where 5ms can be hit more easier?
>
> Want to get a full picture before commiting to something.
It causes different behavior in a debugging kernel. PROVE_LOCKING, DEBUG_SLUB, etc may cause
a behavior change.

I believe it's better to  keep it as a refcount. iirc I noticed it when investigating a test failure from C
in a previous version of your patch series.

In that testcase, the ulls fastpath was disabled before the fastpath completely ran, and a test failure happened.
I'm not sure if the latter was related, but it made me aware that it is definitely a possibility when debugging
that behavior will change compared to non-debugging case.

> Matt
>
>> Kind regards,
>> ~Maarten Lankhorst
>>
>> commit 6beeb2f7ff909bdaf9f8b1eeaa014cd15a65c78b
>> Author: Maarten Lankhorst <dev@lankhorst.se>
>> Date:   Mon Jun 8 19:05:46 2026 +0200
>>
>>     drm/xe: Keep ulls alive while servicing ops.
>>     
>>     Instead of bumping at the start, when performing a lot of work ulls may
>>     run longer, so keep track using a refcount to keep the full benefit of
>>     ulls.
>>     
>>     Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index d28da51d71452..f0b6641dd9815 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -58,6 +58,8 @@ struct xe_migrate {
>>      struct xe_tile *tile;
>>      /** @job_mutex: Timeline mutex for @eng. */
>>      struct mutex job_mutex;
>> +    /** @ulls_used: How many outstanding ulls operations there are */
>> +    atomic_t ulls_used;
>>      /** @pt_bo: Page-table buffer object. */
>>      struct xe_bo *pt_bo;
>>      /** @batch_base_ofs: VM offset of the migration batch buffer */
>> @@ -475,6 +477,8 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>>   *
>>   * If DGFX and not a VF, enter ULLS mode bypassing GuC / HW context
>>   * switches by utilizing semaphore and continuously running batches.
>> + *
>> + * Pairs with xe_migrate_ulls_leave().
>>   */
>>  void xe_migrate_ulls_enter(struct xe_migrate *m)
>>  {
>> @@ -488,6 +492,12 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
>>      if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
>>          return;
>>  
>> +    /* Bump */
>> +    if (atomic_inc_return(&m->ulls_used) > 1)
>> +        return;
>> +
>> +    cancel_delayed_work_sync(&m->ulls.exit_work);
>> +
>>  job_alloc:
>>      if (alloc) {
>>          /*
>> @@ -534,10 +544,30 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
>>      }
>>      if (job)
>>          xe_sched_job_put(job);
>> +    mutex_unlock(&m->job_mutex);
>> +}
>> +
>> +/**
>> + * xe_migrate_ulls_leave() - Leave ULLS mode
>> + * @m: The migration context.
>> + *
>> + * Leaves the critical part of the migration context, it may continue to be enabled.
>> + * Pairs with xe_migrate_ulls_enter().
>> + */
>> +void xe_migrate_ulls_leave(struct xe_migrate *m)
>> +{
>> +    struct xe_device *xe = tile_to_xe(m->tile);
>> +
>> +    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
>> +        return;
>> +
>> +    if (atomic_dec_return(&m->ulls_used))
>> +        return;
>> +
>> +    guard(mutex)(&m->job_mutex);
>>      if (m->ulls.enabled)
>>          mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
>>                   ULLS_EXIT_JIFFIES);
>> -    mutex_unlock(&m->job_mutex);
>>  }
>>  
>>  static void xe_migrate_ulls_exit(struct work_struct *work)
>> @@ -599,8 +629,8 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
>>                   ULLS_EXIT_JIFFIES);
>>      }
>>  
>> -    drm_dev_exit(idx);
>>      mutex_unlock(&m->job_mutex);
>> +    drm_dev_exit(idx);
>>  }
>>  
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>> index 2e8be10fdb71f..c909e1afb476e 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -98,5 +98,6 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
>>  #endif
>>  
>>  void xe_migrate_ulls_enter(struct xe_migrate *m);
>> +void xe_migrate_ulls_leave(struct xe_migrate *m);
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 782ed50a2a43e..51b2cb8fdcf1c 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -315,6 +315,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>  
>>  unlock_vm:
>>      up_read(&vm->lock);
>> +    xe_migrate_ulls_leave(gt_to_tile(gt)->migrate);
>>      xe_vm_put(vm);
>>  
>>      return err;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a1eca4871175b..fc9f587a35905 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2557,7 +2557,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>                  if (addr)
>>                      goto alloc_next_range;
>>                  else
>> -                    goto print_op_label;
>> +                    goto ulls_leave;
>>              }
>>  
>>              if (IS_ERR(svm_range)) {
>> @@ -2598,8 +2598,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>              if (need_put)
>>                  xe_svm_range_put(svm_range);
>>  
>> +ulls_leave:
>> +            for_each_tile(tile, vm->xe, id)
>> +                xe_migrate_ulls_leave(tile->migrate);
>>          }
>> -print_op_label:
>>          print_op(vm->xe, __op);
>>      }
>>  
>>
>>
>>
>> On 9/25/26 06:53, Matthew Brost wrote:
>>> Call xe_migrate_ulls_enter upon page fault or SVM prefetch in an
>>> effort speed up these critical paths.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>
>>> ---
>>> v7:
>>>  - s/migration/migrate (Shuicheng)
>>> ---
>>>  drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
>>>  drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
>>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>>> index f9e5bd41cfd1..f219e9e3b73e 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>> @@ -15,6 +15,7 @@
>>>  #include "xe_gt_stats.h"
>>>  #include "xe_hw_engine.h"
>>>  #include "xe_log.h"
>>> +#include "xe_migrate.h"
>>>  #include "xe_pagefault.h"
>>>  #include "xe_pagefault_types.h"
>>>  #include "xe_pm.h"
>>> @@ -281,6 +282,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>>  	if (IS_ERR(vm))
>>>  		return PTR_ERR(vm);
>>>  
>>> +	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
>>> +
>>>  	down_read(&vm->lock);
>>>  
>>>  	if (xe_vm_is_closed(vm)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index f66bd1de2b70..425c678f4480 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -2528,8 +2528,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>>  			ctx.devmem_possible = IS_DGFX(vm->xe) &&
>>>  					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>>>  
>>> -			for_each_tile(tile, vm->xe, id)
>>> +			for_each_tile(tile, vm->xe, id) {
>>> +				xe_migrate_ulls_enter(tile->migrate);
>>>  				tile_mask |= 0x1 << id;
>>> +			}
>>>  
>>>  			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>>>  				dpagemap = xe_vma_resolve_pagemap(vma,

