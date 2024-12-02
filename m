Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D09D78337
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 17:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3FC10E7D4;
	Mon,  2 Dec 2024 17:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6gR7JE+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DC210E7D4
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733159108; x=1764695108;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7ldCwdcLboGS0hLqTfcHtTn188FoNqbli5fcnfQQqTM=;
 b=e6gR7JE+b+nqz6jGOM27G1RlKStQRUfZhN7rZzjPUUEQef/Hvt4lsMLl
 WXUAYF472xQiEKZC6BoFwxzymib0Ot+0wWY1doBeeULZ91xhry+aLkMB3
 y+YOMScZjBYJl0EioXDdiSRVKDdCZE+R/MQflRZVdcHDekjnKsX/eV/CY
 3SutLLEm3Kse9dCnZrwnbbRNHGf9ehZgdplmNkgBm4OnpWjO63In0YEp0
 NmRp3p5EFH1wugkyNDILCk5FdFr28JbgYU3MqBIw7M7rbtrXWAn3K/8vg
 2FC/f1VOhxOMj56JSruUP5cJy1IGMhH4r1cCBVqEvWFrlAgdkDoZG2CSF A==;
X-CSE-ConnectionGUID: XrXze84OTEWq1YJyhGmX2w==
X-CSE-MsgGUID: JT/3ynR3RISaPKQHTQaAMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50751757"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="50751757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:05:08 -0800
X-CSE-ConnectionGUID: BIBtMNUFSmePuy1TkVTjlw==
X-CSE-MsgGUID: 1a8ceEe0R06awMHdNakFqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="97939477"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:05:05 -0800
Message-ID: <b9839a511b8b4a4c5425b63c23444788fb8b0fca.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/display: fix ttm_bo_access() usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
Date: Mon, 02 Dec 2024 18:05:02 +0100
In-Reply-To: <20241202170102.88893-2-matthew.auld@intel.com>
References: <20241202170102.88893-2-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Mon, 2024-12-02 at 17:01 +0000, Matthew Auld wrote:
> ttm_bo_access() returns the size on success. Account for that
> otherwise
> the caller incorrectly thinks this is an error in
> intel_atomic_prepare_plane_clear_colors().
>=20
> v2 (Thomas)
> =C2=A0- Make sure we check for the partial copy case. Also since this api
> is
> =C2=A0=C2=A0 easy to get wrong, wrap the whole thing in a new helper to h=
ide
> the
> =C2=A0=C2=A0 details and then convert the existing users over.
>=20
> Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page
> to use ttm_bo_access")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/display/intel_bo.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++------
> =C2=A04 files changed, 28 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c
> b/drivers/gpu/drm/xe/display/intel_bo.c
> index 43141964f6f2..b463f5bd4eed 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -41,7 +41,7 @@ int intel_bo_read_from_page(struct drm_gem_object
> *obj, u64 offset, void *dst, i
> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> =C2=A0
> -	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> +	return xe_bo_read(bo, offset, dst, size);
> =C2=A0}
> =C2=A0
> =C2=A0struct intel_frontbuffer *intel_bo_get_frontbuffer(struct
> drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f51d86511cb9..af85e5b8895f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1320,6 +1320,30 @@ static int xe_bo_vm_access(struct
> vm_area_struct *vma, unsigned long addr,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_read() - Read from an xe_bo
> + * @bo: The buffer object to read from.
> + * @offset: The byte offset to start reading from.
> + * @dst: Location to store the read.
> + * @size: Size in bytes for the read.
> +
> + * Read @size bytes from the @bo, starting from @offset, storing
> into @dst.
> + *
> + * Return: Zero on success, or negative error.
> + */
> +int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
> +{
> +	int ret;
> +
> +	ret =3D ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> +	if (ret >=3D 0 && ret !=3D size)
> +		ret =3D -EIO;
> +	else if (ret =3D=3D size)
> +		ret =3D 0;
> +
> +	return ret;
> +}
> +
> =C2=A0static const struct vm_operations_struct xe_gem_vm_ops =3D {
> =C2=A0	.fault =3D xe_gem_fault,
> =C2=A0	.open =3D ttm_bo_vm_open,
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d0dce44317c7..d9386ab03140 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -228,6 +228,7 @@ xe_bo_ggtt_addr(struct xe_bo *bo)
> =C2=A0
> =C2=A0int xe_bo_vmap(struct xe_bo *bo);
> =C2=A0void xe_bo_vunmap(struct xe_bo *bo);
> +int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
> =C2=A0
> =C2=A0bool mem_type_is_vram(u32 mem_type);
> =C2=A0bool xe_bo_is_vram(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2492750505d6..7788680da4e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3321,12 +3321,8 @@ void xe_vm_snapshot_capture_delayed(struct
> xe_vm_snapshot *snap)
> =C2=A0		}
> =C2=A0
> =C2=A0		if (bo) {
> -			err =3D ttm_bo_access(&bo->ttm, snap-
> >snap[i].bo_ofs,
> -					=C2=A0=C2=A0=C2=A0 snap->snap[i].data,
> snap->snap[i].len, 0);
> -			if (!(err < 0) && err !=3D snap->snap[i].len)
> -				err =3D -EIO;
> -			else if (!(err < 0))
> -				err =3D 0;
> +			err =3D xe_bo_read(bo, snap->snap[i].bo_ofs,
> +					 snap->snap[i].data, snap-
> >snap[i].len);
> =C2=A0		} else {
> =C2=A0			void __user *userptr =3D (void __user
> *)(size_t)snap->snap[i].bo_ofs;
> =C2=A0

