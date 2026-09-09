Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3348C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 09:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C7310F01F;
	Wed,  9 Sep 2026 09:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ma1G/0O5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8280B10F025
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 09:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788944514; x=1820480514;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=KWSlq/Aweyt++qQA/86kZkeK8fjjPbI0azSS9tj74fg=;
 b=Ma1G/0O5S8GJzCCAnQiLtxIY+AeVZXf+hqJaXVqSGIDsGNc+E9xHb7IU
 pcMrzC8A1XKd01CZQvigxBxT8FviqTMsnxg+fIplPYNGEeUifqgObtGBB
 2JRIIzKkSQ2tMUaue2cfOftDKbiwScxJyP/LmhMyqRnWHcdZlsHqXDKjJ
 Mt+TkAp9W/yDJ9rHKNW5bnI2HG3PxcvnZLLATfQ3WJLdLCaEYKNOlU4hv
 WX1jnI/bZ1OgoHjbdGjk1M1ZxbUIASRylIlh3hTP8w1ZcLmhc3TZGXbc2
 t9WopEbb7q8LcUgAFUOGQmBxTpxICw2O6/2vgAhNuifWJ6H4jDOL8Uz9N Q==;
X-CSE-ConnectionGUID: iAzQ8FLZRKudvxj5ZMHngA==
X-CSE-MsgGUID: nwJQ9GJgQYyiIaMHaULGKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114906547"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114906547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 02:01:53 -0700
X-CSE-ConnectionGUID: 6WOOChISSsKz4c7rLvrcXg==
X-CSE-MsgGUID: CihDVacwSpKhnD7K37o/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268004085"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60])
 ([10.245.245.60])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 02:01:52 -0700
Message-ID: <ebda3d9ad695bf5fcb69c67d98afcd2098c5acad.camel@linux.intel.com>
Subject: Re: [PATCH v6 24/24] drm/xe: Document ULLS for migration jobs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 11:01:50 +0200
In-Reply-To: <20260904211613.3934307-25-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-25-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-09-04 at 14:16 -0700, Matthew Brost wrote:
> Add a kernel-doc DOC section at the top of xe_migrate.c describing
> the
> Ultra Low Latency Submission (ULLS) scheme used for migration jobs.
>=20
> Cover the motivation (removing the H2G / GuC / context switch latency
> from the page fault and SVM prefetch critical paths), the platform
> requirements, the LRC PPHWSP semaphore layout and its relationship to
> the migration queue job count, the fixed ULLS job size and why it is
> needed, the ring preamble / postamble emitted by the ring ops
> including
> the in-ring tail update, the semaphore-only submission fast path in
> the
> GuC backend, and the enter / delayed exit flow along with the ULLS
> job
> flags.
>=20
> Hook the new section into Documentation/gpu/xe/xe_migrate.rst.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: Github-Copilot:Claude-opus-5
> ---
> =C2=A0Documentation/gpu/xe/xe_migrate.rst |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0 | 146
> ++++++++++++++++++++++++++++
> =C2=A02 files changed, 149 insertions(+)
>=20
> diff --git a/Documentation/gpu/xe/xe_migrate.rst
> b/Documentation/gpu/xe/xe_migrate.rst
> index f92faec0ac94..d297ee53a582 100644
> --- a/Documentation/gpu/xe/xe_migrate.rst
> +++ b/Documentation/gpu/xe/xe_migrate.rst
> @@ -6,3 +6,6 @@ Migrate Layer
> =C2=A0
> =C2=A0.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate_doc.h
> =C2=A0=C2=A0=C2=A0 :doc: Migrate Layer
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate.c
> +=C2=A0=C2=A0 :doc: ULLS (Ultra Low Latency Submission) for migration job=
s
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 3bc78f761f23..94ad1e7e8bc4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -48,6 +48,152 @@
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vram.h"
> =C2=A0
> +/**
> + * DOC: ULLS (Ultra Low Latency Submission) for migration jobs
> + *
> + * Migration jobs issued on behalf of GPU page faults and SVM
> prefetches sit
> + * directly in the critical path of a stalled GPU workload. The
> dominant cost
> + * of such a job is not the copy or clear itself but the submission
> latency:
> + * the H2G round trip to GuC, the GuC scheduling decision, and the
> hardware
> + * context switch required to place the migration LRC on an engine.
> + *
> + * ULLS removes that cost by keeping the migration context resident
> and
> + * *running* on the hardware engine across jobs. Instead of the ring
> going
> + * empty and the context being switched out between jobs, the tail
> of every
> + * ULLS job parks the engine on a semaphore wait for the *next*
> job's
> + * semaphore, and then advances the ring tail itself. Submitting the
> next job
> + * therefore costs the CPU a single write to signal that semaphore -
> no H2G,
> + * no GuC round trip, no context switch, no MMIO.

This all assumes the migration LRC empties between jobs. How common is
that to the case where a new job can modify the ring tail before the
previous job finished? Will the HW autotail feature affect the
usefulness of the ULLS migration jobs?

Also worth adding is a discussion around semaphore context switch-out
when stalled, like whether we're inhibiting that explicitly, whether
the engine is assumed to be single-context etc.


> + *
> + * Requirements
> + * ------------
> + *
> + * ULLS is only used on DGFX with USM support (where a hardware
> engine is
> + * reserved exclusively for migration jobs). Because the engine is
> spinning
> + * on a semaphore while ULLS is active, it can not be shared with
> user
> + * submissions. It can also be disabled at load time with the
> + * ``xe.ulls_enable`` module parameter.

Update if decide to use per-device sysfs entry.

Otherwise LGTM.

/Thomas




> + *
> + * Fixed size jobs
> + * ---------------
> + *
> + * A job updates the ring tail to cover its successor, but it is
> emitted long
> + * before that successor exists, so it can not know how much ring
> the
> + * successor will occupy. Every ULLS job is therefore padded out to
> exactly
> + * ULLS_JOB_SIZE_BYTES, which lets the next tail be computed
> arithmetically
> + * from where the current job started.
> + *
> + * This is why the shorter jobs still have to reach the same size:
> the "last"
> + * job skips the batch buffers and the postamble, and pads the
> difference with
> + * MI_NOOP. The "first" job is not covered by any predecessor's tail
> update
> + * and so is unconstrained, but is padded anyway to keep the
> arithmetic
> + * uniform.
> + *
> + * Leaving ULLS mode always goes through a "last" job, which emits
> no tail
> + * update, so an ordinary variable length migration job never
> follows a
> + * prediction.
> + *
> + * Semaphores
> + * ----------
> + *
> + * The semaphores live in the driver-defined portion of the
> migration LRC's
> + * PPHWSP (see LRC_ULLS_PPHWSP_OFFSET, mutually exclusive with the
> parallel
> + * submission area). There are LRC_MIGRATION_ULLS_SEMAPHORE_COUNT of
> them and
> + * a job's semaphore is selected by ``seqno % COUNT``, so the
> semaphore ring
> + * wraps with the job seqnos. To guarantee a job can never overwrite
> the
> + * semaphore of a job still in flight, the GuC backend caps the
> migration
> + * queue's scheduler job count at LRC_MIGRATION_ULLS_SEMAPHORE_COUNT
> - 1.
> + *
> + * Ring layout of a ULLS job
> + * -------------------------
> + *
> + * Emitted by emit_migration_job_gen12() in xe_ring_ops.c::
> + *
> + *	preamble:	clear semaphore[seqno]	(reuse for a later
> wrap)
> + *	<copy timestamp, start seqno store>
> + *	<batch buffer start(s)>			(skipped on
> first/last job)
> + *	<seqno write + user interrupt>
> + *	postamble:	SDI saved ring tail =3D end of next job
> + *			LRI RING_TAIL =3D end of next job
> + *			wait on semaphore[seqno + 1]
> + *						(skipped on the last
> job)
> + *	pad:		MI_NOOP up to ULLS_JOB_SIZE_DW
> + *
> + * The preamble clears the current job's semaphore so it can be
> reused once
> + * the seqno space wraps. The postamble is what keeps the engine
> busy: it
> + * advances the ring tail over the next job and then blocks on that
> job's
> + * semaphore, which is only signaled when the job is actually
> submitted. It
> + * advances the saved tail as well as the tail register, keeping the
> two in
> + * step without any help from the CPU, so a context save and restore
> can not
> + * rewind the tail behind work which has already been published.
> + *
> + * The tail register write must be non-posted, i.e. it must not
> carry
> + * MI_LRI_FORCE_POSTED. Posted, the new tail is free to land after
> the command
> + * streamer has already drained the rest of the job, at which point
> the command
> + * streamer sees head =3D=3D the old tail and parks as though the ring
> were empty.
> + * A parked context can be switched off the hardware, and the fast
> path below
> + * has no H2G with which to ask GuC to bring it back.
> + *
> + * The tail is published ahead of the semaphore wait rather than
> after it so
> + * that the non-posted write drains while the engine is parked
> anyway, keeping
> + * a register round trip off the path between the semaphore being
> signaled and
> + * the next job running.
> + *
> + * Submission fast path
> + * --------------------
> + *
> + * In submit_exec_queue() (xe_guc_submit.c), a ULLS job that is not
> the first
> + * one reduces to::
> + *
> + *	xe_lrc_set_ulls_semaphore(lrc, seqno);		release
> previous job
> + *
> + * The XE_GUC_ACTION_SCHED_CONTEXT H2G is suppressed, and so is the
> write of
> + * the saved ring tail: the previous job's postamble has already
> published
> + * this job's tail both in the tail register and in the context
> image, so the
> + * semaphore signal is all that is left. The previous job's
> semaphore wait is
> + * satisfied and the engine walks straight into this job.
> + *
> + * This does assume the context stays resident for as long as ULLS
> mode is
> + * active. Nothing else is scheduled on the reserved engine, so the
> only ways
> + * off the hardware are the "last" job below, or a reset - and a
> migration job
> + * failing already wedges the device.
> + *
> + * Enter / exit
> + * ------------
> + *
> + * xe_migrate_ulls_enter() is called from the page fault handler and
> from the
> + * SVM prefetch path, i.e. exactly where low latency migration
> matters. It
> + * takes a PM runtime reference (the device must not suspend while
> the engine
> + * spins), then submits a "first" ULLS job. That first job carries
> no batch
> + * buffer; it exists only to get the context onto the hardware
> through the
> + * normal GuC path and to leave the engine waiting on the next
> semaphore,
> + * pipelining the GuC/HW context switch out of the critical path.
> + *
> + * No forcewake reference is required. Nothing in the fast path
> touches MMIO,
> + * and the engine keeps itself awake for as long as it is executing
> the ring.
> + * Not needing host MMIO access is also what lets ULLS run on SRIOV
> VFs.
> + *
> + * Keeping an engine spinning costs power, so ULLS is not left
> enabled
> + * indefinitely. Every enter and every ULLS job submission re-arms
> + * @xe_migrate.ulls.exit_work with a ULLS_EXIT_JIFFIES delay. When
> it fires
> + * with the queue idle, it submits a "last" ULLS job - again with no
> batch
> + * buffer and, crucially, with no postamble semaphore wait or tail
> update -
> + * which lets the ring drain so the context can be switched off the
> hardware.
> + * The PM reference is then dropped. If the queue was not idle, the
> worker
> + * simply re-arms itself.
> + *
> + * Job state
> + * ---------
> + *
> + * The state above is communicated to the ring ops and GuC backend
> via
> + * @xe_sched_job.ulls, set under @xe_migrate.job_mutex:
> + *
> + * - %ULLS_NONE: job submitted outside of ULLS mode
> + * - %ULLS_ENTER: job that enters ULLS mode
> + * - %ULLS_ACTIVE: job submitted while in ULLS mode
> + * - %ULLS_EXIT: job that exits ULLS mode
> + */
> +
> =C2=A0/**
> =C2=A0 * struct xe_migrate - migrate context.
> =C2=A0 */
