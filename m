Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B3BC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 08:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0AC10FA0B;
	Wed,  8 May 2024 08:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="mdpwTP+T";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C620310FA0B
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 08:35:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so30643705e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 08 May 2024 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1715157301; x=1715762101;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fx3k2+ni74MzgbdCeMHReq7NDGxafrGExvPG66mmzSo=;
 b=mdpwTP+TXBBqB6B+oYmeMJGk9RxrEBo+MOb61wwoDhZSj6JxJK0T4m1eToG+cuF4Qn
 Z2CYIjupJL/So6r23Exapyx6lLD1UkN0MmkMpDLmgZsPeJRQiAS1NYDl+XC6yeYujHPS
 f/VCXCl0NBAlspwEg8FFkeJqjg+YhBQi5Ys02MhMsdFIvF6M1JjMltJutt3Q6dALC2hI
 MixkUy1PVA06RMZoA2+fORdikEobKsPV2ACoDPfS+3dv1lVg09/Z7bHbyTmZe3Clji90
 VaW85toY/6oKcnTq2ukrK7KoWiHbJmI3ZrN8oRPxwcYEqJG4M6GdSPS8dhsRbMPhqI7V
 5FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157301; x=1715762101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fx3k2+ni74MzgbdCeMHReq7NDGxafrGExvPG66mmzSo=;
 b=Qu3x4YJhpm4HlQ/lSu0/D2eH5sphxY2SF9ozexzaLjghNvmuQBgAFgWZWZzpxBGyvp
 kmnbLJkpGbrHS3o7rXynfJHPsZnX5fX0inSNTzUrioKEPTpC3jvptvo7nCNiY4+VjGXT
 Jwwso4AIxfpRfe1oJpy3k1bOA1/i0xoMnaN0N90Bh8RmJVI27yPnfb6xTK0qIsaJpmQU
 DpHFsyG74unhjTPeMrnnFh9XMiPt3ym72+Y+cwnMMZLqVAvIOp0Q5VpFiQP8BxB3SRSC
 uTQkne7bcz5Q2rGHM6NQYbnn5BIJox446hGMuD+LtIPHst8ntj3Xrvtox9bA/3qg0jx1
 lCOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCeutDYTx8ggwHF9zN9M5voMcPe1paP1bFFBhZnhjGQIIQfaGxieftLeUEPxDapK1ojoATDpnDwWEg98xUdwh1QTbL+D1+H28eserG/FU=
X-Gm-Message-State: AOJu0YxuOPYhfaB/7g8feAqpk80LUXmMaLaFxlcwtlT4sHVzMtInkTul
 ng57oajWf/43nSG83h+oW0jpZm6MPyytMwrsQ4aUnflINw5F+1kndNzt5GfqdAs=
X-Google-Smtp-Source: AGHT+IEoz11ZrsDCP8hW3rmfIsUwWZWgQTZoCO9mDe6dBn1F9oxVLP+wlwJ5zSouZY2erxrrnlM5lQ==
X-Received: by 2002:a05:600c:4e0e:b0:416:88f9:f5ea with SMTP id
 5b1f17b1804b1-41f71accaf3mr17691845e9.34.1715157300825; 
 Wed, 08 May 2024 01:35:00 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b0041bff91ea43sm1459533wmb.37.2024.05.08.01.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 01:35:00 -0700 (PDT)
Message-ID: <2e7c4f62-a539-4985-8bd7-2f6d6030e6dd@ursulin.net>
Date: Wed, 8 May 2024 09:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/xe: Add helper to accumulate exec queue runtime
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
 <20240507224510.442971-6-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240507224510.442971-6-lucas.demarchi@intel.com>
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


On 07/05/2024 23:45, Lucas De Marchi wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Add a helper to accumulate per-client runtime of all its
> exec queues. This is called every time a sched job is finished.
> 
> v2:
>    - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>      runtime when job is finished since xe_sched_job_completed() is not a
>      notification that job finished.
>    - Stop trying to update runtime from xe_exec_queue_fini() - that is
>      redundant and may happen after xef is closed, leading to a
>      use-after-free
>    - Do not special case the first timestamp read: the default LRC sets
>      CTX_TIMESTAMP to zero, so even the first sample should be a valid
>      one.
>    - Handle the parallel submission case by multiplying the runtime by
>      width.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>   drivers/gpu/drm/xe/xe_exec_queue.c   | 35 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>   drivers/gpu/drm/xe/xe_execlist.c     |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
>   5 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 906b98fb973b..de078bdf0ab9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -560,6 +560,15 @@ struct xe_file {
>   		struct mutex lock;
>   	} exec_queue;
>   
> +	/**
> +	 * @runtime: hw engine class runtime in ticks for this drm client
> +	 *
> +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
> +	 * case, since all jobs run in parallel on the engines, only the stats
> +	 * from lrc[0] are sufficient.
> +	 */
> +	u64 runtime[XE_ENGINE_CLASS_MAX];
> +
>   	/** @client: drm client */
>   	struct xe_drm_client *client;
>   };
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 395de93579fa..86eb22e22c95 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -769,6 +769,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>   		q->lrc[0].fence_ctx.next_seqno - 1;
>   }
>   
> +/**
> + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
> + * @q: The exec queue
> + *
> + * Update the timestamp saved by HW for this exec queue and save runtime
> + * calculated by using the delta from last update. On multi-lrc case, only the
> + * first is considered.
> + */
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> +{
> +	struct xe_file *xef;
> +	struct xe_lrc *lrc;
> +	u32 old_ts, new_ts;
> +
> +	/*
> +	 * Jobs that are run during driver load may use an exec_queue, but are
> +	 * not associated with a user xe file, so avoid accumulating busyness
> +	 * for kernel specific work.
> +	 */
> +	if (!q->vm || !q->vm->xef)
> +		return;
> +
> +	xef = q->vm->xef;
> +
> +	/*
> +	 * Only sample the first LRC. For parallel submission, all of them are
> +	 * scheduled together and we compensate that below by multiplying by
> +	 * width
> +	 */
> +	lrc = &q->lrc[0];
> +
> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +	xef->runtime[q->class] += (new_ts - old_ts) * q->width;

I think in theory this could be introducing a systematic error depending 
on how firmware handles things and tick resolution. Or even regardless 
of the firmware, if the timestamps are saved on context exit by the GPU 
hw itself and parallel contexts do not exit 100% aligned. Undershoot 
would be I think fine, but systematic overshoot under constant 100% 
parallel load from mutlitple client could constantly show >100% class 
utilisation. Probably not a concern in practice but worthy a comment?

Regards,

Tvrtko

> +}
> +
>   void xe_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 48f6da53a292..e0f07d28ee1a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -75,5 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>   					       struct xe_vm *vm);
>   void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>   				  struct dma_fence *fence);
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index dece2785933c..a316431025c7 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -307,6 +307,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
>   {
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   
> +	xe_exec_queue_update_runtime(job->q);
>   	xe_sched_job_put(job);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d274a139010b..e0ebfe83dfe8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -749,6 +749,8 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>   {
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   
> +	xe_exec_queue_update_runtime(job->q);
> +
>   	trace_xe_sched_job_free(job);
>   	xe_sched_job_put(job);
>   }
