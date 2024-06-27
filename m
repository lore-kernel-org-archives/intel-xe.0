Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E5FC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 16:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F026010E13F;
	Thu, 27 Jun 2024 16:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhzqFRJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9310E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719506206; x=1751042206;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8f+wPhQliHK9PQYdDZmOQxuuUPuX9Kk276hz5MuwV6w=;
 b=ZhzqFRJCq8n6x6IZKHK+2eVOyimVxD+5G8q4GLQuK9XH9nhkLRvY4vbN
 xZgsajVEDwiC0G5VtYnGgHDI2pZiKCbhqYjv69Hwg0vjPmzw5kggFgnvi
 5r7oqOviBStI7i4C6/Io64M7HI3NoYRNmQzU7+gD7t0HofPfdOLlVdQPK
 LYxr8xUO25B3rnyQ2GVqJR8K28ZqToh0VNy2BBHk5nDHmXq9SFS+8QbdN
 J/1vDHZx/VMixLn9AuqFy2vTScZFfFQnanIEDhHgkdQ99HxPa26GSTdVO
 hb/l8bKL8B/HFJ83q+4Kxb7G9EYEtle6r4tgzLMj7b2LdqwXG2Zyk8H+E w==;
X-CSE-ConnectionGUID: 7W+CxiYlQwCIE4qWeZYsyQ==
X-CSE-MsgGUID: gkmC4LMjRkmMsUYqDWKpHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="12286338"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="12286338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 09:36:46 -0700
X-CSE-ConnectionGUID: GuXYW+iJQJGZ8so5Pubq1A==
X-CSE-MsgGUID: YadZhTvwT/iThW6e3EejQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="45193308"
Received: from unknown (HELO [10.245.245.90]) ([10.245.245.90])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 09:36:45 -0700
Message-ID: <2434297e-bbf5-456a-886c-4abd9a1aed22@intel.com>
Date: Thu, 27 Jun 2024 17:36:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/xe: Add xe_exec_queue_last_fence_test_dep
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240626211546.4099339-1-matthew.brost@intel.com>
 <20240626211546.4099339-4-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240626211546.4099339-4-matthew.brost@intel.com>
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

On 26/06/2024 22:15, Matthew Brost wrote:
> Helpful to determine if a bind can immediately use CPU or needs to be
> deferred a drm scheduler job.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0ba37835849b..65b4d1da6c93 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -906,3 +906,26 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
>   	xe_exec_queue_last_fence_put(q, vm);
>   	q->last_fence = dma_fence_get(fence);
>   }
> +
> +/**
> + * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Returns:
> + * 0 on success on dependency, -ETIME on dependency

Could maybe improve the wording here?

"-ETIME if there exists an unsignalled last fence dependency, zero 
otherwise."

?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + */
> +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> +{
> +	struct dma_fence *fence;
> +	int err = 0;
> +
> +	fence = xe_exec_queue_last_fence_get(q, vm);
> +	if (fence) {
> +		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> +			0 : -ETIME;
> +		dma_fence_put(fence);
> +	}
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 289a3a51d2a2..ded77b0f3b90 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -75,6 +75,8 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>   					       struct xe_vm *vm);
>   void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>   				  struct dma_fence *fence);
> +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> +				      struct xe_vm *vm);
>   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>   
>   #endif
