Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D3C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2DE10E29F;
	Tue, 17 Jun 2025 15:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikDazCfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552D010E29F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750173248; x=1781709248;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qY81BrDkz0ensYkKgMx1G1YSwXHyT9SfIbOxyZnQwsU=;
 b=ikDazCfPDeAUuoi9xv90jKhwLHapxOgwprc+veUkOx95ZrdnnLGadH3g
 jtiah4xvfD0PK/ZrxTLznwtcsEhjmbDeu6kK8ALb+ukVdjZIF3effOBLT
 thhOri13F4jpEhZvNGZ53kzhXN2Z7PuoR601LCGjaUFwwF3mVzHxKe9gy
 mjLQRplzJ/UlKpZuquWMUHiCPaNIgl8dl1GYRYYjj4a7qG/xfAUOoExpf
 rgNwo7plBZgvpEIPHWXHiSFpJ8vDEP6CL/Cr3TvZbdoLrgapjoIjNDyXq
 KxDB2bunpFk4j/rOWe6XOd1Sv9D4bhlWt7bvMQ/VVD/y4hJTGr+4kWCgE Q==;
X-CSE-ConnectionGUID: QkWeZAmSTDindm8B6V0Rsw==
X-CSE-MsgGUID: Oq0VzClXQh6+fj5PjqZcyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52451018"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52451018"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:14:08 -0700
X-CSE-ConnectionGUID: 36sJPhotRxioH+1zmbN2Cw==
X-CSE-MsgGUID: r1+v2yB6QwK9s17gK4+Glw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148797666"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:14:07 -0700
Message-ID: <b049cbbb-9941-440c-ae2d-880e4f420511@intel.com>
Date: Tue, 17 Jun 2025 16:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Grab pending job list lock before resubmit
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20250617144753.3177952-1-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250617144753.3177952-1-tejas.upadhyay@intel.com>
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

On 17/06/2025 15:47, Tejas Upadhyay wrote:
> Pending job list is protected by pending job lock to
> avoid any racing thus grab pending job list lock before
> resubmitting jobs.
> 
> Fixes: 38fafa9f392f ("drm/xe/sched: stop re-submitting signalled jobs")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 308061f0cf37..dfdb409da6ba 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -53,6 +53,7 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>   {
>   	struct drm_sched_job *s_job;
>   
> +	spin_lock(&sched->base.job_list_lock);
>   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>   		struct drm_sched_fence *s_fence = s_job->s_fence;
>   		struct dma_fence *hw_fence = s_fence->parent;
> @@ -60,6 +61,7 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>   		if (hw_fence && !dma_fence_is_signaled(hw_fence))
>   			sched->base.ops->run_job(s_job);

Is this fixing a real issue? There is a sleeping lock and maybe other 
nasties in run_job() AFAICT, so I don't think this will work as-is, but 
I don't believe we need this, since sched should be stopped at this 
point, so nothing else should be modifying pending_list until we start 
it back up, which is only later?

>   	}
> +	spin_unlock(&sched->base.job_list_lock);
>   }
>   
>   static inline bool

