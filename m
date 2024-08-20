Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A026C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F1010E352;
	Tue, 20 Aug 2024 20:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kM1LnkgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865810E352
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185664; x=1755721664;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=r4+a2UbqNBZpV85ywmRGWl5e4L7rnsXtoH7E0iW8Kuc=;
 b=kM1LnkgUVfxRbx7WxVokcX9qfYVbw4FdC5Ht5edq+Ex4YGYwtNHQs0Aa
 1V9W2zIqmAOhRMB2y/5VoYL0HTtaJV+0156ktuCjvTBn3G0fC9JEVYT+L
 o58GY8m0xYMLd0O3v5vOb7T5ys6nZ5t6g43CZStGO9XT2dgvRcghVSvyV
 HRRz70meGlpesz6V4ttjlWEwC9gA+nQxuDon+o0F1IsUW2mmfFEj1Bl7F
 00jayrkAk/Rm8JuOQWpHJ8BgoTR1eO6KX1l9GsmyzLU1yN+tp8TPUtnjz
 ZKAWISQuot8rNtG8SuejMdoS7spvqepAvmXIgqU9Jn3hnSnRbNHzIbG7r g==;
X-CSE-ConnectionGUID: h9mWZW58S3uRh4vEGucHFQ==
X-CSE-MsgGUID: it/bSqTFQgexJndGeUDulg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26267971"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26267971"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:27:16 -0700
X-CSE-ConnectionGUID: cV1r1oxgR0OI/twk/l1ouA==
X-CSE-MsgGUID: pisvHHitQsmvenO5BDqAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65205364"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.80.42])
 ([10.245.80.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:27:15 -0700
Message-ID: <ee8f18fa-1faf-46f2-be46-492f76dcc7a9@linux.intel.com>
Date: Tue, 20 Aug 2024 22:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Free job before xe_exec_queue_put
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240820202309.1260755-1-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240820202309.1260755-1-matthew.brost@intel.com>
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


On 8/20/2024 10:23 PM, Matthew Brost wrote:
> Free job depends on job->vm being valid, the last xe_exec_queue_put can
> destroy the VM. Prevent UAF by freeing job before xe_exec_queue_put.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 44d534e362cd..9628f9deb3c0 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -171,12 +171,13 @@ void xe_sched_job_destroy(struct kref *ref)
>   	struct xe_sched_job *job =
>   		container_of(ref, struct xe_sched_job, refcount);
>   	struct xe_device *xe = job_to_xe(job);
> +	struct xe_exec_queue *q = job->q;
>   
>   	xe_sched_job_free_fences(job);
> -	xe_exec_queue_put(job->q);
>   	dma_fence_put(job->fence);
>   	drm_sched_job_cleanup(&job->drm);
>   	job_free(job);
> +	xe_exec_queue_put(q);
>   	xe_pm_runtime_put(xe);
>   }
>   
