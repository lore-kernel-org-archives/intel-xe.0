Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE61CF649D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 10:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8239010E2E4;
	Mon, 30 Sep 2024 10:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfCsJbKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0108010E2E4
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727690486; x=1759226486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8E5r2kqkRISqlN3kD7Ersy1eEo8GzMIAXTahqVZlqZM=;
 b=kfCsJbKIVsYkEjGye+DDe4AaUEYlElh+f5gCth4OtAfQsl0oHfrKh5yf
 ML4BHlkuLUdeDAG82azN6Wh6PksomRKdgQv5BVIHd0TRv0FIOvdTLLHT1
 YTldJvXKX2dJJ5/tddpI8FDPby3z95+RGhf7k0U6ifI2BbRFoUetlNBa1
 z8jvNGcCXLr4FKP71kuAnww6WiR4OvjNdcjr3v6u0XhCCY8ItWcxFFmNR
 O8vU7dL8Ww/1biHWMjppHt5RyDsJmbBc+/EEHpY5qkBKA2Tnyc8U5fzZQ
 xmjlngMQZf6n5tSKcAaoYviQrKfPsJiNCzVCeaqT6/4fleSUmTjVFEwxE Q==;
X-CSE-ConnectionGUID: h1wuO875TEW1Py7y4UJ0NQ==
X-CSE-MsgGUID: 3s7NagqzSEqFR/Qb7H3GLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44233088"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="44233088"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:01:25 -0700
X-CSE-ConnectionGUID: SmIlyOuAS1qoO4FUxSRR7g==
X-CSE-MsgGUID: W4DGtBdbT0aWDbnJKMSlpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72852167"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.244.244])
 ([10.245.244.244])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:00:57 -0700
Message-ID: <7e64c52d-3b38-42eb-8f63-ad6c37ef225f@intel.com>
Date: Mon, 30 Sep 2024 11:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240927133535.548793-2-matthew.auld@intel.com>
 <e2f109e3-d34c-4461-bfda-910965a14ce9@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e2f109e3-d34c-4461-bfda-910965a14ce9@intel.com>
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

On 28/09/2024 00:05, John Harrison wrote:
> On 9/27/2024 06:35, Matthew Auld wrote:
>> A few things here. Make the two prints consistent (and distinct), print
>> the guc_id, and finally dump the CT queues. It should be possible to
>> spot the guc_id in the CT queue dump, and for example see that host side
>> has yet to process the response for the schedule disable, or see that
>> GuC is yet to send it, to help narrow things down if we trigger the
>> timeout.
> Where are you seeing these failures? Is there an understanding of why? 
> Or is this patch basically a "we have no idea what is going on, so get 
> better logs out of CI" type thing? In which case you really want is to 
> generate a devcoredump (with my debug improvements patch set to include 
> the GuC log and such like) and to get CI to give you the core dumps back.

Yeah, patch is "we have no idea what is going on, so get better logs out 
of CI".

 From https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638, one 
example failure: 
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1873-c689a348137cb6f8934a9be49438bafe413b97d5/re-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

devcoredump wired up to CI with everything thrown in sounds good.

> 
> And maybe this is related to the fix from Badal: "drm/xe/guc: In 
> guc_ct_send_recv flush g2h worker if g2h resp times out"? We have seen 
> problems where the worker is simply not getting to run before the 
> timeout expires.

I don't think the schedule disable is using guc_ct_send_recv() 
interface, so I don't think is related but not 100% sure.

> 
> John.
> 
>>
>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 80062e1d3f66..52ed7c0043f9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct 
>> work_struct *w)
>>                        !exec_queue_pending_disable(q) ||
>>                        guc_read_stopped(guc), HZ * 5);
>>           if (!ret) {
>> -            drm_warn(&xe->drm, "Schedule disable failed to respond");
>> +            struct xe_gt *gt = guc_to_gt(guc);
>> +            struct drm_printer p = xe_gt_err_printer(gt);
>> +
>> +            xe_gt_warn(gt, "%s schedule disable failed to respond 
>> guc_id=%d",
>> +                   __func__, ge->id);
>> +            xe_guc_ct_print(&guc->ct, &p, false);
>>               xe_sched_submission_start(sched);
>>               xe_gt_reset_async(q->gt);
>>               return;
>> @@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct 
>> drm_sched_job *drm_job)
>>                        guc_read_stopped(guc), HZ * 5);
>>           if (!ret || guc_read_stopped(guc)) {
>>   trigger_reset:
>> -            if (!ret)
>> -                xe_gt_warn(guc_to_gt(guc), "Schedule disable failed 
>> to respond");
>> +            if (!ret) {
>> +                struct xe_gt *gt = guc_to_gt(guc);
>> +                struct drm_printer p = xe_gt_err_printer(gt);
>> +
>> +                xe_gt_warn(gt, "%s schedule disable failed to respond 
>> guc_id=%d",
>> +                       __func__, q->guc->id);
>> +                xe_guc_ct_print(&guc->ct, &p, true);
>> +            }
>>               set_exec_queue_extra_ref(q);
>>               xe_exec_queue_get(q);    /* GT reset owns this */
>>               set_exec_queue_banned(q);
> 
