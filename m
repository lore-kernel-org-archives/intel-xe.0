Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB2FC48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 09:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D797A10EFD3;
	Mon, 26 Feb 2024 09:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IreLQKZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE3310EFD3
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708939567; x=1740475567;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mi31C/elQ0y+gKyNDyFXUpHsIDc0N5kq2KCWw0IC6jI=;
 b=IreLQKZrNHRKNbgHXoXDnj2zEa60Q/O1Tm6xAuP/W6vwTm/BUInyTp3I
 gxKwBM9bjvGA49XPN7ImzfbBDeAXkIunABEyo6uBD5PS0oIhuzjLWSfmm
 BceWSMfb2hlpefeoqgFnhhxDJpToN+ylAfFHTNJ66q4arQIiHFoHxItUv
 Lp2LX74CWLEjHAUI5oq5GuBlVsAdEzRN65wrBOcwZp9yx2wRMH7WcIfqK
 cd3vHs4beFTBmNuJ4L5VgGflJBN1m2DE7+ut5+6OYaO1/nTx04Qkv5FgA
 1fNBr9bexHdJPGvlYYnufKw0q35gtsFMPjGMqLLs8CTY1TErHa4wGV4iU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20663282"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="20663282"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:26:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="37614404"
Received: from hekner-mobl1.ger.corp.intel.com (HELO [10.249.254.134])
 ([10.249.254.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:26:05 -0800
Message-ID: <07060f9c57583d71193b3e18d029ee8d6abffc6c.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/guc: Handle timing out of signaled jobs gracefully
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Date: Mon, 26 Feb 2024 10:26:02 +0100
In-Reply-To: <20240223204659.40750-1-matthew.brost@intel.com>
References: <20240223204659.40750-1-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

Hi,

On Fri, 2024-02-23 at 12:46 -0800, Matthew Brost wrote:
> Timing out of signaled jobs can happen during regular operations
> (e.g.
> an exec queue closed immediately after last fence signaled). The TDR
> can
> pass the worker which free jobs. Rather than running through the TDR
> if
> signaled job is found, simply free it without any debug messages.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reported-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1271
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c | 32 ++++++++++++++++++---------=
-
> --
> =C2=A01 file changed, 19 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ff77bc8da1b2..29748e40555f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -929,20 +929,26 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> =C2=A0	int err =3D -ETIME;
> =C2=A0	int i =3D 0;
> =C2=A0
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> >flags)) {
> -		drm_notice(&xe->drm, "Timedout job: seqno=3D%u,
> guc_id=3D%d, flags=3D0x%lx",
> -			=C2=A0=C2=A0 xe_sched_job_seqno(job), q->guc->id, q-
> >flags);
> -		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -			=C2=A0=C2=A0 "Kernel-submitted job timed out\n");
> -		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> !exec_queue_killed(q),
> -			=C2=A0=C2=A0 "VM job timed out on non-killed
> execqueue\n");
> -
> -		simple_error_capture(q);
> -		xe_devcoredump(job);
> -	} else {
> -		drm_dbg(&xe->drm, "Timedout signaled job: seqno=3D%u,
> guc_id=3D%d, flags=3D0x%lx",
> -			 xe_sched_job_seqno(job), q->guc->id, q-
> >flags);
> +	/*
> +	 * TDR has fired before free job worker. Common if exec
> queue
> +	 * immediately closed after last fence signaled.
> +	 */
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> >flags)) {
Perhaps use dma_fence_is_signaled() to double-check?

Either way=20
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> +		guc_exec_queue_free_job(drm_job);
> +
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0	}
> +
> +	drm_notice(&xe->drm, "Timedout job: seqno=3D%u, guc_id=3D%d,
> flags=3D0x%lx",
> +		=C2=A0=C2=A0 xe_sched_job_seqno(job), q->guc->id, q->flags);
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +		=C2=A0=C2=A0 "Kernel-submitted job timed out\n");
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> !exec_queue_killed(q),
> +		=C2=A0=C2=A0 "VM job timed out on non-killed execqueue\n");
> +
> +	simple_error_capture(q);
> +	xe_devcoredump(job);
> +
> =C2=A0	trace_xe_sched_job_timedout(job);
> =C2=A0
> =C2=A0	/* Kill the run_job entry point */

