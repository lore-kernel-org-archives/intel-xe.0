Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB11FD609A7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871F610EA1A;
	Wed, 27 Nov 2024 08:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kbp+pEBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D410EA1A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732695188; x=1764231188;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bpQnjhiE6c07KzHMnnLukjwLWyGQfACG0W0G7jKVD9g=;
 b=Kbp+pEBsnjniJFIkyFnNa9rBm80xsvooOl3aUkF/ysIFkk1qJ95IJrOQ
 i6ylMqF04V3LHG4U6qyeqHftlZHYiU9nOdV4gEXqKkXrirx4p0cNoAO3D
 ha/D3uQVJor2XUHVJiM5YpvGEqlxe+NF/OlhxiBC1izg1ox6cDcQfGpxl
 y6+vRovogeg/44M26iMh2KziQOAC7dfoI8gFdRCuMto7Vpq/uPXW1KTmh
 NGK176Y/41YHYesHd2pFn1dGNSY11Nsl1mnHWeH/XmHCEMoo3NRroqFkH
 bzC6qj1Azfgu2HmK1MGGXCv/tN33VS2ttb9S/v2Pd6IZ/aJXBBw/AXzM7 Q==;
X-CSE-ConnectionGUID: F+CJpE0gSQC+PjymrTL7Zg==
X-CSE-MsgGUID: aakP6U4FQZKeNom1vu6w4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44276104"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="44276104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:13:08 -0800
X-CSE-ConnectionGUID: tAgOeeZ+T5ygkiTEYIKezA==
X-CSE-MsgGUID: IbBOWafORDOutpB/ZLfcDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92182012"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.103])
 ([10.245.246.103])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:13:06 -0800
Message-ID: <b91fdc7fa3550ed802f5ccdb759c2fb84406897e.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] Revert "drm/xe: Add a reason string to the
 devcoredump"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 27 Nov 2024 09:13:02 +0100
In-Reply-To: <20241127083042.358726-4-himal.prasad.ghimiray@intel.com>
References: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
 <20241127083042.358726-4-himal.prasad.ghimiray@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2024-11-27 at 14:00 +0530, Himal Prasad Ghimiray wrote:
> This reverts commit 06e2cb496396613e583a72a85e0822fb43b2ead5. The
> commit
> was accidentally and unintentionally pushed.
>=20
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 21 +++------------------
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 ++---
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump_types.h |=C2=A0 4 ----
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 14 ++++----------
> =C2=A04 files changed, 9 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index f4c77f525819..0e5edf14a241 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -99,7 +99,6 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> size_t count,
> =C2=A0	p =3D drm_coredump_printer(&iter);
> =C2=A0
> =C2=A0	drm_puts(&p, "**** Xe Device Coredump ****\n");
> -	drm_printf(&p, "Reason: %s\n", ss->reason);
> =C2=A0	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
> =C2=A0	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
> =C2=A0
> @@ -107,7 +106,7 @@ static ssize_t __xe_devcoredump_read(char
> *buffer, size_t count,
> =C2=A0	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec,
> ts.tv_nsec);
> =C2=A0	ts =3D ktime_to_timespec64(ss->boot_time);
> =C2=A0	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec,
> ts.tv_nsec);
> -	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss-
> >pid);
> +	drm_printf(&p, "Process: %s\n", ss->process_name);
> =C2=A0	xe_device_snapshot_print(xe, &p);
> =C2=A0
> =C2=A0	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
> @@ -139,9 +138,6 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> -	kfree(ss->reason);
> -	ss->reason =3D NULL;
> -
> =C2=A0	xe_guc_log_snapshot_free(ss->guc.log);
> =C2=A0	ss->guc.log =3D NULL;
> =C2=A0
> @@ -257,11 +253,8 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
> =C2=A0	ss->snapshot_time =3D ktime_get_real();
> =C2=A0	ss->boot_time =3D ktime_get_boottime();
> =C2=A0
> -	if (q->vm && q->vm->xef) {
> +	if (q->vm && q->vm->xef)
> =C2=A0		process_name =3D q->vm->xef->process_name;
> -		ss->pid =3D q->vm->xef->pid;
> -	}
> -
> =C2=A0	strscpy(ss->process_name, process_name);
> =C2=A0
> =C2=A0	ss->gt =3D q->gt;
> @@ -299,18 +292,15 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
> =C2=A0 * xe_devcoredump - Take the required snapshots and initialize
> coredump device.
> =C2=A0 * @q: The faulty xe_exec_queue, where the issue was detected.
> =C2=A0 * @job: The faulty xe_sched_job, where the issue was detected.
> - * @fmt: Printf format + args to describe the reason for the core
> dump
> =C2=A0 *
> =C2=A0 * This function should be called at the crash time within the
> serialized
> =C2=A0 * gt_reset. It is skipped if we still have the core dump device
> available
> =C2=A0 * with the information of the 'first' snapshot.
> =C2=A0 */
> -__printf(3, 4)
> -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job
> *job, const char *fmt, ...)
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job
> *job)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D gt_to_xe(q->gt);
> =C2=A0	struct xe_devcoredump *coredump =3D &xe->devcoredump;
> -	va_list varg;
> =C2=A0
> =C2=A0	if (coredump->captured) {
> =C2=A0		drm_dbg(&xe->drm, "Multiple hangs are occurring, but
> only the first snapshot was taken\n");
> @@ -318,11 +308,6 @@ void xe_devcoredump(struct xe_exec_queue *q,
> struct xe_sched_job *job, const cha
> =C2=A0	}
> =C2=A0
> =C2=A0	coredump->captured =3D true;
> -
> -	va_start(varg, fmt);
> -	coredump->snapshot.reason =3D kvasprintf(GFP_ATOMIC, fmt,
> varg);
> -	va_end(varg);
> -
> =C2=A0	devcoredump_snapshot(coredump, q, job);
> =C2=A0
> =C2=A0	drm_info(&xe->drm, "Xe device coredump has been created\n");
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h
> b/drivers/gpu/drm/xe/xe_devcoredump.h
> index 6a17e6d60102..c04a534e3384 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -14,12 +14,11 @@ struct xe_exec_queue;
> =C2=A0struct xe_sched_job;
> =C2=A0
> =C2=A0#ifdef CONFIG_DEV_COREDUMP
> -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job
> *job, const char *fmt, ...);
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job
> *job);
> =C2=A0int xe_devcoredump_init(struct xe_device *xe);
> =C2=A0#else
> =C2=A0static inline void xe_devcoredump(struct xe_exec_queue *q,
> -				=C2=A0 struct xe_sched_job *job,
> -				=C2=A0 const char *fmt, ...)
> +				=C2=A0 struct xe_sched_job *job)
> =C2=A0{
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e6234e887102..be4d59ea9ac8 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -28,10 +28,6 @@ struct xe_devcoredump_snapshot {
> =C2=A0	ktime_t boot_time;
> =C2=A0	/** @process_name: Name of process that triggered this gpu
> hang */
> =C2=A0	char process_name[TASK_COMM_LEN];
> -	/** @pid: Process id of process that triggered this gpu hang
> */
> -	pid_t pid;
> -	/** @reason: The reason the coredump was triggered */
> -	char *reason;
> =C2=A0
> =C2=A0	/** @gt: Affected GT, used by forcewake for delayed capture
> */
> =C2=A0	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c36329fe857..d00af8d8acbe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -901,8 +901,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct
> work_struct *w)
> =C2=A0		if (!ret) {
> =C2=A0			xe_gt_warn(q->gt, "Schedule disable failed
> to respond, guc_id=3D%d\n",
> =C2=A0				=C2=A0=C2=A0 q->guc->id);
> -			xe_devcoredump(q, NULL, "Schedule disable
> failed to respond, guc_id=3D%d\n",
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q->guc->id);
> +			xe_devcoredump(q, NULL);
> =C2=A0			xe_sched_submission_start(sched);
> =C2=A0			xe_gt_reset_async(q->gt);
> =C2=A0			return;
> @@ -910,7 +909,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct
> work_struct *w)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q-
> >lrc[0]))
> -		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=3D%d",
> q->guc->id);
> +		xe_devcoredump(q, NULL);
> =C2=A0
> =C2=A0	xe_sched_submission_start(sched);
> =C2=A0}
> @@ -1137,9 +1136,7 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0				xe_gt_warn(guc_to_gt(guc),
> =C2=A0					=C2=A0=C2=A0 "Schedule disable failed
> to respond, guc_id=3D%d",
> =C2=A0					=C2=A0=C2=A0 q->guc->id);
> -			xe_devcoredump(q, job,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Schedule disable failed to
> respond, guc_id=3D%d, ret=3D%d, guc_read=3D%d",
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q->guc->id, ret,
> xe_guc_read_stopped(guc));
> +			xe_devcoredump(q, job);
> =C2=A0			set_exec_queue_extra_ref(q);
> =C2=A0			xe_exec_queue_get(q);	/* GT reset owns
> this */
> =C2=A0			set_exec_queue_banned(q);
> @@ -1169,10 +1166,7 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0	trace_xe_sched_job_timedout(job);
> =C2=A0
> =C2=A0	if (!exec_queue_killed(q))
> -		xe_devcoredump(q, job,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Timedout job - seqno=3D%u,
> lrc_seqno=3D%u, guc_id=3D%d, flags=3D0x%lx",
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_seqno(job),
> xe_sched_job_lrc_seqno(job),
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q->guc->id, q->flags);
> +		xe_devcoredump(q, job);
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Kernel jobs should never fail, nor should VM jobs if they
> do

