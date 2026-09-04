Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35738C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE8110E199;
	Fri,  4 Sep 2026 21:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ggtwfqcc";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1A910E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:50:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 91C1940A35;
 Fri,  4 Sep 2026 21:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485491F00A3D;
 Fri,  4 Sep 2026 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788558603;
 bh=IBrYMNAoPqCQM6mRtGhRg6hn9C/v9ZWujRfHEq05jDM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ggtwfqcchYtkoYSICj6Zuuf+rW6opi8+UmPeS/3MYN0Dpvv0tGWm7ArqA5Kiz+vx9
 JQ3jJEHhffpsbJjsFu7445Jxw2WKYSnUkjesQYyQ/UmAeffEsTkX+vimvkemebiPpq
 MJzczKbkz7r+QJNfrooV0nVygN2Syu6TpStDNvmg3R8g+R3C8aoey9zRI6x3QuOYQL
 JrNU9lNxSQn2K+cmJ7eFxRhqm2kkb4ET88rFLv/VeftILsICi67HBJxWQzJbR2rDeg
 V23SdIBFIJNeTZyG3ezFeQstVh+Nc6i83mUo3GZ9r8wI/tw4epceSybq+fZUmUImhG
 ZLfZ7hA1PC7OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/24] drm/xe: Add CPU bind layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-17-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:50:02 +0000
Message-Id: <20260904215003.485491F00A3D@smtp.kernel.org>
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

Pre-existing issues:
- [High] Concurrent RB-tree corruption in `xe_range_fence_insert()` during =
PREFETCH operations.
- [High] Memory leak of `pt_job_ops` and deferred page table BOs when a PT =
job is dropped by the DRM scheduler.
--

commit dab33f2788d31662c4784993dd54e7509cc455e6
Author: Matthew Brost <matthew.brost@intel.com>
drm/xe: Add CPU bind layer

This commit introduces a dedicated CPU bind layer at the device level,
decoupling it from the migrate layer. It updates the PT layer to generate
a single bind job when pages are mirrored across tiles. The patch includes
a significant refactor to ensure functional equivalence.

Link: https://patch.msgid.link/20260228013501.106680-17-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sc=
hed_job.c
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -73,8 +73,9 @@ static void job_free(struct xe_sched_job *job)
>  	struct xe_exec_queue *q =3D job->q;
>  	bool is_migration =3D xe_sched_job_is_migration(q);
> =20
> -	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
> -			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
> +	kmem_cache_free(job->is_pt_job || xe_exec_queue_is_parallel(job->q) ||
> +			is_migration ? xe_sched_job_parallel_slab :
> +			xe_sched_job_slab, job);
>  }

[Severity: High]
This is a pre-existing issue, but does dropping a PT job leak the pt_job_ops
and its deferred page table BOs?

When a page table update job is created (e.g. in
xe_cpu_bind_update_pgtables_job()), a reference to pt_job_ops is acquired v=
ia
xe_pt_job_ops_get(). This is normally released when the job executes in
guc_exec_queue_run_job().

However, if the execution queue is destroyed before execution, the DRM
scheduler aborts the job and calls the backend's .free_job callback
(guc_exec_queue_free_job()). That callback invokes job_free() which frees t=
he
job memory, but fails to call xe_pt_job_ops_put() for PT jobs. This appears
to permanently leak the xe_pt_job_ops structure and the BOs it tracks.

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -2821,67 +2824,61 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct=
 xe_vma_ops *vops)
[ ... ]
> -	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> +	if (xe_range_fence_insert(&vm->rftree, rfence,
>  				  &xe_range_fence_kfree_ops,
> -				  pt_update_ops->start,
> -				  pt_update_ops->last, fence))
> +				  vops->start, vops->last, fence))

[Severity: High]
This isn't a bug introduced by this patch, but does xe_range_fence_insert()
have a concurrent RB-tree corruption risk here?

In xe_vm_bind_ioctl(), if an operation does not modify the GPU VA (such as
DRM_XE_VM_BIND_OP_PREFETCH on non-userptr memory),
XE_VMA_OPS_FLAG_DOWNGRADE_LOCK is set and vm->lock is downgraded to a read
lock (downgrade_write(&vm->lock)).

When multiple prefetch binds on the same VM execute concurrently, they will
reach xe_pt_update_ops_run() and unconditionally call xe_range_fence_insert=
()
to track the page table update. Since xe_range_fence_insert() modifies the
RB-tree directly without any internal synchronization, this concurrent acce=
ss
under a read lock could lead to structural corruption of the shared
vm->rftree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D16
