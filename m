Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF00C001DB
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 14:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE5710E200;
	Mon,  7 Aug 2023 14:41:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148D610E298
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691419306; x=1722955306;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BYbiVbzCKqcU2ADWvDUUg7vU7bb39/DqG+b66PSMdIE=;
 b=KBUrzlcEaKOMUKbiDx5y33hZznbzlz/VTnhWgxHE5GeVtS+4ozhUUr2m
 HHVNANEtuFgYZXE1TmIbkpmlvJt1VX5HhsGjKWbUEsrn4q0etQRBbvC16
 nM56/xrdhYudHTggNe8T+P7VSWqZJrfAahDONkY3WFmuSondqYXDv1DpI
 mkKIgn4fBLZQFmP2O7IT79vGCYC90IvNIH75gATvv7n9TOFqANyYyqj9f
 gESF929p8gqDn8xbULeSWJHqFSDSQ5A1MEzyH+KjKs5ckZddykOcbmTLp
 nx6Mh6PGoPFd9fVq6sw8/OGrVNs6nf4j/zDSYYmjU2QuTMnoywoG7E/IK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373315540"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="373315540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766021809"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="766021809"
Received: from katemurp-mobl.ger.corp.intel.com (HELO [10.252.17.251])
 ([10.252.17.251])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:41:44 -0700
Message-ID: <1019a70e-cbbc-e6e7-28b0-39666e3e9a88@intel.com>
Date: Mon, 7 Aug 2023 15:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230807130226.49777-2-matthew.auld@intel.com>
 <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
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

On 07/08/2023 14:28, Matthew Brost wrote:
> On Mon, Aug 07, 2023 at 02:02:27PM +0100, Matthew Auld wrote:
>> It looks like it's plausible for eviction to be happening as we are
>> closing the vm, however the rebind_link and destroy links are in this
>> case not mutually exclusive, since eviction only needs the vm dma-resv
>> lock which the vm close drops when accessing the contested list. If we
>> race with eviction here it can run rampant and corrupt the list since
>> both the destroy and rebind links are the same list entry underneath.
>> Simplest is to just split these entries into separate links.
>>
> 
> I think there is another problem here too, I think
> vm->notifier.rebind_list could be corrupted too.

AFAICT that one always has vm->lock held, and close_and_put() doesn't 
release it until nuking the vma, so I think it's fine?

> 
> I think a better solution is to check the XE_VMA_DESTROYED bit in
> xe_bo_trigger_rebind before adding to either the
> vm->notifier.rebind_list or vm->rebind_list. Both checks should done
> under the list locks.

Ok, let me try that. Thanks for reviewing.

> 
> Matt
> 
>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 10 +++++-----
>>   drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
>>   2 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index cb28dbc2bdbb..aa13b2bcda86 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -891,6 +891,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	}
>>   
>>   	INIT_LIST_HEAD(&vma->combined_links.rebind);
>> +	INIT_LIST_HEAD(&vma->destroy_link);
>>   	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>>   	INIT_LIST_HEAD(&vma->extobj.link);
>>   
>> @@ -1063,7 +1064,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
>> +	XE_WARN_ON(!list_empty(&vma->destroy_link));
>>   
>>   	if (xe_vma_is_userptr(vma)) {
>>   		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>> @@ -1449,7 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>   			continue;
>>   		}
>>   
>> -		list_move_tail(&vma->combined_links.destroy, &contested);
>> +		list_add_tail(&vma->destroy_link, &contested);
>>   	}
>>   
>>   	/*
>> @@ -1477,9 +1478,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>   	 * Since we hold a refcount to the bo, we can remove and free
>>   	 * the members safely without locking.
>>   	 */
>> -	list_for_each_entry_safe(vma, next_vma, &contested,
>> -				 combined_links.destroy) {
>> -		list_del_init(&vma->combined_links.destroy);
>> +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
>> +		list_del_init(&vma->destroy_link);
>>   		xe_vma_destroy_unlocked(vma);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 3681a5ff588b..a01dde418803 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -79,13 +79,14 @@ struct xe_vma {
>>   		 * mutually exclusive execution with userptr.
>>   		 */
>>   		struct list_head rebind;
>> -		/**
>> -		 * @destroy: link to contested list when VM is being closed.
>> -		 * Protected by vm->lock in write mode and vm's resv lock.
>> -		 */
>> -		struct list_head destroy;
>>   	} combined_links;
>>   
>> +	/**
>> +	 * @destroy_link: link to contested list when VM is being closed.
>> +	 * Protected by vm->lock in write mode and vm's resv lock.
>> +	 */
>> +	struct list_head destroy_link;
>> +
>>   	union {
>>   		/** @destroy_cb: callback to destroy VMA when unbind job is done */
>>   		struct dma_fence_cb destroy_cb;
>> -- 
>> 2.41.0
>>
