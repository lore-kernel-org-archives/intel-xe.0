Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7825AC6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4979510E046;
	Fri, 24 Mar 2023 16:25:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9112210E046
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679675146; x=1711211146;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J2SuZHB9zDxbXrTh3jDpUKgEqsAcA1faczuif6CTd/Q=;
 b=anZsTb5ls9XCds3VHy7aS7aRXFnyO1wf6DJyhSsLW4zWpAYviQ33TYXH
 ZbqqstDZjOnCIKplEZleI9cCg2M7rkciRGzmA61kqssdJ9WJUWFiYLK1v
 +QMrSQWdPtvITa7pvESuoKrF1NZ3bVf8HGZy6hZPdh2dLB6YIwsPyFHBo
 AJpnW5kV9lvseq+l98IFo7oI2GG0ZIKnhFg8OBBNvR3kgZwidSzwhfp2m
 4AgIthfiJuTzbaj/nbd1K1du5nW0eRfHZ93/skF9yltDsdxxCHgUIjAud
 M8hKGhzyExEs1D0SB7m4rELWVtmnM6+l7J27Utk3oTluJtU1WnYk13VKX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="404737272"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="404737272"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="660113871"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="660113871"
Received: from bherle-mobl.ger.corp.intel.com (HELO [10.252.38.170])
 ([10.252.38.170])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:25:45 -0700
Message-ID: <884e2a18-25d2-864f-eb9a-e3daf1e0d87f@linux.intel.com>
Date: Fri, 24 Mar 2023 17:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-3-matthew.brost@intel.com>
 <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK> <ZB1PRMW0fmWvuVs3@DUT025-TGLU.fm.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZB1PRMW0fmWvuVs3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Move in fault mode / non-fault
 mode check to xe_vm_create
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2023-03-24 08:20, Matthew Brost wrote:
> On Thu, Mar 23, 2023 at 11:10:17PM -0700, Niranjana Vishwanathapura wrote:
>> On Tue, Mar 21, 2023 at 04:42:17PM -0700, Matthew Brost wrote:
>>> The check for fault mode / non-fault mode was in the VM create IOCTL
>>> before VM creation and not under a lock. The increment was after VM
>>> creation under the lock. This is racey. Move both the check and
>>> increment to xe_vm_create before actual creation and have the lock for
>>> both of these steps.
>>>
>>> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_vm.c | 45 ++++++++++++++++++++++++--------------
>>> 1 file changed, 28 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index e7674612a57e..965cad81b02a 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1060,9 +1060,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>> 	struct xe_gt *gt;
>>> 	u8 id;
>>>
>>> +	err = mutex_lock_interruptible(&xe->usm.lock);
>>> +	if (err)
>>> +		return ERR_PTR(err);
>>> +	if (XE_IOCTL_ERR(xe, flags & XE_VM_FLAG_FAULT_MODE &&
>>> +			 xe_device_in_non_fault_mode(xe)) ||
>>> +	    XE_IOCTL_ERR(xe, !(flags & XE_VM_FLAG_MIGRATION) &&
>>> +			 xe_device_in_fault_mode(xe))) {
>> NIT...is below simplification any better?
>>
>> bool fault_mode = !!(flags & XE_VM_FLAG_FAULT_MODE);
>> if (XE_IOCTL_ERR(xe, fault_mode != xe_device_in_fault_mode(xe))
>>
> Sure.

This will not work correctly when fault_mode and non_fault_mode are both 
false (eg first context created).

I'd jsut leave this patch as it is now.

~Maarten

>   
>>> +		mutex_unlock(&xe->usm.lock);
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +	if (flags & XE_VM_FLAG_FAULT_MODE)
>>> +		xe->usm.num_vm_in_fault_mode++;
>>> +	else if (!(flags & XE_VM_FLAG_MIGRATION))
>>> +		xe->usm.num_vm_in_non_fault_mode++;
>>> +	mutex_unlock(&xe->usm.lock);
>>> +
>>> 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
>>> -	if (!vm)
>>> -		return ERR_PTR(-ENOMEM);
>>> +	if (!vm) {
>>> +		err = -ENOMEM;
>>> +		goto err_usm;
>>> +	}
>>>
>>> 	vm->xe = xe;
>>> 	kref_init(&vm->refcount);
>>> @@ -1182,13 +1200,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>> 	if (number_gts > 1)
>>> 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>>>
>>> -	mutex_lock(&xe->usm.lock);
>>> -	if (flags & XE_VM_FLAG_FAULT_MODE)
>>> -		xe->usm.num_vm_in_fault_mode++;
>>> -	else if (!(flags & XE_VM_FLAG_MIGRATION))
>>> -		xe->usm.num_vm_in_non_fault_mode++;
>>> -	mutex_unlock(&xe->usm.lock);
>>> -
>>> 	trace_xe_vm_create(vm);
>>>
>>> 	return vm;
>>> @@ -1220,6 +1231,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>> 		xe_device_mem_access_put(xe);
>>> 		xe_pm_runtime_put(xe);
>>> 	}
>>> +err_usm:
>>> +	mutex_lock(&xe->usm.lock);
>>> +	if (flags & XE_VM_FLAG_FAULT_MODE)
>>> +		xe->usm.num_vm_in_fault_mode--;
>>> +	else if (!(flags & XE_VM_FLAG_MIGRATION))
>>> +		xe->usm.num_vm_in_non_fault_mode--;
>>> +	mutex_unlock(&xe->usm.lock);
>>> +
>> Perhaps put these counts increment/decrement blocks into functions
>> instead of duplicating them?
>>
> Sure.
>
> Matt
>   
>> Niranjana
>>
>>> 	return ERR_PTR(err);
>>> }
>>>
>>> @@ -1843,14 +1862,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>> 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>>> 		return -EINVAL;
>>>
>>> -	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
>>> -			 xe_device_in_non_fault_mode(xe)))
>>> -		return -EINVAL;
>>> -
>>> -	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
>>> -			 xe_device_in_fault_mode(xe)))
>>> -		return -EINVAL;
>>> -
>>> 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
>>> 			 !xe->info.supports_usm))
>>> 		return -EINVAL;
>>> -- 
>>> 2.34.1
>>>
