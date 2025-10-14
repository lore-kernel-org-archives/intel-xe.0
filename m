Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB61CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 12:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D7B10E605;
	Tue, 14 Oct 2025 12:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CY6NH7QS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181610E605
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760446739; x=1791982739;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A/EX+ZniDchGH8r5tM61sMFnvAKRMRvwzT/LbtV8wqk=;
 b=CY6NH7QSjnF1MC+u/aqnTmGFhCgCDjbybx6Nq6ZAnz1HZUPyc9IseslS
 YdejzT5J7D9imBcF25HPgfDeV1tfZRlc9P9LEESWQbWIxszs8qdYEsbKk
 6jbQoAS38EpNgS+/5b4GvXPZF/Sw7nne1e7M6mofxEmWxjJUk4qOqhi3m
 CMnvhsmJB16IJfzbsVTFUeYRFsKrmg98SjG6Pb1JyGDI6JzmSC+C0blBz
 z5LHmZqXOwnNbgUz43zcO4kQpGTDaK1audo5yadtb2NmRqyx64mm7ew85
 WBJ7RwXMJIIH7BHTyjPQRrdMAhLOxdDQmiEBO1nGYDOAmgJ7uPb9jJ8iy Q==;
X-CSE-ConnectionGUID: yKOwQoDAT6OxwXLGjta8ww==
X-CSE-MsgGUID: sncLtLm0TRu9XzdHjkzvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80237453"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80237453"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:58:59 -0700
X-CSE-ConnectionGUID: 7tXYl8ZbSCSO0kZ9PyWD2Q==
X-CSE-MsgGUID: cIhHV9kJRx+POlBu4aby1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182325060"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:58:58 -0700
Message-ID: <d2517d66f571e11a760cb143981b7ca238f5cd58.camel@linux.intel.com>
Subject: Re: [PATCH 12/23] drm/xe/xe3p: Flush userptr/shrinker bo cachelines
 manually
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan	
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>,  Tejas Upadhyay <tejas.upadhyay@intel.com>
Date: Tue, 14 Oct 2025 14:58:55 +0200
In-Reply-To: <20251013-xe3p-v1-12-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-12-bfb74f038215@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Mon, 2025-10-13 at 20:24 -0700, Lucas De Marchi wrote:
> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Starting with Xe3p, HW will flush cachelines marked with XA only when
> media is off. We have few cases where kernel will have non-XA
> cachelines
> which needs manual flush as we postpone the invalidation.

is XA- and non-XA cachelines described somewhere in the code?

>=20
> Flush asap from correctness POV to ensure non accelerated CPU copy to
> swap/shmem file will see coherent view of memory, but also from
> security
> POV where later flush can't corrupt the next user of those pages.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> [ TODO: xe_device_needs_cache_flush() seems a bad name that doesn't
> =C2=A0 really review the context - it may need to be renamed/localized ]
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

This worries me. Any dma-fence *must*, when signaled, have flushed all
caches from data resulting from the operation it marks the completion
of. The code below indicates that's not the case?

Note also that the wait for idle in xe_bo_trigger_rebind does not
guarantee that the bo is idle, just that there are no pending bind
operations.

In fault mode we have a slightly different approach to ensure data is
flushed before pages are released.

Could you elaborate a bit on how this is intendend to work.

Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 =
++-
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0 | 20 ++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_device.h=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_userptr.c |=C2=A0 3 ++-
> =C2=A04 files changed, 25 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b65020818738..05bc61d9e37cf 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -673,7 +673,8 @@ static int xe_bo_trigger_rebind(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0
> =C2=A0		if (!xe_vm_in_fault_mode(vm)) {
> =C2=A0			drm_gpuvm_bo_evict(vm_bo, true);
> -			continue;
> +			if (!xe_device_needs_cache_flush(xe))
> +				continue;
> =C2=A0		}
> =C2=A0
> =C2=A0		if (!idle) {
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 7efa8da9e1069..168a45fe36838 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1081,6 +1081,26 @@ void xe_device_l2_flush(struct xe_device *xe)
> =C2=A0	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_device_needs_cache_flush - Whether the cache needs to be
> flushed
> + * @xe: The device to check.
> + *
> + * Return: true if the device needs cache flush, false otherwise.
> + */
> +bool xe_device_needs_cache_flush(struct xe_device *xe)
> +{
> +	/*
> +	 * Xe3p will flush cachelines marked with XA only when media
> is off. We
> +	 * have few cases where kernel will have non-XA cachelines
> which needs
> +	 * manual flush and this is one of them as we postpone the
> +	 * invalidation. Flush asap from correctness POV to ensure
> non
> +	 * accelerated CPU copy to swap/shmem file will see coherent
> view of
> +	 * memory, but also from security POV where later flush
> can't corrupt
> +	 * the next user of those pages.
> +	 */
> +	return GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_device_td_flush() - Flush transient L3 cache entries
> =C2=A0 * @xe: The device
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f64..15e67db44b56c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -179,6 +179,7 @@ void xe_device_snapshot_print(struct xe_device
> *xe, struct drm_printer *p);
> =C2=A0u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> =C2=A0u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
> address);
> =C2=A0
> +bool xe_device_needs_cache_flush(struct xe_device *xe);
> =C2=A0void xe_device_td_flush(struct xe_device *xe);
> =C2=A0void xe_device_l2_flush(struct xe_device *xe);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> b/drivers/gpu/drm/xe/xe_userptr.c
> index f16e92cd80904..86ce1c3ef41aa 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -112,7 +112,8 @@ static void __vma_userptr_invalidate(struct xe_vm
> *vm, struct xe_userptr_vma *uv
> =C2=A0				=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> =C2=A0	XE_WARN_ON(err <=3D 0);
> =C2=A0
> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +	if ((xe_vm_in_fault_mode(vm) ||
> xe_device_needs_cache_flush(vm->xe)) &&
> +	=C2=A0=C2=A0=C2=A0 userptr->initial_bind) {
> =C2=A0		err =3D xe_vm_invalidate_vma(vma);
> =C2=A0		XE_WARN_ON(err);
> =C2=A0	}
>=20

