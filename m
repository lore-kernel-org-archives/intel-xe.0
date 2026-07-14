Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8709AC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 09:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4164E10E6A7;
	Tue, 14 Jul 2026 09:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="DmCHfbEW";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F83B10E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 09:32:12 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c15f020a223so532115866b.1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784021531; x=1784626331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IutPtTO1ZuTokmR7Cv7+6zqNGJ/ROF8mV/RFoMSHFSE=;
 b=DmCHfbEWfWB2CiyvZujTWlu8DhM8L3ZOlmC++hBklh2OtEp3CtLCyZy2v8hUyyMQlQ
 8DQRLWitcDuCynm+/74mR7wVXXeA7vUY7lI98eJTTsTqgeJ1WUjljTlTupW4ilT3rtmo
 sSVZRvZ6M71iWAgDnCEIMoO1sGWp1tbRKXR2aYG10//1OInueW8WCZzv8gUckqhNaRrC
 eOngGnj99/FzlOVJyCSuHl82zkArYqOuiChQfVtp83GvPq0py0Bg8HmFPlMsdiz5Ie6h
 LHRgpRpTNRuqmVvixd1vfswgVDXB0uESfpeQIcUMQpNTs6z/dca1Raldz2p9wWvAhd8C
 O0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784021531; x=1784626331;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IutPtTO1ZuTokmR7Cv7+6zqNGJ/ROF8mV/RFoMSHFSE=;
 b=riO3YLgLOqnkHcgz+qFvMUOcMntpErrSjkghUp2PMr5QZHGoGRlL8n/ptRrTijO9yv
 jqjd4tsDgw/PkJhSwW4hMpLrZh++Xg05nNqZg8PRy98l9uqt/oQsTkzMg65iV6l/oW6s
 Dhtp8C2rj7MhwstMen8vlOKyAvhB5GC12lTQ/rK0rBmYd4GMV9ne19igtnUTBiSYhgjZ
 eB+lSIeDzUPyCyjDwP4zcxboghRijI0zIJA9AuQBaU/u/9DMzHAHdkjdcsNMXGkcNU+N
 jH4O0mrz3FjpOoTk1N0JdQZJ+Z2EKb3Nq8S7YD82BscUH2OPd0L7h4Rw076ZVJhIMNWX
 SwYw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHEnyhoIa5JSxy588SN+YPigdy284iAm3mt3fWtcW2oqGeLgbQxp47mK62fw5xVq1wimDx/z9xoA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzlnB+UWDh3fQdtKeiQXSyWm4u/OEstxY1AmNnNOqI5fn2e3te
 bXI03wycVGMFTQZFnb/h8c0v1SzgZVOnHSGe0f0oVPUHj2SDw8GzGR4LuEjSOjXFyHs=
X-Gm-Gg: AfdE7cnp3GkMGy+4i5Tdi1nJbMsnBJMX/R/eFaXUBYtfgjC4j2tfs/ZsoZqextffsCz
 X5mGj22xJKPVnY9U5DDlWYJReGZgr22Ws1ZsvsfV7hkEO+HWIpAUryxw94loExLduTgltZEc4Et
 Si1fMwykC8ArLXJgqgd84jwiPhg/HSgqVjRhhbrSMj9ww67JgQhwjhKEZa5f+etefiWCNSCcpra
 aEnYLh8SHj9rGp1wQA1L1ASeUrXrfgBT0WN5/0sE6cm8DC6n9y40ULDqo2Vp75f7hhvi44vfwZ9
 TQtxR5upubhtyHUgOcR6NOL36yYXQ04oC1Oks2It1N189K0JkO8c9ae+LqFuGC63iBZu+tGnyJE
 4NSzcX5tFsJoDDQs48NvSCK+aYMZHLM5gkDxQ+xv3yQW6wvEIxzwPnnobQnOUkkoq2WYr/ON34n
 u865Sc7VqKcCZ8BaOnCaDQt0KmenqtJ4K9xQ==
X-Received: by 2002:a17:907:d28:b0:c12:4c93:852b with SMTP id
 a640c23a62f3a-c16679962eamr72380766b.13.1784021530605; 
 Tue, 14 Jul 2026 02:32:10 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1602f5e9c5sm587742866b.21.2026.07.14.02.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:32:10 -0700 (PDT)
Message-ID: <3f103d7b-3a58-4c3d-a4d7-e413e7b92e47@ursulin.net>
Date: Tue, 14 Jul 2026 10:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Keep scheduler timeline name alive
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com
References: <20260714064402.2457257-1-arvind.yadav@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260714064402.2457257-1-arvind.yadav@intel.com>
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


On 14/07/2026 07:44, Arvind Yadav wrote:
> The scheduler keeps a pointer to the timeline name, but q->name
> is freed with the exec queue while scheduler fences can still
> reference it.
> 
> Store the name in struct xe_guc_exec_queue so it shares
> the scheduler's RCU-deferred lifetime.
> 
> Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access rules")

Feel free to copy me if I broke something, or even fixed it incompletely. :)

It is curious since I had an IGT which confirmed the fix was effective 
by dereferencing the timeline.

At the time of the above commit:

__guc_exec_queue_process_msg_cleanup
   __guc_exec_queue_fini
     guc_exec_queue_fini_async
     ...
         xe_sched_entity_fini
         xe_sched_fini
         kfree_rcu ge
         xe_exec_queue_fini q
           __xe_exec_queue_free
            kfree q


Now:

__guc_exec_queue_process_msg_cleanup
   __guc_exec_queue_destroy
     guc_exec_queue_destroy_async
       __guc_exec_queue_destroy_async
         xe_exec_queue_fini
	  __xe_exec_queue_fini
             guc_exec_queue_fini
             ...
               xe_sched_entity_fini
               xe_sched_fini
               kfree_rcu ge
	  __xe_exec_queue_free
               kfree q

Looks functionally identical.

AFAIR the problem actually was:

drm_sched_fence_get_timeline_name()
   return (const char *)fence->sched->name;

Where fence->sched is drm sched, aka "ge" from the above flow.

And that has kfree_rcu in the today's code base too. So no issue with 
the sched pointer itself.

What about sched->name ie. q->name? It is only free after the scheduler 
is freed, so after the RCU grace, and if scheduler itself is unreachable 
then sched->name is surely unreachable too.

What am I missing? Could you provide some details on where and how this 
crashes?

Regards,

Tvrtko

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
>   drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index e5e53b421f29..cda14d954e57 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -10,6 +10,7 @@
>   #include <linux/workqueue.h>
>   
>   #include "xe_gpu_scheduler_types.h"
> +#include "xe_hw_fence_types.h"
>   
>   struct dma_fence;
>   struct xe_exec_queue;
> @@ -24,6 +25,10 @@ struct xe_guc_exec_queue {
>   	struct rcu_head rcu;
>   	/** @sched: GPU scheduler for this xe_exec_queue */
>   	struct xe_gpu_scheduler sched;
> +	/**
> +	 * @name: Scheduler timeline name, kept with @sched until RCU free.
> +	 */
> +	char name[MAX_FENCE_NAME_LEN];
>   	/** @entity: Scheduler entity for this xe_exec_queue */
>   	struct xe_sched_entity entity;
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cec3bbf3a10e..8ef6eeebfaa8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1978,6 +1978,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   
>   	xe_exec_queue_assign_name(q, q->guc->id);
>   
> +	strscpy(ge->name, q->name, sizeof(ge->name));
> +
>   	/*
>   	 * Use primary queue's submit_wq for all secondary queues of a
>   	 * multi queue group. This serialization avoids any locking around
> @@ -1992,7 +1994,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>   			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> -			    q->name, gt_to_xe(q->gt)->drm.dev);
> +			    ge->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)
>   		goto err_release_id;
>   

