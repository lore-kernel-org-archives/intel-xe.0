Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7045C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EA310E07F;
	Fri,  4 Sep 2026 02:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kAoANWGI";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09E110E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:51:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 118CF60A64;
 Fri,  4 Sep 2026 02:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915D11F000E9;
 Fri,  4 Sep 2026 02:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788490314;
 bh=1FEn6svxfQU25ZHrNEVfAWYXOyx7mhgeGCS4zoSvQIU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kAoANWGITZF8ok792RPw58cvXURwE0I1aJ47ZYV33icPd7IPpVBklMYhp/j6dTERI
 hYoMcHmq2MqUPB8uMx6Kx1tzX5NyUXLfxPiQXewJddmbiOPDjBZyjqPLF/6lcqnTWE
 9agMCaYo2zCr06PI8ejVzeTLzOIPwYSKKLZRU37AmUHJTpmPfrDRlaWWI9WvbzW8o0
 dtJCtKstcdp8xN09RlRpHYNHFUJf37xm93Eoen8/UiLKlNpbLdkvJ+oeDlWWaj+tJd
 6Fw5q2UrU+TA6gwttT0yg1dBNVHyTISfSoFtK0wWHuwSbm+kNvalXv2dORtiT8ItOl
 91f3SJ4rzN+NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/25] drm/xe: Enable CPU binds for jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-14-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:51:54 +0000
Message-Id: <20260904025154.915D11F000E9@smtp.kernel.org>
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
- [High] Missing handling for CPU-based PT jobs in the execlist backend cau=
ses the GPU to execute kernel pointers as a batch address and skips page ta=
ble updates.
- [Medium] Leaked `xe_pt_job_ops` and `dma_fence` references when a PT job =
is canceled by the DRM scheduler before execution.
--

commit 9837aa81f0294a36920d4bcf8d6d4c00ce265778
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Enable CPU binds for jobs

This commit transitions the driver to use CPU-based binds instead of the
GPU for page table updates. It formulates a PT job that issues the CPU
bind in the submission backend and removes previous GPU-based binding code.

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

[Severity: High]
Does this new CPU-based PT job cause the GPU to execute garbage when using
the execlist submission backend?

When GuC is disabled, the execlist backend processes the job. However,
execlist_run_job() in drivers/gpu/drm/xe/xe_execlist.c unconditionally
pushes jobs to the GPU without checking if it is a CPU-only PT job.

Because struct xe_sched_job uses a union for these arguments:

	union {
		/** @ptrs: per instance pointers. */
		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
		/** @pt_update: PT update arguments */
		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
	};

the execlist backend will interpret job->ptrs[0].batch_addr (which perfectly
aliases the pt_job_ops pointer) as a physical batch address. This emits the
kernel pointer to the hardware ring, leading to a GPU hang, invalid
instruction faults, and unexecuted page table updates.

[Severity: Medium]
Will the xe_pt_job_ops and dma_fence references leak if the PT job is
canceled by the DRM scheduler before execution?

When a PT job is canceled (e.g., due to process termination or a wedged
device), it bypasses .run_job (like guc_exec_queue_run_job, where cleanup
normally occurs) and directly goes to .free_job, which resolves to
xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c.

The generic xe_sched_job_destroy() routine only drops a single fence
reference and lacks the logic to drop the xe_pt_job_ops reference acquired
here, permanently leaking both.

>  	xe_sched_job_arm(job);
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D13
