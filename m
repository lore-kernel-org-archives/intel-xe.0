Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66015EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 15:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3081B10E648;
	Fri, 16 Jun 2023 15:10:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0910E648
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686928206; x=1718464206;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=djD92Gi1HPnodZIup9cMl+xLCzfGOkm+n9xTyKjHjY0=;
 b=VhEdjGpr3tXBED/ci9BLPyBkkWN9jVDUv0xWOyno6ifBIzHsS9ijjK/9
 G5kN3IOfPHfxkIJcyFHKIFHBtQ9ysT2FZRejVN29dXT2KjhPlx2J+VSKw
 6wvryblB8b14lh8FKmwb/3qvejBfVMBNDsfexgY/RA0gXuHpIzcwV0mN1
 FbFlE0tzSv/sJlBqE/eB5AY7M9xsX8UFKCnETJ/eUSnGhEZl5T0bC64Qn
 5YJYDoqSSVaCvlJL2suRX7NTPs5rHK/DSkgFsYPviqbpxLeKS5B45TERv
 dxlrw0PV0/OFNrEoT47cjW+cxbZX3VwsNgaLldRpkl+LyQgh8jTZRC/lh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361764333"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="361764333"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="802872081"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="802872081"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO [10.249.254.148])
 ([10.249.254.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 08:10:03 -0700
Message-ID: <1c3e262a-d506-21d1-64b8-8504a5c251f6@linux.intel.com>
Date: Fri, 16 Jun 2023 17:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230615173014.258703-1-matthew.brost@intel.com>
 <20230615173014.258703-2-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230615173014.258703-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 1/8] fixup! drm/sched: Convert drm
 scheduler to use a work queue rather than kthread
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 6/15/23 19:30, Matthew Brost wrote:
> Add run WQ argument to drm_sched_init so user can control run WQ.
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
>   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |  7 ++++---
>   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c     |  4 +++-
>   drivers/gpu/drm/v3d/v3d_sched.c            | 10 +++++-----
>   drivers/gpu/drm/xe/xe_devcoredump_types.h  |  1 +
>   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
>   include/drm/gpu_scheduler.h                |  1 +
>   11 files changed, 20 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 64e7584c5dd2..2e776ece4251 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2364,7 +2364,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>   			break;
>   		}
>   
> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>   				   ring->num_hw_submission, 0,
>   				   timeout, adev->reset_domain->wq,
>   				   ring->sched_score, ring->name,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 1ae87dfd19c4..8486a2923f1b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   {
>   	int ret;
>   
> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>   			     msecs_to_jiffies(500), NULL, NULL,
>   			     dev_name(gpu->dev), gpu->dev);
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ff003403fbbc..54f53bece27c 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   
>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>   
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>   			      lima_job_hang_limit,
>   			      msecs_to_jiffies(timeout), NULL,
>   			      NULL, name, pipe->ldev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index b60199184409..e1cff31f147a 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -93,9 +93,10 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>   	 /* currently managing hangcheck ourselves: */
>   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>   
> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> -			num_hw_submissions, 0, sched_timeout,
> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> +			     num_hw_submissions, 0, sched_timeout,
> +			     NULL, NULL, to_msm_bo(ring->bo)->name,
> +			     gpu->dev->dev);
>   	if (ret) {
>   		goto fail;
>   	}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..f48b07056a16 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -815,7 +815,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   		js->queue[j].fence_context = dma_fence_context_alloc(1);
>   
>   		ret = drm_sched_init(&js->queue[j].sched,
> -				     &panfrost_sched_ops,
> +				     &panfrost_sched_ops, NULL,
>   				     nentries, 0,
>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>   				     pfdev->reset.wq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index db70a57a3a1a..6bc29d509161 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1178,6 +1178,7 @@ static void drm_sched_main(struct work_struct *w)
>    *
>    * @sched: scheduler instance
>    * @ops: backend operations for this scheduler
> + * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
>    * @hw_submission: number of hw submissions that can be in flight
>    * @hang_limit: number of times to allow a job to hang before dropping it
>    * @timeout: timeout value in jiffies for the scheduler
> @@ -1191,6 +1192,7 @@ static void drm_sched_main(struct work_struct *w)
>    */
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *run_wq,
>   		   unsigned hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
>   		   atomic_t *score, const char *name, struct device *dev)
> @@ -1199,9 +1201,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->ops = ops;
>   	sched->hw_submission_limit = hw_submission;
>   	sched->name = name;
> +	sched->run_wq = run_wq ? : system_wq;
>   	sched->timeout = timeout;
>   	sched->timeout_wq = timeout_wq ? : system_wq;
> -	sched->run_wq = system_wq;	/* FIXME: Let user pass this in */
>   	sched->hang_limit = hang_limit;
>   	sched->score = score ? score : &sched->_score;
>   	sched->dev = dev;
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 06238e6d7f5c..38e092ea41e6 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	int ret;
>   
>   	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -			     &v3d_bin_sched_ops,
> +			     &v3d_bin_sched_ops, NULL,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_bin", v3d->drm.dev);
> @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   		return ret;
>   
>   	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -			     &v3d_render_sched_ops,
> +			     &v3d_render_sched_ops, NULL,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_render", v3d->drm.dev);
> @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   		goto fail;
>   
>   	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -			     &v3d_tfu_sched_ops,
> +			     &v3d_tfu_sched_ops, NULL,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_tfu", v3d->drm.dev);
> @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   
>   	if (v3d_has_csd(v3d)) {
>   		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -				     &v3d_csd_sched_ops,
> +				     &v3d_csd_sched_ops, NULL,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
>   				     NULL, "v3d_csd", v3d->drm.dev);
> @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			goto fail;
>   
>   		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> -				     &v3d_cache_clean_sched_ops,
> +				     &v3d_cache_clean_sched_ops, NULL,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
>   				     NULL, "v3d_cache_clean", v3d->drm.dev);
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index c0d711eb6ab3..cc3ff3ac47ff 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -11,6 +11,7 @@
>   
>   #include "xe_hw_engine_types.h"
>   
> +struct xe_ct;
>   struct xe_device;
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 5d2d26e361b9..f0eb8bb277ce 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -336,7 +336,7 @@ static int execlist_engine_init(struct xe_engine *e)
>   
>   	exl->engine = e;
>   
> -	err = drm_sched_init(&exl->sched, &drm_sched_ops,
> +	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
>   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
>   			     NULL, NULL, e->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b209e4c2a3a9..5c9a6866bd3d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1064,7 +1064,7 @@ static int guc_engine_init(struct xe_engine *e)
>   	init_waitqueue_head(&ge->suspend_wait);
>   
>   	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> -	err = drm_sched_init(&ge->sched, &drm_sched_ops,
> +	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			     e->name, gt_to_xe(e->gt)->drm.dev);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 79311df9dd09..419c0446edd7 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -547,6 +547,7 @@ struct drm_gpu_scheduler {
>   
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *run_wq,
>   		   uint32_t hw_submission, unsigned hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
>   		   atomic_t *score, const char *name, struct device *dev);
