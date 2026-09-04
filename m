Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38E6C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7686110E0FD;
	Fri,  4 Sep 2026 00:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W35upfi0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D2010E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:36:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E38F40794;
 Fri,  4 Sep 2026 00:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4686B1F000E9;
 Fri,  4 Sep 2026 00:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788482210;
 bh=5I+PE8udZzbx7YJj7A06RXl7zaPsosQVyK3FOqwDVVU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=W35upfi0TJISOMogQn+WicxofxcMVi/w+YMfMLRGh48oyJNnDi35SzjnqUnAi8a/p
 1e7e84fFLC6K0DhbqaSjD/SgTiWqs0aYZzd0+hpvLecFgzXFt8bpUeO84Ij0d40WhW
 crXVt4iAXlstkGq8CZCTGsikTX9dhn1K5v7WMibIRU6Vj8IwsJ1R7l8kSnXHWGVX/+
 0wxCl2MLNX/V0n2C6mqDYVal9vLewx4bJwN2eZZMyaWTc9EKNnuODkOfsn6+8JzEMD
 nB9/lDBOBQo6xn/zjfKfP93gfACWr/blYMIEt1al2enzerYTHKaFvSBQBG7J+KLnYS
 vcmBeliSQqS1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/25] drm/xe: Update GuC submission backend to run
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-11-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:36:49 +0000
Message-Id: <20260904003650.4686B1F000E9@smtp.kernel.org>
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
- [High] PT jobs on wedged, killed, or banned queues silently report succes=
s to the DRM scheduler, masking failures.
- [High] Memory leak of xe_pt_job_ops and dma_fence references if a PT job =
is aborted before execution.
--

commit 86f7996687fb641831b3ca6cb60d0fed641a6978
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Update GuC submission backend to run PT jobs

This commit teaches the GuC submission backend to execute PT (Page Table) j=
obs.
PT jobs bypass GPU execution for the final step of a bind job, instead using
the CPU to program the required page tables.

Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1261,14 +1277,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_=
job)

[ ... ]

>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {

[ ... ]

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
If the queue is wedged, killed, or banned, the execution block above is
skipped, but this block unconditionally returns NULL for PT jobs. Can this
cause PT jobs on failed queues to silently report success to the DRM
scheduler and mask failures?

[Severity: High]
This handles dropping the extra dma_fence and xe_pt_job_ops references duri=
ng
normal execution, but what happens if the DRM scheduler aborts the job befo=
re
it executes (for example, if the queue is destroyed)?

Looking at xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c:

> void xe_sched_job_destroy(struct kref *ref)
> {
>         struct xe_sched_job *job =3D
>                 container_of(ref, struct xe_sched_job, refcount);
> ...
>         xe_sched_job_free_fences(job);
>         dma_fence_put(job->fence);
>         drm_sched_job_cleanup(&job->drm);
>         job_free(job);
> ...
> }

It seems the destructor fails to call xe_pt_job_ops_put() for PT jobs and
only drops the primary fence reference. Does this code leak the xe_pt_job_o=
ps
structure and the extra dma_fence reference taken during job arming if
execution is aborted?

>  run_job_out:
> =20
>  	return job->fence;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D10
