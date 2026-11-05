Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42489606A32C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N/Pvs4uz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386110E1C8;
	Thu,  5 Nov 2026 16:39:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A15810E1C8
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793896752; x=1825432752;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fEB+HnM16EiFsv+dKPmC8P4Ales4xuH58kCQ/9RX6lc=;
 b=N/Pvs4uzmKQ8xKQFR3TCCU+kAAR7MjG9KmZNw+AND+nSfjsksM0WLQqX
 07qo+hXGlxlP1CaNabwbdMNFI1TkW5RMb/Yl0dIo0zy2YhN62okSusOW1
 kYBMZDAb9cY0NsPuj4cp0fHUhOQdNl4Qq/kOBhG35olDxTS5brnuzR8m6
 8YJ+hIiwl4zbvZDlEfqEWx1CZp7jsSOXTGg0/J9jQpeDPoWNN10X4Xn1X
 Sb/qwCw1JOC+VeeDHAnQb/1IFrKhuTYIUmwreE9NLy0MOLP3su2RFgGQc
 N4fH0cQc5EPkczA4AhpjtDSuWe73pLWaEb3dcTTWf3bgtSuL2bD4Xxgqa g==;
X-CSE-ConnectionGUID: rrIT02AnSL+rDW2J2N7ioA==
X-CSE-MsgGUID: UV3koPZRSzStvODPGhWYdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2793005"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2793005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:39:12 -0800
X-CSE-ConnectionGUID: DJlKKjhMSDGjWYiER7MztA==
X-CSE-MsgGUID: IAXEM4PpSuqHvuCRNW0NcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7623998"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.225])
 ([10.245.244.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:39:10 -0800
Message-ID: <109e29f6-472f-4829-82f1-f3b5c4dab540@intel.com>
Date: Thu, 5 Nov 2026 16:39:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 2/2] drm/xe/pm: skip BO eviction on iGPU for non-hibernation
 sleep
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261105143547.1089207-3-matthew.auld@intel.com>
 <20261105143547.1089207-4-matthew.auld@intel.com>
 <sashiko-outbox-199288@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-199288@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 15:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe/pm: unblocked LR VM rebind worker during S2idle/S3 in xe_pm_notifier_callback()
> --
> 
> commit 02558a47cf40f27ef297c0a97e9f30441e04b641
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe/pm: skip BO eviction on iGPU for non-hibernation sleep
> 
> This commit distinguishes S4 hibernation from S2idle and S3 suspend and
> skips BO eviction and pinned BO preparation on iGPU platforms when not
> creating a hibernation image.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index f483b565d323f..a24424b0d1dd2 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
> [ ... ]
>> @@ -452,8 +460,13 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>>   				   unsigned long action, void *data)
>>   {
>>   	struct xe_device *xe = container_of(nb, struct xe_device, pm_notifier);
>> +	bool hibernate = (action == PM_HIBERNATION_PREPARE ||
>> +			  action == PM_POST_HIBERNATION);
>>   	int err = 0;
>>   
>> +	if (!xe_pm_needs_bo_evict(xe, hibernate))
>> +		return NOTIFY_DONE;
> 
> [Severity: High]
> Does returning early from xe_pm_notifier_callback() on iGPU during
> PM_SUSPEND_PREPARE and PM_POST_SUSPEND leave long-running VM rebind workers
> unblocked across S2idle and S3 suspend?
> 
> By returning before the switch statement when xe_pm_needs_bo_evict() is
> false, xe_pm_notifier_callback() skips reinit_completion(&xe->pm_block) on
> PM_SUSPEND_PREPARE as well as complete_all(&xe->pm_block) and
> xe_pm_wake_rebind_workers(xe) on PM_POST_SUSPEND.
> 
> Long-running VMs in preempt-fence mode run preempt_fence_work_func() on
> xe->preempt_fence_wq and preempt_rebind_work_func() on xe->ordered_wq,
> neither of which is allocated with WQ_FREEZABLE. Instead,
> preempt_rebind_work_func() relies on xe->pm_block to park itself onto
> xe->rebind_resume_list during system sleep:
> 
> drivers/gpu/drm/xe/xe_vm.c:preempt_rebind_work_func() {
> 	...
> 	if (!try_wait_for_completion(&vm->xe->pm_block) && vm_suspend_rebind_worker(vm)) {
> 		up_write(&vm->lock);
> 		/* We don't actually block but don't make progress. */
> 		xe_pm_might_block_on_suspend();
> 		return;
> 	}
> 	...
> }
> 
> When a preempt fence signals during suspend preparation or while
> xe_gt_suspend() -> xe_uc_suspend() stops GuC submission:
> 
> preempt_fence_work_func()
>    -> q->ops->suspend_wait(q)
>    -> xe_vm_queue_rebind_worker(q->vm)
> 
> guc_exec_queue_wait_suspend_done() can also return early once
> xe_guc_read_stopped(guc) becomes true while ge->suspend_pending is still set.
> 
> Because xe->pm_block remains completed, try_wait_for_completion() in
> preempt_rebind_work_func() and xe_gpuvm_validate() returns true instead of
> parking the worker. Can preempt_rebind_work_func() then run concurrently with
> or after xe_gt_suspend(), pushing TLB invalidations while the GT is
> suspended and calling resume_and_reinstall_preempt_fences() ->
> q->ops->resume(q) -> __guc_exec_queue_resume(), hitting:
> 
> 	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending ||
> 		     exec_queue_killed_or_banned_or_wedged(q));
> 
> Would it make sense to still manage xe->pm_block and
> xe_pm_wake_rebind_workers(xe) in xe_pm_notifier_callback() even when BO
> eviction is skipped?

Yeah, we should probably just limit to skipping eviction here. Will fix.

> 

