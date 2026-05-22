Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAE7CD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 10:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE3E10F535;
	Fri, 22 May 2026 10:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZbwmw7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BC010F535
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779444340; x=1810980340;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KiZhFfvVCpv9ZImVocY7rSwfsNJqXbLMN8wmdEJVO74=;
 b=XZbwmw7vrkFFbkK6xPYJ1M3f0EUSFkbGoNFIRgrHU1cQbdKU4giA2aof
 FRfw1BQrPO684bFJtWyXsXetHT0uLC4+LM5DqZTd8M5W4/UR7Ew0RBgKa
 3Z0aTC0cyzfK6FdIpAvhgUv93wGam9N/vvKe48d+E0Qelc5mwI9k6tjyk
 z5xw9w69+tBVT84nDTl4cMu2TJ5lz8A7PtZzRvUAv9ty5ZWsUFcr9O37D
 ZMBpTnpvgC720omkZpSjPiMh2QMry5FtME7hweH30uUvvKTuHxRhCmfyl
 4Kd2Bvz/5rN/TyWq5aiDL63esDbgU2JLN0WVjUe4f/p5aKCU7sbsbeshN w==;
X-CSE-ConnectionGUID: P5KH79irRRy+tPZFv0VqKg==
X-CSE-MsgGUID: z2JehRytQXyxUv/J7Rm0aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80426159"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80426159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 03:05:32 -0700
X-CSE-ConnectionGUID: LRDA+2I/S7ah5g3nADGDWQ==
X-CSE-MsgGUID: YqvtDh2HTi2AOFq3pUOaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="244918465"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 03:05:29 -0700
Message-ID: <4ae0d045-e60b-4aab-a743-dc42007f0320@intel.com>
Date: Fri, 22 May 2026 11:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Restore userspace LRC BOs early on resume
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
 <20260521144837.7363-4-thomas.hellstrom@linux.intel.com>
 <397bc3b9-2e0b-498a-9088-b99521ebb79c@intel.com>
 <745c9abdd971c07342a2010e9aac9804605ffeae.camel@linux.intel.com>
 <22bda18802acaeeb827d3b34540a0f97c6807d7f.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <22bda18802acaeeb827d3b34540a0f97c6807d7f.camel@linux.intel.com>
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

On 22/05/2026 10:51, Thomas Hellström wrote:
> On Thu, 2026-05-21 at 18:31 +0200, Thomas Hellström wrote:
>> On Thu, 2026-05-21 at 17:09 +0100, Matthew Auld wrote:
>>> On 21/05/2026 15:48, Thomas Hellström wrote:
>>>> When GuC registers a context (REGISTER_CONTEXT G2H action), the
>>>> LRC
>>>> buffer object must already be present in VRAM with valid content.
>>>> Userspace LRC BOs currently carry XE_BO_FLAG_PINNED_LATE_RESTORE,
>>>> which
>>>> defers their restore to xe_bo_restore_late() — a blitter copy
>>>> that
>>>> runs
>>>> after xe_gt_resume().  However, xe_gt_resume() itself calls
>>>> xe_guc_submit_start(), which drives guc_exec_queue_start() ->
>>>> xe_sched_resubmit_jobs() -> guc_exec_queue_run_job() ->
>>>> register_exec_queue(), all before xe_bo_restore_late() has had a
>>>> chance
>>>> to repopulate the BO.  The result is that GuC reads LRC state
>>>> from
>>>> uninitialised VRAM and raises an exception.
>>>
>>> Hmm, thinking out aloud here, but what stops the hw executing the
>>> ring
>>> if we can get as far as run_job() this early? Thinking about non-
>>> LR,
>>> can
>>> we not have pending jobs that get re-submitted, before we have had
>>> a
>>> chance to restore the bb, page-tables, other user BOs etc, since
>>> that
>>> is
>>> maybe late restore also.
>>
>> Good point. Need to look at that.
> 
> That's actually the case. I figure this might be hit if we use VRAM
> page-tables for system BOs.
> 
> That case would potentially be fatal for preempt-fence mode as well,
> I'll have to respin the fault mode patch to unconditionally suspend the
> preempt-fence exec-queues, since with that case we might not see
> eviction and hence no preempt-fences firing.
> 
> To me a decent fix would be to split up gt resume into two separate
> steps. One registers migrate exec-queues and activates migrate
> schedulers. Second does the same for user-space.

Yeah, fully agreed. I was also thinking the same here.

> 
> /Thomas
> 
>>
>> /Thomas
>>
>>>
>>>>
>>>> Fix this by dropping XE_BO_FLAG_PINNED_LATE_RESTORE from the
>>>> userspace
>>>> LRC BO flags.  Without that flag, the BO lands in the
>>>> pinned.early.kernel_bo_present list and is restored by
>>>> xe_bo_restore_early() via CPU/BAR copy before xe_gt_resume() is
>>>> entered.
>>>> By the time any context registration fires the LRC VRAM is valid.
>>>>
>>>> xe_bo_create_pin_map_novm() already adds
>>>> XE_BO_FLAG_NEEDS_CPU_ACCESS and
>>>> XE_BO_FLAG_PINNED, satisfying the requirements of the CPU copy
>>>> path.
>>>> Dropping XE_BO_FLAG_PINNED_LATE_RESTORE also makes
>>>> force_contiguous()
>>>> return true for these BOs (PINNED without LATE_RESTORE), which is
>>>> already
>>>> required for the GGTT mapping they carry.
>>>>
>>>> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
>>>> Signed-off-by: Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
>>>> b/drivers/gpu/drm/xe/xe_lrc.c
>>>> index a4292a11391d..c9ea5a3e5365 100644
>>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>> @@ -1661,7 +1661,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
>>>> struct xe_hw_engine *hwe, struct xe_v
>>>>    		   XE_BO_FLAG_GGTT_INVALIDATE;
>>>>    
>>>>    	if ((vm && vm->xef) || init_flags &
>>>> XE_LRC_CREATE_USER_CTX) /* userspace */
>>>> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE |
>>>> XE_BO_FLAG_FORCE_USER_VRAM;
>>>> +		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
>>>>    
>>>>    	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
>>>>    				       ttm_bo_type_kernel,

