Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF7C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8305710FCA2;
	Fri, 25 Sep 2026 20:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VqkZ2hTv";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981F10FCA6
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:41:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E032460136;
 Fri, 25 Sep 2026 20:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9181F000FF;
 Fri, 25 Sep 2026 20:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790368898;
 bh=xUjCUp/TeF8dC5SEuB93viGfuXBIvHaby/5H4jPB5AY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VqkZ2hTvkM2k1dl2SI3AbJP32RJUtUOcu5yXJgXzF6Ni0Aze7Ig4dAemkFsQzTgSl
 LKOllmwh6ee45YCOecst/R4qHXw7m0FLTXMn/r3T2hFk4YqCFxJYRXxhKUOx15sS5Y
 dmvbMsO73BkCSXk+0jBHuENuBbd55Q0Wekc7M/ZSUmKec+Nn6UbbV4q3JMRZD3gJmI
 x99xhhtjoyHsGteVFdN2aypaJIJUbc4mI+XASEfmzvHA41yaR5CoWYiZ87bmhRDALF
 nDu9SEaKUhqC+3xkOy+/PPx9RWJZ4VeUf/4JyNnarvEDfV4Dnl6S0pZ/zqnnJjJWSs
 fRbxwKzqTanlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 19/24] drm/xe: Add ULLS migration job support to
 migration layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925201526.1355279-20-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 20:41:37 +0000
Message-Id: <20260925204138.6C9181F000FF@smtp.kernel.org>
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
- [Critical] drm/xe/migrate: ULLS exit worker fires during system suspend c=
ausing fatal hardware access
- [High] drm/xe/migrate: ULLS state not cleared on GT reset causes migratio=
n engine hang
--

commit ffd4d32bbca19023aed05a8d61a40704a5e6e6a4
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to migration layer

This commit adds a function to enter Ultra Low Latency Submission (ULLS)
mode for migration jobs, and a delayed worker to exit it for power savings.
It introduces several ULLS state flags and related job submission triggers.

> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> +static struct dma_fence *xe_migrate_job_push(struct xe_migrate *m,
> +					     struct xe_sched_job *job)
> +{
> +	enum xe_ulls_state ulls =3D ULLS_NONE;
> +
> +	lockdep_assert_held(&m->job_mutex);
> +
> +	if (xe_migrate_ulls_enabled(m)) {
> +		ulls =3D ULLS_ACTIVE;

[Severity: High]
Does the software state stay out of sync if a GT reset occurs while ULLS is
active?

If m->ulls.enabled is never cleared by a GT reset hook, the next migration
job submitted post-reset will see ulls.enabled as true. It will then submit
as a chained job (ULLS_ACTIVE), bypassing the GuC doorbell (H2G
XE_GUC_ACTION_SCHED_CONTEXT).

Since the hardware was reset, the context needs a schedule doorbell to pick
up the new tail, potentially causing the migration engine to hang permanent=
ly.

> +		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
> +				 ULLS_EXIT_JIFFIES);
> +	}
> +
> +	return __xe_migrate_job_push(m, job, ulls);
> +}

[ ... ]

> +static void xe_migrate_ulls_exit(struct work_struct *work)
> +{
> +	struct xe_migrate *m =3D container_of(work, struct xe_migrate,
> +					    ulls.exit_work.work);
> +	struct xe_device *xe =3D tile_to_xe(m->tile);
> +	struct xe_sched_job *job =3D NULL;
> +	struct dma_fence *fence =3D NULL;
> +	u64 batch_addr[2] =3D { 0, 0 };
> +	int idx;
> +
> +	xe_assert(xe, m->ulls.enabled);
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return;
> +
> +	/*
> +	 * Must be done outside job_mutex as that lock is tainted with
> +	 * reclaim and must be done holding a pm ref.
> +	 */
> +	job =3D xe_sched_job_create(m->q, batch_addr);

[Severity: Critical]
Could this worker fire during system suspend and attempt invalid hardware
access?

The system suspend path (xe_pm_suspend) does not appear to call
cancel_delayed_work_sync(&m->ulls.exit_work).

If ULLS is entered right before suspend (e.g., from an eviction page fault),
this exit worker might execute after the device has entered D3Cold. This
would lead to a machine check, PCI abort, or kernel panic when
xe_sched_job_create() pushes the job and the scheduler writes to GuC MMIO
or the GGTT ring buffer on a powered-down device.

> +	if (WARN_ON_ONCE(IS_ERR(job))) {
> +		drm_dev_exit(idx);
> +		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
> +				 ULLS_EXIT_JIFFIES);
> +		return;		/* Not fatal */
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925201526.1355=
279-1-matthew.brost@intel.com?part=3D19
