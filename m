Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AF7CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 08:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4581610E17A;
	Wed,  8 Oct 2025 08:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHo3fAPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227DA10E17A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759912034; x=1791448034;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TiV234+pi/n1oOAh+R49xeMwuwfOyxd93+epDNE06Tw=;
 b=mHo3fAPxoeQR58QXPafruF2uZMkgv1v7TzP12OzXjafXy9PXqViEgP4b
 rOVgmzfHI0sybHpjL4QpxjtAp1lY/Hh02QyR41Kct88MdBxttX7RZzgHg
 AIPjF5EimvULOlXaSPhUYm426HenavJRKRrjToZpQoijCyZEU+Tv2OWSB
 1zFzXP0Da98oOU4+XW9KzE3DSBfzfbX0+XPqPxLPrQnowrP58tAMjqN5Y
 0aDsgluZDfmdwvC8Z/3vwUhw7UTWSRJVgRQrUFFGtGYHVfrwQZ95oMfLM
 FvGV4tInl29sorUbk4YzDzyLNWvcyUP4uSwcymfx81SgEJ5bYBd0G6jHl g==;
X-CSE-ConnectionGUID: oMkrmScSRN2qQbRG+Ia2nA==
X-CSE-MsgGUID: t3WEwnNHRA+ANdp4+wuPkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79746273"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="79746273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:27:14 -0700
X-CSE-ConnectionGUID: 4a+lkPlIQpKEC9X+MAFQkA==
X-CSE-MsgGUID: I8oKOSZ9RdOnAGQLPSsFFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180333825"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.123])
 ([10.245.244.123])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:27:13 -0700
Message-ID: <4cc6fb22-749c-410e-80b7-da286e3398f9@intel.com>
Date: Wed, 8 Oct 2025 09:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/33] drm/xe: Return first unsignaled job first
 pending job helper
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <20251007130505.2694829-6-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251007130505.2694829-6-matthew.brost@intel.com>
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

On 07/10/2025 14:04, Matthew Brost wrote:
> In all cases where the first pending job helper is called, we only want
> to retrieve the first unsignaled pending job, as this helper is used
> exclusively in recovery flows. It is possible for signaled jobs to
> remain in the pending list as the scheduler is stopped, so those should
> be skipped.
> 
> Also, add kernel documentation to clarify this behavior.
> 
> v8:
>   - Split out into own patch (Auld)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index e548b2aed95a..3a9ff78d9346 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -77,17 +77,30 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>   	spin_unlock(&sched->base.job_list_lock);
>   }
>   
> +/**
> + * xe_sched_first_pending_job() - Find first pending job which is unsignaled
> + * @sched: Xe GPU scheduler
> + *
> + * Return first unsignaled job in pending list or NULL
> + */
>   static inline
>   struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
>   {
> -	struct xe_sched_job *job;
> +	struct xe_sched_job *job, *r_job = NULL;
>   
>   	spin_lock(&sched->base.job_list_lock);
> -	job = list_first_entry_or_null(&sched->base.pending_list,
> -				       struct xe_sched_job, drm.list);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		struct drm_sched_fence *s_fence = job->drm.s_fence;
> +		struct dma_fence *hw_fence = s_fence->parent;
> +
> +		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
> +			r_job = job;
> +			break;
> +		}
> +	}
>   	spin_unlock(&sched->base.job_list_lock);
>   
> -	return job;
> +	return r_job;
>   }
>   
>   static inline int

