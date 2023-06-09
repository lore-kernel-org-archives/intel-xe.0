Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E62DC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 06:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D610E635;
	Fri,  9 Jun 2023 06:58:47 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CBC10E633;
 Fri,  9 Jun 2023 06:58:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A68B36606F22;
 Fri,  9 Jun 2023 07:58:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686293923;
 bh=pA/SzzFVMBRbMcHr5oZaDixSjybEV+kk5rXcdghgZ2Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aimsC9Qg4bjx7M1k1RQReTxIhySrRFDwBJ0mSAjzQ8aEeJ3Mk57rvIBoLd1KCDmv9
 r9idcEfEx+b3wNZ6kIKxPphN7arEeb3vuBxCzCrBmZP43Q0XNW+dQ/EK1E9giJqM0y
 nUoPq8bpnlBe0ss7gCYnCDNXBmvxj5qyfSdg2aIPHk4GZEf42VgZ1nIEtiHoHlcmnX
 vx94ZWpZ80yv1+gzhrFuEECbORRdteef7L6SXsWLb10DZHqy4FnjjKnwOYUi3Fqnfo
 QE98j2gKTRRLDinJR24ImB+WZKiNfOAoCPUVCX4cXYZ7yXobS+bIQ6+WrXQTMyoJ4m
 FPSxjjOIK1IvA==
Date: Fri, 9 Jun 2023 08:58:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230609085839.3fc9e237@collabora.com>
In-Reply-To: <20230404002211.3611376-2-matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-2-matthew.brost@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC PATCH 01/10] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
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
Cc: robdclark@chromium.org, Sarah Walker <sarah.walker@imgtec.com>,
 airlied@linux.ie, lina@asahilina.net, Frank Binns <frank.binns@imgtec.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Donald Robson <donald.robson@imgtec.com>, daniel@ffwll.ch,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matthew,

On Mon,  3 Apr 2023 17:22:02 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> -static int drm_sched_main(void *param)
> +static void drm_sched_main(struct work_struct *w)
>  {
> -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run);
>  	int r;
>  
> -	sched_set_fifo_low(current);
> -
> -	while (!kthread_should_stop()) {
> -		struct drm_sched_entity *entity = NULL;
> +	while (!READ_ONCE(sched->pause_run_wq)) {

During an informal discussion on IRC I mentioned that this loop might
become problematic if all the 1:1 entities share the same wq
(especially if it's an ordered wq), and one of them is getting passed a
lot of requests. Just wanted to tell you that we've hit that case in
PowerVR:

Geometry and fragment queues get passed X requests respectively, each
pair of request corresponding to a rendering operation. Because we're
using an ordered wq (which I know we shouldn't do, and I intend to
fix that, but I think it shows the problem exists by making it more
visible), all geometry requests get submitted first, then come the
fragment requests. It turns out the submission time is non-negligible
compared to the geometry job execution time, and geometry jobs end up
generating data for the fragment jobs that are not consumed fast enough
by the fragment job to allow the following geom jobs to re-use the same
portion of memory, leading to on-demand allocation of extra memory
chunks which wouldn't happen if submissions were interleaved.

I know you were not fundamentally opposed to killing this loop and doing
one iteration at a time (you even provided a patch doing that), just
wanted to share my findings to prove this is not just a theoretical
issue, and the lack of fairness in the submission path can cause trouble
in practice.

Best Regards,

Boris

> +		struct drm_sched_entity *entity;
>  		struct drm_sched_fence *s_fence;
>  		struct drm_sched_job *sched_job;
>  		struct dma_fence *fence;
> -		struct drm_sched_job *cleanup_job = NULL;
> +		struct drm_sched_job *cleanup_job;
>  
> -		wait_event_interruptible(sched->wake_up_worker,
> -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> -					 (!drm_sched_blocked(sched) &&
> -					  (entity = drm_sched_select_entity(sched))) ||
> -					 kthread_should_stop());
> +		cleanup_job = drm_sched_get_cleanup_job(sched);
> +		entity = drm_sched_select_entity(sched);
>  
>  		if (cleanup_job)
>  			sched->ops->free_job(cleanup_job);
>  
> -		if (!entity)
> +		if (!entity) {
> +			if (!cleanup_job)
> +				break;
>  			continue;
> +		}
>  
>  		sched_job = drm_sched_entity_pop_job(entity);
>  
>  		if (!sched_job) {
>  			complete_all(&entity->entity_idle);
> +			if (!cleanup_job)
> +				break;
>  			continue;
>  		}
>  
> @@ -1055,14 +1083,14 @@ static int drm_sched_main(void *param)
>  					  r);
>  		} else {
>  			if (IS_ERR(fence))
> -				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
> +				dma_fence_set_error(&s_fence->finished,
> +						    PTR_ERR(fence));
>  
>  			drm_sched_job_done(sched_job);
>  		}
>  
>  		wake_up(&sched->job_scheduled);
>  	}
> -	return 0;
>  }
