Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AEAD0E6F9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 15:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747C10E29F;
	Tue, 25 Nov 2025 15:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPF6gros";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23C10E29F
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764083204; x=1795619204;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Bdsmx3OP3vHCSATIhlJrAJ8GHtdXON68wM0wsYou4kM=;
 b=GPF6gros7BzhgLEgiFIOClbZ7iy+i5ceINyXrFSoJKSkWRKZZW2VZdE+
 bTHtPiPjaDkXT1RkMcr4AfkVZ6ZvdNwOS7g57U4jbdnWynwKoph0vm3L2
 211KOwwTeGXCsn/6anoRQ+txcRjI6SwFENxi7JwQ1TftEaKLve6dXILc5
 1U01dWK5/zPUs59VIRc6kixIAoMxpL1C7l8Xy2yMT7g7fN3mW7R7/1N5s
 MW/W+oddde1mBkApddFjZoKGb08lAECP5eeY164iqeiEI81PmIUY+K/A3
 CJdN8ZPFBEEf2O/tHYNsqZ+2ID0gxQ6D7aGEXT+zMAgLjYleFsMo/Z0wT A==;
X-CSE-ConnectionGUID: iM58WmpKRquN4AwHAnuNDg==
X-CSE-MsgGUID: /lpeg8UERcCYtdr2oeTlWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88754662"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="88754662"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:06:43 -0800
X-CSE-ConnectionGUID: 1QIiKvOCSgmEnUXAA48rnA==
X-CSE-MsgGUID: Nhyi0RWpRJ2azGzDrMaZFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192896475"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.198])
 ([10.245.244.198])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 07:06:42 -0800
Message-ID: <e3b54213adab24d5620241ec9e701ced2c1f4f85.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Date: Tue, 25 Nov 2025 16:06:40 +0100
In-Reply-To: <20251125094335.12028-2-tejas.upadhyay@intel.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
 <20251125094335.12028-2-tejas.upadhyay@intel.com>
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

Hi.


On Tue, 2025-11-25 at 15:13 +0530, Tejas Upadhyay wrote:
> Starting NVL, HW will flush cachelines marked with XA only
> when media is off. We have few cases where kernel will have
> non-XA cachelines which needs manual flush as we postpone
> the invalidation. Flush asap from correctness POV to ensure
> non accelerated CPU copy to swap/shmem file will see coherent
> view of memory, but also from security POV where later flush
> can't corrupt the next user of those pages.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

I had a number of concerns last time this patch was sent to the list,
none of which seems to have been addressed?=20

https://lore.kernel.org/intel-xe/d2517d66f571e11a760cb143981b7ca238f5cd58.c=
amel@linux.intel.com/

The main concern is that the code indicates that not all GPU caches are
flushed when all fences are signalled (bo / userptr idle)?

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
> index 465cf9fc7ce9..97e1e9d40e96 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device
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
> index 92f883dd8877..6e8335b493e8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1079,6 +1079,26 @@ void xe_device_l2_flush(struct xe_device *xe)
> =C2=A0	spin_unlock(&gt->global_invl_lock);
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
> +	 * Starting NVL, HW will flush cachelines marked with XA
> only when media is off. We have
> +	 * few cases where kernel will have non-XA cachelines which
> needs manual flush and this is
> +	 * one of them as we postpone the invalidation. Flush asap
> from correctness POV to ensure
> +	 * non accelerated CPU copy to swap/shmem file will see
> coherent view of memory, but also
> +	 * from security POV where later flush can't corrupt the
> next user of those pages.
> +	 */
> +	if (GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe))
> +		return true;
> +	return false;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_device_td_flush() - Flush transient L3 cache entries
> =C2=A0 * @xe: The device
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..15e67db44b56 100644
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
> index 0d9130b1958a..a93c7e887cca 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm
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

