Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C643D609AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16B410EA16;
	Wed, 27 Nov 2024 08:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKp4K0n/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5B810EA16
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732695095; x=1764231095;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tS0Oppk1j/IkbGuWa22I0WX2CKYDTji/6zLhGtiyNDs=;
 b=cKp4K0n/f90FCE5xJsN/t/KSobPfx2zJQBFfDgk6Qhbx6dPJO19loMWP
 w0LIooa8ynKN8Ms6c7ZMMPZoB5lcxQ9lc8N0RbQJa96CB1XQjStWqSb9v
 0EBMuZiY/WdXGLpbDducC4QDztivk1vJ2thzUIO+OCoi98H19BlVjyShW
 uPI5pNfgbfFfhM14fLH7CLmdE2c/gcO32OFjCYLQwQbUIkRM0XfCFw8mN
 vPy4CJ1GV1qkGUdJ7o7Z8AVtdkyTk+70YmWWwJVBHHe1WdQFgTb0S5CL+
 mbgB2df2feWtv56DsZNJk2pTQ3qdVffeoXDvU7SKEUzzEnWaElfDwDCf5 w==;
X-CSE-ConnectionGUID: zmPL0/7yRh22ZshLtV12cw==
X-CSE-MsgGUID: 9O2hG6rdR8Waeyesy/JOVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32629864"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32629864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:11:34 -0800
X-CSE-ConnectionGUID: aHFYA7wVSoGUjvet4N1mMQ==
X-CSE-MsgGUID: kkD2StPwQhCxNHs6oJJH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92012067"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.103])
 ([10.245.246.103])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:11:31 -0800
Message-ID: <f7bb2b1a6a31597bdd440a4db92f4f344c86c232.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] Revert "drm/xe: Add mutex locking to devcoredump"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 27 Nov 2024 09:11:28 +0100
In-Reply-To: <20241127083042.358726-2-himal.prasad.ghimiray@intel.com>
References: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
 <20241127083042.358726-2-himal.prasad.ghimiray@intel.com>
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
> This reverts commit b9428d0ac54fcece5ad8fc86c5d3e7aacc6e2c76. The
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
=C2=A0 | 33 ++-------------------
> --
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump_types.h |=C2=A0 4 +--
> =C2=A02 files changed, 3 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index dd6a4f591ee0..5d19a4e3d5af 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -182,24 +182,16 @@ static ssize_t xe_devcoredump_read(char
> *buffer, loff_t offset,
> =C2=A0	/* Ensure delayed work is captured before continuing */
> =C2=A0	flush_work(&ss->work);
> =C2=A0
> -	mutex_lock(&coredump->lock);
> -
> -	if (!ss->read.buffer) {
> -		mutex_unlock(&coredump->lock);
> +	if (!ss->read.buffer)
> =C2=A0		return -ENODEV;
> -	}
> =C2=A0
> -	if (offset >=3D ss->read.size) {
> -		mutex_unlock(&coredump->lock);
> +	if (offset >=3D ss->read.size)
> =C2=A0		return 0;
> -	}
> =C2=A0
> =C2=A0	byte_copied =3D count < ss->read.size - offset ? count :
> =C2=A0		ss->read.size - offset;
> =C2=A0	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> =C2=A0
> -	mutex_unlock(&coredump->lock);
> -
> =C2=A0	return byte_copied;
> =C2=A0}
> =C2=A0
> @@ -213,8 +205,6 @@ static void xe_devcoredump_free(void *data)
> =C2=A0
> =C2=A0	cancel_work_sync(&coredump->snapshot.work);
> =C2=A0
> -	mutex_lock(&coredump->lock);
> -
> =C2=A0	xe_devcoredump_snapshot_free(&coredump->snapshot);
> =C2=A0	kvfree(coredump->snapshot.read.buffer);
> =C2=A0
> @@ -223,8 +213,6 @@ static void xe_devcoredump_free(void *data)
> =C2=A0	coredump->captured =3D false;
> =C2=A0	drm_info(&coredump_to_xe(coredump)->drm,
> =C2=A0		 "Xe device coredump has been deleted.\n");
> -
> -	mutex_unlock(&coredump->lock);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_devcoredump_deferred_snap_work(struct work_struct
> *work)
> @@ -333,11 +321,8 @@ void xe_devcoredump(struct xe_exec_queue *q,
> struct xe_sched_job *job, const cha
> =C2=A0	struct xe_devcoredump *coredump =3D &xe->devcoredump;
> =C2=A0	va_list varg;
> =C2=A0
> -	mutex_lock(&coredump->lock);
> -
> =C2=A0	if (coredump->captured) {
> =C2=A0		drm_dbg(&xe->drm, "Multiple hangs are occurring, but
> only the first snapshot was taken\n");
> -		mutex_unlock(&coredump->lock);
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> @@ -352,8 +337,6 @@ void xe_devcoredump(struct xe_exec_queue *q,
> struct xe_sched_job *job, const cha
> =C2=A0	drm_info(&xe->drm, "Xe device coredump has been created\n");
> =C2=A0	drm_info(&xe->drm, "Check your
> /sys/class/drm/card%d/device/devcoredump/data\n",
> =C2=A0		 xe->drm.primary->index);
> -
> -	mutex_unlock(&coredump->lock);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_driver_devcoredump_fini(void *arg)
> @@ -365,18 +348,6 @@ static void xe_driver_devcoredump_fini(void
> *arg)
> =C2=A0
> =C2=A0int xe_devcoredump_init(struct xe_device *xe)
> =C2=A0{
> -	int err;
> -
> -	err =3D drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
> -	if (err)
> -		return err;
> -
> -	if (IS_ENABLED(CONFIG_LOCKDEP)) {
> -		fs_reclaim_acquire(GFP_KERNEL);
> -		might_lock(&xe->devcoredump.lock);
> -		fs_reclaim_release(GFP_KERNEL);
> -	}
> -
> =C2=A0	return devm_add_action_or_reset(xe->drm.dev,
> xe_driver_devcoredump_fini, &xe->drm);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..e6234e887102 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -80,9 +80,7 @@ struct xe_devcoredump_snapshot {
> =C2=A0 * for reading the information.
> =C2=A0 */
> =C2=A0struct xe_devcoredump {
> -	/** @lock: protects access to entire structure */
> -	struct mutex lock;
> -	/** @captured: The snapshot of the first hang has already
> been taken */
> +	/** @captured: The snapshot of the first hang has already
> been taken. */
> =C2=A0	bool captured;
> =C2=A0	/** @snapshot: Snapshot is captured at time of the first
> crash */
> =C2=A0	struct xe_devcoredump_snapshot snapshot;

