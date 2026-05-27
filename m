Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5065BCD6E43
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 16:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D010E826;
	Wed, 27 May 2026 16:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxzXaZPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43B010E808
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779899741; x=1811435741;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ipX5U4lue22rFA9cJIFFgKNOq8OnTI1hSGrKhPohkoA=;
 b=UxzXaZPL9R7WAu6sflniqdVeujOGHxCMVmZb2WK1Wyxtd535ZirIF16m
 C7a4jdLN1V2XYks24mc2NsRlI/xs6r86fEIDH2w3s2taio60LoxJRgrE4
 2iFFVVxj0O9PMJ+EI2slLSzpCF4u8CVq4XONPvT9Ov5CBk4gGUP/qRsUc
 Qe/M+a0Tz4NkYzt2/vozXlIo3CnIcVNdSfMtgy0o6flG3dc7ON8gOLNCL
 EtwcH/88bBP02/j1FoJuGijWCR93S31iMOpHCEfjSuTk7TlAGwCKaDlvu
 rc7KqfV3YoAJdn5OmZkGDvkkXHiHGoywGdijccWDFAY/5yqHkF5nGzMqF Q==;
X-CSE-ConnectionGUID: t50Z6q5HRReuOrryhQKPDQ==
X-CSE-MsgGUID: q+dWOLuxTiOtG+P1nLVyAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91843794"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91843794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 09:35:40 -0700
X-CSE-ConnectionGUID: PRWWty1oTneEMZupCpZYIw==
X-CSE-MsgGUID: LfBlB69JTN6+86wOSFnAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242439757"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.24])
 ([10.245.245.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 09:35:38 -0700
Message-ID: <f3e0a8cd-bd32-4ac7-9135-3c6f53e959c4@intel.com>
Date: Wed, 27 May 2026 17:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Don't ban LR VM exec queues on PM
 suspend
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-3-thomas.hellstrom@linux.intel.com>
 <f0df867c-d4f4-4a9f-b2f0-58d05e5f8926@intel.com>
 <b3a30dfcf5eb035aca3e7e836b985155c419d9fe.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <b3a30dfcf5eb035aca3e7e836b985155c419d9fe.camel@linux.intel.com>
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

On 27/05/2026 11:19, Thomas Hellström wrote:
> On Tue, 2026-05-26 at 16:38 +0100, Matthew Auld wrote:
>> On 25/05/2026 14:30, Thomas Hellström wrote:
>>> When xe_guc_submit_stop() is called during an S3/S4 suspend or GT
>>> reset, guc_exec_queue_stop() bans any user exec queue that has a
>>> job
>>> which has started but not yet completed.  For normal (non-LR) exec
>>> queues this is the correct behaviour: a started-but-incomplete job
>>> at
>>> reset time may indicate a hung workload.
>>
>> Is it not too harsh to ban the user job for that? Say you are a well
>> behaved 3D workload, and forced suspend is triggered by the user, if
>> you
>> are very unlucky you can get banned, if you hit the queue_stop flow
>> with
>> a WIP job?
> 
> Actually (and this has bearing also on patch 1, I think) suspend /
> resume must not sit in the critical path of any dma-fence job. Meaning
> we explicitly have to wait for all outstanding dma-fences before
> suspending, and add that if that's not already done.

I guess that is missing? I assume it mostly works by fluke, since we 
likely end up evicting user buffers on suspend, which ends up also 
idling most WIP jobs, however that is only true for VRAM buffers on 
dgpu, and CCS buffers on igpu, which is not everything. Some igpu have 
CCS disabled, and on dgpu we still have non-VRAM buffers?

Also on igpu we want to make eviction on suspend limited only to s4, so 
wondering if this will be more noticable there, like with s3 + no evict.

> 
> /Thomas
> 
> 
>>
>>>
>>> For exec queues attached to Long Running (LR) VMs the same
>>> condition
>>> is always true during normal operation: LR jobs are designed to run
>>> indefinitely and are never "completed" in the DRM scheduler sense —
>>> they are preempted and resumed via the preempt-fence mechanism.
>>> Banning such an exec queue on PM suspend permanently prevents the
>>> job
>>> from restarting after resume, causing the userspace compute
>>> workload to
>>> fail silently.
>>>
>>> Fix this by not banning LR VM exec queues when a system suspend or
>>> hibernation is in progress, while preserving the ban for GT reset
>>> where
>>> a started-but-incomplete job is a legitimate indicator of a hang.
>>>
>>> Fixes: f6375fb3aa94 ("drm/xe: Track LR jobs in DRM scheduler
>>> pending list")
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.19+
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
>>> ---
>>>    drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>>>    drivers/gpu/drm/xe/xe_guc_submit.c   | 10 +++++++++-
>>>    drivers/gpu/drm/xe/xe_pm.c           |  5 ++++-
>>>    3 files changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 32dd2ffbc796..9dbf7b3a0c49 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -433,6 +433,14 @@ struct xe_device {
>>>    	struct notifier_block pm_notifier;
>>>    	/** @pm_block: Completion to block validating tasks on
>>> suspend / hibernate prepare */
>>>    	struct completion pm_block;
>>> +	/**
>>> +	 * @pm_suspend_in_progress: True while the device is going
>>> through
>>> +	 * system suspend or hibernation (set at xe_pm_suspend()
>>> entry, cleared
>>> +	 * at xe_pm_resume() entry or on suspend error). Used to
>>> suppress exec
>>> +	 * queue bans that should only apply during GT reset, not
>>> PM suspend.
>>> +	 * Serialised by the PM suspend sequence; no lock
>>> required.
>>> +	 */
>>> +	bool pm_suspend_in_progress;
>>>    	/** @rebind_resume_list: List of wq items to kick on
>>> resume. */
>>>    	struct list_head rebind_resume_list;
>>>    	/** @rebind_resume_lock: Lock to protect the
>>> rebind_resume_list */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 2b8b316c0ca3..f1a6f13011b5 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -2268,8 +2268,16 @@ static void guc_exec_queue_stop(struct
>>> xe_guc *guc, struct xe_exec_queue *q)
>>>    	 * Ban any engine (aside from kernel and engines used for
>>> VM ops) with a
>>>    	 * started but not complete job or if a job has gone
>>> through a GT reset
>>>    	 * more than twice.
>>> +	 *
>>> +	 * LR VM exec queues are excluded from this ban during PM
>>> suspend: their
>>> +	 * jobs are intentionally long-running and are preempted
>>> and resumed via
>>> +	 * the preempt-fence mechanism. Banning them on PM suspend
>>> would
>>> +	 * permanently prevent the job from restarting after
>>> resume.
>>> +	 * On GT reset however we do want to ban them, as that may
>>> indicate a
>>> +	 * genuinely hung workload.
>>>    	 */
>>> -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
>>> EXEC_QUEUE_FLAG_VM))) {
>>> +	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
>>> EXEC_QUEUE_FLAG_VM)) &&
>>> +	    !(q->vm && xe_vm_in_lr_mode(q->vm) && guc_to_xe(guc)-
>>>> pm_suspend_in_progress)) {
>>>    		struct xe_sched_job *job =
>>> xe_sched_first_pending_job(sched);
>>>    		bool ban = false;
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c
>>> b/drivers/gpu/drm/xe/xe_pm.c
>>> index c203a59d7000..76d211986822 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -176,6 +176,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>    	int err;
>>>    
>>>    	drm_dbg(&xe->drm, "Suspending device\n");
>>> +	xe->pm_suspend_in_progress = true;
>>>    	xe_pm_block_begin_signalling();
>>>    	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>>>    
>>> @@ -217,6 +218,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>    	xe_pxp_pm_resume(xe->pxp);
>>>    err:
>>>    	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>>> +	xe->pm_suspend_in_progress = false;
>>>    	xe_pm_block_end_signalling();
>>>    	return err;
>>>    }
>>> @@ -234,8 +236,9 @@ int xe_pm_resume(struct xe_device *xe)
>>>    	u8 id;
>>>    	int err;
>>>    
>>> -	xe_pm_block_begin_signalling();
>>> +	xe->pm_suspend_in_progress = false;
>>>    	drm_dbg(&xe->drm, "Resuming device\n");
>>> +	xe_pm_block_begin_signalling();
>>>    	trace_xe_pm_resume(xe, __builtin_return_address(0));
>>>    
>>>    	for_each_gt(gt, xe, id)

