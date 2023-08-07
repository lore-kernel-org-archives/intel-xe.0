Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C127C00528
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 16:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838A710E2F4;
	Mon,  7 Aug 2023 16:51:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549738826D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691427087; x=1722963087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oochgSx34i/N1VbB2Kd0e4FWWro7CFF4S4KBBBy7GKw=;
 b=b7P+5KIiHlT3z5rD3Ve2XZFGT7mG3OtvOu5ch4T4KiuR/eWsfI/B87mW
 G9U+Ge26J2ZjljM28NmEUGVe50DqSUl16oy0JIFf/H9BEF2hizOUyq0tb
 XKgDXyLbh9OPRRZTaL3jfY7IMbV6n/zqPSFdardx6jTHGrXcUMHLHk6zH
 eNlX2OXGNlX+5nrXzFnwTIZGPjkYTo6vhd8NmlhS93fEMQj8P46jBnaB3
 QgTnn3XAormwHrbUAA8CWdsW4tuthcvgd2DZL/SASeJPuZA9rGDo86M5q
 prfpfOw9d2zEtABxIf6gtezZCF+1OB5trjafr2JBbrHT/cm68GVHTN7oP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360683850"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="360683850"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 09:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977515578"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="977515578"
Received: from katemurp-mobl.ger.corp.intel.com (HELO [10.252.17.251])
 ([10.252.17.251])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 09:51:25 -0700
Message-ID: <e6d25a26-1f48-9d7e-1d99-9fe98f4d6e8a@intel.com>
Date: Mon, 7 Aug 2023 17:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20230807130226.49777-2-matthew.auld@intel.com>
 <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
 <1019a70e-cbbc-e6e7-28b0-39666e3e9a88@intel.com>
 <ZNEEhcq8YTR0CbjO@DUT025-TGLU.fm.intel.com>
 <8f6fc52a-addc-d1f8-e8c9-47bc8e6bcc41@intel.com>
 <ZNEY8D9eU/xh4wRY@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZNEY8D9eU/xh4wRY@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: uncombine the
 combined_links.destroy
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

On 07/08/2023 17:16, Matthew Brost wrote:
> On Mon, Aug 07, 2023 at 04:19:46PM +0100, Matthew Auld wrote:
>> On 07/08/2023 15:49, Matthew Brost wrote:
>>> On Mon, Aug 07, 2023 at 03:41:30PM +0100, Matthew Auld wrote:
>>>> On 07/08/2023 14:28, Matthew Brost wrote:
>>>>> On Mon, Aug 07, 2023 at 02:02:27PM +0100, Matthew Auld wrote:
>>>>>> It looks like it's plausible for eviction to be happening as we are
>>>>>> closing the vm, however the rebind_link and destroy links are in this
>>>>>> case not mutually exclusive, since eviction only needs the vm dma-resv
>>>>>> lock which the vm close drops when accessing the contested list. If we
>>>>>> race with eviction here it can run rampant and corrupt the list since
>>>>>> both the destroy and rebind links are the same list entry underneath.
>>>>>> Simplest is to just split these entries into separate links.
>>>>>>
>>>>>
>>>>> I think there is another problem here too, I think
>>>>> vm->notifier.rebind_list could be corrupted too.
>>>>
>>>> AFAICT that one always has vm->lock held, and close_and_put() doesn't
>>>> release it until nuking the vma, so I think it's fine?
>>>>
>>>
>>> External BOs do not hold the VM->lock in xe_bo_trigger_rebind so I do
>>> think there is a potenial issue.
>>
>> Maybe I'm misunderstanding something as I only see it being added to
>> vm->notifier.rebind_list, which doesn't involve the combined_links. Once it
>> can fully lock the vm later, when for example doing xe_vm_lock_dma_resv(),
>> it moves it to the real vm->rebind_list but at that point we are holding the
>> vm->lock, and if the vma was since nuked we never actually transfer it.
>>
> 
> It is not related to the combined list, rather a race between
> close_and_put & trigger_rebind.
> 
> close_and_put can remove from the vm->notifier.rebind_list, then
> trigger_rebind can add it back in, VMA is destroyed, and now we have
> destroyed (corrupt memory) on the vm->notifier.rebind_list.
> 
> Make sense?

I'm still not seeing it tbh. AFAICT trigger_rebind/eviction needs the bo 
lock and so does destroying the vma (if applicable). If vma destruction 
runs first then the vma will be gone from the list of vmas for that 
object, so eviction never sees it. If the eviction ran first then vma 
destruction will simply remove it from the list. So the actual vma 
destroy vs trigger_rebind looks to be serialised to me.

> 
> Matt
> 
>>>
>>> Matt
>>>
>>>>>
>>>>> I think a better solution is to check the XE_VMA_DESTROYED bit in
>>>>> xe_bo_trigger_rebind before adding to either the
>>>>> vm->notifier.rebind_list or vm->rebind_list. Both checks should done
>>>>> under the list locks.
>>>>
>>>> Ok, let me try that. Thanks for reviewing.
>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_vm.c       | 10 +++++-----
>>>>>>     drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
>>>>>>     2 files changed, 11 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> index cb28dbc2bdbb..aa13b2bcda86 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> @@ -891,6 +891,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>>>>     	}
>>>>>>     	INIT_LIST_HEAD(&vma->combined_links.rebind);
>>>>>> +	INIT_LIST_HEAD(&vma->destroy_link);
>>>>>>     	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>>>>>>     	INIT_LIST_HEAD(&vma->extobj.link);
>>>>>> @@ -1063,7 +1064,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>>>>>     	struct xe_vm *vm = xe_vma_vm(vma);
>>>>>>     	lockdep_assert_held_write(&vm->lock);
>>>>>> -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
>>>>>> +	XE_WARN_ON(!list_empty(&vma->destroy_link));
>>>>>>     	if (xe_vma_is_userptr(vma)) {
>>>>>>     		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>>>>>> @@ -1449,7 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>>>>>     			continue;
>>>>>>     		}
>>>>>> -		list_move_tail(&vma->combined_links.destroy, &contested);
>>>>>> +		list_add_tail(&vma->destroy_link, &contested);
>>>>>>     	}
>>>>>>     	/*
>>>>>> @@ -1477,9 +1478,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>>>>>     	 * Since we hold a refcount to the bo, we can remove and free
>>>>>>     	 * the members safely without locking.
>>>>>>     	 */
>>>>>> -	list_for_each_entry_safe(vma, next_vma, &contested,
>>>>>> -				 combined_links.destroy) {
>>>>>> -		list_del_init(&vma->combined_links.destroy);
>>>>>> +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
>>>>>> +		list_del_init(&vma->destroy_link);
>>>>>>     		xe_vma_destroy_unlocked(vma);
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> index 3681a5ff588b..a01dde418803 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> @@ -79,13 +79,14 @@ struct xe_vma {
>>>>>>     		 * mutually exclusive execution with userptr.
>>>>>>     		 */
>>>>>>     		struct list_head rebind;
>>>>>> -		/**
>>>>>> -		 * @destroy: link to contested list when VM is being closed.
>>>>>> -		 * Protected by vm->lock in write mode and vm's resv lock.
>>>>>> -		 */
>>>>>> -		struct list_head destroy;
>>>>>>     	} combined_links;
>>>>>> +	/**
>>>>>> +	 * @destroy_link: link to contested list when VM is being closed.
>>>>>> +	 * Protected by vm->lock in write mode and vm's resv lock.
>>>>>> +	 */
>>>>>> +	struct list_head destroy_link;
>>>>>> +
>>>>>>     	union {
>>>>>>     		/** @destroy_cb: callback to destroy VMA when unbind job is done */
>>>>>>     		struct dma_fence_cb destroy_cb;
>>>>>> -- 
>>>>>> 2.41.0
>>>>>>
