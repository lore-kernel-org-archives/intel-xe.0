Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B13C021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 09:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228810E3A7;
	Mon, 17 Feb 2025 09:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbZjjzek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6C10E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739785109; x=1771321109;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xH3Hy9dhQ6bLZ5I/SDFGnVKNoil9bC2Prv+SGWvQUR4=;
 b=QbZjjzek1501wnwYEpa0AvQa9Yg9Vz3nxj9fAeFmYn7KOwbRzWSVUc46
 garkdNRRKda1lKgGnZV0/4Qo0ZqVKcJsbdR8WIX52B/29uG0B6BdRNmG7
 NGxkSnLOMl5tMOzZ0YiuDdshFRmQMdINQ1P0/onHDSwz9gMu8WQ5FHZMV
 M77DEACNC/v8qDBrcA+LTOiSjyXtGl6FzAB1U7CAWg+SHKcbessjNQNQX
 C9sjOFG4N6szifkgd9QcJOElwjowqGIYJowX1/1l+iQN8+LRqIl6PpmEd
 mdxoj/Sn3oA/oo12xSnHNTMS3OWkClwPVfp1HZZ3LTMsFOiLUfszmlyNM g==;
X-CSE-ConnectionGUID: bBUy4yqTSqWX0keQBxjD4w==
X-CSE-MsgGUID: hu0pjsdCQNSo5ghfgyZE3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39648217"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="39648217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 01:38:29 -0800
X-CSE-ConnectionGUID: uXo9fve3QeKgAjAFvN0Akw==
X-CSE-MsgGUID: vFV/FOu/SjGBdlMfCgFiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114048859"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.174])
 ([10.245.244.174])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 01:38:28 -0800
Message-ID: <6fec16d5-cbf3-448b-9c07-85a079095f62@intel.com>
Date: Mon, 17 Feb 2025 09:38:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/userptr: restore invalidation list on error
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
References: <20250214170527.272182-4-matthew.auld@intel.com>
 <Z6/ttCTrEuwNsD6w@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z6/ttCTrEuwNsD6w@lstrano-desk.jf.intel.com>
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

On 15/02/2025 01:28, Matthew Brost wrote:
> On Fri, Feb 14, 2025 at 05:05:28PM +0000, Matthew Auld wrote:
>> On error restore anything still on the pin_list back to the invalidation
>> list on error. For the actual pin, so long as the vma is tracked on
>> either list it should get picked up on the next pin, however it looks
>> possible for the vma to get nuked but still be present on this per vm
>> pin_list leading to corruption. An alternative might be then to instead
>> just remove the link when destroying the vma.
>>
>> Fixes: ed2bdf3b264d ("drm/xe/vm: Subclass userptr vmas")
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v6.8+
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 26 +++++++++++++++++++-------
>>   1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d664f2e418b2..668b0bde7822 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -670,12 +670,12 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>>   	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
>>   				 userptr.invalidate_link) {
>>   		list_del_init(&uvma->userptr.invalidate_link);
>> -		list_move_tail(&uvma->userptr.repin_link,
>> -			       &vm->userptr.repin_list);
>> +		list_add_tail(&uvma->userptr.repin_link,
>> +			      &vm->userptr.repin_list);
> 
> Why this change?

Just that with this patch the repin_link should now always be empty at 
this point, I think. add should complain if that is not the case.

> 
>>   	}
>>   	spin_unlock(&vm->userptr.invalidated_lock);
>>   
>> -	/* Pin and move to temporary list */
>> +	/* Pin and move to bind list */
>>   	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>>   				 userptr.repin_link) {
>>   		err = xe_vma_userptr_pin_pages(uvma);
>> @@ -691,10 +691,10 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>>   			err = xe_vm_invalidate_vma(&uvma->vma);
>>   			xe_vm_unlock(vm);
>>   			if (err)
>> -				return err;
>> +				break;
>>   		} else {
>> -			if (err < 0)
>> -				return err;
>> +			if (err)
>> +				break;
>>   
>>   			list_del_init(&uvma->userptr.repin_link);
>>   			list_move_tail(&uvma->vma.combined_links.rebind,
>> @@ -702,7 +702,19 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>>   		}
>>   	}
>>   
>> -	return 0;
>> +	if (err) {
>> +		down_write(&vm->userptr.notifier_lock);
> 
> Can you explain why you take the notifier lock here? I don't think this
> required unless I'm missing something.

For the invalidated list, the docs say:

"Removing items from the list additionally requires @lock in write mode, 
and adding items to the list requires the @userptr.notifer_lock in write 
mode."

Not sure if the docs needs to be updated here?

> 
> Matt
> 
>> +		spin_lock(&vm->userptr.invalidated_lock);
>> +		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>> +					 userptr.repin_link) {
>> +			list_del_init(&uvma->userptr.repin_link);
>> +			list_move_tail(&uvma->userptr.invalidate_link,
>> +				       &vm->userptr.invalidated);
>> +		}
>> +		spin_unlock(&vm->userptr.invalidated_lock);
>> +		up_write(&vm->userptr.notifier_lock);
>> +	}
>> +	return err;
>>   }
>>   
>>   /**
>> -- 
>> 2.48.1
>>

