Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F360CEB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 17:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E9210E05E;
	Tue, 13 Jun 2023 17:11:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016110E05E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686676293; x=1718212293;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ghyD/7wRttyB2PeaZAL4kMMtybOmCNtvGb1e4x/oKCc=;
 b=Ot/8Ej4oXhc3cA6RXTC0BYDxdZ8scy3gt+rE5cVfOg637TGluGMGumCe
 URBpSgX3oPuDVXBV5qAm86mLzh0mPF9Aj360gNI6P1xt0T26ILi806Vog
 yNnPPX0QvDcJH6l1IRhU13Qt78UQN9Kme479vyQQN4vS4dbZINPBcUklE
 6yb3HdpmnY+K2OGgVipLypGobpzvr/XRsCOh2OwHhAZ+0mH58imkWYktM
 gOEefZFxzvZU8Q4wNg99mOH1A4b7aBPot1sxlj/F20ODMx6ZQObocsTIf
 YFfhs9QfhFSfp1L4+z5r9KYsF+FIG4o2YuiH30gaP6HqSJ7RB4MBXkrV3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338755953"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="338755953"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="662079121"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="662079121"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.22])
 ([10.249.254.22])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:11:16 -0700
Message-ID: <94523dbd-7881-e6bf-8b29-d18018d14d1f@linux.intel.com>
Date: Tue, 13 Jun 2023 19:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-3-matthew.brost@intel.com>
 <03ad932e9cabfea3b29a4029d9693c8296b14c29.camel@linux.intel.com>
 <ZIc+I6LnF8o+yzYg@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZIc+I6LnF8o+yzYg@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits
 an error
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


On 6/12/23 17:47, Matthew Brost wrote:
> On Fri, Jun 09, 2023 at 11:10:15PM +0200, Thomas Hellström wrote:
>> On Fri, 2023-06-09 at 11:26 -0700, Matthew Brost wrote:
>>> We cannot recover a VM if a rebind worker hits an error, ban the VM
>>> if
>>> happens to ensure we do not attempt to place this VM on the hardware
>>> again.
>>>
>>> A follow up will inform the user if this happens.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_engine.c     |  5 +++++
>>>   drivers/gpu/drm/xe/xe_exec.c       |  2 +-
>>>   drivers/gpu/drm/xe/xe_trace.h      |  5 +++++
>>>   drivers/gpu/drm/xe/xe_vm.c         | 27 +++++++++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_vm.h         | 10 ++++++++++
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
>>>   drivers/gpu/drm/xe/xe_vm_types.h   |  5 +++--
>>>   7 files changed, 48 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_engine.c
>>> b/drivers/gpu/drm/xe/xe_engine.c
>>> index b3036c4a8ec3..b1f808c08dc5 100644
>>> --- a/drivers/gpu/drm/xe/xe_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>>> @@ -597,6 +597,11 @@ int xe_engine_create_ioctl(struct drm_device
>>> *dev, void *data,
>>>                  if (XE_IOCTL_ERR(xe, !vm))
>>>                          return -ENOENT;
>>>   
>>> +               if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm)))
>>> {
>>> +                       xe_vm_put(vm);
>>> +                       return -ENOENT;
>>> +               }
>> Hm. What if the VM gets banned exactly here? Shouldn't the banned and
>> closed status be read inside a vm lock? (which must then protect the
>> entire vm->flags member)
>>
> It doesn't really matter, worst case we create an engine, we won't be
> able to submit to it as the exec has the same check. I can move if you
> think it is a big deal IMO it is not.

It's possible that it works, but we need to be able to rely on the 
locking rules to keep code maintainable in the long run. Here for 
example "vm flags are protected by the vm lock". Otherwise at least I 
would have to go and look up "what happens if we close a vm and then 
create an engine, if closing the vm did something to engines that we 
miss for that engine we create" everytime I see suspicious constructs 
like that.

So yes, I'd say we need to make this check under the vm lock.

/Thomas


>
> Matt
>
>> /Thomas
>>
>>
>>> +
>>>                  e = xe_engine_create(xe, vm, logical_mask,
>>>                                       args->width, hwe,
>>> ENGINE_FLAG_PERSISTENT);
>>>                  xe_vm_put(vm);
>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c
>>> b/drivers/gpu/drm/xe/xe_exec.c
>>> index e44076ee2e11..27c11812d733 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>> @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void
>>> *data, struct drm_file *file)
>>>          if (err)
>>>                  goto err_unlock_list;
>>>   
>>> -       if (xe_vm_is_closed(engine->vm)) {
>>> +       if (xe_vm_is_closed_or_banned(engine->vm)) {
>>>                  drm_warn(&xe->drm, "Trying to schedule after vm is
>>> closed\n");
>>>                  err = -EIO;
>>>                  goto err_engine_end;
>>> diff --git a/drivers/gpu/drm/xe/xe_trace.h
>>> b/drivers/gpu/drm/xe/xe_trace.h
>>> index 2f8eb7ebe9a7..eb89ac934394 100644
>>> --- a/drivers/gpu/drm/xe/xe_trace.h
>>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>>> @@ -472,6 +472,11 @@ DECLARE_EVENT_CLASS(xe_vm,
>>>                                __entry->asid)
>>>   );
>>>   
>>> +DEFINE_EVENT(xe_vm, xe_vm_kill,
>>> +            TP_PROTO(struct xe_vm *vm),
>>> +            TP_ARGS(vm)
>>> +);
>>> +
>>>   DEFINE_EVENT(xe_vm, xe_vm_create,
>>>               TP_PROTO(struct xe_vm *vm),
>>>               TP_ARGS(vm)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index e4311c48cc54..1966a583b761 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -514,6 +514,24 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>>   
>>>   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>>>   
>>> +static void xe_vm_kill(struct xe_vm *vm)
>>> +{
>>> +       struct ww_acquire_ctx ww;
>>> +       struct xe_engine *e;
>>> +
>>> +       lockdep_assert_held(&vm->lock);
>>> +
>>> +       xe_vm_lock(vm, &ww, 0, false);
>>> +       vm->flags |= XE_VM_FLAG_BANNED;
>>> +       trace_xe_vm_kill(vm);
>>> +
>>> +       list_for_each_entry(e, &vm->preempt.engines, compute.link)
>>> +               e->ops->kill(e);
>>> +       xe_vm_unlock(vm, &ww);
>>> +
>>> +       /* TODO: Inform user the VM is banned */
>>> +}
>>> +
>>>   static void preempt_rebind_work_func(struct work_struct *w)
>>>   {
>>>          struct xe_vm *vm = container_of(w, struct xe_vm,
>>> preempt.rebind_work);
>>> @@ -533,7 +551,7 @@ static void preempt_rebind_work_func(struct
>>> work_struct *w)
>>>          XE_BUG_ON(!xe_vm_in_compute_mode(vm));
>>>          trace_xe_vm_rebind_worker_enter(vm);
>>>   
>>> -       if (xe_vm_is_closed(vm)) {
>>> +       if (xe_vm_is_closed_or_banned(vm)) {
>>>                  trace_xe_vm_rebind_worker_exit(vm);
>>>                  return;
>>>          }
>>> @@ -662,11 +680,12 @@ static void preempt_rebind_work_func(struct
>>> work_struct *w)
>>>                          goto retry;
>>>                  }
>>>          }
>>> +       if (err)
>>> +               xe_vm_kill(vm);
>>>          up_write(&vm->lock);
>>>   
>>>          free_preempt_fences(&preempt_fences);
>>>   
>>> -       XE_WARN_ON(err < 0);    /* TODO: Kill VM or put in error
>>> state */
>>>          trace_xe_vm_rebind_worker_exit(vm);
>>>   }
>>>   
>>> @@ -1127,7 +1146,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm,
>>> const struct xe_vma *vma)
>>>   {
>>>          struct rb_node *node;
>>>   
>>> -       if (xe_vm_is_closed(vm))
>>> +       if (xe_vm_is_closed_or_banned(vm))
>>>                  return NULL;
>>>   
>>>          XE_BUG_ON(vma->end >= vm->size);
>>> @@ -3048,7 +3067,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
>>> void *data, struct drm_file *file)
>>>                  goto free_objs;
>>>          }
>>>   
>>> -       if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
>>> +       if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
>>>                  drm_err(dev, "VM closed while we began looking
>>> up?\n");
>>>                  err = -ENOENT;
>>>                  goto put_vm;
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index 372f26153209..858207a20017 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -49,6 +49,16 @@ static inline bool xe_vm_is_closed(struct xe_vm
>>> *vm)
>>>          return !vm->size;
>>>   }
>>>   
>>> +static inline bool xe_vm_is_banned(struct xe_vm *vm)
>>> +{
>>> +       return vm->flags & XE_VM_FLAG_BANNED;
>>> +}
>>> +
>>> +static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
>>> +{
>>> +       return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
>>> +}
>>> +
>>>   struct xe_vma *
>>>   xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma
>>> *vma);
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index 0f5eef337037..76458f8d57f3 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -313,7 +313,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>>> void *data,
>>>          if (XE_IOCTL_ERR(xe, !vm))
>>>                  return -EINVAL;
>>>   
>>> -       if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
>>> +       if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
>>>                  err = -ENOENT;
>>>                  goto put_vm;
>>>          }
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>> index 76af6ac0fa84..566b67abe1c3 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>> @@ -178,8 +178,9 @@ struct xe_vm {
>>>   #define XE_VM_FLAG_MIGRATION           BIT(3)
>>>   #define XE_VM_FLAG_SCRATCH_PAGE                BIT(4)
>>>   #define XE_VM_FLAG_FAULT_MODE          BIT(5)
>>> -#define XE_VM_FLAG_GT_ID(flags)                (((flags) >> 6) &
>>> 0x3)
>>> -#define XE_VM_FLAG_SET_TILE_ID(tile)   ((tile)->id << 6)
>>> +#define XE_VM_FLAG_BANNED              BIT(6)
>>> +#define XE_VM_FLAG_GT_ID(flags)                (((flags) >> 7) &
>>> 0x3)
>>> +#define XE_VM_FLAG_SET_TILE_ID(tile)   ((tile)->id << 7)
>>>          unsigned long flags;
>>>   
>>>          /** @composite_fence_ctx: context composite fence */
