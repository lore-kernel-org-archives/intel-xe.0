Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F2EC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 11:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F44889F4F;
	Thu, 30 May 2024 11:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brm/YHNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCB011AC8E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717067857; x=1748603857;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dvNDUqGzjHzC/hfSjc7fXobPvTeXCd7KhzBonhx1N88=;
 b=brm/YHNMFK48TmSqDkdCfcAMdIwShMoZMuvxLwJeLpOlDfBH4tU+iZIZ
 i/ulFIH2QfgxM/txre/nwS0Q4bgnDZ1swuU2xi6xJ8kLDZ9G8obPCwFVW
 wXWkx9YiB/qTMl64jhJu5JuSLRSq8peeSHQ38KutgBb8m33ccV7Vd37OK
 wgEKtShz7Kj7F2ifjB7NPvUz0GU1zJZl1XWfqZPBgbNg7oj4FObo77/R1
 88T3Z6v20TDUkhuehbBxzJ9rTmc0xgYXJqeP6uZA18MtEGjbJwuKaNts8
 4kryoLLtKetDpazlUh8YPqgto5zr5XdSA3BAOfeUmc30oaBqH3n+4A+zw Q==;
X-CSE-ConnectionGUID: F7uiSZgAS6C0QaCBUDB4iw==
X-CSE-MsgGUID: d17FYDlzT1+NoG1p27LB2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24154690"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24154690"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 04:17:36 -0700
X-CSE-ConnectionGUID: 0+nWM3QnTqCPLNuSM50fIA==
X-CSE-MsgGUID: y8U+yM6wTTeGa0zFxtTMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35774575"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.63])
 ([10.245.245.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 04:17:34 -0700
Message-ID: <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on
 all engines
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Date: Thu, 30 May 2024 13:17:32 +0200
In-Reply-To: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
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

Hi, All.

I was looking at this patch for drm-xe-fixes but it doesn't look
correct to me.

First, AFAICT, the "emit flush imm ggtt" means that we're flushing
outstanding / posted writes, and then write a DW to a ggtt address, so
we're not really "flushing gtt"

Second, I don't think we have anything left that explicitly flushes the
posted write of the user-fence value?

and finally the seqno fence now gets flushed before the user-fence.
Perhaps that's not a bad thing, though.

/Thomas


On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
> Tests show that user fence signalling requires kind of write barrier,
> otherwise not all writes performed by the workload will be available
> to userspace. It is already done for render and compute, we need it
> also for the rest: video, gsc, copy.
>=20
> v2: added gsc and copy engines, added fixes and r-b tags
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
> Changes in v2:
> - Added fixes and r-b tags
> - Link to v1:
> https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b=
56c8c9@intel.com
> ---
> Matthew,
>=20
> I have extended patch to copy and gsc engines. I have kept your r-b,
> since the change is similar, I hope it is OK.
> ---
> =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a3ca718456f6..a46a1257a24f 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct
> xe_sched_job *job, struct xe_lrc *lrc
> =C2=A0
> =C2=A0	i =3D emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> =C2=A0
> +	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> false, dw, i);
> +
> =C2=A0	if (job->user_fence.used)
> =C2=A0		i =3D emit_store_imm_ppgtt_posted(job-
> >user_fence.addr,
> =C2=A0						job-
> >user_fence.value,
> =C2=A0						dw, i);
> =C2=A0
> -	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> false, dw, i);
> -
> =C2=A0	i =3D emit_user_interrupt(dw, i);
> =C2=A0
> =C2=A0	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> @@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct
> xe_sched_job *job, struct xe_lrc *lrc,
> =C2=A0
> =C2=A0	i =3D emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> =C2=A0
> +	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> false, dw, i);
> +
> =C2=A0	if (job->user_fence.used)
> =C2=A0		i =3D emit_store_imm_ppgtt_posted(job-
> >user_fence.addr,
> =C2=A0						job-
> >user_fence.value,
> =C2=A0						dw, i);
> =C2=A0
> -	i =3D emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> false, dw, i);
> -
> =C2=A0	i =3D emit_user_interrupt(dw, i);
> =C2=A0
> =C2=A0	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
>=20
> ---
> base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
>=20
> Best regards,

