Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052CAC25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 12:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C12F10F288;
	Fri, 24 May 2024 12:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZ5RaZdG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393010F288
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 12:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716555433; x=1748091433;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4J8nUR7mNNPYcU58W0J1hO/P2x2qn9bP+fBQ5i+D0kA=;
 b=cZ5RaZdGQR+92fbCtoDW8pnfbt8S2tHAyVEiDfrhy1eynd7vz2IxOwYs
 RKY2ZlzlcTTiK72OB4mWyPdRUydjF7uB/k5FZmNjXKi/Oa+AugeXfKaSS
 /D7LnTJRDMkMJdX3aRaqJxlJRcF75F+aItQD2ceepdawOZY0BiLjViOw3
 9jOwDTuu8FFmyIq1Z9+iKqXNk879W/hbqtvarOHiu63uu2F8dBKeT2Cn4
 UjQ2l+xISmdMfd7ObWFTOZBySjj0Z+ckvGOIY5nvU7vC1r1wfsMkkSFQx
 iTqGbEUJELTRZvGTpzOQczwkXmcIMohzwH/jtS4bmKX5xBlh39xXBuuW/ Q==;
X-CSE-ConnectionGUID: F5aisZ6tS/ujui9ckHoyBw==
X-CSE-MsgGUID: wY5SQYWGTNOzEY3ivj9h5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16765619"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="16765619"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 05:56:57 -0700
X-CSE-ConnectionGUID: YglFn12jQf6szJtnl+woTg==
X-CSE-MsgGUID: 3ojDZht5TLCu/Dz25ACOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="57258773"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 05:56:54 -0700
Message-ID: <dee8dc60b0fc6954d38801b4fc1ef215a0ba933b.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/5] drm/xe: Decouple job seqno and lrc seqno
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 24 May 2024 14:56:51 +0200
In-Reply-To: <ZlCHal90bzN_jp55@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-2-thomas.hellstrom@linux.intel.com>
 <ZlCHal90bzN_jp55@intel.com>
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

Hi, Rodrigo,

Thanks for reviewing,

On Fri, 2024-05-24 at 08:26 -0400, Rodrigo Vivi wrote:
> On Fri, May 24, 2024 at 09:19:36AM +0200, Thomas Hellstr=C3=B6m wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> >=20
> > Tightly coupling these seqno presents problems if alternative
> > fences for
> > jobs are used. Decouple these for correctness.
> >=20
> > v2:
> > - Slightly reword commit message (Thomas)
> > - Make sure the lrc fence ops are used in comparison (Thomas)
> > - Assume seqno is unsigned rather than signed in format string
> > (Thomas)
> >=20
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 5 +++--
> > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 ++++++------
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 16 ++++++++--------
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +++++
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h |=C2=A0 2 ++
> > =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
> > =C2=A07 files changed, 30 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 0fd61fb4d104..e8bf250f5b6a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -98,7 +98,7 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> > =C2=A0
> > =C2=A0	if (xe_exec_queue_is_parallel(q)) {
> > =C2=A0		q->parallel.composite_fence_ctx =3D
> > dma_fence_context_alloc(1);
> > -		q->parallel.composite_fence_seqno =3D
> > XE_FENCE_INITIAL_SEQNO;
> > +		q->parallel.composite_fence_seqno =3D 0;
>=20
> Why do you change this case to 0 instead of the -127?
> Shouldn't it be a separate patch since it is not directly the new
> lrc_seqno
> that this patch is introducing?=20

This change was done by Matthew, but I think the intention was to
explicitly separate the composite fence seqno and the lrc fence seqno
to ensure they are different and we'd see any remaining fallouts
because of that.


>=20
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	return q;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 54778189cfd5..53ab98c5ef5e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -940,8 +940,9 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> > =C2=A0		return DRM_GPU_SCHED_STAT_NOMINAL;
> > =C2=A0	}
> > =C2=A0
> > -	drm_notice(&xe->drm, "Timedout job: seqno=3D%u, guc_id=3D%d,
> > flags=3D0x%lx",
> > -		=C2=A0=C2=A0 xe_sched_job_seqno(job), q->guc->id, q->flags);
> > +	drm_notice(&xe->drm, "Timedout job: seqno=3D%u,
> > lrc_seqno=3D%u, guc_id=3D%d, flags=3D0x%lx",
> > +		=C2=A0=C2=A0 xe_sched_job_seqno(job),
> > xe_sched_job_lrc_seqno(job),
> > +		=C2=A0=C2=A0 q->guc->id, q->flags);
> > =C2=A0	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > =C2=A0		=C2=A0=C2=A0 "Kernel-submitted job timed out\n");
> > =C2=A0	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> > !exec_queue_killed(q),
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index a3ca718456f6..2705d1f9d572 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -398,7 +398,7 @@ static void emit_job_gen12_gsc(struct
> > xe_sched_job *job)
> > =C2=A0
> > =C2=A0	__emit_job_gen12_simple(job, job->q->lrc,
> > =C2=A0				job->batch_addr[0],
> > -				xe_sched_job_seqno(job));
> > +				xe_sched_job_lrc_seqno(job));
>=20
> Looking at this I got a bit confused now.
> If you are emitting the job, why you are using the lrc seqno and not
> the job seqno?
> I mean, the other seqno that remains looks like a fence_seqno and not
> a job_seqno,
> right? In this case wouldn't it be better if we could rename the
> other one to make
> it more clear the split so the next developer changes the seqnos
> don't get confused
> in which to use when/where?

You mean like xe_sched_job_seqno() and xe_sched_composite_seqno()?
I'll let Matt comment on that, but it's only parallel jobs that have
composite seqnos.

>=20
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void emit_job_gen12_copy(struct xe_sched_job *job)
> > @@ -407,14 +407,14 @@ static void emit_job_gen12_copy(struct
> > xe_sched_job *job)
> > =C2=A0
> > =C2=A0	if (xe_sched_job_is_migration(job->q)) {
> > =C2=A0		emit_migration_job_gen12(job, job->q->lrc,
> > -					 xe_sched_job_seqno(job));
> > +				=09
> > xe_sched_job_lrc_seqno(job));
> > =C2=A0		return;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> > =C2=A0		__emit_job_gen12_simple(job, job->q->lrc + i,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->batch_addr[i],
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_seqno(job)=
);
> > +					job->batch_addr[i],
> > +					xe_sched_job_lrc_seqno(job
> > ));
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void emit_job_gen12_video(struct xe_sched_job *job)
> > @@ -425,7 +425,7 @@ static void emit_job_gen12_video(struct
> > xe_sched_job *job)
> > =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> > =C2=A0		__emit_job_gen12_video(job, job->q->lrc + i,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->batch_addr[i],
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_seqno(job));
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > xe_sched_job_lrc_seqno(job));
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void emit_job_gen12_render_compute(struct xe_sched_job
> > *job)
> > @@ -435,7 +435,7 @@ static void
> > emit_job_gen12_render_compute(struct xe_sched_job *job)
> > =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> > =C2=A0		__emit_job_gen12_render_compute(job, job->q->lrc +
> > i,
> > =C2=A0						job-
> > >batch_addr[i],
> > -
> > 						xe_sched_job_seqno(job));
> > +						xe_sched_job_lrc_s
> > eqno(job));
> > =C2=A0}
> > =C2=A0
> > =C2=A0static const struct xe_ring_ops ring_ops_gen12_gsc =3D {
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > b/drivers/gpu/drm/xe/xe_sched_job.c
> > index a4e030f5e019..874450be327e 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -117,6 +117,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> > =C2=A0			err =3D PTR_ERR(job->fence);
> > =C2=A0			goto err_sched_job;
> > =C2=A0		}
> > +		job->lrc_seqno =3D job->fence->seqno;
> > =C2=A0	} else {
> > =C2=A0		struct dma_fence_array *cf;
> > =C2=A0
> > @@ -132,6 +133,8 @@ struct xe_sched_job *xe_sched_job_create(struct
> > xe_exec_queue *q,
> > =C2=A0				err =3D PTR_ERR(fences[j]);
> > =C2=A0				goto err_fences;
> > =C2=A0			}
> > +			if (!j)
> > +				job->lrc_seqno =3D fences[0]->seqno;
>=20
> why the lrc_seqno is =3D the first fence seqno?

In a parallell job, all LRC fences have the same seqno so we can
grab any.

>=20
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		cf =3D dma_fence_array_create(q->width, fences,
> > @@ -144,10 +147,6 @@ struct xe_sched_job
> > *xe_sched_job_create(struct xe_exec_queue *q,
> > =C2=A0			goto err_fences;
> > =C2=A0		}
> > =C2=A0
> > -		/* Sanity check */
> > -		for (j =3D 0; j < q->width; ++j)
> > -			xe_assert(job_to_xe(job), cf->base.seqno
> > =3D=3D fences[j]->seqno);
> > -
> > =C2=A0		job->fence =3D &cf->base;
> > =C2=A0	}
> > =C2=A0
> > @@ -229,9 +228,9 @@ bool xe_sched_job_started(struct xe_sched_job
> > *job)
> > =C2=A0{
> > =C2=A0	struct xe_lrc *lrc =3D job->q->lrc;
> > =C2=A0
> > -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> > +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 xe_lrc_start_seqno(lrc),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 job->fence->ops);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_array_first(job-
> > >fence)->ops);
> > =C2=A0}
> > =C2=A0
> > =C2=A0bool xe_sched_job_completed(struct xe_sched_job *job)
> > @@ -243,8 +242,9 @@ bool xe_sched_job_completed(struct xe_sched_job
> > *job)
> > =C2=A0	 * parallel handshake is done.
> > =C2=A0	 */
> > =C2=A0
> > -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> > xe_lrc_seqno(lrc),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 job->fence->ops);
> > +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 xe_lrc_seqno(lrc),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_array_first(job-
> > >fence)->ops);
>=20
> the s/job->fence->ops/dma_fence_array_first(job->fence)->ops
> looks like a good canditate for a separate patch, no?!

Since we're now explicitly using the LRC seqno for comparison here, we
need to also get at the lrc fence ops, which is the ops of one of the
contained fences. (If (job->fence) is not a dma_fence_array, the
function just returns (job->fence)).

So in all, since we change the first argument to __dma_fence_is_later,
it makes sense to also change the third to align.

Thanks,
Thomas



>=20
> > =C2=A0}
> > =C2=A0
> > =C2=A0void xe_sched_job_arm(struct xe_sched_job *job)
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
> > b/drivers/gpu/drm/xe/xe_sched_job.h
> > index c75018f4660d..002c3b5c0a5c 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > @@ -73,6 +73,11 @@ static inline u32 xe_sched_job_seqno(struct
> > xe_sched_job *job)
> > =C2=A0	return job->fence->seqno;
> > =C2=A0}
> > =C2=A0
> > +static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> > +{
> > +	return job->lrc_seqno;
> > +}
> > +
> > =C2=A0static inline void
> > =C2=A0xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32
> > flags)
> > =C2=A0{
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 5e12724219fd..990ddac55ed6 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -37,6 +37,8 @@ struct xe_sched_job {
> > =C2=A0		/** @user_fence.value: write back value */
> > =C2=A0		u64 value;
> > =C2=A0	} user_fence;
> > +	/** @lrc_seqno: LRC seqno */
> > +	u32 lrc_seqno;
> > =C2=A0	/** @migrate_flush_flags: Additional flush flags for
> > migration jobs */
> > =C2=A0	u32 migrate_flush_flags;
> > =C2=A0	/** @ring_ops_flush_tlb: The ring ops need to flush TLB
> > before payload. */
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > index 2d56cfc09e42..6c6cecc58f63 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -254,6 +254,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > =C2=A0
> > =C2=A0		=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, seqno)
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, lrc_seqno)
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u16, guc_id)
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, guc_state)
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, flags)
> > @@ -264,6 +265,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > =C2=A0
> > =C2=A0		=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D
> > xe_sched_job_seqno(job);
> > +			=C2=A0=C2=A0 __entry->lrc_seqno =3D
> > xe_sched_job_lrc_seqno(job);
> > =C2=A0			=C2=A0=C2=A0 __entry->guc_id =3D job->q->guc->id;
> > =C2=A0			=C2=A0=C2=A0 __entry->guc_state =3D
> > =C2=A0			=C2=A0=C2=A0 atomic_read(&job->q->guc->state);
> > @@ -273,8 +275,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > =C2=A0			=C2=A0=C2=A0 __entry->batch_addr =3D (u64)job-
> > >batch_addr[0];
> > =C2=A0			=C2=A0=C2=A0 ),
> > =C2=A0
> > -		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p, seqno=3D%u, guc_id=3D%d,
> > batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x, error=3D%d",
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->seqno,
> > __entry->guc_id,
> > +		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p, seqno=3D%u, lrc_seqno=3D%u=
,
> > guc_id=3D%d, batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x,
> > error=3D%d",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->seqno,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->lrc_seqno, __entry->guc_id,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->batch_addr, __entry-
> > >guc_state,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->flags, __entry->error)
> > =C2=A0);
> > --=20
> > 2.44.0
> >=20

