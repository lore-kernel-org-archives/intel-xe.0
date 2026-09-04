Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F35C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6510E580;
	Fri,  4 Sep 2026 21:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MKVJ5qEb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4462210E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:44:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7E78460209;
 Fri,  4 Sep 2026 21:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A74E1F00A3D;
 Fri,  4 Sep 2026 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788558251;
 bh=QHFJZ7XG4P3V8UAnuYwPcUpjv+bKd9fYoorNmleMX+U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MKVJ5qEbVCocx1vIPkKSNTSH1rTBdbWPiQqz39qJgLy5dH8DjKMU91wxPdDClBmSm
 hOe0J1SmwbxXIrqCDeVFSgFW88K+m140zh3rw8oHDzqURLmjkvNwTwuY9wBKIkuEJJ
 /PzkxhaDUvUNJlnlJl2mnM6t8zHDFXGx+f5Pz6q6p1sJWB0fzmycqXSXEcgoMjvj9q
 irdofxHqbV1Bo1qcTjHlACjl+PDd1qm6xYIlS3wQeIc3xgw4vBP2erXac3nsZZ1Zag
 x9Zbs3yaIXSPfNG2j8T/k4ELZqbAM/uUgUDRzs1KpGzbyGatApLZxzUoxu0X2zELj6
 wutgVHvDGnLFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/24] drm/xe: Enable CPU binds for jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-14-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:44:10 +0000
Message-Id: <20260904214411.0A74E1F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Memory leak of `xe_pt_job_ops` and `job->fence` when PT jobs are=
 aborted by the DRM scheduler.
--

commit 5533668320d4e1611a5ff8ddda82df8a65a1b27b
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Enable CPU binds for jobs
   =20
This patch removes GPU-based binding and updates the migration layer to
formulate a PT job which will issue CPU bind in the submission backend. This
lowers latency and avoids running out of migration PTEs.

Link: https://patch.msgid.link/20260228013501.106680-14-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index ba8e195afcc89..e5c46e0fa9607 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -2104,6 +1889,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  	if (is_migrate)
>  		mutex_lock(&m->job_mutex);
> =20
> +	job->pt_update[0].vm =3D pt_update->vops->vm;
> +	job->pt_update[0].tile =3D tile;
> +	job->pt_update[0].ops =3D ops;
> +	job->pt_update[0].pt_job_ops =3D
> +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> +
>  	xe_sched_job_arm(job);
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);

[Severity: Medium]
Are these references correctly released if the DRM scheduler aborts the job?

When a PT job is created and armed, pt_job_ops gets a reference here, and t=
he
job's fence receives an extra reference. Normally, guc_exec_queue_run_job()
drops both of these references:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_run_job() {
	if (is_pt_job(job)) {
		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
		return NULL;
	}
...
}

However, if the job is aborted (e.g., queue closed, wedging), run_job() is
bypassed and the scheduler calls xe_sched_job_destroy() instead. Looking at
xe_sched_job_destroy(), it only puts job->fence once and lacks a call to
xe_pt_job_ops_put() entirely:

drivers/gpu/drm/xe/xe_sched_job.c:xe_sched_job_destroy() {
...
	xe_sched_job_free_fences(job);
	dma_fence_put(job->fence);
	drm_sched_job_cleanup(&job->drm);
	job_free(job);
...
}

Does this permanently leak the pt_job_ops structure and the second fence
reference when PT jobs are aborted during error paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D13
