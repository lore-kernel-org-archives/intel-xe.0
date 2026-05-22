Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF470CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788C410F673;
	Fri, 22 May 2026 16:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jLZHJgtj";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596DE10F673
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xEzMpeV81MQM9bui3iQdcH0QakvifeBM3hts9fwCfY8=; b=jLZHJgtji1B3ctGXG97dgFFoUd
 cNFH3h4AV2yNYeyFhhL7H07MQrCQP72wgOV6yA5WULPUlp9UgtWnaYrn42QqXgJBMJxoy0KpK+krv
 HHIZ12RlRvQICzCY9qm+BKgRNk+6uZS1MN/cqK3Om0kCkgnpnp49Hp7rR+PVxjifD/6whL1JYSkwL
 Fsnj6A3Zl/FV10aSPEIdW9KnTYSMQYxWwXWqNDZ5fzzI0xkjWuTIsjqk5kgkhS4Cx6bwTBGyB9ixl
 e9a1wCXzaNPCj66ZrmVPwqSXUFdXeW2DgITKH24mCZE3OFbf+wXwEECPCIYVTi8Bes1xoimVqW3bm
 uSxxc+bA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wQSaE-004xbY-Qk; Fri, 22 May 2026 18:18:46 +0200
Message-ID: <858f5cd1-a542-4cc5-9ab3-8569e172f9ce@igalia.com>
Date: Fri, 22 May 2026 17:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Assign queue name in time for drm_sched_init
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
References: <20260522144003.12836-1-tvrtko.ursulin@igalia.com>
 <ahB_3OV1sSfrfDwY@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <ahB_3OV1sSfrfDwY@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 22/05/2026 17:10, Rodrigo Vivi wrote:
> On Fri, May 22, 2026 at 03:40:03PM +0100, Tvrtko Ursulin wrote:
>> Currently the queue name is only assigned after the drm scheduler instance
>> has been created. This loses information with all logging or debug
>> workqueue facilities so lets re-order things a bit so the name gets
>> assigned in time.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++-------------
>>   1 file changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index afd8cc7bd231..28f3b23527e6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1961,6 +1961,13 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>>   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>>   
>> +	mutex_lock(&guc->submission_state.lock);
>> +	err = alloc_guc_id(guc, q);
>> +	mutex_unlock(&guc->submission_state.lock);
>> +	if (err)
>> +		goto err_free;
>> +	xe_exec_queue_assign_name(q, q->guc->id);
> 
> I'm afraid this might open some race conditions here.
> 
> First I wondering about simply moving the mutex to inside the alloc_guc_id
> itself where the submission_state is used so it gets clear, then
> I saw the FIXME message in there and wondered why could had made it
> harder when it was first developed.
> 
> Then I read the Sashiko
> https://sashiko.dev/#/patchset/20260522144003.12836-1-tvrtko.ursulin%40igalia.com
> 
> Perhaps the safest approach here is to use a unlocked xa_reserve to get
> the id and create the name. With this you already get the GFP_NOWAIT FIXME note
> fixed.
> 
> Then you keep the xa_store down later, not opening for any possible races.
> 2-in-1 fix...

Right, my bad for assuming alloc_guc_id is allocating, well, a guc id! 
:) Thanks for looking and spotting the terrible mistake. I will have a 
look next week to see if I can implement what you suggest.

Regards,

Tvrtko

> 
>> +
>>   	/*
>>   	 * Use primary queue's submit_wq for all secondary queues of a
>>   	 * multi queue group. This serialization avoids any locking around
>> @@ -1977,28 +1984,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>>   			    q->name, gt_to_xe(q->gt)->drm.dev);
>>   	if (err)
>> -		goto err_free;
>> +		goto err_release_id;
>>   
>>   	sched = &ge->sched;
>>   	err = xe_sched_entity_init(&ge->entity, sched);
>>   	if (err)
>>   		goto err_sched;
>>   
>> -	mutex_lock(&guc->submission_state.lock);
>> -
>> -	err = alloc_guc_id(guc, q);
>> -	if (err)
>> -		goto err_entity;
>> -
>>   	q->entity = &ge->entity;
>>   
>> +	mutex_lock(&guc->submission_state.lock);
>>   	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>>   		xe_sched_stop(sched);
>> -
>>   	mutex_unlock(&guc->submission_state.lock);
>>   
>> -	xe_exec_queue_assign_name(q, q->guc->id);
>> -
>>   	/*
>>   	 * Maintain secondary queues of the multi queue group in a list
>>   	 * for handling dependencies across the queues in the group.
>> @@ -2021,11 +2020,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   
>>   	return 0;
>>   
>> -err_entity:
>> -	mutex_unlock(&guc->submission_state.lock);
>> -	xe_sched_entity_fini(&ge->entity);
>>   err_sched:
>>   	xe_sched_fini(&ge->sched);
>> +err_release_id:
>> +	release_guc_id(guc, q);
>>   err_free:
>>   	kfree(ge);
>>   
>> -- 
>> 2.54.0
>>

