Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73A7C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB4E10E656;
	Fri,  5 May 2023 18:24:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EC710E656
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:24:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5119160DEA;
 Fri,  5 May 2023 18:24:50 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 7A487C433D2;
 Fri,  5 May 2023 18:24:47 +0000 (UTC)
Date: Fri, 5 May 2023 14:24:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFVJ7ZiMoob3FmJv@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-2-matthew.brost@intel.com>
 <7f63b928-6c20-096b-f1c8-0439289c29bd@linux.intel.com>
 <ZFJ4XpjSe8X81q1C@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZFJ4XpjSe8X81q1C@DUT025-TGLU.fm.intel.com>
Subject: Re: [Intel-xe] [PATCH v2 01/31] drm/sched: Add run_wq argument to
 drm_sched_init
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 03:06:06PM +0000, Matthew Brost wrote:
> On Wed, May 03, 2023 at 02:03:49PM +0200, Thomas Hellström wrote:
> > Hi,
> > 
> > On 5/2/23 02:16, Matthew Brost wrote:
> > > We will have this argument upstream, lets pull into the Xe repo.
> > 
> > Please rephrase the commit message. Add explanation, imperative wording and
> > remove mentions of the Xe repo (nobody cares about that once it goes
> > upstream)
> > 
> > /Thomas
> 
> This patch gets squashed into one eariler in our repo into t upstream
> version:
> https://patchwork.freedesktop.org/patch/530648/?series=116054&rev=1

if the patch is to be squashed in an existent one please create it with
git commit --fixup=<hash of commit to be changed>

so we push this to the top of the branch and during the cleanup rebases
that I'm running it will get automatically squashed...
(git rebase --autosquash)

without the fixup! annotation I don't have visibility to know which
patches should be squashed.

> 
> Can reword if you think it is a big deal but this is just a placeholder.
> 
> Matt
>  
> 
> > 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
> > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
> > >   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
> > >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
> > >   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
> > >   drivers/gpu/drm/scheduler/sched_main.c     |  4 +++-
> > >   drivers/gpu/drm/v3d/v3d_sched.c            | 10 +++++-----
> > >   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
> > >   drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
> > >   include/drm/gpu_scheduler.h                |  1 +
> > >   10 files changed, 16 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index 902f9b5ff82c..fe28f6b71fe3 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -2364,7 +2364,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > >   			break;
> > >   		}
> > > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> > >   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> > >   				   timeout, adev->reset_domain->wq,
> > >   				   ring->sched_score, ring->name,
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > index 1ae87dfd19c4..8486a2923f1b 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > @@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > >   {
> > >   	int ret;
> > > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > > +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> > >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> > >   			     msecs_to_jiffies(500), NULL, NULL,
> > >   			     dev_name(gpu->dev), gpu->dev);
> > > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > > index ff003403fbbc..54f53bece27c 100644
> > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> > >   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > > -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > > +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> > >   			      lima_job_hang_limit,
> > >   			      msecs_to_jiffies(timeout), NULL,
> > >   			      NULL, name, pipe->ldev->dev);
> > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > index 57a8e9564540..5879fc262047 100644
> > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > @@ -95,7 +95,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> > >   	 /* currently managing hangcheck ourselves: */
> > >   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > >   			num_hw_submissions, 0, sched_timeout,
> > >   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > >   	if (ret) {
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > index dbc597ab46fb..f48b07056a16 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > @@ -815,7 +815,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> > >   		js->queue[j].fence_context = dma_fence_context_alloc(1);
> > >   		ret = drm_sched_init(&js->queue[j].sched,
> > > -				     &panfrost_sched_ops,
> > > +				     &panfrost_sched_ops, NULL,
> > >   				     nentries, 0,
> > >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> > >   				     pfdev->reset.wq,
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index cfd8a838e283..e79b9c760efe 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1182,6 +1182,7 @@ static void drm_sched_main(struct work_struct *w)
> > >    *
> > >    * @sched: scheduler instance
> > >    * @ops: backend operations for this scheduler
> > > + * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
> > >    * @hw_submission: number of hw submissions that can be in flight
> > >    * @hang_limit: number of times to allow a job to hang before dropping it
> > >    * @timeout: timeout value in jiffies for the scheduler
> > > @@ -1195,6 +1196,7 @@ static void drm_sched_main(struct work_struct *w)
> > >    */
> > >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> > >   		   const struct drm_sched_backend_ops *ops,
> > > +		   struct workqueue_struct *run_wq,
> > >   		   unsigned hw_submission, unsigned hang_limit,
> > >   		   long timeout, struct workqueue_struct *timeout_wq,
> > >   		   atomic_t *score, const char *name, struct device *dev)
> > > @@ -1203,9 +1205,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > >   	sched->ops = ops;
> > >   	sched->hw_submission_limit = hw_submission;
> > >   	sched->name = name;
> > > +	sched->run_wq = run_wq ? : system_wq;
> > >   	sched->timeout = timeout;
> > >   	sched->timeout_wq = timeout_wq ? : system_wq;
> > > -	sched->run_wq = system_wq;	/* FIXME: Let user pass this in */
> > >   	sched->hang_limit = hang_limit;
> > >   	sched->score = score ? score : &sched->_score;
> > >   	sched->dev = dev;
> > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > > index 06238e6d7f5c..38e092ea41e6 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> > >   	int ret;
> > >   	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > -			     &v3d_bin_sched_ops,
> > > +			     &v3d_bin_sched_ops, NULL,
> > >   			     hw_jobs_limit, job_hang_limit,
> > >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > >   			     NULL, "v3d_bin", v3d->drm.dev);
> > > @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> > >   		return ret;
> > >   	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > -			     &v3d_render_sched_ops,
> > > +			     &v3d_render_sched_ops, NULL,
> > >   			     hw_jobs_limit, job_hang_limit,
> > >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > >   			     NULL, "v3d_render", v3d->drm.dev);
> > > @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> > >   		goto fail;
> > >   	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > -			     &v3d_tfu_sched_ops,
> > > +			     &v3d_tfu_sched_ops, NULL,
> > >   			     hw_jobs_limit, job_hang_limit,
> > >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > >   			     NULL, "v3d_tfu", v3d->drm.dev);
> > > @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> > >   	if (v3d_has_csd(v3d)) {
> > >   		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > -				     &v3d_csd_sched_ops,
> > > +				     &v3d_csd_sched_ops, NULL,
> > >   				     hw_jobs_limit, job_hang_limit,
> > >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > >   				     NULL, "v3d_csd", v3d->drm.dev);
> > > @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> > >   			goto fail;
> > >   		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > > -				     &v3d_cache_clean_sched_ops,
> > > +				     &v3d_cache_clean_sched_ops, NULL,
> > >   				     hw_jobs_limit, job_hang_limit,
> > >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > >   				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > > index de4f0044b211..d6d60ebf3d5f 100644
> > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > @@ -336,7 +336,7 @@ static int execlist_engine_init(struct xe_engine *e)
> > >   	exl->engine = e;
> > > -	err = drm_sched_init(&exl->sched, &drm_sched_ops,
> > > +	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
> > >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> > >   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> > >   			     NULL, NULL, e->hwe->name,
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index e857013070b9..735f31257f3a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1081,7 +1081,7 @@ static int guc_engine_init(struct xe_engine *e)
> > >   	init_waitqueue_head(&ge->suspend_wait);
> > >   	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> > > -	err = drm_sched_init(&ge->sched, &drm_sched_ops,
> > > +	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> > >   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> > >   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > >   			     e->name, gt_to_xe(e->gt)->drm.dev);
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index cf85f93218fc..09bc39840dc8 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -539,6 +539,7 @@ struct drm_gpu_scheduler {
> > >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> > >   		   const struct drm_sched_backend_ops *ops,
> > > +		   struct workqueue_struct *run_wq,
> > >   		   uint32_t hw_submission, unsigned hang_limit,
> > >   		   long timeout, struct workqueue_struct *timeout_wq,
> > >   		   atomic_t *score, const char *name, struct device *dev);
