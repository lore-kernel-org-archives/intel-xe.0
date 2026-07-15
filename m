Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C2BC44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 08:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD410EF2D;
	Wed, 15 Jul 2026 08:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Uy9kRZIm";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164A010EF2D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 08:09:48 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c15ba3a2b4bso597253266b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784102986; x=1784707786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cfBuc3RB87EpcSCXaukGemwpCUGIcu8gr3b68CC1yzk=;
 b=Uy9kRZImivqNwhy4etGcaRLEkM+gqUSArsRAB5Yng7PgBzReAW1aOsWixja03QRsBL
 EQEQeJqV2oX4tJy6QATRxFRB9WvrLCNdlQD22F6R0clhjNA0ohthrMtoTSyVKWYUsqxD
 MAx1EQfT+hcAgiH8C/bWfaXsj0k3qlBRZG/RVKTwpKK0/cdgKqHwM6HccXU0Tog/BHHI
 p39d7B04qhnmiqkGCtBcCRz34n1lJWQpn5k20yIJNofryh/ONXro1/G0tpoKUvA6yvme
 aK8sNonXD42kl25U3V7mt4cRUJTbQmZKqNUOAXPMsAqARFO8mATz5KOBeGJzc5vUXZAL
 p1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784102986; x=1784707786;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cfBuc3RB87EpcSCXaukGemwpCUGIcu8gr3b68CC1yzk=;
 b=ka1GwYxjQ2TxQP4cpMibt7tfoVlRjUA9ouzhoJDyvD6BoerwUXOVvW9WIFalE99vHu
 QLzXhNMSoDqs13LX5jeDiJR7UgPacVEFPiXNY8LC3NH2x1ULwlZDzqIhEQMWalfS0Kjx
 wySs6MUvwnwg2DeGMBCMT8Vhk99EBEa3ivoSsQPTbtHx6siE/ARDKFmsDsfvfQ8MeGHE
 zni/qDPnqnqlGsacr/qkNivdpNR8FqXSFs9d4DbaXlmj1pQOd0vAWC4w3E9Ki2fISbpJ
 qwoMDUuXd0BAQYJg35XC3YLfITQ1f4hdYuqR9tNomsm/JEetx2KXfu+rYKkNZZrQoLe8
 A1Lg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpq6svKvrpdv1f2pwRFlLlG/eFGF1CxSo6OPCR99nGo1EZRBxFyWz/6TnRXWjv0xbOTgXZX0OGQWw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTEO8afG7wH6n/hhX7XnXlfGFZfnT2TngcYjHxNSInkI18xljS
 xkJ5+u4FK44E372lrYw2AceCiGTr+tT9sCDLjUN/IeY4y3B4d4mTQPQNcyLaUOobWCc=
X-Gm-Gg: AfdE7cnAgJW6x20by6dVvSyd+Xrp3h3jWHiij0zb4bbL78I3Zjsq/ud26Dpwl+wgCbL
 1DS3N/ZGi9L0KaWz+p6Wrp3oWPH8RP3K+jk1ljFZUEM+F25pqaS4MQahI4NXr4RfeHHxeJDy5EF
 Hoyz4Z2alyhm9FQfTfpuAtXFu7eGVRafxQhhd0g0eIjq2XwcXVix1hgiGzAgBkfKoz2f/YfOmxs
 MlbIER7KG7t01/Nm4gAmCC6GbeyTnt6COU7xqEoiOabYc0LNLFrZfWFzvBZOZIHJs2XpW7sI5sS
 qifYrvnwDJLhOUjHoRlgKdu4APdedUZxsEXebOEkUccDw/JWPHJ93hkv1j+Klr3RtoGQb1jesAg
 XzPcOLQo47fNpBgSL8052Nw/Xuwi2GOmfxIYla2lfsuMfzrTHBGIeGcKD51zff24j8FYLwhDklV
 PzIgoQHHB0UdtkC3OnfWLiQIstMccw8IyE3A==
X-Received: by 2002:a17:907:a4b:b0:c15:e6a4:c71 with SMTP id
 a640c23a62f3a-c1661671413mr373773766b.19.1784102986168; 
 Wed, 15 Jul 2026 01:09:46 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1675936ab6sm95036366b.57.2026.07.15.01.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 01:09:45 -0700 (PDT)
Message-ID: <45c18ad2-ad59-4d0f-a4b2-f657b509adeb@ursulin.net>
Date: Wed, 15 Jul 2026 09:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Keep scheduler timeline name alive
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Yadav, Arvind" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
References: <20260714064402.2457257-1-arvind.yadav@intel.com>
 <3f103d7b-3a58-4c3d-a4d7-e413e7b92e47@ursulin.net>
 <13aa91ef-452d-411d-9bb5-0ca43ea169da@intel.com>
 <ba1420ef-26df-413a-8554-b60f470b9344@ursulin.net>
 <alc8x/nLLb+L/aFK@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <alc8x/nLLb+L/aFK@gsse-cloud1.jf.intel.com>
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



On 15/07/2026 08:54, Matthew Brost wrote:
> On Wed, Jul 15, 2026 at 08:49:00AM +0100, Tvrtko Ursulin wrote:
>>
>> On 15/07/2026 05:26, Yadav, Arvind wrote:
>>>
>>> On 14-07-2026 15:02, Tvrtko Ursulin wrote:
>>>>
>>>> On 14/07/2026 07:44, Arvind Yadav wrote:
>>>>> The scheduler keeps a pointer to the timeline name, but q->name
>>>>> is freed with the exec queue while scheduler fences can still
>>>>> reference it.
>>>>>
>>>>> Store the name in struct xe_guc_exec_queue so it shares
>>>>> the scheduler's RCU-deferred lifetime.
>>>>>
>>>>> Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the
>>>>> safe access rules")
>>>>
>>>> Feel free to copy me if I broke something, or even fixed it
>>>> incompletely. :)
>>>>
>>>> It is curious since I had an IGT which confirmed the fix was
>>>> effective by dereferencing the timeline.
>>>>
>>>> At the time of the above commit:
>>>>
>>>> __guc_exec_queue_process_msg_cleanup
>>>>    __guc_exec_queue_fini
>>>>      guc_exec_queue_fini_async
>>>>      ...
>>>>          xe_sched_entity_fini
>>>>          xe_sched_fini
>>>>          kfree_rcu ge
>>>>          xe_exec_queue_fini q
>>>>            __xe_exec_queue_free
>>>>             kfree q
>>>>
>>>>
>>>> Now:
>>>>
>>>> __guc_exec_queue_process_msg_cleanup
>>>>    __guc_exec_queue_destroy
>>>>      guc_exec_queue_destroy_async
>>>>        __guc_exec_queue_destroy_async
>>>>          xe_exec_queue_fini
>>>>        __xe_exec_queue_fini
>>>>              guc_exec_queue_fini
>>>>              ...
>>>>                xe_sched_entity_fini
>>>>                xe_sched_fini
>>>>                kfree_rcu ge
>>>>        __xe_exec_queue_free
>>>>                kfree q
>>>>
>>>> Looks functionally identical.
>>>>
>>>> AFAIR the problem actually was:
>>>>
>>>> drm_sched_fence_get_timeline_name()
>>>>    return (const char *)fence->sched->name;
>>>>
>>>> Where fence->sched is drm sched, aka "ge" from the above flow.
>>>>
>>>> And that has kfree_rcu in the today's code base too. So no issue
>>>> with the sched pointer itself.
>>>>
>>>> What about sched->name ie. q->name? It is only free after the
>>>> scheduler is freed, so after the RCU grace, and if scheduler itself
>>>> is unreachable then sched->name is surely unreachable too.
>>>>
>>>> What am I missing? Could you provide some details on where and how
>>>> this crashes?
>>>>
>>> Thanks Tvrtko,
>>>
>>> The gap is in the lifetime of sched->name, not fence->sched.
>>> drm_sched_init() stores the name as a pointer. it does not copy it.
>>> Today that pointer refers to q->name, which is embedded in struct
>>> xe_exec_queue.
>>>
>>> The teardown order is:
>>>           kfree_rcu(ge)    // scheduler remains valid until the RCU grace
>>> period
>>>           kfree(q)         // q->name is freed immediately
>>>
>>> So during the RCU grace period, fence->sched is still valid, but fence-
>>>> sched->name points into the already freed q. The patch moves the name
>>> storage into ge, so the scheduler and its name share the same RCU-
>>> deferred lifetime.
>>
>> With a fresh pair of eyes, this definitely looks obviously true. But it is
>> really odd KASAN did not spot this back then. It was easily spotting the
>> fence->sched dereference and then with kfree_rcu it was completely happy.
>> Odd so sorry for the noise.
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> I seem to remember bringing this up before, but I also remember it
> getting lost in the convoluted reasoning.

I don't remember anything like that and all I could find was 
https://lore.kernel.org/intel-xe/aCIBnh6JS%2FJuZOcM@lstrano-desk.jf.intel.com/ 
. Maybe it was something else?

Regards,

Tvrtko

> 
> Tvrtko's nit aside below:
> 
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> 
>>
>> Just one comment below:
>>
>>> this issue is pointed by sashiko -: https://sashiko.dev/#/
>>> patchset/20260713042530.2108459-1-arvind.yadav%40intel.com
>>>
>>> Regards,
>>> Arvind
>>>
>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
>>>>>    drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
>>>>>    2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>>>> b/drivers/ gpu/drm/xe/xe_guc_exec_queue_types.h
>>>>> index e5e53b421f29..cda14d954e57 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>>>> @@ -10,6 +10,7 @@
>>>>>    #include <linux/workqueue.h>
>>>>>      #include "xe_gpu_scheduler_types.h"
>>>>> +#include "xe_hw_fence_types.h"
>>>>>      struct dma_fence;
>>>>>    struct xe_exec_queue;
>>>>> @@ -24,6 +25,10 @@ struct xe_guc_exec_queue {
>>>>>        struct rcu_head rcu;
>>>>>        /** @sched: GPU scheduler for this xe_exec_queue */
>>>>>        struct xe_gpu_scheduler sched;
>>>>> +    /**
>>>>> +     * @name: Scheduler timeline name, kept with @sched until RCU free.
>>
>> Strictly speaking it's not the name that is specifically kept but the whole
>> struct, so maybe drop the ", kept with..." part?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>> +     */
>>>>> +    char name[MAX_FENCE_NAME_LEN];
>>>>>        /** @entity: Scheduler entity for this xe_exec_queue */
>>>>>        struct xe_sched_entity entity;
>>>>>        /**
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> b/drivers/gpu/drm/xe/ xe_guc_submit.c
>>>>> index cec3bbf3a10e..8ef6eeebfaa8 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -1978,6 +1978,8 @@ static int guc_exec_queue_init(struct
>>>>> xe_exec_queue *q)
>>>>>          xe_exec_queue_assign_name(q, q->guc->id);
>>>>>    +    strscpy(ge->name, q->name, sizeof(ge->name));
>>>>> +
>>>>>        /*
>>>>>         * Use primary queue's submit_wq for all secondary queues of a
>>>>>         * multi queue group. This serialization avoids any locking around
>>>>> @@ -1992,7 +1994,7 @@ static int guc_exec_queue_init(struct
>>>>> xe_exec_queue *q)
>>>>>        err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>>>>>                    submit_wq, xe_lrc_ring_size() /
>>>>> MAX_JOB_SIZE_BYTES, 64,
>>>>>                    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>>>>> -                q->name, gt_to_xe(q->gt)->drm.dev);
>>>>> +                ge->name, gt_to_xe(q->gt)->drm.dev);
>>>>>        if (err)
>>>>>            goto err_release_id;
>>>>
>>

