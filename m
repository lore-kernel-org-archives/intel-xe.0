Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6226AC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 10:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7DE10F314;
	Fri, 26 Apr 2024 10:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="hmAXF4Qu";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA7110EFC2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 10:49:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2de233961caso19654381fa.3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714128574; x=1714733374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QnJcjRtI4k9n13MCru6mxup2+bPgV/S36bPK7UA5kOs=;
 b=hmAXF4QuWcAeCeEK9WwpivvXIuehceZ9KSTJYCH+yMzpqYt56iFfWW95UD0eepv+AZ
 uJvoY0/J66ZWzcxe24kcTEIDaFpfQP5RBPvG0Ay/dSwFmqhMs4Ci9fi5d3Gc7XVfodSE
 4hXA4rseAi3gKwRVlNNVqgGvRGy3EGxGbBytWvXDySKx8qSnkbazCja98IqjghmMa/Lt
 om3ezAEYCu6eKIhSqwPP2QKyd7t1LE+OHePeALKoj5A5lbiDubONqQfzdx5uwrmAIoWt
 SkdIt2PTYxASDvF06hxAVP2l9vWUoagk9CLViaGcU/TjZ4PCvboEPOTDoNRXb/KydMDw
 iu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714128574; x=1714733374;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QnJcjRtI4k9n13MCru6mxup2+bPgV/S36bPK7UA5kOs=;
 b=QmtD1R03qmDMOQ0OXn29BVKDoXTstu1gvS5uiUlz/58UTpVdj8ofuEVwJq1Ji2a7Rh
 O4gjxBFIXIOgREd60AoN90JInZhDIhyVohCgIGiPCcxtZvdz9tA0nbfXHU7NBJPVkShz
 HpFOH6sWtEFM6xcsYLMf/saI5sPntTYTVXiraCkV2S94FPSFFv5m8AGLgIdumx9TqGwT
 696Yy48Xtf9FndNhdD8CcSeWYPG8pSAVpwwflW2e8ws7X0g+VzuOjGoEFmi5ROLcb1aP
 MQKCk1Uu5qi7U+wHgf1Myvbn+w+4IEI5QVJgMfUFPciBYZQh4f1P18A9ljLsKH2ShMhz
 b0kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYMLiMWUqmeYLPwGAE/pDO0GyLnmX4C+g4OY4PgJZLZdK3RSwPlgKV66f7GlRHpk8j0mNZdNouwtJ21K6ROwrdmuLVkoRmqCbIWY1YQPQ=
X-Gm-Message-State: AOJu0Yw28zd4De76EVNonpYrG3/K6eHY46fCigOvSyOI3E8uXmOaW6sY
 0MC+b0k8WkK1TtRb1i/mi66kvRPZXPSwQ2xz7aVt5jmlqhv1jt6uXHJUoBotqrY=
X-Google-Smtp-Source: AGHT+IFPB3wT32HxMmMvaMRurEEgW46Ocjyfy82qy/vad6yY6vLlxtQUK6SVI85YHV4hxHUz+xI+jA==
X-Received: by 2002:a2e:a417:0:b0:2dc:e3da:8025 with SMTP id
 p23-20020a2ea417000000b002dce3da8025mr1831843ljn.36.1714128573636; 
 Fri, 26 Apr 2024 03:49:33 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b004186f979543sm34578755wms.33.2024.04.26.03.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 03:49:33 -0700 (PDT)
Message-ID: <da261fef-03ef-47ad-8001-fe4fa26f43e0@ursulin.net>
Date: Fri, 26 Apr 2024 11:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe: Add helper to accumulate exec queue runtime
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-4-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240423235652.1959945-4-lucas.demarchi@intel.com>
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


On 24/04/2024 00:56, Lucas De Marchi wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Add a helper to accumulate per-client runtime of all its
> exec queues. Currently that is done in 2 places:
> 
> 	1. when the exec_queue is destroyed
> 	2. when the sched job is completed
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>   drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>   drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>   4 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2e62450d86e1..33d3bf93a2f1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -547,6 +547,15 @@ struct xe_file {
>   		struct mutex lock;
>   	} exec_queue;
>   
> +	/**
> +	 * @runtime: hw engine class runtime in ticks for this drm client
> +	 *
> +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
> +	 * case, since all jobs run in parallel on the engines, only the stats
> +	 * from lrc[0] are sufficient.

Out of curiousity doesn't this mean multi-lrc jobs will be incorrectly 
accounted for? (When capacity is considered.)

Regards,

Tvrtko

> +	 */
> +	u64 runtime[XE_ENGINE_CLASS_MAX];
> +
>   	/** @client: drm client */
>   	struct xe_drm_client *client;
>   };
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 395de93579fa..b7b6256cb96a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   {
>   	int i;
>   
> +	xe_exec_queue_update_runtime(q);
> +
>   	for (i = 0; i < q->width; ++i)
>   		xe_lrc_finish(q->lrc + i);
>   	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
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
> +	lrc = &q->lrc[0];
> +
> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +
> +	/*
> +	 * Special case the very first timestamp: we don't want the
> +	 * initial delta to be a huge value
> +	 */
> +	if (old_ts)
> +		xef->runtime[q->class] += new_ts - old_ts;
> +}
> +
>   void xe_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 02ce8d204622..45b72daa2db3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>   					       struct xe_vm *vm);
>   void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>   				  struct dma_fence *fence);
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index cd8a2fba5438..6a081a4fa190 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -242,6 +242,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>   {
>   	struct xe_lrc *lrc = job->q->lrc;
>   
> +	xe_exec_queue_update_runtime(job->q);
> +
>   	/*
>   	 * Can safely check just LRC[0] seqno as that is last seqno written when
>   	 * parallel handshake is done.
