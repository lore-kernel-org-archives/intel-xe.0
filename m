Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02122C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F5510E0FD;
	Fri,  4 Sep 2026 00:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fFxHiTJg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E51D10E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:31:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AAFD640192;
 Fri,  4 Sep 2026 00:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA551F000E9;
 Fri,  4 Sep 2026 00:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481904;
 bh=K/Q/cC3B/+BRmAnVvG4vTx53g5UchsgvhJT7GlPwCy4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fFxHiTJgF2CzfN7VJTHL0fIgbdgMjM5ve5R+CO6IIiHcGeuKFwqj6ZXtNcPzgraOH
 JpsfYHuyDEBwbsi1XoDGUGGnsOd++mfwh4wCb9vy5SZw9yUQaPUWIqWB7VY48RWdzH
 25/L8RTZd3v3rG2R/k6o5WXgtRe2jESyrvdVfis+ZZwBJTcx03K1ewstf8IT2MYBeB
 84zdXgpGThmRDoFRTkDULM9X0LmdDpsTAt/nP/uKJJMjgF9jhLTqsIcJqNWweMk9rn
 FWpzjDRfuDemUUP2cX7QKy+lxcGPDbCzdqu5j6iISdOTdPCV6Ut6RzO+dAGCuZn+6C
 Kf40QWN0cO/Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/25] drm/xe: Enable CPU binds for jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-14-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:31:44 +0000
Message-Id: <20260904003144.6DA551F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] A Use-After-Free of `xe_vm` occurs because CPU-based PT update=
s execute asynchronously on the device-global bind queue without holding a =
reference to the VM.
- [High] execlist backend ignores is_pt_job and submits PT jobs to hardware=
, skipping CPU updates.
- [High] The `xe_pt_job_ops` reference is leaked when a PT job is aborted o=
r destroyed without running.
- [Medium] xe_sched_job_snapshot_capture reads from the wrong union member =
for PT jobs.
--

commit 1bc0a17fc99eb78f42df916d66ac3038c0338a83
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Enable CPU binds for jobs

This commit updates the migration layer to formulate a PT job which will is=
sue
CPU binds in the submission backend. All code related to GPU-based binding =
has
been removed.

Link: https://patch.msgid.link/20260228013501.106680-14-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 100e84b7b81df..62ae0e2e85be5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1938,162 +1867,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *=
m,
>  {

[ ... ]

>  	int err;
> =20
> -	job =3D xe_bb_create_migration_job(pt_update_ops->q, bb,
> -					 xe_migrate_batch_base(m, usm),
> -					 update_idx);
> +	job =3D xe_sched_job_create(pt_update_ops->q, NULL);
>  	if (IS_ERR(job)) {
>  		err =3D PTR_ERR(job);
> -		goto err_sa;
> +		goto err_out;
>  	}
> =20
> -	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> +	xe_tile_assert(tile, job->is_pt_job);

[Severity: High]
If the platform uses the execlist backend (e.g., GuC disabled), does
execlist_run_job() properly handle CPU-only PT jobs?

Looking at the execlist backend, execlist_run_job() appears to unconditiona=
lly
call q->ring_ops->emit_job(job) without checking job->is_pt_job. Because
job->ptrs and job->pt_update share a union, the ring ops might read a garba=
ge
value (like the ops kernel pointer) as batch_addr and emit a hardware migra=
tion
job instead.

Could this regression cause an immediate GPU fault or hang from executing an
invalid address, while completely skipping the actual page table update on =
the
CPU?

> =20
>  	if (ops->pre_commit) {
>  		pt_update->job =3D job;
> @@ -2104,6 +1889,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  	if (is_migrate)
>  		mutex_lock(&m->job_mutex);
> =20
> +	job->pt_update[0].vm =3D pt_update->vops->vm;

[Severity: Critical]
Is it possible for the xe_vm pointer assigned here to be used after it is f=
reed?

PT jobs are assigned a raw VM pointer without taking an xe_vm_get() referen=
ce.
CPU binds are queued and executed on a device-global queue (xe->cpu_bind->q=
).
If the user closes the VM, xe_vm_close_and_put() kills the VM's specific
queues and frees the struct xe_vm, but it does not appear to wait for jobs
pending on the global cpu_bind->q.

When the DRM scheduler later executes the pending PT job on the cpu_bind->q,
could it access the now-freed vm pointer during CPU execution, resulting in=
 a
use-after-free regression?

[Severity: Medium]
When xe_sched_job_snapshot_capture() iterates over q->width, will it safely
handle PT jobs?

It appears that xe_sched_job_snapshot_capture() accesses job->ptrs[i].batch=
_addr
unconditionally. For PT jobs, job->ptrs aliases with job->pt_update via a u=
nion.

This causes batch_addr to overlap with the ops kernel pointer (or similar
members) from xe_pt_update_args. Could this mangled pointer then be
uncanonicalized and included in GPU devcoredumps, leading to corrupted state
data and a potential kernel pointer information leak?

> +	job->pt_update[0].tile =3D tile;
> +	job->pt_update[0].ops =3D ops;
> +	job->pt_update[0].pt_job_ops =3D
> +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);

[Severity: High]
What happens to the pt_job_ops reference if the PT job is aborted or destro=
yed
without running?

The job destruction path in xe_sched_job_destroy() does not seem to check f=
or
is_pt_job, and thus skips calling xe_pt_job_ops_put(). If the job is cancel=
ed,
aborted, or its execution queue is destroyed before it runs, the DRM schedu=
ler
bypasses the normal execution path and directly calls the free_job callback.

Would this permanently leak the pt_job_ops structure on those failure paths?

> +
>  	xe_sched_job_arm(job);
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D13
