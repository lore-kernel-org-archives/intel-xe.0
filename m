Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D80C25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 11:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2310E29B;
	Thu, 23 May 2024 11:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELl37UAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EDF10E29A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716465072; x=1748001072;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=g39p/LGx0OHYZWXRhwKxjri1c5+yYciWjN8vRnMavuY=;
 b=ELl37UAVIEtPnWvExKRE4PPEqSJKhljHwenNV+KeVwtIW7Iig11vnEDR
 of2WGXn+8eQCmTyTo5/NrXTfmmJ+KGOOZF6fMyc9KtPwzmL8l11lycZdW
 GtGcUjAEmDu8qNx2ayvRo9dzPN+r9Lh2K/anBLCN1TgwTfFZhKH/2zHsS
 /X4szFs8z12CqILHZ1kT/cGOcw/Oy4AgfnKAzRn/jawk0Kul9ElqteeY5
 p4KkEJxSVQUv3OU8FWbqB0Qhu6qG5i1p0ThMXoL6OLn3r1Hbo//sjPRSF
 f/QQxTOz7t68pVJLWxBcxD8goRrwP1mpFAJj54qivTmafTx9cMRo4fW32 w==;
X-CSE-ConnectionGUID: NIFUDt9GTrekxn7H48xdAQ==
X-CSE-MsgGUID: 4kzfcuMVRkOQucKoI3R3Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12651404"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12651404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 04:51:08 -0700
X-CSE-ConnectionGUID: nz1cR+xLQ8COStgqoqjvbw==
X-CSE-MsgGUID: Fb5J3L+ATdiq/C62zZNqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33537620"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.44])
 ([10.245.246.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 04:51:06 -0700
Message-ID: <fce37c8b88d7a143fc2e46e9b1bc96711351e2aa.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe: Docouple job seqno and lrc seqno
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <mathhew.brost@intel.com>
Date: Thu, 23 May 2024 13:51:03 +0200
In-Reply-To: <20240522205250.1578514-1-matthew.brost@intel.com>
References: <20240522205250.1578514-1-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-05-22 at 13:52 -0700, Matthew Brost wrote:
> Tightly coupling these seqno presents problems if alternative fences
> for
> jobs are used. Best to decouple these for correctness.
>=20
>=20
Nit: Imperative language.

> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <mathhew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 +++--
> =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 10 +++++-----
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 12 ++++++------
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 5 +++++
> =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
> =C2=A07 files changed, 27 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 395de93579fa..e4607f0e3456 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -98,7 +98,7 @@ static struct xe_exec_queue
> *__xe_exec_queue_alloc(struct xe_device *xe,
> =C2=A0
> =C2=A0	if (xe_exec_queue_is_parallel(q)) {
> =C2=A0		q->parallel.composite_fence_ctx =3D
> dma_fence_context_alloc(1);
> -		q->parallel.composite_fence_seqno =3D
> XE_FENCE_INITIAL_SEQNO;
> +		q->parallel.composite_fence_seqno =3D 0;
> =C2=A0	}
> =C2=A0
> =C2=A0	return q;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4efb88e3e056..0a6a9471f1ce 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -973,8 +973,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job
> *drm_job)
> =C2=A0		return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0	}
> =C2=A0
> -	drm_notice(&xe->drm, "Timedout job: seqno=3D%u, guc_id=3D%d,
> flags=3D0x%lx",
> -		=C2=A0=C2=A0 xe_sched_job_seqno(job), q->guc->id, q->flags);
> +	drm_notice(&xe->drm, "Timedout job: seqno=3D%u, lrc_seqno=3D%d,
> guc_id=3D%d, flags=3D0x%lx",
> +		=C2=A0=C2=A0 xe_sched_job_seqno(job),
> xe_sched_job_lrc_seqno(job),
> +		=C2=A0=C2=A0 q->guc->id, q->flags);
> =C2=A0	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> =C2=A0		=C2=A0=C2=A0 "Kernel-submitted job timed out\n");
> =C2=A0	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> !exec_queue_killed(q),
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a3ca718456f6..78bec455b714 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -398,7 +398,7 @@ static void emit_job_gen12_gsc(struct
> xe_sched_job *job)
> =C2=A0
> =C2=A0	__emit_job_gen12_simple(job, job->q->lrc,
> =C2=A0				job->batch_addr[0],
> -				xe_sched_job_seqno(job));
> +				xe_sched_job_lrc_seqno(job));
> =C2=A0}
> =C2=A0
> =C2=A0static void emit_job_gen12_copy(struct xe_sched_job *job)
> @@ -407,14 +407,14 @@ static void emit_job_gen12_copy(struct
> xe_sched_job *job)
> =C2=A0
> =C2=A0	if (xe_sched_job_is_migration(job->q)) {
> =C2=A0		emit_migration_job_gen12(job, job->q->lrc,
> -					 xe_sched_job_seqno(job));
> +				=09
> xe_sched_job_lrc_seqno(job));
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> =C2=A0		__emit_job_gen12_simple(job, job->q->lrc + i,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->batch_addr[i],
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_seqno(job));
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> xe_sched_job_lrc_seqno(job));
> =C2=A0}
> =C2=A0
> =C2=A0static void emit_job_gen12_video(struct xe_sched_job *job)
> @@ -425,7 +425,7 @@ static void emit_job_gen12_video(struct
> xe_sched_job *job)
> =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> =C2=A0		__emit_job_gen12_video(job, job->q->lrc + i,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->batch_addr[i],
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_seqno(job));
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_lrc_seqno(job));
> =C2=A0}
> =C2=A0
> =C2=A0static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> @@ -435,7 +435,7 @@ static void emit_job_gen12_render_compute(struct
> xe_sched_job *job)
> =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> =C2=A0		__emit_job_gen12_render_compute(job, job->q->lrc +
> i,
> =C2=A0						job->batch_addr[i],
> -
> 						xe_sched_job_seqno(job));
> +						xe_sched_job_lrc_seq
> no(job));
> =C2=A0}
> =C2=A0
> =C2=A0static const struct xe_ring_ops ring_ops_gen12_gsc =3D {
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index cd8a2fba5438..b7b1669d0bea 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -117,6 +117,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0			err =3D PTR_ERR(job->fence);
> =C2=A0			goto err_sched_job;
> =C2=A0		}
> +		job->lrc_seqno =3D job->fence->seqno;
> =C2=A0	} else {
> =C2=A0		struct dma_fence_array *cf;
> =C2=A0
> @@ -132,6 +133,8 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0				err =3D PTR_ERR(fences[j]);
> =C2=A0				goto err_fences;
> =C2=A0			}
> +			if (!j)
> +				job->lrc_seqno =3D fences[0]->seqno;
> =C2=A0		}
> =C2=A0
> =C2=A0		cf =3D dma_fence_array_create(q->width, fences,
> @@ -144,10 +147,6 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0			goto err_fences;
> =C2=A0		}
> =C2=A0
> -		/* Sanity check */
> -		for (j =3D 0; j < q->width; ++j)
> -			xe_assert(job_to_xe(job), cf->base.seqno =3D=3D
> fences[j]->seqno);
> -
> =C2=A0		job->fence =3D &cf->base;
> =C2=A0	}
> =C2=A0
> @@ -233,7 +232,7 @@ bool xe_sched_job_started(struct xe_sched_job
> *job)
> =C2=A0{
> =C2=A0	struct xe_lrc *lrc =3D job->q->lrc;
> =C2=A0
> -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 xe_lrc_start_seqno(lrc),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 job->fence->ops);
Fence ops must be the LRC ops here.

> =C2=A0}
> @@ -247,7 +246,8 @@ bool xe_sched_job_completed(struct xe_sched_job
> *job)
> =C2=A0	 * parallel handshake is done.
> =C2=A0	 */
> =C2=A0
> -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> xe_lrc_seqno(lrc),
> +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 xe_lrc_seqno(lrc),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 job->fence->ops);
Same here.

Otherwise LGTM.
/Thomas


> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
> b/drivers/gpu/drm/xe/xe_sched_job.h
> index c75018f4660d..002c3b5c0a5c 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -73,6 +73,11 @@ static inline u32 xe_sched_job_seqno(struct
> xe_sched_job *job)
> =C2=A0	return job->fence->seqno;
> =C2=A0}
> =C2=A0
> +static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> +{
> +	return job->lrc_seqno;
> +}
> +
> =C2=A0static inline void
> =C2=A0xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 5e12724219fd..990ddac55ed6 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -37,6 +37,8 @@ struct xe_sched_job {
> =C2=A0		/** @user_fence.value: write back value */
> =C2=A0		u64 value;
> =C2=A0	} user_fence;
> +	/** @lrc_seqno: LRC seqno */
> +	u32 lrc_seqno;
> =C2=A0	/** @migrate_flush_flags: Additional flush flags for
> migration jobs */
> =C2=A0	u32 migrate_flush_flags;
> =C2=A0	/** @ring_ops_flush_tlb: The ring ops need to flush TLB
> before payload. */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index f18ae1c63031..657e2f1f4c31 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -254,6 +254,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, seqno)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, lrc_seqno)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u16, guc_id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, guc_state)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, flags)
> @@ -264,6 +265,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> =C2=A0
> =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D xe_sched_job_seqno(job);
> +			=C2=A0=C2=A0 __entry->lrc_seqno =3D
> xe_sched_job_lrc_seqno(job);
> =C2=A0			=C2=A0=C2=A0 __entry->guc_id =3D job->q->guc->id;
> =C2=A0			=C2=A0=C2=A0 __entry->guc_state =3D
> =C2=A0			=C2=A0=C2=A0 atomic_read(&job->q->guc->state);
> @@ -273,8 +275,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> =C2=A0			=C2=A0=C2=A0 __entry->batch_addr =3D (u64)job-
> >batch_addr[0];
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0
> -		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p, seqno=3D%u, guc_id=3D%d,
> batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x, error=3D%d",
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->seqno,
> __entry->guc_id,
> +		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p, seqno=3D%u, lrc_seqno=3D%u,
> guc_id=3D%d, batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x,
> error=3D%d",
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->seqno,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->lrc_seqno, __entry->guc_id,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->batch_addr, __entry-
> >guc_state,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->flags, __entry->error)
> =C2=A0);

