Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0CC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 17:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB82710EA25;
	Fri, 27 Oct 2023 17:48:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4604210EA25
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698428878; x=1729964878;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GqNOiLgEhNVwvSx2BU1Ci3mKVX6Cj4nu1U9Tn1LTaYQ=;
 b=LN7m0W4/Nh7hVRJ3uSszNXIyCFViDdRybXIXqAmIO+DmA/wTkBGLAvGJ
 cUfN+MlQeh9VGPAODFOc9qJ6xJyjlvdj7C2N9fJKz8NWd49S2eoIQiuIE
 wWqGHmJCp6IBONcBJ6wAQKBO+NA1/NAf/vTpB7qWCS06qb2CUBd1N5sJy
 +uROnz2eFKHQN98BciUBbwSi71vRISpzX4CNTAEP2QuTWrfVvuEMan415
 LbcepqYDumTfCNfWXMnc4hFx7u/4MwG4ClvqozNcR7SmXdkh3Y1q5vkUL
 G9nmlcVzewbQ+qW6bQRQIvlRkJDBdJs5jPAqygy55liXL73jJcfGCvyfI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="391693935"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="391693935"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 10:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="794644555"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="794644555"
Received: from lradhakr-mobl.ger.corp.intel.com (HELO [10.249.42.16])
 ([10.249.42.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 10:47:56 -0700
Message-ID: <38587ddb-989b-303c-6f2e-32100958a9d3@linux.intel.com>
Date: Fri, 27 Oct 2023 19:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten@mblankhorst.nl, intel-xe@lists.freedesktop.org
References: <20231024122256.19512-1-dev@lankhorst.se>
 <20231024122256.19512-5-dev@lankhorst.se>
 <78608338-86d7-bc42-4a7e-ade7210c59a6@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <78608338-86d7-bc42-4a7e-ade7210c59a6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Implement VM snapshot support
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

Hey,

On 2023-10-27 14:17, Thomas Hellström wrote:
> Hi, Maarten
> 
> 
> On 10/24/23 14:22, Maarten@mblankhorst.nl wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c       |   9 ++
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_vm.c                | 111 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h                |   4 +
>>   4 files changed, 126 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 68abc0b195be..298be162ed0c 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_vm.h"
>>   /**
>>    * DOC: Xe device coredump
>> @@ -98,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, 
>> loff_t offset,
>>           if (coredump->snapshot.hwe[i])
>>               xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
>>                               &p);
>> +    if (coredump->snapshot.vm) {
>> +        drm_printf(&p, "\n**** VM state ****\n");
>> +        xe_vm_snapshot_print(coredump->snapshot.vm, &p);
>> +    }
>>       return count - iter.remain;
>>   }
>> @@ -116,6 +121,7 @@ static void xe_devcoredump_free(void *data)
>>       for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>>           if (coredump->snapshot.hwe[i])
>>               xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
>> +    xe_vm_snapshot_free(coredump->snapshot.vm);
>>       coredump->captured = false;
>>       drm_info(&coredump_to_xe(coredump)->drm,
>> @@ -151,6 +157,8 @@ static void devcoredump_snapshot(struct 
>> xe_devcoredump *coredump,
>>       coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>>       coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
>> +    if (q->vm)
>> +        coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
>>       for_each_hw_engine(hwe, q->gt, id) {
>>           if (hwe->class != q->hwe->class ||
>> @@ -194,3 +202,4 @@ void xe_devcoredump(struct xe_exec_queue *q)
>>                 xe_devcoredump_read, xe_devcoredump_free);
>>   }
>>   #endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h 
>> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index 7fdad9c3d3dd..93c2ad7bdc54 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -33,6 +33,8 @@ struct xe_devcoredump_snapshot {
>>       struct xe_guc_submit_exec_queue_snapshot *ge;
>>       /** @hwe: HW Engine snapshot array */
>>       struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>> +    /** @vm: Snapshot of VM state */
>> +    struct xe_vm_snapshot *vm;
>>   };
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index b42ca1069c5b..13494c81e964 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3329,3 +3329,114 @@ int xe_analyze_vm(struct drm_printer *p, 
>> struct xe_vm *vm, int gt_id)
>>       return 0;
>>   }
>> +
>> +struct xe_vm_snapshot {
> Kerneldoc structs and external functinos.
>> +    unsigned long num_snaps;
>> +    struct {
>> +        uint64_t ofs, bo_ofs;
>> +        unsigned long len;
>> +        struct xe_bo *bo;
>> +        void *data;
>> +    } snap[];
>> +};
>> +
>> +struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>> +{
>> +    unsigned long num_snaps = 0, i;
>> +    struct xe_vm_snapshot *snap;
>> +    struct drm_gpuva *gpuva;
>> +
>> +    mutex_lock(&vm->snap_mutex); /*interruptible locks? */
>> +    drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
>> +        if (gpuva->flags & XE_VMA_DUMPABLE)
>> +            num_snaps++;
>> +    }
>> +
>> +    snap = kvmalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), 
>> GFP_NOWAIT);
>> +    if (!snap)
>> +        goto out_unlock;
>> +
>> +    snap->num_snaps = num_snaps;
>> +    i = 0;
>> +    drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
>> +        struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +        struct xe_bo *bo = gem_to_xe_bo(vma->gpuva.gem.obj);
>> +
>> +        if (!(gpuva->flags & XE_VMA_DUMPABLE))
>> +            continue;
>> +
>> +        snap->snap[i].ofs = xe_vma_start(vma);
>> +        snap->snap[i].len = xe_vma_size(vma);
>> +        snap->snap[i].bo = xe_bo_get(bo);
>> +        snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
>> +        i++;
>> +    }
>> +
>> +out_unlock:
>> +    mutex_unlock(&vm->snap_mutex);
>> +    return snap;
>> +}
>> +
>> +void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct 
>> drm_printer *p)
>> +{
>> +    unsigned long i, j;
>> +
>> +    for (i = 0; i < snap->num_snaps; i++) {
>> +        struct xe_bo *bo = snap->snap[i].bo;
>> +        struct iosys_map src;
>> +        int err;
>> +
>> +        if (snap->snap[i].data)
>> +            goto print;
>> +
>> +        /* Capture data, but try only once */
>> +        if (bo)
>> +            snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
>> +        if (!snap->snap[i].data)
>> +            goto kvfree;
>> +
>> +        /* TODO: Locking, VMAP magic etc here.. */
>> +        dma_resv_lock(bo->ttm.base.resv, NULL);
> 
> Hm. What is the thinking around deep pipelining here?
> I figure a hang that caused the coredump may in theory be several 
> migrations behind the current state of the bo, and the bo may not even 
> have been dumpable when executing whatever caused the hang...
> 
> Does it make sense to wait for any KERNEL fences here?
Yes, I think it would make sense to wait for KERNEL. I missed that.

It's of course different for userspace than pinned kernel objects. :)

Cheers,
~Maarten

> /Thomas
> 
> 
>> +        err = ttm_bo_vmap(&bo->ttm, &src);
>> +        if (!err) {
>> +            xe_map_memcpy_from(xe_bo_device(bo),
>> +                       snap->snap[i].data,
>> +                       &src, snap->snap[i].bo_ofs,
>> +                       snap->snap[i].len);
>> +            ttm_bo_vunmap(&bo->ttm, &src);
>> +        }
>> +        dma_resv_unlock(bo->ttm.base.resv);
>> +
>> +        if (err)
>> +            goto kvfree;
>> +
>> +print:
>> +        for (j = 0; j < snap->snap[i].len; j += 64) {
>> +            uint32_t *x = snap->snap[i].data + j;
>> +
>> +            drm_printf(p, "[%llx] = { %x, %x, %x, %x, %x, %x, %x, %x, 
>> %x, %x, %x, %x, %x, %x, %x, %x }\n",
>> +                   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], 
>> x[4], x[5], x[6], x[7],
>> +                   x[8], x[9], x[10], x[11], x[12], x[13], x[14], 
>> x[15]);
>> +        }
>> +        xe_bo_put(bo);
>> +        snap->snap[i].bo = NULL;
>> +        continue;
>> +kvfree:
>> +        kvfree(snap->snap[i].data);
>> +        snap->snap[i].data = NULL;
>> +
>> +        drm_printf(p, "Unable to capture range [%llx-%llx]\n",
>> +               snap->snap[i].ofs, snap->snap[i].ofs + 
>> snap->snap[i].len - 1);
>> +    }
>> +}
>> +
>> +void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>> +{
>> +    unsigned long i;
>> +
>> +    for (i = 0; i < snap->num_snaps; i++) {
>> +        kvfree(snap->snap[i].data);
>> +        xe_bo_put(snap->snap[i].bo);
>> +    }
>> +    kvfree(snap);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index b08c75fbd8a1..ef23fe3c2f40 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -233,3 +233,7 @@ static inline void vm_dbg(const struct drm_device 
>> *dev,
>>   { /* noop */ }
>>   #endif
>>   #endif
>> +
>> +struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>> +void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct 
>> drm_printer *p);
>> +void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
