Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B422C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 08:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4910E2D9;
	Mon, 16 Jun 2025 08:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EMJkuGaa";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B743810E2D9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 08:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpeKYKidK2Xb1wyL827XzEn3VI+lFxYrtm7n7VXEytY=; b=EMJkuGaaaSPoIJ7btturzMn+Rq
 gajF0kLu0wFk6pvkHQnFVVX8INYoPOfgLpL96vhyXCDTk+fZyEH7hdup4mvXzjUpltQqDKQURvJC1
 8va9u6tAK32Ofp63SU2QYPzQTGa6mtlVHoA6Zq09DPmIxJYDxikk3m8qBzXPQzaIXYbNTZ0AIR8Es
 k8GyoQaqdtiiRJl0k9cuoh8Acvunweq7GsBN3TrtbWpq/zT8AEIOXGx9tREqmNQx/lMSN1f92kWtN
 BgAgvWn4xFmklLY+Nl9FnybuqYpKwvw2ZHALRf/c12sv/qE/idDIUqCVrXwDn9mxfhPfGouRoeNlV
 cMCWVF5w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uR5JD-0041iI-2W; Mon, 16 Jun 2025 10:35:15 +0200
Message-ID: <faba71be-0f1c-4c5a-81db-b072e43a1c7e@igalia.com>
Date: Mon, 16 Jun 2025 09:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Use RCU free for exec queue, not GuC exec queue
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20250616072737.2062805-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250616072737.2062805-1-matthew.brost@intel.com>
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


On 16/06/2025 08:27, Matthew Brost wrote:
> The exec queue name is used in dma-fence timelines, not the GuC exec queue.
> Therefore, the exec queue itself requires RCU freeing rather than the
> GuC exec queue.
> 
> Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access rules")
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c           | 7 ++++++-
>   drivers/gpu/drm/xe/xe_exec_queue_types.h     | 2 ++
>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 2 --
>   drivers/gpu/drm/xe/xe_guc_submit.c           | 7 +------
>   4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fee22358cc09..d8c3e983ffb6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -47,7 +47,11 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>   	if (q->xef)
>   		xe_file_put(q->xef);
>   
> -	kfree(q);
> +	/*
> +	 * RCU free due sched being exported via DRM scheduler fences
> +	 * (timeline name).
> +	 */
> +	kfree_rcu(q, rcu);
>   }
>   
>   static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> @@ -82,6 +86,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	INIT_LIST_HEAD(&q->multi_gt_link);
>   	INIT_LIST_HEAD(&q->hw_engine_group_link);
>   	INIT_LIST_HEAD(&q->pxp.link);
> +	init_rcu_head(&q->rcu);
>   
>   	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>   	q->sched_props.preempt_timeout_us =
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cc1cffb5c87f..a17fe852fc0d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -43,6 +43,8 @@ struct xe_exec_queue {
>   
>   	/** @gt: GT structure this exec queue can submit to */
>   	struct xe_gt *gt;
> +	/** @rcu: For safe freeing of exported dma fences */
> +	struct rcu_head rcu;
>   	/**
>   	 * @hwe: A hardware of the same class. May (physical engine) or may not
>   	 * (virtual engine) be where jobs actual engine up running. Should never
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index a3f421e2adc0..4c39f01e4f52 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -20,8 +20,6 @@ struct xe_exec_queue;
>   struct xe_guc_exec_queue {
>   	/** @q: Backpointer to parent xe_exec_queue */
>   	struct xe_exec_queue *q;
> -	/** @rcu: For safe freeing of exported dma fences */
> -	struct rcu_head rcu;
>   	/** @sched: GPU scheduler for this xe_exec_queue */
>   	struct xe_gpu_scheduler sched;
>   	/** @entity: Scheduler entity for this xe_exec_queue */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index df7a5a4eec74..7170e78e5b8e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1299,11 +1299,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>   	xe_sched_entity_fini(&ge->entity);
>   	xe_sched_fini(&ge->sched);
>   
> -	/*
> -	 * RCU free due sched being exported via DRM scheduler fences
> -	 * (timeline name).
> -	 */
> -	kfree_rcu(ge, rcu);
> +	kfree(ge);
>   	xe_exec_queue_fini(q);

Hmm but before it gets to the name it needs to dereference the drm 
sched, and drm sched is embedded in the guc queue.

So as soon as kfree(ge) runs here, drm_sched_fence_get_timeline_name() 
can oops on fence->sched dereference.

Name is then one derefence further - fence->sched->name. Which indeed 
points to xe_exec_queue, but because that one is destroyed second, 
kfree_rcu on the guc queue adds the appropriate guarantee of one RCU 
period before signaling and ability to enter fence->get_timeline_name().

In summary how I had it still looks correct to me. Does it explode 
somehow or what prompted you to think it was wrong?

Regards,

Tvrtko

>   	xe_pm_runtime_put(guc_to_xe(guc));
>   }
> @@ -1486,7 +1482,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   
>   	q->guc = ge;
>   	ge->q = q;
> -	init_rcu_head(&ge->rcu);
>   	init_waitqueue_head(&ge->suspend_wait);
>   
>   	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)

