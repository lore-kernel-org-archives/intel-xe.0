Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA97C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 05:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB7110F855;
	Fri, 25 Sep 2026 05:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UORW6FKq";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDDB10F855
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 05:39:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8B0B41237;
 Fri, 25 Sep 2026 05:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5431F000FF;
 Fri, 25 Sep 2026 05:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790314754;
 bh=Jdma7ore7AbZ5Rorbxe8lUqvtXb2gooG0yfVXjc61Ck=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UORW6FKqmclkivAkMOV5DsvZ2XKo1e1VW9hNkReORwXCgDbe2WKUj+Nk3+b9ne+5S
 CJzvIVBGUXjcWxy5jZUhbWxIWZlZvoDPj4EUyf/YN2Ns/LpPbhBRdg4aPBDw/AnfJH
 CaN8ZRcPblyojPXIM5LUXS+NPtP5GJub31TddpdDhH8kjMqxUrN8R70yx8NzZawkEg
 Id0cE+r/Pf8G34j5Pi2CUWSyPwRVX/SRD/PRTKREtbyB9slPgek1ykLPxJPe654kxd
 YftmMn3mh/sOXYKAgSu6c5nbFEgzTOaDBZBqmOcay/6BkYp/qFozlOoDqBPSyslzs6
 D4OfnZ5cP1apQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/24] drm/xe: Update GuC submission backend to run
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-11-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 05:39:14 +0000
Message-Id: <20260925053914.AB5431F000FF@smtp.kernel.org>
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
- [High] xe: memory leak of pt_job_ops when PT job is aborted before execut=
ion
- [High] xe: PT jobs swallow cancellation error statuses and signal false s=
uccess
--

commit 784a2cd005e51d36d34825eebaf5abff98891eff
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Update GuC submission backend to run PT jobs

PT jobs bypass GPU execution for the final step of a bind job, using the
CPU to program the required page tables. Teach the GuC submission backend
how to execute these jobs.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 4bd1ead57efa4..9faddb7c6407f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -1238,21 +1240,44 @@ static void submit_exec_queue(struct xe_exec_queu=
e *q, struct xe_sched_job *job)
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

[Severity: High]
Can this condition fail to detect errors for PT jobs?

PT jobs are initialized with a global stub fence. When the queue is
killed or banned, xe_sched_job_set_error() attempts to set an error on this
fence but fails because the stub fence is already permanently signaled. As a
result, xe_sched_job_is_error() will always be false for PT jobs.

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

[Severity: High]
Does this leak the pt_job_ops when a PT job is aborted before execution?

If the DRM scheduler is stopped, the entity killed, or the execution queue
banned before run_job is invoked, the scheduler calls free_job directly
without running it. The free_job callback invokes xe_sched_job_destroy(),
which then calls xe_sched_job_free_fences(). That function explicitly skips
PT jobs via an early return:

xe_sched_job_free_fences() {
	if (job->is_pt_job)
		return;
	...
}

Since xe_pt_job_ops_put() is only called here in guc_exec_queue_run_job(),
which is completely bypassed on this cancellation path, does the refcount
leak?

> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> +
> +		return NULL;

[Severity: High]
Does this swallow cancellation error statuses and signal false success for
PT jobs?

Even when killed_or_banned_or_wedged_or_error is true, this path
unconditionally returns NULL. The DRM scheduler treats a NULL return from
run_job as an immediate successful completion, signaling the software
finished fence with 0 instead of an error (like -ECANCELED).

Userspace waiting on a failed or cancelled bind will observe false success
and might proceed to access memory that hasn't been properly mapped.

> +	} else if (!killed_or_banned_or_wedged_or_error) {
>  		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  			struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q=
);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D10
