Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D478C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 08:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0617D10E321;
	Mon,  3 Jun 2024 08:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P95oTMEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C262D10E301
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717402273; x=1748938273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aRmHroIi5lY+ayIXJYy/BEcxoWHDZYGg67L0e1n3/Mc=;
 b=P95oTMEma6rPAxDesNi/k9oCyGi3WNghhc4f2u7nyhR4hWK7Z0rbtGqx
 0BpwvfhdPAxFINd3q4SsltyFskSZfcb41X78NKN8IP6HaKA0xRRwkOvxg
 bDk6EnnbU3bq5VY3BVioxAnhqTpoEKa2yDcH5Pvsph9lANOttAwfQ5Xie
 JiO97ouCSxT6IQMcIm//oBUo0m2y5undY98amSRrYE1yymQjayDYBKMUs
 SeEIxGH8Iti09X+88owlU09cLZa0R8+ENp56dm4GHb+u0PgQ5zWQWL8yM
 sMetC8NANjkSF6OBcnY4ruidtwim+k9cO+g5PYxsCz9R2E3IagGhycw0k A==;
X-CSE-ConnectionGUID: MKQOInBmSQWyAj/0jmyDNA==
X-CSE-MsgGUID: 7J9NZ47jTe+JW5TYcWwifQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="31415404"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="31415404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:11:12 -0700
X-CSE-ConnectionGUID: VoObME9mSoOoGAdZiC0J+Q==
X-CSE-MsgGUID: mn9tSbv5TzeVk6mhXmxVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37258227"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:11:10 -0700
Message-ID: <2f068913-5010-41a6-b24a-2a8057fa8e1c@intel.com>
Date: Mon, 3 Jun 2024 10:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on all
 engines
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
 <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
 <93ca58d4cbbd37cd93ce82959a8da30efd91307a.camel@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <93ca58d4cbbd37cd93ce82959a8da30efd91307a.camel@linux.intel.com>
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



On 03.06.2024 09:35, Thomas Hellström wrote:
> On Thu, 2024-05-30 at 20:45 +0000, Matthew Brost wrote:
>> On Thu, May 30, 2024 at 01:17:32PM +0200, Thomas Hellström wrote:
>>> Hi, All.
>>>
>>> I was looking at this patch for drm-xe-fixes but it doesn't look
>>> correct to me.
>>>
>>> First, AFAICT, the "emit flush imm ggtt" means that we're flushing
>>> outstanding / posted writes, and then write a DW to a ggtt address,
>>> so
>>> we're not really "flushing gtt"
>>>
>> So, is this a bad name? I think I agree. It could have been a
>> holdover
>> from the i915 names. Maybe we should do a cleanup in xe_ring_ops
>> soon?
>>
>> Or are you saying that the existing emit_flush_imm_ggtt is not
>> sufficient to ensure all writes from batches are visible? If this
>> were
>> true, I would think we'd have all sorts of problems popping up.
> It was more the title of the patch that says "flush gtt" when I think
> it should say "flush writes" or something similar.
>
>
>>> Second, I don't think we have anything left that explicitly flushes
>>> the
>>> posted write of the user-fence value?
>>>
>> I think this might be true. So there could be a case where we get an
>> IRQ
>> and the user fence value is not yet visible?
> Yes, exactly.
>
>> Not an expert ring programming but are instructions to store a dword
>> which make these immediately visible? If so, I think that is what
>> should
>> be used.
> There are various options here, using various variants of MI_FLUSH_DW
> and pipe_control, and I'm not sure what would be the most performant
> but I think the simplest solution would be to revert the patch and just
> emit an additional MI_FLUSH_DW as a write barrier before emitting the
> posted userptr value.

As the patch already landed I have posted fix for it:
https://patchwork.freedesktop.org/series/134354/

Regards
Andrzej

>
>>
>>
>> We should also probably check how downstream i915 did this too.
>>
>>> and finally the seqno fence now gets flushed before the user-fence.
>>> Perhaps that's not a bad thing, though.
>>>
>> I don't think this is an issue, I can't think of a case where this
>> reordering would create a problem.
>>
>> Matt
> /Thomas
>
>>   
>>> /Thomas
>>>
>>>
>>> On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
>>>> Tests show that user fence signalling requires kind of write
>>>> barrier,
>>>> otherwise not all writes performed by the workload will be
>>>> available
>>>> to userspace. It is already done for render and compute, we need
>>>> it
>>>> also for the rest: video, gsc, copy.
>>>>
>>>> v2: added gsc and copy engines, added fixes and r-b tags
>>>>
>>>> Closes:
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
>>>> Intel
>>>> GPUs")
>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>> Changes in v2:
>>>> - Added fixes and r-b tags
>>>> - Link to v1:
>>>> https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com
>>>> ---
>>>> Matthew,
>>>>
>>>> I have extended patch to copy and gsc engines. I have kept your
>>>> r-b,
>>>> since the change is similar, I hope it is OK.
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index a3ca718456f6..a46a1257a24f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct
>>>> xe_sched_job *job, struct xe_lrc *lrc
>>>>   
>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>   
>>>> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
>>>> seqno,
>>>> false, dw, i);
>>>> +
>>>>   	if (job->user_fence.used)
>>>>   		i = emit_store_imm_ppgtt_posted(job-
>>>>> user_fence.addr,
>>>>   						job-
>>>>> user_fence.value,
>>>>   						dw, i);
>>>>   
>>>> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
>>>> seqno,
>>>> false, dw, i);
>>>> -
>>>>   	i = emit_user_interrupt(dw, i);
>>>>   
>>>>   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>>>> @@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct
>>>> xe_sched_job *job, struct xe_lrc *lrc,
>>>>   
>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>   
>>>> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
>>>> seqno,
>>>> false, dw, i);
>>>> +
>>>>   	if (job->user_fence.used)
>>>>   		i = emit_store_imm_ppgtt_posted(job-
>>>>> user_fence.addr,
>>>>   						job-
>>>>> user_fence.value,
>>>>   						dw, i);
>>>>   
>>>> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
>>>> seqno,
>>>> false, dw, i);
>>>> -
>>>>   	i = emit_user_interrupt(dw, i);
>>>>   
>>>>   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>>>>
>>>> ---
>>>> base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
>>>> change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
>>>>
>>>> Best regards,

