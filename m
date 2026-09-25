Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182D3C98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 06:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E5C10E22A;
	Fri, 25 Sep 2026 06:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iJzFuuLJ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839FD10E22A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:03:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FBD560252;
 Fri, 25 Sep 2026 06:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F9A1F000FF;
 Fri, 25 Sep 2026 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790316206;
 bh=K86jLeuFvs2tUY8TgRuqAWm5viDAd1mpipmfjQA3dxY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=iJzFuuLJciZJzj/ULGgljoPuou7/S3jH+RXhg0dDOURhxQaz5HVwCkmIKayS5wWgA
 +mNljjSbm0Qyyd9U+WZ4kERvA5JWP2r/hN2AQ9UDCb6ZW8mA1iw6gVCfUgeKS5oFwx
 4YCTz99zN/Soo/LZVsS5s9N/q0abSIQ8Je/yW67LWN087AMQSRlzwf2KqgaYy86Lod
 FacO9qrRisktCIUtM6CVitH/VqNneRtaRDYYyHSeR7IVjvLVo+323RQr4eNer8/wLi
 4INey+ekD1f5gI7sigm9rZBGR4Ivtu7zs1LOf2GSF4843tIFwLf9T43ufElLyLl6Ju
 ajlcour5rirNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/24] drm/xe: Enable CPU binds for jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-14-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:03:25 +0000
Message-Id: <20260925060326.27F9A1F000FF@smtp.kernel.org>
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
- [High] drm/xe: memory leak of pt_job_ops and dma_fence when PT jobs are c=
anceled
- [High] drm/xe: GPU hang and memory leak due to missing CPU bind support i=
n Execlist backend
--

commit 6471c15e2149c2517458e891e7dceef8c5573f97
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Enable CPU binds for jobs

This commit updates the migration layer to formulate page table jobs that
issue CPU binds in the submission backend. All code related to GPU-based
binding is removed to lower latency and avoid PTE migration limits.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -1937,162 +1866,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *=
m,
>  {
>  	const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
>  	struct xe_tile *tile =3D m->tile;
>  	struct xe_sched_job *job;
>  	struct dma_fence *fence;
>  	bool is_migrate =3D is_migrate_queue(m, pt_update_ops->q);
> +	int err;
> =20
> -	job =3D xe_bb_create_migration_job(pt_update_ops->q, bb,
> -					 xe_migrate_batch_base(m, usm),
> -					 update_idx);
> +	job =3D xe_sched_job_create(pt_update_ops->q, NULL);

[Severity: High]
Does the Execlist backend properly handle these new PT jobs?

Since xe_sched_job_create() is now called with a NULL batch address, these
jobs rely on backend interception. However, looking at execlist_run_job() in
the Execlist backend:

drivers/gpu/drm/xe/xe_execlist.c:execlist_run_job() {
    ...
    q->ring_ops->emit_job(job);
    xe_execlist_make_active(exl);

    return job->fence;
}

If GuC submission is disabled, it appears the backend receives this job and
directly emits it to the ring without an is_pt_job() check. Could this resu=
lt
in pushing an uninitialized batch address to the hardware, causing a GPU ha=
ng
and leaking the pt_job_ops structures?

>  	if (IS_ERR(job)) {
>  		err =3D PTR_ERR(job);
> -		goto err_sa;
> +		goto err_out;
>  	}
> =20
> -	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> +	xe_tile_assert(tile, job->is_pt_job);
> =20
>  	if (ops->pre_commit) {
>  		pt_update->job =3D job;
> @@ -2103,6 +1888,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  	if (is_migrate)
>  		mutex_lock(&m->job_mutex);
> =20
> +	job->pt_update[0].vm =3D pt_update->vops->vm;
> +	job->pt_update[0].tile =3D tile;
> +	job->pt_update[0].ops =3D ops;
> +	job->pt_update[0].pt_job_ops =3D
> +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> +

[Severity: High]
Is there a memory leak if this PT job gets canceled before execution?

We acquire a reference to pt_job_ops here, and xe_sched_job_arm() takes an
extra dma_fence reference. If the job is canceled (for example, from an
execution queue kill or GPU reset), the DRM scheduler calls the free_job
callback which ultimately calls xe_sched_job_destroy():

drivers/gpu/drm/xe/xe_sched_job.c:xe_sched_job_destroy() {
    ...
    xe_sched_job_free_fences(job);
    dma_fence_put(job->fence);
    drm_sched_job_cleanup(&job->drm);
    job_free(job);
}

Since xe_sched_job_destroy() doesn't check job->is_pt_job, it seems we never
drop the pt_job_ops or the extra dma_fence reference. This would permanently
leak the deferred actions and their associated page table BO references. Do=
es
the job destruction path need updating to clean up canceled PT jobs?

>  	xe_sched_job_arm(job);
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D13
