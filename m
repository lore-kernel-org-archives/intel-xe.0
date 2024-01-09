Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB9C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 18:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D110E49B;
	Tue,  9 Jan 2024 18:49:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9B10E49B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704826190; x=1736362190;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+TTK47wAEypdd91d0SZrPxBTLpJHdNhQLY9iD9NfXqU=;
 b=d78pDpuoN46B6Br9GCG3hNiUVL4ShMK4it4/DmDMGFF37fiscV5rJpTH
 fFOiKuWN41/hbYeTuSfvz42uqZSRk2fzyX1Tsyzjcqlqjd+jqjnUNtiP4
 E24aBEOznY1yTJzL7X5magRiisNQ8zAlqnlCrqtpr1EStIoFij+t5EDq/
 rkdzqdsPhPIira5o7He7t7H3HnxFD5GQCV4Nuj3vhAVBK8eBygQzZO0TR
 EKH597MlOnGShfTOlu8LodFgp1uygGud35HY3N4cafDM5KYYUoXntX5OA
 6zELVxdOZe62NjYWWSNw3vxJ1vBQkksUJDlQw7PSSj1USoEOJfhYBE48P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5067201"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5067201"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925362034"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="925362034"
Received: from hmanning-mobl.ger.corp.intel.com (HELO [10.252.14.148])
 ([10.252.14.148])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:49:49 -0800
Message-ID: <062c816f-b825-4b8c-aacf-2e4221398455@intel.com>
Date: Tue, 9 Jan 2024 18:49:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/20] drm/xe: Remove mem_access calls from migration
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-17-rodrigo.vivi@intel.com>
 <0c1b0948-0a00-4881-af37-e47573687c0e@intel.com> <ZZ2JW1NQVVkNMsAw@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZZ2JW1NQVVkNMsAw@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09/01/2024 17:58, Rodrigo Vivi wrote:
> On Tue, Jan 09, 2024 at 12:33:25PM +0000, Matthew Auld wrote:
>> On 28/12/2023 02:12, Rodrigo Vivi wrote:
>>> The sched jobs runtime pm calls already protects every execution,
>>> including these migration ones.
>>
>> Is job really enough here? I assume queue is only destroyed once it has no
>> more jobs and the final queue ref is dropped. And destroying the queue might
>> involve stuff like de-register the context with GuC etc. which needs to use
>> CT which will need rpm ref. What is holding the rpm if not the vm or queue?
> 
> The exec queue is holding to the end.

Can you share some more details? AFAIK the queue destruction is async, 
and previously the vm underneath is holding the rpm or in the case of 
migration vm, if was the queue itself. But for the migration vm case 
that is removed below. I guess I'm missing something here.

> 
>>
>>>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/tests/xe_migrate.c |  2 --
>>>    drivers/gpu/drm/xe/xe_device.c        | 17 -----------------
>>>    drivers/gpu/drm/xe/xe_device.h        |  1 -
>>>    drivers/gpu/drm/xe/xe_exec_queue.c    | 18 ------------------
>>>    4 files changed, 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>> index 7a32faa2f6888..2257f0a28435b 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>> @@ -428,9 +428,7 @@ static int migrate_test_run_device(struct xe_device *xe)
>>>    		kunit_info(test, "Testing tile id %d.\n", id);
>>>    		xe_vm_lock(m->q->vm, true);
>>> -		xe_device_mem_access_get(xe);
>>>    		xe_migrate_sanity_test(m, test);
>>> -		xe_device_mem_access_put(xe);
>>>    		xe_vm_unlock(m->q->vm);
>>>    	}
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index ee9b6612eec43..a7bec49da49fa 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -675,23 +675,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
>>>    	XE_WARN_ON(xe_pm_runtime_suspended(xe));
>>>    }
>>> -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
>>> -{
>>> -	bool active;
>>> -
>>> -	if (xe_pm_read_callback_task(xe) == current)
>>> -		return true;
>>> -
>>> -	active = xe_pm_runtime_get_if_active(xe);
>>> -	if (active) {
>>> -		int ref = atomic_inc_return(&xe->mem_access.ref);
>>> -
>>> -		xe_assert(xe, ref != S32_MAX);
>>> -	}
>>> -
>>> -	return active;
>>> -}
>>> -
>>>    void xe_device_mem_access_get(struct xe_device *xe)
>>>    {
>>>    	int ref;
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>> index af8ac2e9e2709..4acf4c2973390 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -142,7 +142,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>>>    }
>>>    void xe_device_mem_access_get(struct xe_device *xe);
>>> -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
>>>    void xe_device_mem_access_put(struct xe_device *xe);
>>>    void xe_device_assert_mem_access(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 44fe8097b7cda..d3a8d2d8caaaf 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -87,17 +87,6 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>>>    	if (err)
>>>    		goto err_lrc;
>>> -	/*
>>> -	 * Normally the user vm holds an rpm ref to keep the device
>>> -	 * awake, and the context holds a ref for the vm, however for
>>> -	 * some engines we use the kernels migrate vm underneath which offers no
>>> -	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
>>> -	 * can perform GuC CT actions when needed. Caller is expected to have
>>> -	 * already grabbed the rpm ref outside any sensitive locks.
>>> -	 */
>>> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
>>> -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
>>> -
>>>    	return q;
>>>    err_lrc:
>>> @@ -172,8 +161,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>>    	for (i = 0; i < q->width; ++i)
>>>    		xe_lrc_finish(q->lrc + i);
>>> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>>> -		xe_device_mem_access_put(gt_to_xe(q->gt));
>>>    	if (q->vm)
>>>    		xe_vm_put(q->vm);
>>> @@ -643,9 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>    			if (XE_IOCTL_DBG(xe, !hwe))
>>>    				return -EINVAL;
>>> -			/* The migration vm doesn't hold rpm ref */
>>> -			xe_device_mem_access_get(xe);
>>> -
>>>    			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>>>    			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
>>>    						   args->width, hwe,
>>> @@ -655,8 +639,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>    						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
>>>    						    0));
>>> -			xe_device_mem_access_put(xe); /* now held by engine */
>>> -
>>>    			xe_vm_put(migrate_vm);
>>>    			if (IS_ERR(new)) {
>>>    				err = PTR_ERR(new);
