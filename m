Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8FAC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 07:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE510E2E4;
	Mon,  3 Jun 2024 07:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvfAhRc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E181C10E2E4
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717400160; x=1748936160;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uv8qIPcvRO4NhtLZiJz4rdNtjLQAGkwW1l6O83HAqBo=;
 b=fvfAhRc2g7k6mEYpA+nafivcjwSG+kAlUrVUrpvA6Lg2BaUa690wEZFi
 H/JGaZpQY88wyZ9KuQOhGXDu3ZHVrakR4crC+ELGNUpJs719O+OgAFrDO
 4hycJDQMt2eKLoYWrr0OfVKsyg2DYX/i/VQXudpc7xB9IoILreoVDDXlt
 zL2JtZDZf1xNXdoZgFjB9S5eJ0eBtIL900OmwGY/ySE7ZsnzsFa57jSTm
 c4F1Q6xcMQfz4zjSbLgc22KScaZpD12szze7NTaGKbUJAPqqFpWhTFLG+
 OcjNeqDaU3y24ZJBXCsJ/jTRFs6DBjDfEMYe7b+KrZjvpqPYm8LX1vgFp Q==;
X-CSE-ConnectionGUID: 86f9xq/eQtWu5/EsO1pUmg==
X-CSE-MsgGUID: BukuNOfKRUmx34XDBN3yXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17672291"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="17672291"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:36:00 -0700
X-CSE-ConnectionGUID: IJm4BF/uTEqBcs7I/8Wtgw==
X-CSE-MsgGUID: 1N+hVTsMRB+dfY2vFs00lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="36903937"
Received: from unknown (HELO [10.245.245.174]) ([10.245.245.174])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:35:57 -0700
Message-ID: <93ca58d4cbbd37cd93ce82959a8da30efd91307a.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on
 all engines
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Mon, 03 Jun 2024 09:35:55 +0200
In-Reply-To: <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
 <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-05-30 at 20:45 +0000, Matthew Brost wrote:
> On Thu, May 30, 2024 at 01:17:32PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi, All.
> >=20
> > I was looking at this patch for drm-xe-fixes but it doesn't look
> > correct to me.
> >=20
> > First, AFAICT, the "emit flush imm ggtt" means that we're flushing
> > outstanding / posted writes, and then write a DW to a ggtt address,
> > so
> > we're not really "flushing gtt"
> >=20
>=20
> So, is this a bad name? I think I agree. It could have been a
> holdover
> from the i915 names. Maybe we should do a cleanup in xe_ring_ops
> soon?
>=20
> Or are you saying that the existing emit_flush_imm_ggtt is not
> sufficient to ensure all writes from batches are visible? If this
> were
> true, I would think we'd have all sorts of problems popping up.

It was more the title of the patch that says "flush gtt" when I think
it should say "flush writes" or something similar.


>=20
> > Second, I don't think we have anything left that explicitly flushes
> > the
> > posted write of the user-fence value?
> >=20
>=20
> I think this might be true. So there could be a case where we get an
> IRQ
> and the user fence value is not yet visible?=20

Yes, exactly.

>=20
> Not an expert ring programming but are instructions to store a dword
> which make these immediately visible? If so, I think that is what
> should
> be used.

There are various options here, using various variants of MI_FLUSH_DW
and pipe_control, and I'm not sure what would be the most performant
but I think the simplest solution would be to revert the patch and just
emit an additional MI_FLUSH_DW as a write barrier before emitting the
posted userptr value.

>=20
>=20
>=20
> We should also probably check how downstream i915 did this too.
>=20
> > and finally the seqno fence now gets flushed before the user-fence.
> > Perhaps that's not a bad thing, though.
> >=20
>=20
> I don't think this is an issue, I can't think of a case where this
> reordering would create a problem.
>=20
> Matt

/Thomas

> =C2=A0
> > /Thomas
> >=20
> >=20
> > On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
> > > Tests show that user fence signalling requires kind of write
> > > barrier,
> > > otherwise not all writes performed by the workload will be
> > > available
> > > to userspace. It is already done for render and compute, we need
> > > it
> > > also for the rest: video, gsc, copy.
> > >=20
> > > v2: added gsc and copy engines, added fixes and r-b tags
> > >=20
> > > Closes:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > Intel
> > > GPUs")
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > Changes in v2:
> > > - Added fixes and r-b tags
> > > - Link to v1:
> > > https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-de=
d38b56c8c9@intel.com
> > > ---
> > > Matthew,
> > >=20
> > > I have extended patch to copy and gsc engines. I have kept your
> > > r-b,
> > > since the change is similar, I hope it is OK.
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
> > > =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index a3ca718456f6..a46a1257a24f 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct
> > > xe_sched_job *job, struct xe_lrc *lrc
> > > =C2=A0
> > > =C2=A0	i =3D emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > =C2=A0
> > > +	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > seqno,
> > > false, dw, i);
> > > +
> > > =C2=A0	if (job->user_fence.used)
> > > =C2=A0		i =3D emit_store_imm_ppgtt_posted(job-
> > > > user_fence.addr,
> > > =C2=A0						job-
> > > > user_fence.value,
> > > =C2=A0						dw, i);
> > > =C2=A0
> > > -	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > seqno,
> > > false, dw, i);
> > > -
> > > =C2=A0	i =3D emit_user_interrupt(dw, i);
> > > =C2=A0
> > > =C2=A0	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> > > @@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct
> > > xe_sched_job *job, struct xe_lrc *lrc,
> > > =C2=A0
> > > =C2=A0	i =3D emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > =C2=A0
> > > +	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > seqno,
> > > false, dw, i);
> > > +
> > > =C2=A0	if (job->user_fence.used)
> > > =C2=A0		i =3D emit_store_imm_ppgtt_posted(job-
> > > > user_fence.addr,
> > > =C2=A0						job-
> > > > user_fence.value,
> > > =C2=A0						dw, i);
> > > =C2=A0
> > > -	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > seqno,
> > > false, dw, i);
> > > -
> > > =C2=A0	i =3D emit_user_interrupt(dw, i);
> > > =C2=A0
> > > =C2=A0	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> > >=20
> > > ---
> > > base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> > > change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
> > >=20
> > > Best regards,
> >=20

