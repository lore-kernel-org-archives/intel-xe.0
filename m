Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F568C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183F210E334;
	Tue,  9 May 2023 06:57:47 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87AC10E33D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683615465; x=1715151465;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TCaneIgBl1mguHHUCRLj2duWbkoRRe5p9pMFcyPxYbM=;
 b=MpdgOSrHCkdCuQwbRr6BCqB8mmV23VOPXZ2m9uKPXDiM/NjnpibRhJtl
 AYi2WqWw4bZuYkPu4BA44HFQzlg1110UJjXlS2h/bMX3yFpwvMZixzOU7
 EGutTKwyu2DrjTFcd9WL+fcuHzNjVHKXWQMnV9OjOhCUbnI5Ml5/4B/kO
 4+CsZTY0brIoPZNVTvfYMl5ea/4jiaxOFjSM+YQ7q0TXQLf5MYiViPjMr
 cQa0dkbWUH84E5A232zKN67MYtAumjgSIsc4kldp0vm0uSWZW3QjruyA/
 u3wwTnPwWaYqz5v6bm07No5rmKTH2qgkswB5/z89jWf0A6Cq9l36kyYLr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413091725"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="413091725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="842985229"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="842985229"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:57:43 -0700
Message-ID: <e5cfbffd-679d-0229-0b77-0d7b08d83f5a@linux.intel.com>
Date: Tue, 9 May 2023 08:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
 <20230509052419.28430-2-niranjana.vishwanathapura@intel.com>
 <0a9ebdbf622ae83936ddb7960d86d9998249bba0.camel@intel.com>
 <ZFnpLMBkjSlu4HM/@nvishwa1-DESK>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFnpLMBkjSlu4HM/@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Handle -EDEADLK case in preempt
 worker
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/9/23 08:33, Niranjana Vishwanathapura wrote:
> On Mon, May 08, 2023 at 10:46:48PM -0700, Hellstrom, Thomas wrote:
>> On Mon, 2023-05-08 at 22:24 -0700, Niranjana Vishwanathapura wrote:
>>> With multiple active VMs, under memory pressure, it is possible that
>>> ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
>>> return -ENOMEM.
>>>
>>> Until ttm properly handles locking in such scenarios, best thing the
>>> driver can do is unwind the lock and retry.
>>>
>>> Update preempt worker to retry validating BOs with a timeout upon
>>> -ENOMEM and while at it, apply the timeout for retries upon -EAGAIN
>>> as well.
>>>
>>> Signed-off-by: Niranjana Vishwanathapura
>>> <niranjana.vishwanathapura@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++++++++++---
>>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 91576cec000d..d92c9f659ab3 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -10,6 +10,7 @@
>>>  #include <drm/ttm/ttm_execbuf_util.h>
>>>  #include <drm/ttm/ttm_tt.h>
>>>  #include <drm/xe_drm.h>
>>> +#include <linux/delay.h>
>>>  #include <linux/kthread.h>
>>>  #include <linux/mm.h>
>>>  #include <linux/swap.h>
>>> @@ -508,6 +509,8 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>>                 kvfree(tv);
>>>  }
>>>
>>> +#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>>> +
>>>  static void preempt_rebind_work_func(struct work_struct *w)
>>>  {
>>>         struct xe_vm *vm = container_of(w, struct xe_vm,
>>> preempt.rebind_work);
>>> @@ -519,6 +522,7 @@ static void preempt_rebind_work_func(struct
>>> work_struct *w)
>>>         struct dma_fence *rebind_fence;
>>>         unsigned int fence_count = 0;
>>>         LIST_HEAD(preempt_fences);
>>> +       ktime_t end = 0;
>>>         int err;
>>>         long wait;
>>>         int __maybe_unused tries = 0;
>>> @@ -633,9 +637,24 @@ static void preempt_rebind_work_func(struct
>>> work_struct *w)
>>>  out_unlock:
>>>         xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>>>  out_unlock_outer:
>>> -       if (err == -EAGAIN) {
>>> -               trace_xe_vm_rebind_worker_retry(vm);
>>> -               goto retry;
>>> +       /*
>>> +        * With multiple active VMs, under memory pressure, it is
>>> possible that
>>> +        * ttm_bo_validate() run into -EDEADLK and in such case
>>> returns -ENOMEM.
>>> +        * Until ttm properly handles locking in such scenarios, best
>>> thing the
>>> +        * driver can do is retry with a timeout. Apply timeout for
>>> retries upon
>>> +        * -EAGAIN as well instead of indefinitely retrying. Killing
>>> the VM or
>>> +        * putting it in error state after timeout or other error
>>> scenarios is
>>> +        * still TBD.
>>> +        */
>>> +       if ((err == -EAGAIN) || (err == -ENOMEM)) {
>>
>> We should not timeout for userptr -EAGAIN, see previous mail.
>> Otherwise LGTM.
>
> Ok, will leave -EAGAIN as is.
>
> Niranjana


Thanks. If we later find out somehow it might be needed, it's a much 
bigger change involving multiple retry points so we should tackle that 
separately anyway.

Thomas


>
>>
>>> +               ktime_t cur = ktime_get();
>>> +
>>> +               end = end ? : ktime_add_ms(cur,
>>> XE_VM_REBIND_RETRY_TIMEOUT_MS);
>>> +               if (ktime_before(cur, end)) {
>>> +                       msleep(20);
>>> +                       trace_xe_vm_rebind_worker_retry(vm);
>>> +                       goto retry;
>>> +               }
>>>         }
>>>         up_write(&vm->lock);
>>>
>>
