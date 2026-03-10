Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2373CEB1041
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 10:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECA610E214;
	Tue, 10 Mar 2026 10:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9KUBI/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6A710E214
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773137841; x=1804673841;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1vxeJIsUxEfzXQVrhJGdaH0kJgn7QytaJRitoTiaeXo=;
 b=J9KUBI/rjlqy23PcZPGPQ/eBDlu4OZlVoLh2w9S7Pn9Tucr7uP1hS8UK
 JNOiXfR5jZisDjDgfRnhFISmFWVe4GfizTOS2A/RAEIqg7WYPjq5AcHFX
 ko7d96LX6lYdwWgPSQIzBbDJ32yS4Nb+5JbpnGXlh7Snm37bSESmWwIyf
 yuav011BxKC6N7fRzaDDqngEbjK1Uw0E0YKMBUdbzeEY7ZyjOwgIq2qYM
 QeEJdgEf5Yd303UKZh6kaDFWl7ifUBh5QC5S5hhgoStjb8nKFiihJYCqp
 x2iSi1RP0jeXatKl2HRcO1I8iUSQj6nz9/KrFLwbe4kcB3ILNdHirRCHw A==;
X-CSE-ConnectionGUID: XZDY0vcgRneHAfSfkizhEQ==
X-CSE-MsgGUID: 6onI878wS3SoNJU6eVU/Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74296341"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74296341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:17:19 -0700
X-CSE-ConnectionGUID: SGfARgrFR1qcbDj9U5b1GA==
X-CSE-MsgGUID: 6bJz/ky4Raykt3QkKHxXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="250547875"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.39])
 ([10.245.244.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:17:18 -0700
Message-ID: <2b12e3a06e3fefd2c3574c996c040be8a0bc76ee.camel@linux.intel.com>
Subject: Re: [PATCH v6 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 10 Mar 2026 11:17:15 +0100
In-Reply-To: <20260303152015.3499248-9-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-9-arvind.yadav@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
> Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
> DONTNEED BOs can have their contents discarded at any time, making
> CPU access undefined behavior. PURGED BOs have no backing store and
> are permanently invalid.
>=20
> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
> -EINVAL for purged BOs (permanent, no backing store).
>=20
> The mmap offset ioctl now checks the BO's purgeable state before
> allowing userspace to establish a new CPU mapping. This prevents
> the race where userspace gets a valid offset but the BO is purged
> before actual faulting begins.
>=20
> Existing mmaps (established before DONTNEED) may still work until
> pages are purged, at which point CPU faults fail with SIGBUS.
>=20
> v6:
> - Split DONTNEED =E2=86=92 -EBUSY and PURGED =E2=86=92 -EINVAL for consis=
tency
> =C2=A0 with the rest of the series (Thomas, Matt)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 28 +++++++++++++++++++++++++++-
> =C2=A01 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d05a73756905..3a4965bdadf2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3396,6 +3396,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device

This needs to be done in the mmap() callback. It should be OK to wrap
the existing callback there.

> *dev, void *data,
> =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> =C2=A0	struct drm_xe_gem_mmap_offset *args =3D data;
> =C2=A0	struct drm_gem_object *gem_obj;
> +	struct xe_bo *bo;
> +	int err;
> =C2=A0
> =C2=A0	if (XE_IOCTL_DBG(xe, args->extensions) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, args->reserved[0] || args-
> >reserved[1]))
> @@ -3425,11 +3427,35 @@ int xe_gem_mmap_offset_ioctl(struct
> drm_device *dev, void *data,
> =C2=A0	if (XE_IOCTL_DBG(xe, !gem_obj))
> =C2=A0		return -ENOENT;
> =C2=A0
> +	bo =3D gem_to_xe_bo(gem_obj);
> +
> +	/*
> +	 * Reject new mmap to purgeable BOs. DONTNEED BOs can be
> purged
> +	 * at any time, making CPU access undefined behavior. Purged
> BOs have
> +	 * no backing store and are permanently invalid.
> +	 */
> +	xe_bo_lock(bo, false);

sleeping locks need to be interruptible whenever possible.

Thanks,
Thomas



> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		err =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	if (xe_bo_is_purged(bo)) {
> +		err =3D -EINVAL;
> +		goto out_unlock;
> +	}
> +	xe_bo_unlock(bo);
> +
> =C2=A0	/* The mmap offset was set up at BO allocation time. */
> =C2=A0	args->offset =3D drm_vma_node_offset_addr(&gem_obj->vma_node);
> +	xe_bo_put(bo);
> =C2=A0
> -	xe_bo_put(gem_to_xe_bo(gem_obj));
> =C2=A0	return 0;
> +
> +out_unlock:
> +	xe_bo_unlock(bo);
> +	xe_bo_put(bo);
> +	return err;
> =C2=A0}
> =C2=A0
> =C2=A0/**
