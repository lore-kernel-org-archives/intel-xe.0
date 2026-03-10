Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA0EB1043
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 10:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AA710E6B2;
	Tue, 10 Mar 2026 10:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzNexxY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FAA10E214
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773138231; x=1804674231;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SmdN9zfNLrjT0lUa37lFCfzEHq/WP/U970xOnYzZlsg=;
 b=FzNexxY7AAg4xtX++CGM5g11lkTv9K0dhb7z5guW+wknzLJuDBzneK8K
 rs6lhCHGNriYgeKoPXT/Iz5sUtq32+2VaI2lD1t53W7FJ7Yw7poaM1KDQ
 2D5i0N7iKc0NMuuFLBVpmLcppHJxXrYQC/8IN5HeHHh3z+DUgjQMrOKnh
 /U7QcOHhw/EydjH/7crZHNrOdOyzlVoV0o6NrtBA9q0w9QH3n5JmHp6cQ
 NKV1JZiPOWPn1eQKKc1GScjJPqm1+JsF0bqMA/v5QWCcM9JoQXzk8pviC
 +YPyxGewA/X/5lBbyAxwWQV3SLxOJhqKzlfFe8/yssY4G0B5ZMRt6hXWf Q==;
X-CSE-ConnectionGUID: l3wq5eApTWewVU7ZB7kuSg==
X-CSE-MsgGUID: 6Aod/Sm0Q3y/AXvNbmPzAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74149265"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74149265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:23:50 -0700
X-CSE-ConnectionGUID: GRaPIHewRB6Vt99OpYNx2Q==
X-CSE-MsgGUID: GTDasiggR0iGQO8Hrffy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="257980207"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.39])
 ([10.245.244.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:23:48 -0700
Message-ID: <89cb34fc432fa0288e9ebf1e1338a817a31f00c7.camel@linux.intel.com>
Subject: Re: [PATCH v6 11/12] drm/xe/madvise: Enable purgeable buffer object
 IOCTL support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 10 Mar 2026 11:23:45 +0100
In-Reply-To: <20260303152015.3499248-12-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-12-arvind.yadav@intel.com>
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
> Hook the madvise_purgeable() handler into the madvise IOCTL now that
> all
> supporting infrastructure is complete:
>=20
> =C2=A0- Core purge implementation (patch 3)
> =C2=A0- BO state tracking and helpers (patches 1-2)
> =C2=A0- Per-VMA purgeable state tracking (patch 6)
> =C2=A0- Shrinker integration for memory reclamation (patch 10)
>=20
> This final patch enables userspace to use the
> DRM_XE_VMA_ATTR_PURGEABLE_STATE
> madvise type to mark buffers as WILLNEED/DONTNEED and receive the
> retained
> status indicating whether buffers were purged.
>=20
> The feature was kept disabled in earlier patches to maintain
> bisectability
> and ensure all components are in place before exposing to userspace.
>=20
> Userspace can detect kernel support for purgeable BOs by checking the
> DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT flag in the query_config
> response.
>=20
> v6:
> =C2=A0 - Add DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for userspace
> =C2=A0=C2=A0=C2=A0 feature detection. (Jose)
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_query.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 22 +++++-----------------
> =C2=A02 files changed, 7 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c
> b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..e535c77405b9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe,
> struct drm_xe_device_query *query)
> =C2=A0			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_
> HINT;
> =C2=A0	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> =C2=A0			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT
> ;
> =C2=A0	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> =C2=A0		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K
> : SZ_4K;
> =C2=A0	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe-
> >info.va_bits;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index ab83e94980e4..746e9b7b47bb 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -337,18 +337,11 @@ void xe_bo_recompute_purgeable_state(struct
> xe_bo *bo)
> =C2=A0 *
> =C2=A0 * Handles DONTNEED/WILLNEED/PURGED states. Tracks if any BO was
> purged
> =C2=A0 * in details->has_purged_bo for later copy to userspace.
> - *
> - * Note: Marked __maybe_unused until hooked into madvise_funcs[] in
> the
> - * final patch to maintain bisectability. The NULL placeholder in
> the
> - * array ensures proper -EINVAL return for userspace until all
> supporting
> - * infrastructure (shrinker, per-VMA tracking) is complete.
> =C2=A0 */
> -static void __maybe_unused madvise_purgeable(struct xe_device *xe,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 int num_vmas,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise
> *op,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 struct
> xe_madvise_details *details)
> +static void madvise_purgeable(struct xe_device *xe, struct xe_vm
> *vm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int num_vmas,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_madvise_details *details)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> @@ -412,12 +405,7 @@ static const madvise_func madvise_funcs[] =3D {
> =C2=A0	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] =3D
> madvise_preferred_mem_loc,
> =C2=A0	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] =3D madvise_atomic,
> =C2=A0	[DRM_XE_MEM_RANGE_ATTR_PAT] =3D madvise_pat_index,
> -	/*
> -	 * Purgeable support implemented but not enabled yet to
> maintain
> -	 * bisectability. Will be set to madvise_purgeable() in
> final patch
> -	 * when all infrastructure (shrinker, VMA tracking) is
> complete.
> -	 */
> -	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] =3D NULL,
> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] =3D madvise_purgeable,
> =C2=A0};
> =C2=A0
> =C2=A0static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start,
> u64 end)
