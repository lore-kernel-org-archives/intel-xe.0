Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003D8C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 08:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B873110E877;
	Fri, 18 Sep 2026 08:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CMec46Eg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB6210E877
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 08:32:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B78F40861;
 Fri, 18 Sep 2026 08:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06891F000FF;
 Fri, 18 Sep 2026 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789720362;
 bh=J5PKMpUuWA4llqytcWTroUfuwX2jjzi7hCwk9WvOB5M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CMec46EgzW03p88nwMcmcNOZfcWpWD69igLsIVKD7HVKQC0P3F0ewQxKX64I+b8r8
 BUz9DpzQOq90XR9uElufOfqwPlGyGyAxeN/m2Wu8LoqmeWRAxtrp1+dO7J8BaAipeX
 SxbwEB7zHsz4BFadHpKNRiXvBqOQwCP2+17HesDWypSv7Dix0gU9tkZECewXZ7p/Bm
 JVunjr0AQ//rdkR+tkHJpilwMy2Iz9ktmz/+8nAEzApzEsgL30fFA1W9o6VTHRS/Qs
 iYP5D1ynRqZV89KAnHgktIDNo+9VeEeUZvJPBBFEY25/es9QGG6H9KLZ1OKnibsPCv
 jg7Dm/uqq+tjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Set job credits based on LRC size
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260918081609.518988-3-dev@lankhorst.se>
References: <20260918081609.518988-1-dev@lankhorst.se>
 <20260918081609.518988-3-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 08:32:41 +0000
Message-Id: <20260918083241.F06891F000FF@smtp.kernel.org>
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
- [High] drm/xe: scheduler credits under-account 8-byte padded ring writes
- [High] drm/xe: setting credit limit to ring capacity causes full/empty al=
iasing hang
--

commit 1784ce8c172d03c0fac8aec6a5070336e0615926
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe: Set job credits based on LRC size

This commit changes the scheduler credit limit in the xe driver to be based
on xe_lrc_ring_size() and sets the job credits to the actual job size. This
allows filling the entire LRC without throttling.

> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index a36db39dcda8a..94d4d982f79b3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -329,7 +329,7 @@ static int execlist_exec_queue_init(struct xe_exec_qu=
eue *q)
>  	const struct drm_sched_init_args args =3D {
>  		.ops =3D &drm_sched_ops,
>  		.num_rqs =3D 1,
> -		.credit_limit =3D xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
> +		.credit_limit =3D xe_lrc_ring_size(),

[Severity: High]
Does setting the credit limit to exactly xe_lrc_ring_size() cause a
full/empty aliasing hang?

When a user submits a series of jobs whose total size perfectly hits the
xe_lrc_ring_size() limit, the scheduler permits all these jobs to be queued.
The tail pointer advances by the full ring capacity and wraps around to
precisely equal the head pointer.

Since a condition of tail =3D=3D head indicates an empty ring, the hardware
stops fetching commands, permanently hanging the queue and triggering a TDR
reset. Should the limit be strictly less than the capacity (e.g.,
xe_lrc_ring_size() - 8) to prevent this?

>  		.hang_limit =3D XE_SCHED_HANG_LIMIT,
>  		.timeout =3D XE_SCHED_JOB_TIMEOUT,
>  		.name =3D q->hwe->name,

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index f3ba8abfc228e..98fbc72af9f3d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2089,7 +2089,7 @@ static int guc_exec_queue_init(struct xe_exec_queue=
 *q)
>  	}
> =20
>  	err =3D xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, xe_lrc_ring_size(), 64,

[Severity: High]
Does configuring the GuC submit scheduler's credit limit exactly to the
ring size expose GuC submissions to the same full/empty aliasing hang as in
xe_execlist.c?

>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    ge->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)

> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sc=
hed_job.c
> index 57ed6734d31d5..be99d9cd16ad3 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c

[ ... ]

> @@ -295,8 +295,10 @@ void xe_sched_job_push(struct xe_sched_job *job)
>  	xe_sched_job_get(job);
>  	trace_xe_sched_job_exec(job);
> =20
> -	if (!job->restore_replay)
> +	if (!job->restore_replay) {
>  		job->q->ring_ops->prepare_job(job);
> +		job->drm.credits =3D job->ptrs[0].job_size;

[Severity: High]
Can assigning the unaligned job_size to the scheduler credits lead to a
buffer overflow of the hardware ring buffer?

If a user submits multiple jobs whose sizes are not perfectly 8-byte
aligned, the scheduler deducts the unaligned job_size (e.g., 68 bytes) from
its credit limit. However, xe_lrc_write_ring() aligns each job write to 8
bytes by padding with MI_NOOP (e.g., writing 72 bytes):

drivers/gpu/drm/xe/xe_lrc.c:xe_lrc_write_ring() {
	...
	aligned_size =3D ALIGN(size, 8);
	...
	if (aligned_size > size) {
		u32 noop =3D MI_NOOP;

		__xe_lrc_write_ring(lrc, ring, &noop, sizeof(noop));
	}
	...
}

Because credit_limit is increased to the absolute maximum
xe_lrc_ring_size(), the accumulation of unaccounted padding bytes allows
the total written bytes to physically exceed the ring's size while the
scheduler believes there is still space.

The tail pointer could then overtake the head pointer, overwriting active
commands.

> +	}
> =20
>  	drm_sched_entity_push_job(&job->drm);
>  	xe_sched_job_put(job);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918081609.5189=
88-1-dev@lankhorst.se?part=3D2
