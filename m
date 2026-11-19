Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8AC606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CcEKnn5m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D511123F6;
	Thu, 19 Nov 2026 13:38:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023031123F6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795095502; x=1826631502;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qq1g4dWFMbCOiNOad3jXmsPjENGEXw4xMGQW/A5rrLw=;
 b=CcEKnn5mDgexfEQzBNyRexfrfhk0c1Jv0cQlxjqCJO1Q2ZaZOcbbSSJz
 mcrKLJ5qez0v6oEUxZU5XZu+DEcTfce+Wwm0WDg03LxXicKcWl9rHbNpE
 CoUZ3vjmZg3gpL9eOV8+e9VADxoJAqdWPk8MkGqFAqvFlWRbiexnVuXPR
 cPno46wlHk8Ay9Ju5ZGUBBy0FoIaSKgAu5h5v2lXBb8Fg+bra0KYG3UXO
 Kn5gV1JpNhJ0rXXwncs3wzlLSdbBbj3lpFnVUMliP1dHEkn+pg4aeuL+b
 L4xjQpPnkv5t0sYZwBIbgQ3LfqLu+KGgZlaXM2jKhis+ZrjNWTpLUDBd2 A==;
X-CSE-ConnectionGUID: WTtRj2KNTwmKD3h5Crzjaw==
X-CSE-MsgGUID: /1iNYXNcTuq3QzBWiJfuow==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3832198"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3832198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:38:22 -0800
X-CSE-ConnectionGUID: Se6G9eMLQsqKgiI9ji4Enw==
X-CSE-MsgGUID: vBBfRX6bQQCZa1f0tYcQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10995874"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.108])
 ([10.245.245.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:38:20 -0800
Message-ID: <5380ab8f-f972-40a7-bab6-45e6b183bdfd@intel.com>
Date: Thu, 19 Nov 2026 13:38:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe: run compute rebind worker on device NUMA node
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-5-af2e327833a9@intel.com>
 <f29cef0f95344993fc9d098f548dcde0dba8bfe8.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <f29cef0f95344993fc9d098f548dcde0dba8bfe8.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 13:11, Thomas Hellström wrote:
> On Thu, 2026-11-19 at 11:14 +0000, Matthew Auld wrote:
>> preempt_rebind_work_func() currently runs on xe->ordered_wq, whose
>> unbound worker pool spans all NUMA nodes. On multi-socket systems, if
>> the rebind worker runs on a remote socket when faulting userptr pages
>> marked PROT_NONE by AutoNUMA, hmm_range_fault() invokes
>> do_numa_page()
>> using the worker's NUMA node and triggers migrate_misplaced_folio(),
>> pulling pages away from the GPU's local node and causing self-
>> inflicted
>> MMU notifier invalidations.
>>
>> Move vm->preempt.rebind_work onto a dedicated WQ_UNBOUND workqueue
>> (max_active = 1) queued via queue_work_node() with dev_to_node(),
>> leaving user-fence signalling on xe->ordered_wq. Guard
>> preempt_rebind_work_func() with a per-device mutex so compute rebinds
>> remain strictly 1-at-a-time even when queue_work_node() falls back
>> across nodes (such as NUMA_NO_NODE or CPU-less nodes).
> 
> I don't remember fully why we have this 1-at-a-time rebind worker. I
> wonder whether it was because of concurrent validations causing VMs to
> outcompete eachother for memory. If that was the case, then we might be
> able to lift that restriction due to the validation guard.

If that is the case, then yeah that would make this a lot nicer.

> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 11 ++++++++++-
>>   drivers/gpu/drm/xe/xe_device_types.h | 10 +++++++++-
>>   drivers/gpu/drm/xe/xe_vm.c           |  8 +++++++-
>>   drivers/gpu/drm/xe/xe_vm.h           |  6 +++++-
>>   4 files changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 4e54a1b7fc51..f75a32bb48e3 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -8,7 +8,9 @@
>>   #include <linux/aperture.h>
>>   #include <linux/delay.h>
>>   #include <linux/error-injection.h>
>> +#include <linux/mutex.h>
>>   #include <linux/units.h>
>> +#include <linux/workqueue.h>
>>   
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_gem_ttm_helper.h>
>> @@ -396,6 +398,11 @@ static void xe_device_destroy(struct drm_device
>> *dev, void *dummy)
>>   	if (xe->destroy_wq)
>>   		destroy_workqueue(xe->destroy_wq);
>>   
>> +	if (xe->rebind_wq)
>> +		destroy_workqueue(xe->rebind_wq);
> 
> Hm. It looks safer if we destroy this wq earlier than the destroy wq?
> Is there a chance that we put something on the destroy wq from the
> rebind wq?

Can move.

> 
> 
> 
>> +
>> +	mutex_destroy(&xe->rebind_lock);
>> +
>>   	ttm_device_fini(&xe->ttm);
>>   
>>   	if (atomic_dec_and_test(&xe_device_count))
>> @@ -472,6 +479,7 @@ int xe_device_init_early(struct xe_device *xe)
>>   		return err;
>>   
>>   	xe_bo_dev_init(&xe->bo_device);
>> +	mutex_init(&xe->rebind_lock);
>>   	atomic_inc(&xe_device_count);
>>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy,
>> NULL);
>>   	if (err)
>> @@ -518,10 +526,11 @@ int xe_device_init_early(struct xe_device *xe)
>>   
>>   	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-
>> fence-wq",
>>   						
>> WQ_MEM_RECLAIM);
>> +	xe->rebind_wq = alloc_workqueue("xe-rebind-wq", WQ_UNBOUND,
>> 1);
>>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq",
>> 0);
>>   	xe->unordered_wq = alloc_workqueue("xe-unordered-wq",
>> WQ_PERCPU, 0);
>>   	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU
>> | WQ_MEM_RECLAIM, 0);
>> -	if (!xe->ordered_wq || !xe->unordered_wq ||
>> +	if (!xe->ordered_wq || !xe->unordered_wq || !xe->rebind_wq
>> ||
>>   	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>>   		/*
>>   		 * Cleanup done in xe_device_destroy via
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index fc80cd2c766e..c30d64296869 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -6,7 +6,9 @@
>>   #ifndef _XE_DEVICE_TYPES_H_
>>   #define _XE_DEVICE_TYPES_H_
>>   
>> +#include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/workqueue.h>
>>   
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_file.h>
>> @@ -375,7 +377,13 @@ struct xe_device {
>>   	/** @preempt_fence_wq: used to serialize preempt fences */
>>   	struct workqueue_struct *preempt_fence_wq;
>>   
>> -	/** @ordered_wq: used to serialize compute mode resume */
>> +	/** @rebind_wq: used to run compute mode rebind work on
>> device node */
>> +	struct workqueue_struct *rebind_wq;
>> +
>> +	/** @rebind_lock: serializes compute mode rebind workers per
>> device */
>> +	struct mutex rebind_lock;
>> +
>> +	/** @ordered_wq: used to serialize ordered work */
>>   	struct workqueue_struct *ordered_wq;
>>   
>>   	/** @unordered_wq: used to serialize unordered work */
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 0c5121361f8e..1436d09ee560 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/kthread.h>
>>   #include <linux/mm.h>
>> +#include <linux/mutex.h>
>>   #include <linux/sched/signal.h>
>>   #include <linux/swap.h>
>>   
>> @@ -540,7 +541,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm
>> *vm)
>>    */
>>   void xe_vm_resume_rebind_worker(struct xe_vm *vm)
>>   {
>> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>> +	xe_vm_queue_rebind_worker(vm);
>>   }
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>> @@ -581,16 +582,19 @@ static void preempt_rebind_work_func(struct
>> work_struct *w)
>>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>>   	trace_xe_vm_rebind_worker_enter(vm);
>>   
>> +	mutex_lock(&vm->xe->rebind_lock);
>>   	down_write(&vm->lock);
>>   
>>   	if (xe_vm_is_closed_or_banned(vm)) {
>>   		up_write(&vm->lock);
>> +		mutex_unlock(&vm->xe->rebind_lock);
>>   		trace_xe_vm_rebind_worker_exit(vm);
>>   		return;
>>   	}
>>   
>>   	if (!try_wait_for_completion(&vm->xe->pm_block) &&
>> vm_suspend_rebind_worker(vm)) {
>>   		up_write(&vm->lock);
>> +		mutex_unlock(&vm->xe->rebind_lock);
>>   		/* We don't actually block but don't make progress.
>> */
>>   		xe_pm_might_block_on_suspend();
>>   		return;
>> @@ -666,6 +670,7 @@ static void preempt_rebind_work_func(struct
>> work_struct *w)
>>   		 * lock make progress between attempts.
>>   		 */
>>   		up_write(&vm->lock);
>> +		mutex_unlock(&vm->xe->rebind_lock);
>>   		free_preempt_fences(&preempt_fences);
>>   		xe_vm_queue_rebind_worker(vm);
>>   		trace_xe_vm_rebind_worker_exit(vm);
>> @@ -679,6 +684,7 @@ static void preempt_rebind_work_func(struct
>> work_struct *w)
>>   		xe_vm_kill(vm, true);
>>   	}
>>   	up_write(&vm->lock);
>> +	mutex_unlock(&vm->xe->rebind_lock);
>>   
>>   	free_preempt_fences(&preempt_fences);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index b1c5f940bcc5..ed590bad892c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -6,6 +6,9 @@
>>   #ifndef _XE_VM_H_
>>   #define _XE_VM_H_
>>   
>> +#include <linux/device.h>
>> +#include <linux/workqueue.h>
>> +
>>   #include "xe_assert.h"
>>   #include "xe_bo_types.h"
>>   #include "xe_macros.h"
>> @@ -259,7 +262,8 @@ int xe_vm_validate_protected(struct xe_vm *vm);
>>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>>   {
>>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>> +	queue_work_node(dev_to_node(vm->xe->drm.dev), vm->xe-
>>> rebind_wq,
>> +			&vm->preempt.rebind_work);
> 
> Is a NUMA_NO_NODE dev_to_node() return OK here?

Yeah, select_numa_node_cpu() checks this:

if (node < 0 || node >= MAX_NUMNODES || !node_online(node))
             return WORK_CPU_UNBOUND;

And here NUMA_NO_NODE = -1

> 
> Thanks,
> Thomas
> 
> 
> 
>>   }
>>   
>>   /**

