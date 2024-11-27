Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B7FD609A7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F36210EA16;
	Wed, 27 Nov 2024 08:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OsnBgSAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3383710EA16
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732695131; x=1764231131;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ne6s2FKAv2gBhs77vNpjx0sUcW6LP7fVwl75h5A96HM=;
 b=OsnBgSAUDJlk6HvdneNrTn6Hec3NoNFRFO8tcwMPtr2iLtChamkuHQ2p
 9g6Mv7xFwMtUT+BR4ocqtxqnxAIyDSv59CkRs0260X8YN9ZlmHiO9pWK9
 HSdfG2tuGl46URvNxJD2QfAQGiIHdUWAL5hgFMNUtbyatroAZAEmhbpAH
 0kzmE+66wrYdBoIbcfe0s5bd5NT+G/zeNkES5z8zYJ4Gfj3VBbbO+RJLn
 mUtujDx/dnWOFuVCNmSnovjsDfcfjYypmTZ4KwoXJRqhJG2ioqXvIEDX6
 hjgswpaYPxWIBo+60XgUQoKfc39o2lqgjrzPTZyNYcpC83fGDvAPMTe39 w==;
X-CSE-ConnectionGUID: 77XDvZtbRauV7s+c9NkqLQ==
X-CSE-MsgGUID: wXejklPrQs6zEur5jO/6og==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33016814"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="33016814"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:12:11 -0800
X-CSE-ConnectionGUID: hbCdx2crRmOhA2/etCFD7g==
X-CSE-MsgGUID: mc/HTTKxStOuCGMsS90tag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="122698070"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.103])
 ([10.245.246.103])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:12:10 -0800
Message-ID: <52025af2fada1db3841cf0231e02d9e5d8542285.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] Revert "drm/xe: Move the coredump registration to
 the worker thread"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 27 Nov 2024 09:12:05 +0100
In-Reply-To: <20241127083042.358726-3-himal.prasad.ghimiray@intel.com>
References: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
 <20241127083042.358726-3-himal.prasad.ghimiray@intel.com>
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
> This reverts commit e7c5f5ac82a9a763207eb30b194500fad48fbc88. The
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
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump.c | 63 +++++++++++++-------------=
-
> --
> =C2=A01 file changed, 29 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5d19a4e3d5af..f4c77f525819 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -167,6 +167,31 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
> =C2=A0	ss->vm =3D NULL;
> =C2=A0}
> =C2=A0
> +static void xe_devcoredump_deferred_snap_work(struct work_struct
> *work)
> +{
> +	struct xe_devcoredump_snapshot *ss =3D container_of(work,
> typeof(*ss), work);
> +	struct xe_devcoredump *coredump =3D container_of(ss,
> typeof(*coredump), snapshot);
> +	unsigned int fw_ref;
> +
> +	/* keep going if fw fails as we still want to save the
> memory and SW data */
> +	fw_ref =3D xe_force_wake_get(gt_to_fw(ss->gt),
> XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for
> coredump capture\n");
> +	xe_vm_snapshot_capture_delayed(ss->vm);
> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> +	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> +
> +	/* Calculate devcoredump size */
> +	ss->read.size =3D __xe_devcoredump_read(NULL, INT_MAX,
> coredump);
> +
> +	ss->read.buffer =3D kvmalloc(ss->read.size, GFP_USER);
> +	if (!ss->read.buffer)
> +		return;
> +
> +	__xe_devcoredump_read(ss->read.buffer, ss->read.size,
> coredump);
> +	xe_devcoredump_snapshot_free(ss);
> +}
> +
> =C2=A0static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> =C2=A0				=C2=A0=C2=A0 size_t count, void *data, size_t
> datalen)
> =C2=A0{
> @@ -215,40 +240,6 @@ static void xe_devcoredump_free(void *data)
> =C2=A0		 "Xe device coredump has been deleted.\n");
> =C2=A0}
> =C2=A0
> -static void xe_devcoredump_deferred_snap_work(struct work_struct
> *work)
> -{
> -	struct xe_devcoredump_snapshot *ss =3D container_of(work,
> typeof(*ss), work);
> -	struct xe_devcoredump *coredump =3D container_of(ss,
> typeof(*coredump), snapshot);
> -	unsigned int fw_ref;
> -
> -	/*
> -	 * NB: Despite passing a GFP_ flags parameter here, more
> allocations are done
> -	 * internally using GFP_KERNEL expliictly. Hence this call
> must be in the worker
> -	 * thread and not in the initial capture call.
> -	 */
> -	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev,
> THIS_MODULE, coredump, 0, GFP_KERNEL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_devcoredump_read,
> xe_devcoredump_free,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_COREDUMP_TIMEOUT_JIFFIES);
> -
> -	/* keep going if fw fails as we still want to save the
> memory and SW data */
> -	fw_ref =3D xe_force_wake_get(gt_to_fw(ss->gt),
> XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		xe_gt_info(ss->gt, "failed to get forcewake for
> coredump capture\n");
> -	xe_vm_snapshot_capture_delayed(ss->vm);
> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> -	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> -
> -	/* Calculate devcoredump size */
> -	ss->read.size =3D __xe_devcoredump_read(NULL, INT_MAX,
> coredump);
> -
> -	ss->read.buffer =3D kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> -
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size,
> coredump);
> -	xe_devcoredump_snapshot_free(ss);
> -}
> -
> =C2=A0static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> =C2=A0				 struct xe_exec_queue *q,
> =C2=A0				 struct xe_sched_job *job)
> @@ -337,6 +328,10 @@ void xe_devcoredump(struct xe_exec_queue *q,
> struct xe_sched_job *job, const cha
> =C2=A0	drm_info(&xe->drm, "Xe device coredump has been created\n");
> =C2=A0	drm_info(&xe->drm, "Check your
> /sys/class/drm/card%d/device/devcoredump/data\n",
> =C2=A0		 xe->drm.primary->index);
> +
> +	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0,
> GFP_KERNEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_devcoredump_read,
> xe_devcoredump_free,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_COREDUMP_TIMEOUT_JIFFIES);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_driver_devcoredump_fini(void *arg)

