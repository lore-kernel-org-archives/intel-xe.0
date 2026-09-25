Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC064C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908BA10FC6E;
	Fri, 25 Sep 2026 20:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RlZcwd+u";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240B10FC6E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:38:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 295804375A;
 Fri, 25 Sep 2026 20:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D655B1F000FF;
 Fri, 25 Sep 2026 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790368732;
 bh=FJgItG+/NRC3qCcZOIY1kFvP34Q1QXkzJS8MFp33rl0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RlZcwd+uSe6iw5QEhZrpNVPQGxYNjbjHbmhdmIcfkvoD+5jxvpVBq3676KVKl/n1g
 l3XLJk+ebQ+H53qVuZOIVi1eW4a1qBrSyvDRjEvC056fvl9OWVxBvH3LQt2B0egqjX
 P6dawHhxp+fw7KIZ7339A91rRlTHoPL7+0opZftRt/qvpNtYSzDgPtmbT2FlhMZFCp
 WHbTf+8jpzTP7GUw8Aw4vfE5C2AnSdx1wL8iFVRk1iRO6zSrosP08ebMptyKNtd0r+
 h5QkRybtz58kY2S9qofXIMBSsqBsuMKDehIafOJFybOneoXGm6o2XmyFxUJQSihmr4
 FgG9WwnHNAwaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/24] drm/xe: Update GuC submission backend to run
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925201526.1355279-11-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 20:38:51 +0000
Message-Id: <20260925203851.D655B1F000FF@smtp.kernel.org>
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
- [High] drm/xe: Memory leak of pt_job_ops and fence refs on aborted PT jobs
- [High] drm/xe: guc_exec_queue_run_job() drops error status for aborted PT=
 jobs
--

commit 9cf187bc8ca7b690be92bb4415979a7f9395643d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Sep 25 20:15:12 2026 +0000

drm/xe: Update GuC submission backend to run PT jobs

PT jobs bypass GPU execution for the final step of a bind job, using the
CPU to program the required page tables. Teach the GuC submission backend
how to execute these jobs.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
>  static struct dma_fence *
>  guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job =3D to_xe_sched_job(drm_job);
>  	struct xe_exec_queue *q =3D job->q;
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
> -	bool killed_or_banned_or_wedged =3D
> -		exec_queue_killed_or_banned_or_wedged(q);
> +	bool killed_or_banned_or_wedged_or_error  =3D
> +		exec_queue_killed_or_banned_or_wedged(q) ||
> +		xe_sched_job_is_error(job);
> =20
>  	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pe=
nding_disable(q)) ||
>  		     exec_queue_banned(q) || exec_queue_suspended(q));
> =20
>  	trace_xe_sched_job_run(job);
> =20
> -	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> +	if (is_pt_job(job)) {
> +		xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> +		run_pt_job(job, killed_or_banned_or_wedged_or_error);
> +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */

[Severity: High]
If a PT job is aborted by the DRM scheduler before guc_exec_queue_run_job()
is called, do these references get properly released?

When jobs are aborted (e.g., due to failing dependencies or context
teardown), the cleanup path typically goes through xe_sched_job_destroy().

Since these references are dropped exclusively on this execution path, it
seems they might permanently leak xe_pt_job_ops and dma_fence_stub if the
job never makes it here.

> +
> +		return NULL;

[Severity: High]
Could unconditionally returning NULL here hide error states from the DRM
scheduler?

When killed_or_banned_or_wedged_or_error is true, run_pt_job() is passed
true for force_clear, which correctly clears the page tables.=20

However, returning NULL tells the DRM scheduler that the job completed
successfully without error.

This false success signal might cause dependent jobs on other queues to
execute on unbound memory and trigger GPU page faults.

> +	} else if (!killed_or_banned_or_wedged_or_error) {
>  		if (xe_exec_queue_is_multi_queue_secondary(q)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925201526.1355=
279-1-matthew.brost@intel.com?part=3D10
