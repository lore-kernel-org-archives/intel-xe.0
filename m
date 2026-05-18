Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4402ACD4F52
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 09:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008C810E738;
	Mon, 18 May 2026 09:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2y/xUik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155010E738
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779095723; x=1810631723;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=tbQ5+P//oWe84FHyBdxt7eTqERLU5bM4Ve+wKE7g9NY=;
 b=N2y/xUikTaBovxOs2PRub2M0HjYjLlhdId1vUm08bFCEs1+7oEHwp7to
 uQAnpyCSYm1o7pKVcwwFY3fPbCWIZ6CTe3yFJUvHOuDggiSpN6HhhgyMH
 kAp2B3gsjDXNBq1F8NlYQ5g4jCKWUE5q6Vgq2dSysyD/GWy91arT27zxL
 o+EXnhgW1d7oapZLbhdShYIeJgL3r3XnFgtQCIadGgCJH06vwxvEd5NAU
 jwlj+CwOaRM8dK5N34A8s9mMfw3JXck8HK5V4hwz1cTbv6MxVVaQpoVoB
 CyhUm+JeLUBiZceU7oq2PKnjEiSPCSKDl044a2ZcXcfZq8qIjx6Es4iUW A==;
X-CSE-ConnectionGUID: z+qhlutuQkuNM7o7n9ii3A==
X-CSE-MsgGUID: SQFjTQIHSw6l0wYgkB5nhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79659583"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79659583"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 02:15:23 -0700
X-CSE-ConnectionGUID: 8o+nfUppTGKZT66kNmaw3A==
X-CSE-MsgGUID: GQaFO53uTle11krRnHOAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="235139018"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.57])
 ([10.245.244.57])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 02:15:22 -0700
Message-ID: <151f260e-0361-4a0c-bd9e-3c76fc22a347@intel.com>
Date: Mon, 18 May 2026 10:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/multi_queue: Fix secondary queue error case
From: Matthew Auld <matthew.auld@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260515210450.249621-2-niranjana.vishwanathapura@intel.com>
 <8c150600-7773-4644-9c29-83de7db2b96e@intel.com>
Content-Language: en-GB
In-Reply-To: <8c150600-7773-4644-9c29-83de7db2b96e@intel.com>
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

On 18/05/2026 10:01, Matthew Auld wrote:
> On 15/05/2026 22:04, Niranjana Vishwanathapura wrote:
>> If xe_lrc_create() fails, the secondary queue added to the
>> multi-queue group list is not removed before freeing the
>> queue. Fix error path handling for secondary queues by
>> removing it from the multi-queue group list at the right
>> place.
>>
>> Fixes: d716a5088c88 ("drm/xe/multi_queue: Handle tearing down of a 
>> multi queue")
>>
> 
> Can drop the newline here. Would be good to also add:
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7979
> Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>
> 
>> Cc: stable@vger.kernel.org # v7.0+
>> Signed-off-by: Niranjana Vishwanathapura 
>> <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Also maybe double check the analysis here: 
https://sashiko.dev/#/patchset/20260515210450.249621-2-niranjana.vishwanathapura%40intel.com

> 
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/ 
>> xe_guc_submit.c
>> index 4171eff4e8ad..afd8cc7bd231 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1665,6 +1665,14 @@ static void guc_exec_queue_fini(struct 
>> xe_exec_queue *q)
>>       struct xe_guc_exec_queue *ge = q->guc;
>>       struct xe_guc *guc = exec_queue_to_guc(q);
>> +    if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +        struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +        mutex_lock(&group->list_lock);
>> +        list_del(&q->multi_queue.link);
>> +        mutex_unlock(&group->list_lock);
>> +    }
>> +
>>       release_guc_id(guc, q);
>>       xe_sched_entity_fini(&ge->entity);
>>       xe_sched_fini(&ge->sched);
>> @@ -1686,14 +1694,6 @@ static void 
>> __guc_exec_queue_destroy_async(struct work_struct *w)
>>       guard(xe_pm_runtime)(guc_to_xe(guc));
>>       trace_xe_exec_queue_destroy(q);
>> -    if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> -        struct xe_exec_queue_group *group = q->multi_queue.group;
>> -
>> -        mutex_lock(&group->list_lock);
>> -        list_del(&q->multi_queue.link);
>> -        mutex_unlock(&group->list_lock);
>> -    }
>> -
>>       /* Confirm no work left behind accessing device structures */
>>       cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> 

