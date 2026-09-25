Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C833C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 06:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40810F864;
	Fri, 25 Sep 2026 06:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RFTfcxyV";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C559810F864
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:38:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C133E6022E;
 Fri, 25 Sep 2026 06:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5830C1F000FF;
 Fri, 25 Sep 2026 06:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790318325;
 bh=DzaQnl3r5DBQJuwlFltB/rGMTEMF3GSYIkYjC+Egv1I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RFTfcxyVIUJHDJgovkMVt2nUV6MOEJKJdvBYkE6+w1M7pF5musGAyJoUxSCYHXTNA
 46oVREWs65Xdx7JfgbUTT64Tu0MesXkzDzjuOGixvgPrBbj0T7b3uw5Y96uFO3ZftA
 Rs6u1B00SPV5Do5fnrABOeYaUInKj5GWIbBFFD8Psvuohp3fr9TxtrQrH+mCSCIp5n
 1twknEaFtoxB6VLbyaVho6O8wmXyO0OT3fiebzYA23arFX3MoUJvGYcEDdHmN4IGXo
 +2nfDdKvYbHlKjHWblQ7sXfDQHlmW72rSCOCzCZQk/QTDTXyPY/g+nv+M6lM/J3Axf
 fqGydyw84rsYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/24] drm/xe: Add ULLS migration job support to ring
 ops
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-21-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:38:44 +0000
Message-Id: <20260925063845.5830C1F000FF@smtp.kernel.org>
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
- [High] drm/xe: GPU hang from CS prefetching uninitialized ULLS jobs
--

commit ca5d0374fab1065ae65164d64f6d5510acadd964
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to ring ops

Add preamble and postamble for ULLS migrations jobs. Preamble clears
current semaphore for reuse. Postamble waits on next semaphore which is
set upon next job submission, then advances the ring tail over that job
with an LRI to RING_TAIL, so submitting it costs the CPU nothing beyond
signalling the semaphore.

> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index 46ab1f0f35648..9f462bfecb831 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
[ ... ]
> +/* Publish the next job's tail, then park the engine on its semaphore */
> +static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32=
 *dw,
> +			       int i, u32 seqno, u32 head)
> +{
> +	i =3D emit_ulls_ring_tail(gt, lrc, dw, i, head);
> +
> +	dw[i++] =3D MI_SEMAPHORE_WAIT |
> +		MI_SEMW_GGTT |
> +		MI_SEMW_POLL |
> +		MI_SEMW_COMPARE(SAD_EQ_SDD);
> +	dw[i++] =3D LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;

[Severity: High]
Does updating the ring tail to the next job's boundary before blocking on
the semaphore open a window where the Command Streamer (CS) prefetcher can
fetch uninitialized memory into its instruction cache?

When the CPU later writes the next job and signals the semaphore, the
absence of an MMIO tail update means the CS cache might not be invalidated.
Could this cause the CS to execute stale data and hang the GPU?

[ ... ]
> +/* Pad out to the fixed ULLS job size */
> +static int emit_ulls_pad(struct xe_gt *gt, u32 *dw, int i)
> +{
> +	xe_gt_assert(gt, i <=3D ULLS_JOB_SIZE_DW);
> +
> +	while (i < ULLS_JOB_SIZE_DW)
> +		dw[i++] =3D MI_NOOP;
> +
> +	return i;
> +}

[Severity: High]
If a ULLS job reaches the maximum size of ULLS_JOB_SIZE_DW (which is 48),
this loop will provide 0 NOOPs of padding.

Will this fail to buffer the prefetcher from the next job's uninitialized
memory, exacerbating the prefetching issue mentioned above?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/=
xe_ring_ops_types.h
> index 52ff96bc41004..ea4af321dd7c4 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
[ ... ]
> +/*
> + * ULLS migration jobs advance the ring tail from within the ring itself=
, so a
> + * job has to know where its successor will end before that successor ha=
s been
> + * emitted. Every ULLS job is therefore padded to a fixed size, letting =
the
> + * next tail be derived arithmetically.
> + *
> + * Sized for the largest such job, emitted by emit_migration_job_gen12():
> + * preamble (4), copy timestamp (8, its size on an SRIOV VF), start seqno
> + * store (4), arbitration off (1), batch buffer starts (2 * 3), pre-pars=
er
> + * bracketed flush invalidate (6), seqno flush (4), user interrupt (3) a=
nd
> + * postamble (7 + 5).
> + */
> +#define ULLS_JOB_SIZE_DW 48
> +#define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)

[Severity: High]
Since this maximum size is exactly equal to the maximal job length, it
guarantees no NOOP padding is appended for the largest jobs.=20

Should this maximum size account for additional NOOPs to safely pad the
CS prefetch window?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D20
