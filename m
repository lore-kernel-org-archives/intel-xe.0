Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C477D5CC90
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 10:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0841410E77F;
	Wed, 30 Oct 2024 10:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSwg6MWV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A3710E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730285791; x=1761821791;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u3fpiMSpd5OWVMKi9urV2eyV6bRldj84tDM9OFV75mA=;
 b=gSwg6MWViLRh3rOzLn3eH4a3CzNfwE2Qa+FCDrsZs7d9UFyaTDbf4lzC
 jx8vZ88y64ghV5qpL+nIVpUzX1GFBMvNnGxLS+6MtNlvVyPySjUTm3/BF
 R1zxBUM36kKWUBZQIZ5+k7WGgfmIW28/DMLIO/3WwozzmcpGxOQR4FJlJ
 JtZ4kTpD0ETnBgyhcdhau12UDI/jkJ7+ZwJgxE2TIaTDDnSf0RViaoVHw
 Zq3QWi9kr30yPr2GMcAG+lLQvx5fLFkEVhbCJ1HpGo+1/eLEmWlJIqh7n
 VOQz6yQSlQK92CSGOxmgPmXE6WCMLyVkUhW9BlCmGUIvEoXFonr0dOjUW Q==;
X-CSE-ConnectionGUID: YGMmqzn8TDKFwaWVW1QF5g==
X-CSE-MsgGUID: Sp+7vrPURISYyTwpDsmu6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47454301"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="47454301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 03:56:31 -0700
X-CSE-ConnectionGUID: XYuAK2GwTS6VPZrSSXE/Ow==
X-CSE-MsgGUID: eNo7gxECSHKqfPkSNxKZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="81926978"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.252])
 ([10.245.244.252])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 03:56:29 -0700
Message-ID: <b4b37380-caee-4a46-bedd-78f32f622698@intel.com>
Date: Wed, 30 Oct 2024 10:56:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-5-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029214351.776293-5-lucas.demarchi@intel.com>
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

On 29/10/2024 21:43, Lucas De Marchi wrote:
> When an exec queue is killed it triggers an async process of asking the
> GuC to schedule the context out. The timestamp in the context image is
> only updated when this process completes. In case a userspace process
> kills an exec and tries to read the timestamp, it may not get an updated
> runtime.
> 
> Add synchronization between the process reading the fdinfo and the exec
> queue being killed. After reading all the timestamps, wait on exec
> queues in the process of being killed. When that wait is over,
> xe_exec_queue_fini() was already called and updated the timestamps.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>   drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>   drivers/gpu/drm/xe/xe_exec_queue.c   | 4 ++++
>   3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ef7412d653d2e..b949376ca388a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -614,6 +614,11 @@ struct xe_file {
>   		 * which does things while being held.
>   		 */
>   		struct mutex lock;
> +		/**
> +		 * @exec_queue.pending_removal: items pending to be removed to
> +		 * synchronize GPU state update with ongoing query.
> +		 */
> +		atomic_t pending_removal;
>   	} exec_queue;
>   
>   	/** @run_ticks: hw engine class run time in ticks for this drm client */
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 22f0f1a6dfd55..24a0a7377abf2 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -317,6 +317,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		break;
>   	}
>   
> +	/*
> +	 * Wait for any exec queue going away: their cycles will get updated on
> +	 * context switch out, so wait for that to happen
> +	 */
> +	wait_var_event(&xef->exec_queue.pending_removal,
> +		       !atomic_read(&xef->exec_queue.pending_removal));
> +
>   	xe_pm_runtime_put(xe);
>   
>   	if (unlikely(!hwe))
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fd0f3b3c9101d..58dd35beb15ad 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   
>   	/*
>   	 * Before releasing our ref to lrc and xef, accumulate our run ticks
> +	 * and wakeup any waiters.
>   	 */
>   	xe_exec_queue_update_run_ticks(q);
> +	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
> +		wake_up_var(&q->xef->exec_queue.pending_removal);
>   
>   	for (i = 0; i < q->width; ++i)
>   		xe_lrc_put(q->lrc[i]);
> @@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> +	atomic_inc(&xef->exec_queue.pending_removal);

Probably need to move this down, otherwise I think user can supply bogus 
queue id or perhaps just accidentally supply an already destroyed queue, 
to get many increments per queue which is then unbalanced with the 
fini() and then show_run_ticks() gets stuck waiting forever?

>   	mutex_lock(&xef->exec_queue.lock);
>   	q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
>   	mutex_unlock(&xef->exec_queue.lock);
