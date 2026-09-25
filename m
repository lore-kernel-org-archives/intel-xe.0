Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CAAC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D3D10FC6E;
	Fri, 25 Sep 2026 20:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LCyBih5v";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A9210FC6E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:39:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E0252406E1;
 Fri, 25 Sep 2026 20:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999EA1F000FF;
 Fri, 25 Sep 2026 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790368772;
 bh=+GIfR2kskWMk4U7uyB8NtEfLGh3ZK0VeMwg1MFTsS/I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LCyBih5vF374CwzYMu6r43JqxwoZs5pc5KHT2YEMOQgbfJrFVpKvyrP1j70FbgNk8
 bh4Qee3DQAdw46Z1lsdK8e6CYVscOP3Y8zWj+l9hXuE+mCO1YVrMGYdsZrSnnVnznG
 akv3uzPbSWNf6VIo53bOvj/iqRPyep94/mU+tD6nxj03E7orhSDVPF1xl1xZAQ4P8F
 eujq7I9Oy8zsNeFq2fYqtFh58xufaB3iEddL8LwmVX+votyClSTXjqrpnw4nLjK5XX
 rdfTWEsALl41ZzXrNiTpgZ4ELXMv+SV/DtS19dHEtp73Z7B8AXAIB5ZZJCItoUmIlL
 IVHS+Rbc8zYmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/24] drm/xe: Enable CPU binds for jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925201526.1355279-14-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 20:39:32 +0000
Message-Id: <20260925203932.999EA1F000FF@smtp.kernel.org>
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
- [High] drm/xe: xe_execlist submission backend crashes on CPU-bound PT jobs
- [Medium] drm/xe: memory leak of xe_pt_job_ops on canceled PT jobs
--

commit 9de8f05bf053b28de6fdac64d9ee437e1c0df6f7
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Enable CPU binds for jobs

This commit transitions the driver to formulating PT jobs that issue CPU
binds in the submission backend instead of using the GPU. This approach
aims to lower latency and avoid migration PTE exhaustion for large arrays
of binds.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -1937,162 +1866,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *=
m,
>  {

[ ... ]

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
Does this cause a crash or hang when the driver operates in execlist mode
(e.g., when GuC is disabled)? In drivers/gpu/drm/xe/xe_execlist.c, the
execlist_run_job() function unconditionally emits the job to the GPU
ringbuffer without checking if is_pt_job is true. Because the job uses a
union for ptrs and pt_update, the backend reads the newly populated
job->pt_update as a batch address, emitting garbage into the hardware ring.

> =20
>  	if (ops->pre_commit) {
>  		pt_update->job =3D job;

[ ... ]

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

[Severity: Medium]
Does this leak the dynamically allocated xe_pt_job_ops structure if the PT
job is canceled or dropped before execution? The scheduler directly invokes
the free_job callback when a process is killed and jobs are aborted, which
calls xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c. Since
xe_sched_job_destroy() does not check for job->is_pt_job, the reference
acquired here is never released.

>  	xe_sched_job_arm(job);
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925201526.1355=
279-1-matthew.brost@intel.com?part=3D13
