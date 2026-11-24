Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F7606A323
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EpLPHP6R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAFB10E603;
	Tue, 24 Nov 2026 18:14:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CA610E603
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795544093; x=1827080093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ds69W3M7/pMotYtkO1HDoM9XdiLEBS47CXw790c8hQo=;
 b=EpLPHP6RFamvoeoDU8YFj381J/24pmNxL0ermvaoWWJHqg/2EZO+nDMD
 CbTlrPpylj598dEGEpIgb/cL83ihwNtPzFZfhrTPly41upSZFNqwVUXdW
 0AQRVKT0MtPegb3UJh5TA0X4lojEB1ufR/6b5ccEgFDFenAVS8m0uTmJs
 3+TsXm/Xnx3DbTFJ27BFVMe423BJg5EmpbTRF1l3YcaIdYwawDrlH7ijg
 PoUlqLH+lkzy9XhD7AhkMTeiSviAMJiuSLw7Whvket+7PGiN9GGBMtdhu
 uebSQqUK7JhQ/CNqHGfIqJIczWFEDFOmI4D9BWWHJ9xfwzOTxZyuqcjST g==;
X-CSE-ConnectionGUID: j6TVqQL4Rnuct9WczOjY4Q==
X-CSE-MsgGUID: 6HDgtV9tR8O26qGirOi1uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4415423"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4415423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:39:29 -0800
X-CSE-ConnectionGUID: jpZb5KcxRlKg1PjIFu/Biw==
X-CSE-MsgGUID: /sIVonpxQUGGC9PjVXH3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11499749"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.172])
 ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:39:03 -0800
Message-ID: <5fa24326-9c35-40ac-aa84-61e0ba09c79f@intel.com>
Date: Tue, 24 Nov 2026 17:39:00 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20261124152300.2450568-1-tomasz.lis@intel.com>
 <5659b906-98d7-4004-91a0-d43a6ba47276@intel.com>
 <aba1c1d4-a06e-4550-ab4f-731b9ed894e1@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aba1c1d4-a06e-4550-ab4f-731b9ed894e1@intel.com>
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

On 24/11/2026 16:15, Lis, Tomasz wrote:
> 
> On 2026-11-24 16:27, Matthew Auld wrote:
>> On 24/11/2026 15:23, Tomasz Lis wrote:
>>> drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget is
>>> exhausted. This can happen when the range was repeatedly invalidated
>>> or faulting was slow. This is transient, but the callers treat -EBUSY
>>> as fatal.
>>>
>>> The behavior causes sporadic fails after a VF post-migration recovery,
>>> if drm_gpusvm_get_pages() run in parallel with the recovery, and the
>>> recovery took longer than HMM_RANGE_DEFAULT_TIMEOUT (which isn't rare,
>>> as the kernel bound to VF is running on virtual CPU).
>>>
>>> Example signature of the issue:
>>>    xe 0000:00:04.0: [drm] VM worker error: -16
>>>    xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or 
>>> banned
>>>
>>> Convert -EBUSY to -EAGAIN in both wrappers around 
>>> drm_gpusvm_get_pages(),
>>> through a common helper. The rebind worker, exec, the pagefault loop and
>>> the SVM fault path already have a retry implemented on -EAGAIN.
>>>
>>> xe_vma_userptr_pin_pages() can now return -EAGAIN instead of -EBUSY, so
>>> update the VMA creation path in xe_vm.c, which maps this error to
>>> -ENOMEM. Tis way the bind ioctl keeps returning the same error as 
>>> before.
>>
>> Do you have some more context for how you hit this?
> For log context:
> 
> [   25.058112] xe 0000:00:04.0: [drm] VF: Tile0: GT0: readyfor recovery after migration
> [   25.058330] xe 0000:00:04.0: [drm] VF: Tile0: GT0: VF migration recovery scheduled
> [   25.058334] xe 0000:00:04.0: [drm] VF: Tile0: GT1: readyfor recovery after migration
> [   25.058336] xe 0000:00:04.0: [drm] VF: Tile0: GT1: VF migration recovery scheduled
> [   25.609533] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: GT0: GuC CT communication channel enabled
> [   25.738796] xe 0000:00:04.0: [drm] VF: Tile0: GT0: migration recovery ended
> [   31.351935] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: GT1: GuC CT communication channel enabled
> [   31.386304] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
> [   31.386392] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
> [   31.390497] xe 0000:00:04.0: [drm] VM worker error: -16
> [   31.394348] xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or banned
> [   31.402756] xe 0000:00:04.0: [drm] VF: Tile0: GT1: migration recovery ended
> 
> For description:
> This is a rare hit when executing VM TestBench test `vmtb@test_migration.py::TestBusyMigrationIgtExecThreads5`.
> The test executes `igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate` within the VM, and while that is executing, performs a Cold Migration to a VM with different GGTT range.
> After PF restores the VM state, post-migration recovery starts executing. In the failing instance I analyzed, the recovery happen to take 6 seconds - far more than HMM_RANGE_DEFAULT_TIMEOUT.
> Since updates of GGTT are blocked during the recovery, timeout was assured. In that instance, the call stack was xe_vm_userptr_pin()->xe_vma_userptr_pin_pages()->drm_gpusvm_get_pages().
> 
>>
>> This looks like:
>> https://patchwork.freedesktop.org/series/179052/
> 
> It does change the same code path, and the modification is similar, 
> though more complex.
> 
> I believe the 179052 series will fix the issue I'm seeing, though I 
> think timeout should be larger that the 
> XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT if the current device supports VM 
> migration.

Yeah, Thomas was also thinking the 10s might not be enough for some 
cases, but we don't have any data for non-NUMA cases, so plan was to 
bump as needed.

We could just use 30s for everything? Or maybe push to 15s for non-NUMA? 
Or something else?

Also, not sure if we should respin that series, or do this on top instead?

> 
> We actually cannot tell what is the limit for VF migration recovery time 
> due to VCPU used, but we've seen in testing rare cases where times 
> reached 10s.
> 
> -Tomasz
> 
>>
>>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c     |  2 +-
>>>   drivers/gpu/drm/xe/xe_userptr.c | 16 ++++++++++------
>>>   drivers/gpu/drm/xe/xe_vm.c      |  8 ++++----
>>>   drivers/gpu/drm/xe/xe_vm.h      | 16 ++++++++++++++++
>>>   4 files changed, 31 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index bc6902b5bf57..ffc624171d50 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -1624,7 +1624,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, 
>>> struct xe_svm_range *range,
>>>           drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>>>       }
>>>   -    return err;
>>> +    return xe_gpusvm_get_pages_err(err);
>>>   }
>>>     /**
>>> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/ 
>>> xe_userptr.c
>>> index 9c1dac0fce6f..423c190ac68d 100644
>>> --- a/drivers/gpu/drm/xe/xe_userptr.c
>>> +++ b/drivers/gpu/drm/xe/xe_userptr.c
>>> @@ -10,6 +10,7 @@
>>>     #include "xe_tlb_inval.h"
>>>   #include "xe_trace_bo.h"
>>> +#include "xe_vm.h"
>>>     static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
>>>   {
>>> @@ -84,6 +85,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma 
>>> *uvma)
>>>           .device_private_page_owner = xe_svm_private_page_owner(vm, 
>>> false),
>>>           .allow_mixed = true,
>>>       };
>>> +    int err;
>>>         xe_vma_userptr_lockdep(uvma);
>>>       xe_assert(xe, xe_vma_is_userptr(vma));
>>> @@ -91,12 +93,14 @@ int xe_vma_userptr_pin_pages(struct 
>>> xe_userptr_vma *uvma)
>>>       if (vma->gpuva.flags & XE_VMA_DESTROYED)
>>>           return 0;
>>>   -    return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma- 
>>> >userptr.pages, 1,
>>> -                    uvma->userptr.notifier.mm,
>>> -                    &uvma->userptr.notifier,
>>> -                    xe_vma_userptr(vma),
>>> -                    xe_vma_userptr(vma) + xe_vma_size(vma),
>>> -                    &ctx);
>>> +    err = drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma- 
>>> >userptr.pages, 1,
>>> +                   uvma->userptr.notifier.mm,
>>> +                   &uvma->userptr.notifier,
>>> +                   xe_vma_userptr(vma),
>>> +                   xe_vma_userptr(vma) + xe_vma_size(vma),
>>> +                   &ctx);
>>> +
>>> +    return xe_gpusvm_get_pages_err(err);
>>>   }
>>>     static struct mmu_interval_notifier_finish *
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index dd855876f571..6e6937870ac6 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -2746,11 +2746,11 @@ static struct xe_vma *new_vma(struct xe_vm 
>>> *vm, struct drm_gpuva_op_map *op,
>>>               err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>>>               /*
>>>                * -EBUSY has dedicated meaning that a user fence
>>> -             * attached to the VMA is busy, in practice
>>> -             * xe_vma_userptr_pin_pages can only fail with -EBUSY if
>>> -             * we are low on memory so convert this to -ENOMEM.
>>> +             * attached to the VMA is busy. xe_vma_userptr_pin_pages
>>> +             * reports exhausted HMM retries as -EAGAIN, which makes
>>> +             * no sense for the bind ioctl, so convert it to -ENOMEM.
>>>                */
>>> -            if (err == -EBUSY)
>>> +            if (err == -EAGAIN)
>>>                   err = -ENOMEM;
>>>           }
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index b1c5f940bcc5..ba24f2e6022e 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -38,6 +38,22 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, 
>>> u32 flags, struct xe_file *xef)
>>>   struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
>>>   int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
>>>   +/**
>>> + * xe_gpusvm_get_pages_err() - Translate an error from 
>>> drm_gpusvm_get_pages()
>>> + * @err: error code returned by drm_gpusvm_get_pages()
>>> + *
>>> + * drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget 
>>> ran out,
>>> + * because the range was repeatedly invalidated or faulting was 
>>> slow. That is
>>> + * transient, so report -EAGAIN to let the callers retry. -EBUSY 
>>> would be
>>> + * treated as fatal, and has other meanings in the VM code.
>>> + *
>>> + * Return: @err, with -EBUSY replaced by -EAGAIN
>>> + */
>>> +static inline int xe_gpusvm_get_pages_err(int err)
>>> +{
>>> +    return err == -EBUSY ? -EAGAIN : err;
>>> +}
>>> +
>>>   static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>>>   {
>>>       drm_gpuvm_get(&vm->gpuvm);
>>

