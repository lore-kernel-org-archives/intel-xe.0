Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A6C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 07:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574A610EF1D;
	Wed, 15 Jul 2026 07:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="vC/ChANH";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26A410EF1D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 07:49:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47d70879764so3397326f8f.2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 00:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784101741; x=1784706541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PTaSUIxouBoJ4Hr4r8oAvSVkzaThpNOsfo/Oz6pgZWc=;
 b=vC/ChANH86Xn3y1GjmP8fOxMpWFYH0CVN7ChWPhJMzqfLukzidGUbYDWoym+evQXIh
 tB1Eo0jbie4HWCgEW95msW7FTklpVllufOrWv0SJjauu3aG8LWU6++Km+avwsBFmfuNk
 gtynq1azHkwYSTFiD9nimEt/VLA3LjZYSboGI+yRLOMm8wvf1xlLsSAOJI+vJaLAXm0r
 BzcFldVw581N2ipD+OV+xIaCzIXDJ/ziIrpF70j3tjjqh42Ka9C9UUJtA2Jg9mwmf3pG
 5RA2ENdsP/K1a5hPIY+CiAkhTN+YYGwASrdEronRa3CpmLZAYzUGPyWf25BdlTNoAyDP
 y33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784101741; x=1784706541;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PTaSUIxouBoJ4Hr4r8oAvSVkzaThpNOsfo/Oz6pgZWc=;
 b=JRnLyTrCM1uzxP7N3qCEZhyPFqu6gF1Xt+IofdeaP71kiU5PI9XPsKFcuppzi6Llmu
 6qYd2RCe1lwdL42CzZ9hxbrpv14BpP0zn0vnXwvvd4rR4N/iHQVaFGMnUfSB8UimiGd6
 HKWpluBN7lUc8dm9N/P4F99tWhLThnZDvCKkDuvtUx2hGjMfTN0cS2g1Jr3vh2mvcc/6
 dtLAiBFhuLW9i1sGWg6mq+k/c68uFdxVOU5rNxF8rk9/zmhaBlu7mWM1KVA+c/s5pYL9
 Ymqo6wPcYDF/t4nK4Q4nAb/CaDG6GITBuiYavttNa2QS/59hzyNwwvtTzU8j6z9K/FST
 mlKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3XhqMM9eI1pZoD2QM+surzOuoNOXWvbDGOkUiSIgBt2xBjPR82Q/pxgd2fPyik20WChVdQiQ78w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZlqNCE3RDyQwXGZsD0gJiiOf2C70IFvqMOmTvtXTCf6AwZ9K3
 WgXuAYOER6UwnlfDMD0g0ttAt0BrMG8z2sEjGIs964vnieQK4PqqAoZI8pJCCJqGMSs=
X-Gm-Gg: AfdE7cksU4yINXtr6NfJRc51j5AnMs6SVQKu4MWH+Ip5GhAGfZO8mnffL87aWVw6Y8O
 sPEB1nEIms/6z4c5z9+gpjq/Siv4rM8CXjtbQ1VTAiGfKJ21Xa8VtTRjjw6y02UEnXoonJdhbxw
 jIfA1zGk61cOR3vpBJT/NnPZnUkfaIt+4hTFM7NN79ay+iJJjNBzVkY8+NwHSY4C0AQJNsaa4Kl
 gYfAOnognWFUJ2YkPoJD+hCBZbH6597t+EbFW1qFxji8kUKzRsya+qwA35MEBs2N81SPONKNjgf
 JAG9TFU0VmdFMfMldLMzLOGcMXtGMz2PktN6KiRNg7aT6K5Pm0ji57sYTmsTYH6UbAtXIPSUn1A
 BWK5D97Y1ISsm8YxtSv5C3CWaa03K14J8ZbSYe5XcD0TUUkgJaCD7IjZ3bS3ljXB57hpDCbnm/J
 YCRSc9vxKTpozi4zaKYxF8/XCeuZjobNybTw==
X-Received: by 2002:a05:600c:529b:b0:493:a5f9:d33d with SMTP id
 5b1f17b1804b1-4953c273d5emr18098545e9.18.1784101740959; 
 Wed, 15 Jul 2026 00:49:00 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495087366c0sm239726435e9.7.2026.07.15.00.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 00:49:00 -0700 (PDT)
Message-ID: <ba1420ef-26df-413a-8554-b60f470b9344@ursulin.net>
Date: Wed, 15 Jul 2026 08:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Keep scheduler timeline name alive
To: "Yadav, Arvind" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com
References: <20260714064402.2457257-1-arvind.yadav@intel.com>
 <3f103d7b-3a58-4c3d-a4d7-e413e7b92e47@ursulin.net>
 <13aa91ef-452d-411d-9bb5-0ca43ea169da@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <13aa91ef-452d-411d-9bb5-0ca43ea169da@intel.com>
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


On 15/07/2026 05:26, Yadav, Arvind wrote:
> 
> On 14-07-2026 15:02, Tvrtko Ursulin wrote:
>>
>> On 14/07/2026 07:44, Arvind Yadav wrote:
>>> The scheduler keeps a pointer to the timeline name, but q->name
>>> is freed with the exec queue while scheduler fences can still
>>> reference it.
>>>
>>> Store the name in struct xe_guc_exec_queue so it shares
>>> the scheduler's RCU-deferred lifetime.
>>>
>>> Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe 
>>> access rules")
>>
>> Feel free to copy me if I broke something, or even fixed it 
>> incompletely. :)
>>
>> It is curious since I had an IGT which confirmed the fix was effective 
>> by dereferencing the timeline.
>>
>> At the time of the above commit:
>>
>> __guc_exec_queue_process_msg_cleanup
>>   __guc_exec_queue_fini
>>     guc_exec_queue_fini_async
>>     ...
>>         xe_sched_entity_fini
>>         xe_sched_fini
>>         kfree_rcu ge
>>         xe_exec_queue_fini q
>>           __xe_exec_queue_free
>>            kfree q
>>
>>
>> Now:
>>
>> __guc_exec_queue_process_msg_cleanup
>>   __guc_exec_queue_destroy
>>     guc_exec_queue_destroy_async
>>       __guc_exec_queue_destroy_async
>>         xe_exec_queue_fini
>>       __xe_exec_queue_fini
>>             guc_exec_queue_fini
>>             ...
>>               xe_sched_entity_fini
>>               xe_sched_fini
>>               kfree_rcu ge
>>       __xe_exec_queue_free
>>               kfree q
>>
>> Looks functionally identical.
>>
>> AFAIR the problem actually was:
>>
>> drm_sched_fence_get_timeline_name()
>>   return (const char *)fence->sched->name;
>>
>> Where fence->sched is drm sched, aka "ge" from the above flow.
>>
>> And that has kfree_rcu in the today's code base too. So no issue with 
>> the sched pointer itself.
>>
>> What about sched->name ie. q->name? It is only free after the 
>> scheduler is freed, so after the RCU grace, and if scheduler itself is 
>> unreachable then sched->name is surely unreachable too.
>>
>> What am I missing? Could you provide some details on where and how 
>> this crashes?
>>
> Thanks Tvrtko,
> 
> The gap is in the lifetime of sched->name, not fence->sched. 
> drm_sched_init() stores the name as a pointer. it does not copy it. 
> Today that pointer refers to q->name, which is embedded in struct 
> xe_exec_queue.
> 
> The teardown order is:
>          kfree_rcu(ge)    // scheduler remains valid until the RCU grace 
> period
>          kfree(q)         // q->name is freed immediately
> 
> So during the RCU grace period, fence->sched is still valid, but fence- 
>  >sched->name points into the already freed q. The patch moves the name 
> storage into ge, so the scheduler and its name share the same RCU- 
> deferred lifetime.

With a fresh pair of eyes, this definitely looks obviously true. But it 
is really odd KASAN did not spot this back then. It was easily spotting 
the fence->sched dereference and then with kfree_rcu it was completely 
happy. Odd so sorry for the noise.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Just one comment below:

> this issue is pointed by sashiko -: https://sashiko.dev/#/ 
> patchset/20260713042530.2108459-1-arvind.yadav%40intel.com
> 
> Regards,
> Arvind
> 
> 
>> Regards,
>>
>> Tvrtko
>>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
>>>   drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/ 
>>> gpu/drm/xe/xe_guc_exec_queue_types.h
>>> index e5e53b421f29..cda14d954e57 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/workqueue.h>
>>>     #include "xe_gpu_scheduler_types.h"
>>> +#include "xe_hw_fence_types.h"
>>>     struct dma_fence;
>>>   struct xe_exec_queue;
>>> @@ -24,6 +25,10 @@ struct xe_guc_exec_queue {
>>>       struct rcu_head rcu;
>>>       /** @sched: GPU scheduler for this xe_exec_queue */
>>>       struct xe_gpu_scheduler sched;
>>> +    /**
>>> +     * @name: Scheduler timeline name, kept with @sched until RCU free.

Strictly speaking it's not the name that is specifically kept but the 
whole struct, so maybe drop the ", kept with..." part?

Regards,

Tvrtko

>>> +     */
>>> +    char name[MAX_FENCE_NAME_LEN];
>>>       /** @entity: Scheduler entity for this xe_exec_queue */
>>>       struct xe_sched_entity entity;
>>>       /**
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_submit.c
>>> index cec3bbf3a10e..8ef6eeebfaa8 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1978,6 +1978,8 @@ static int guc_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>         xe_exec_queue_assign_name(q, q->guc->id);
>>>   +    strscpy(ge->name, q->name, sizeof(ge->name));
>>> +
>>>       /*
>>>        * Use primary queue's submit_wq for all secondary queues of a
>>>        * multi queue group. This serialization avoids any locking around
>>> @@ -1992,7 +1994,7 @@ static int guc_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>       err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>>>                   submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 
>>> 64,
>>>                   timeout, guc_to_gt(guc)->ordered_wq, NULL,
>>> -                q->name, gt_to_xe(q->gt)->drm.dev);
>>> +                ge->name, gt_to_xe(q->gt)->drm.dev);
>>>       if (err)
>>>           goto err_release_id;
>>

