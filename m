Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87529C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11AD10E8F8;
	Thu,  9 Nov 2023 19:24:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F9089208
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699557874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfkcJaVIIPVVOX1IxLCBmZxlniFvORDk1tvPWn/P4UY=;
 b=dpvBNqw8bx6Jg6StqvGE5BPKI+8Gic0xNpECQWsAsk85y2oAS4AyzStyL9qSlRBsOVrNSm
 jkUZg3lyyXHS7RoVO9KF7UKN2tUT259TX5JiKOYm8p2xgmI0XyvB8hJf5YGoj8QiShIZJo
 6XkcfZ90LyX9YOVOUoWs6emSZhAP9FY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-eovwwF_uOTuaDbX6nLy9oQ-1; Thu, 09 Nov 2023 14:24:30 -0500
X-MC-Unique: eovwwF_uOTuaDbX6nLy9oQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5090f6a04e1so1185205e87.0
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Nov 2023 11:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699557868; x=1700162668;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UfkcJaVIIPVVOX1IxLCBmZxlniFvORDk1tvPWn/P4UY=;
 b=TOfOXDZ6Cm9IzJWFA6sqvSXrbi0hPqbceHdd1B+xwLWYYalon9Yfr9CAEeaSPpImon
 PdU20HzesKs51JQnugFMgwsoPRCgelA5bppZNaSREGxkHz8hVXUQhVH+EPI6BAtPyazB
 Cm1A+chQntmW5x4g67KOXCiN6RHAOZDUEREu3T+fcfoOKxdcWpxy0hkM3cT2L7qRMIk3
 CLrEvMIHDpumFEKKFB0IjPkNeK0TCUCnLOfrogPoLh/eERTaZOiioo315+JZSHVGBaoS
 d1d/5nfd4h2ZJs4DIkOjYnCBv+PI7NzAgvF2H3FcaajBW4tj5nX0Imp4cVLb5Zkz57Ux
 +Xwg==
X-Gm-Message-State: AOJu0YzKz4JndNE2Pry8i0uas4MaIywdB3N1pKrmabpLcjekCOaen/VP
 HzIPHsJy5FPydBF6cR6F0LPaJOMum5X6O4ad/vHbMp8aE2ATYVSKWGDYxnJE/UKX1DWIz3GQxyb
 EM3gth+MS+wLXykeuATkYXU8c6xY=
X-Received: by 2002:ac2:5326:0:b0:509:2b82:385c with SMTP id
 f6-20020ac25326000000b005092b82385cmr2175902lfh.61.1699557868561; 
 Thu, 09 Nov 2023 11:24:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRFhhhj7EzORBBem/by8FGEnPGyCry7jtaOkMZqjrt8varQMNkD7qy7umi+xhIibmolJ14kg==
X-Received: by 2002:ac2:5326:0:b0:509:2b82:385c with SMTP id
 f6-20020ac25326000000b005092b82385cmr2175893lfh.61.1699557868179; 
 Thu, 09 Nov 2023 11:24:28 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 v29-20020adfa1dd000000b0032dab20e773sm321761wrv.69.2023.11.09.11.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 11:24:27 -0800 (PST)
Message-ID: <da463288-5c22-4786-bc75-ec21ae9cf96c@redhat.com>
Date: Thu, 9 Nov 2023 20:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luben Tuikov <ltuikov89@gmail.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <70fb8d33-6b39-433f-8fa3-76883001ed68@redhat.com>
 <603b1390-3593-4056-a29b-261b7f635ff6@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <603b1390-3593-4056-a29b-261b7f635ff6@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/sched: Don't disturb the entity when in
 RR-mode scheduling
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/9/23 07:52, Luben Tuikov wrote:
> Hi,
> 
> On 2023-11-07 19:41, Danilo Krummrich wrote:
>> On 11/7/23 05:10, Luben Tuikov wrote:
>>> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
>>> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
>>> it do just that, schedule the work item for execution.
>>>
>>> The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
>>> to determine if the scheduler has an entity ready in one of its run-queues,
>>> and in the case of the Round-Robin (RR) scheduling, the function
>>> drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
>>> which is ready, sets up the run-queue and completion and returns that
>>> entity. The FIFO scheduling algorithm is unaffected.
>>>
>>> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
>>> in the case of RR scheduling, that would result in drm_sched_select_entity()
>>> having been called twice, which may result in skipping a ready entity if more
>>> than one entity is ready. This commit fixes this by eliminating the call to
>>> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
>>> in drm_sched_run_job_work().
>>>
>>> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>>>       Add fixes-tag. (Tvrtko)
>>>
>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
>>>    1 file changed, 3 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 27843e37d9b769..cd0dc3f81d05f0 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>    }
>>>    
>>>    /**
>>> - * __drm_sched_run_job_queue - enqueue run-job work
>>> + * drm_sched_run_job_queue - enqueue run-job work
>>>     * @sched: scheduler instance
>>>     */
>>> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	if (!READ_ONCE(sched->pause_submit))
>>>    		queue_work(sched->submit_wq, &sched->work_run_job);
>>> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>    void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	if (drm_sched_can_queue(sched))
>>> -		__drm_sched_run_job_queue(sched);
>>> +		drm_sched_run_job_queue(sched);
>>>    }
>>>    
>>>    /**
>>> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_pick_best);
>>>    
>>> -/**
>>> - * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
>>> - * @sched: scheduler instance
>>> - */
>>> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>> -{
>>> -	if (drm_sched_select_entity(sched))
>>
>> Hm, now that I rebase my patch to implement dynamic job-flow control I recognize that
>> we probably need the peek semantics here. If we do not select an entity here, we also
>> do not check whether the corresponding job fits on the ring.
>>
>> Alternatively, we simply can't do this check in drm_sched_wakeup(). The consequence would
>> be that we don't detect that we need to wait for credits to free up before the run work is
>> already executing and the run work selects an entity.
> 
> So I rebased v5 on top of the latest drm-misc-next, and looked around and found out that
> drm_sched_wakeup() is missing drm_sched_entity_is_ready(). It should look like the following,

Yeah, but that's just the consequence of re-basing it onto Tvrtko's patch.

My point is that by removing drm_sched_select_entity() from drm_sched_run_job_queue() we do not
only loose the check whether the selected entity is ready, but also whether we have enough
credits to actually run a new job. This can lead to queuing up work that does nothing but calling
drm_sched_select_entity() and return.

By peeking the entity we could know this *before* scheduling work and hence avoid some CPU scheduler
overhead.

However, since this patch already landed and we can fail the same way if the selected entity isn't
ready I don't consider this to be a blocker for the credit patch, hence I will send out a v6.

> 
> void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> 		      struct drm_sched_entity *entity)
> {
> 	if (drm_sched_entity_is_ready(entity))
> 		if (drm_sched_can_queue(sched, entity))
> 			drm_sched_run_job_queue(sched);
> }
> 
> See the attached patch. (Currently running with base-commit and the attached patch.)

