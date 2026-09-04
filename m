Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10E2C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EF510FB3A;
	Fri,  4 Sep 2026 21:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lL75P6mY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394F510E59A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:40:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 21F0943238;
 Fri,  4 Sep 2026 21:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5A61F00A3D;
 Fri,  4 Sep 2026 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788558004;
 bh=n93Ayfg7gLn3jKNKsrh/N6zF7HiDBmFdSzJITSzbnPI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lL75P6mYMEUQTS+8fkKn5F+6mTNxVJHAAq8UZ4QxpxepMfIk+RHLSeam8bnAm/ZJT
 FlGaJ/mEVOb4LRxUxj/RUO5OJ5HYsBvxqYgC1iCLjrBDJRcZr9n351P4Z3CGX6Vcri
 oDyiAZ/b4uYlqUgqMDIby9xJUODCIb3FWu9JqG41SKiclXT3WpuoN1R8Lz5R1mpDLZ
 EinWr3xITkmCo8/elCR1A31EVjMWgjNsSlJ88HRfXW1RaSXncq+djkj5g0dOIwjOra
 Fe4XvfUkcCTJt53Bq3oIA5rh74MM/smUM5nNg2k+ulDu4KGa+bDorigzxgTBbF5dCE
 Pt4ToBKcCgHKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 19/24] drm/xe: Add ULLS migration job support to
 migration layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-20-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:40:03 +0000
Message-Id: <20260904214003.CD5A61F00A3D@smtp.kernel.org>
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
- [High] Holding job_mutex while waiting on a dma_fence in xe_migrate_ulls_=
exit violates the dma_fence contract and risks deadlocks during GPU reset.
--

commit bbc9d2795fb53c65f8a7edb5c701c0f994595d7a
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to migration layer

This commit adds a function to enter ULLS mode for migration jobs and a
delayed worker to exit it for power savings. It sets flags on migration
jobs so submission backends can submit in ULLS mode, which is only
supported on DGFX and USM platforms.

Link: https://patch.msgid.link/20260228013501.106680-21-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 471ae5741836e..3e59aeeca614d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -448,6 +468,161 @@ static int xe_migrate_lock_prepare_vm(struct xe_til=
e *tile, struct xe_migrate *m
[ ... ]
> +static void xe_migrate_ulls_exit(struct work_struct *work)
> +{
[ ... ]
> +	mutex_lock(&m->job_mutex);
> +
> +	if (!xe_exec_queue_is_idle(m->q, 1))
> +		goto unlock_exit;
> +
> +	xe_sched_job_get(job);
> +	fence =3D __xe_migrate_job_push(m, job, ULLS_EXIT);
> +
> +	/* Serialize the PM put against the ring being taken off the hardware */
> +	dma_fence_wait(fence, false);

[Severity: High]
Can this lead to a deadlock during GPU reset?

In xe_migrate_ulls_exit(), the delayed worker acquires m->job_mutex, pushes
the ULLS_EXIT job, and blocks on its completion fence via dma_fence_wait()
before releasing the mutex.

Since m->job_mutex is explicitly tainted with fs_reclaim during
initialization, marking it as used in memory reclaim paths, blocking on a
dma_fence while holding this lock violates dma_fence locking rules. Fence
signaling can depend on memory allocations, creating a circular dependency
(job_mutex -> dma_fence -> fs_reclaim -> job_mutex).

If the GPU hangs while processing the ULLS_EXIT job, the thread blocks
indefinitely. Will the DRM scheduler's GPU reset recovery path permanently
deadlock here if it needs to evict memory using xe_migrate_copy() or
xe_migrate_clear(), which also attempt to acquire m->job_mutex?

> +	dma_fence_put(fence);
> +
> +	m->ulls.enabled =3D false;
> +unlock_exit:
> +	if (job)
> +		xe_sched_job_put(job);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D19
