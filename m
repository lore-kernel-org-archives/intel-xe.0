Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1867C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9539210E59A;
	Fri,  4 Sep 2026 21:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VL0Q3142";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDBD10E59A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:39:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CAACA60209;
 Fri,  4 Sep 2026 21:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4860F1F00A3D;
 Fri,  4 Sep 2026 21:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788557967;
 bh=YK7+PeCVH7rs3VO8/KQCEoABlqaAIlu+tW+0UvN6fc4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VL0Q3142Jndz0bqNZdNEnL2SZfaJzFKjpQZYkt9JcUYrd+GMoAeiZXzFcoFnp39mN
 eu9nJK2tAR2x/Bu/miVSgbrN6xqXQQ9AMWOfp7lZtoHJ7G2YK+qe+P/8iATbKTMdDy
 eSBZT9DjXtolM/zhMchyynzcacKqXVHhZGqJdNzAKb4CelYD9SoBh/5LwesK5u+Zl4
 aLVr67xsJFO7RK06uU5Bwnmi4cyBMv+SEb2WMbyDpsxn8WE0UNbCB/5w2BzZzyO/Jb
 gQpNfZZhKa2oLD3iVX6OldxUbyXSdiRY8mKE0Xdo4KXr0lme8g763QwIskBQQFpgAs
 kCjd11cVWvo0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/24] drm/xe: Update GuC submission backend to run
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-11-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:39:26 +0000
Message-Id: <20260904213927.4860F1F00A3D@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] PT jobs swallow dependency and cancellation errors, silently r=
eporting false success and potentially leaving page tables in an inconsiste=
nt state.
- [High] Memory leak of xe_pt_job_ops and a dma_fence reference when a PT j=
ob is canceled or destroyed without being executed.
--

commit c6e167292efa7934a75cd29809e1057eae0d18c2
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Update GuC submission backend to run PT jobs

PT jobs bypass GPU execution for the final step of a bind job, using the
CPU to program the required page tables. Teach the GuC submission backend
how to execute these jobs.

Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 8b8673f4e037c..b7ec96650405a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -1262,14 +1278,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_=
job)
>  				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
>  		}
> =20
> -		if (!exec_queue_registered(q))
> -			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> -		if (!job->restore_replay)
> -			q->ring_ops->emit_job(job);
> -		submit_exec_queue(q, job);
> +		if (is_pt_job(job)) {
> +			xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> +			run_pt_job(job);
> +		} else {
> +			if (!exec_queue_registered(q))
> +				register_exec_queue(q, GUC_CONTEXT_NORMAL);
> +			if (!job->restore_replay)
> +				q->ring_ops->emit_job(job);
> +			submit_exec_queue(q, job);
> +		}
>  		job->restore_replay =3D false;
>  	}
> =20
> +	if (is_pt_job(job)) {
> +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> +		return NULL;
> +	}

[Severity: High]
Does this code leak the xe_pt_job_ops array and dma_fence objects when a PT
job is canceled before execution?

Because the cleanup operations (xe_pt_job_ops_put() and the extra
dma_fence_put()) are tied to job execution here in guc_exec_queue_run_job(),
they appear to be missed if the job is destroyed before running.

Looking at xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c:

void xe_sched_job_destroy(struct kref *ref)
{
	...
	xe_sched_job_free_fences(job);
	dma_fence_put(job->fence);
	drm_sched_job_cleanup(&job->drm);
	job_free(job);
	...
}

If a PT job is armed, it takes a reference to pt_job_ops and an extra
reference to job->fence. If the queue is killed and the job aborted before =
it
executes, xe_sched_job_destroy() misses the xe_pt_job_ops_put() call and
only drops one dma_fence_put() reference.

Can an unprivileged user repeatedly submit PT jobs via bind ioctls and
immediately destroy the queue before execution to trigger this?

[Severity: Critical]
Does returning NULL unconditionally here swallow dependency and cancellation
errors?

If a queue is banned, guc_exec_queue_run_job() skips run_pt_job() but still
returns NULL here, which the DRM scheduler treats as a synchronous success.

Additionally, PT jobs are initialized with a stub fence:

struct xe_sched_job *xe_sched_job_create(...)
{
	...
	if (!batch_addr) {
		job->fence =3D dma_fence_get_stub();
		job->is_pt_job =3D true;
	}
	...
}

Since a stub fence is permanently signaled with error =3D 0,
xe_sched_job_set_error() fails to set any error state, and
xe_sched_job_is_error() evaluates to false.

Can this result in page table updates silently failing while reporting succ=
ess
to userspace? For unbind operations, this could leave memory mapped in the
GPU after it is freed, potentially allowing read or write access to realloc=
ated
memory from another queue in the same VM.

> =20
>  run_job_out:
> =20
>  	return job->fence;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D10
