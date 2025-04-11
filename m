Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE72FC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 15:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141D10EBF4;
	Fri, 11 Apr 2025 15:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuHc07A2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA110EBF7
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744384358; x=1775920358;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=U953aGXiS1WPPtWkxqVDGY+J+A/hUdYETUK+NVrBdvk=;
 b=LuHc07A2RPwD8ClzqCeMmsfBd09BASbpotb6xKPzRS5h7ylQVUTKKucm
 wRQ6vY+tVMtPAeWKylZTkyIs6erVbaD2cVO5/ydD0YRfpWzsr/V8cQmB4
 cz5Z6kl/Lms5tTd2+8jIxrpq1xG9g0nk9mKiL7jxPoZ9a6wSAKXvwmIBv
 NB6k38mlyFJHnNYv8be0/duAw4dadmvJGSJTVRnrMpusMjnTy1aiMwO7l
 /y5MUjxfBjwMkfAub5SUizSdGvYtcK3JZipZ9HzX1c6Omk5mHKxyj/kfQ
 d90KNznl6Bj15Md+rPux7OM95LCexUBr9SLMaaVSl9A156i7zi7PH4S5G Q==;
X-CSE-ConnectionGUID: SFfoXM+HRzWsBwYoGXuxBA==
X-CSE-MsgGUID: fBGggOZLSRqQQCRQM1TW6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56586255"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="56586255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 08:12:38 -0700
X-CSE-ConnectionGUID: D7Tkg1gqTVeNdljJPptANQ==
X-CSE-MsgGUID: HWYSfvDBS+2e/g/GQUZ8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="129573140"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.82])
 ([10.245.246.82])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 08:12:36 -0700
Message-ID: <93df6de4ea8945ed0aeafb001f55d04b9e62d211.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: share bo dma-resv with backup object
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 17:12:34 +0200
In-Reply-To: <20250410162016.158474-7-matthew.auld@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
 <20250410162016.158474-7-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-04-10 at 17:20 +0100, Matthew Auld wrote:
> We end up needing to grab both locks together anyway and keep them
> held
> until we complete the copy or add the fence. Plus the backup_obj is
> short lived and tied to the parent object, so seems reasonable to
> share
> the same dma-resv. This will simplify the locking here, and in follow
> up patches.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Is there any chance that the bo dma-resv is freed before the backup
object's resv is individualized?

If not, perhaps a short description why that can never happen?

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 24 +++++++++---------------
> =C2=A01 file changed, 9 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c337790c81ae..3eab6352d9dc 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1120,9 +1120,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> =C2=A0		goto out_unlock_bo;
> =C2=A0
> -	backup =3D xe_bo_create_locked(xe, NULL, NULL, bo->size,
> ttm_bo_type_kernel,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_PINNED);
> +	backup =3D ___xe_bo_create_locked(xe, NULL, NULL, bo-
> >ttm.base.resv, NULL, bo->size,
> +					DRM_XE_GEM_CPU_CACHING_WB,
> ttm_bo_type_kernel,
> +					XE_BO_FLAG_SYSTEM |
> XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +					XE_BO_FLAG_PINNED);
> =C2=A0	if (IS_ERR(backup)) {
> =C2=A0		ret =3D PTR_ERR(backup);
> =C2=A0		goto out_unlock_bo;
> @@ -1177,7 +1178,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0
> =C2=A0out_backup:
> =C2=A0	xe_bo_vunmap(backup);
> -	xe_bo_unlock(backup);
> =C2=A0	if (ret)
> =C2=A0		xe_bo_put(backup);
> =C2=A0out_unlock_bo:
> @@ -1212,17 +1212,12 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0	if (!backup)
> =C2=A0		return 0;
> =C2=A0
> -	xe_bo_lock(backup, false);
> +	xe_bo_lock(bo, false);
> =C2=A0
> =C2=A0	ret =3D ttm_bo_validate(&backup->ttm, &backup->placement,
> &ctx);
> =C2=A0	if (ret)
> =C2=A0		goto out_backup;
> =C2=A0
> -	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
> -		ret =3D -EBUSY;
> -		goto out_backup;
> -	}
> -
> =C2=A0	if (xe_bo_is_user(bo) || (bo->flags &
> XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> =C2=A0		struct xe_migrate *migrate;
> =C2=A0		struct dma_fence *fence;
> @@ -1271,15 +1266,14 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0
> =C2=A0	bo->backup_obj =3D NULL;
> =C2=A0
> +out_backup:
> +	xe_bo_vunmap(backup);
> +	if (!bo->backup_obj)
> +		xe_bo_put(backup);
> =C2=A0out_unlock_bo:
> =C2=A0	if (unmap)
> =C2=A0		xe_bo_vunmap(bo);
> =C2=A0	xe_bo_unlock(bo);
> -out_backup:
> -	xe_bo_vunmap(backup);
> -	xe_bo_unlock(backup);
> -	if (!bo->backup_obj)
> -		xe_bo_put(backup);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0

