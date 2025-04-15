Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F4C369B4
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 09:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DBD10E6A5;
	Tue, 15 Apr 2025 09:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHGcsLki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B47310E6A5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744708803; x=1776244803;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=cYiD37obSYpPGKiDJpP/Ytk9BAyaTDiHiEOhAPT5sEo=;
 b=bHGcsLkiiuzRItNi7Ivw6Eg9/i9LCUzvxo/9bPOxH7N0FYg0PK3ognVK
 7dFx/Zec9CmFqWXzJ9jCsM6t+zHVh/u4UU4iejX8AQOFP+YZuJqE+nSss
 QQz37GId7FFhBkOzYfTTDocb00DF8COV9aRr4/6v0xbTAd/6yIWf0hb9v
 KSWzPx/oe2pegWcG9nKxiBUTO8flck8mO4wdqJ/pcIM4D5BcirttizXzz
 Es3J9T0XnUSgvnpWFXxD2vZeB/PQUQwFN92gIVlVOlGCSqbUMz5vF4ld8
 4h7MVmOR52tF5JsGV9eBfdOgEAeXT+dEasHCBqx4g6fV3dOjXPXbRHOkf g==;
X-CSE-ConnectionGUID: W3mIAfKtQfqAbfNqnt9EWg==
X-CSE-MsgGUID: Jm3RIxoLSdyX/0/CeCwPzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56385620"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56385620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:20:03 -0700
X-CSE-ConnectionGUID: OPQX1PsOTey+oWMQyVyDGg==
X-CSE-MsgGUID: p3+j5luITouaMoL87SyfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130962871"
Received: from monicael-mobl3 (HELO [10.245.246.24]) ([10.245.246.24])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:20:01 -0700
Message-ID: <d5cab11450df62c570b9a09122e05c287df5afea.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: share bo dma-resv with backup object
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 11:19:27 +0200
In-Reply-To: <31710fae-5e44-44e4-94e4-e06b2410e639@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
 <20250410162016.158474-7-matthew.auld@intel.com>
 <93df6de4ea8945ed0aeafb001f55d04b9e62d211.camel@linux.intel.com>
 <31710fae-5e44-44e4-94e4-e06b2410e639@intel.com>
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

On Mon, 2025-04-14 at 11:32 +0100, Matthew Auld wrote:
> Hi,
>=20
> On 11/04/2025 16:12, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2025-04-10 at 17:20 +0100, Matthew Auld wrote:
> > > We end up needing to grab both locks together anyway and keep
> > > them
> > > held
> > > until we complete the copy or add the fence. Plus the backup_obj
> > > is
> > > short lived and tied to the parent object, so seems reasonable to
> > > share
> > > the same dma-resv. This will simplify the locking here, and in
> > > follow
> > > up patches.
> > >=20
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > Is there any chance that the bo dma-resv is freed before the backup
> > object's resv is individualized?
> >=20
> > If not, perhaps a short description why that can never happen?
>=20
> Thanks for reviewing. My thinking was that there should be one
> reference=20
> on the backup bo, which is either dropped by the parent bo when
> calling=20
> the unpin or the unprepare step, whoever gets there first. In both
> cases=20
> there will still be a ref to the parent when we drop the backup ref.
> The=20
> individualize step looks to be synchronous in ttm so it should happen
> within the scope of holding the parent lock so parent bo can't
> disappear.
>=20
> But as you say maybe this is inviting trouble later, if there is some
> hypothetical way for something to grab an extra ref on the backup bo.
> What about if in addition we also hold a ref to the parent bo, which
> is=20
> then dropped after the individualize step:
>=20
> https://gitlab.freedesktop.org/mwa/kernel/-/commit/3b72a079a1cd9da9590da8=
2912798785ede8c97f

Yes, that should work, I think. One could also try to drop the
reference in xe_tt_bo_release_notify() but that will not always work if
the individualization fails.

Thanks,
Thomas



>=20
> >=20
> > /Thomas
> >=20
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c | 24 +++++++++---------------
> > > =C2=A0=C2=A01 file changed, 9 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index c337790c81ae..3eab6352d9dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1120,9 +1120,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > > =C2=A0=C2=A0	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> > > =C2=A0=C2=A0		goto out_unlock_bo;
> > > =C2=A0=20
> > > -	backup =3D xe_bo_create_locked(xe, NULL, NULL, bo->size,
> > > ttm_bo_type_kernel,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_PINNED);
> > > +	backup =3D ___xe_bo_create_locked(xe, NULL, NULL, bo-
> > > > ttm.base.resv, NULL, bo->size,
> > > +					DRM_XE_GEM_CPU_CACHING_W
> > > B,
> > > ttm_bo_type_kernel,
> > > +					XE_BO_FLAG_SYSTEM |
> > > XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > > +					XE_BO_FLAG_PINNED);
> > > =C2=A0=C2=A0	if (IS_ERR(backup)) {
> > > =C2=A0=C2=A0		ret =3D PTR_ERR(backup);
> > > =C2=A0=C2=A0		goto out_unlock_bo;
> > > @@ -1177,7 +1178,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > > =C2=A0=20
> > > =C2=A0=C2=A0out_backup:
> > > =C2=A0=C2=A0	xe_bo_vunmap(backup);
> > > -	xe_bo_unlock(backup);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		xe_bo_put(backup);
> > > =C2=A0=C2=A0out_unlock_bo:
> > > @@ -1212,17 +1212,12 @@ int xe_bo_restore_pinned(struct xe_bo
> > > *bo)
> > > =C2=A0=C2=A0	if (!backup)
> > > =C2=A0=C2=A0		return 0;
> > > =C2=A0=20
> > > -	xe_bo_lock(backup, false);
> > > +	xe_bo_lock(bo, false);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	ret =3D ttm_bo_validate(&backup->ttm, &backup->placement=
,
> > > &ctx);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		goto out_backup;
> > > =C2=A0=20
> > > -	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
> > > -		ret =3D -EBUSY;
> > > -		goto out_backup;
> > > -	}
> > > -
> > > =C2=A0=C2=A0	if (xe_bo_is_user(bo) || (bo->flags &
> > > XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> > > =C2=A0=C2=A0		struct xe_migrate *migrate;
> > > =C2=A0=C2=A0		struct dma_fence *fence;
> > > @@ -1271,15 +1266,14 @@ int xe_bo_restore_pinned(struct xe_bo
> > > *bo)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	bo->backup_obj =3D NULL;
> > > =C2=A0=20
> > > +out_backup:
> > > +	xe_bo_vunmap(backup);
> > > +	if (!bo->backup_obj)
> > > +		xe_bo_put(backup);
> > > =C2=A0=C2=A0out_unlock_bo:
> > > =C2=A0=C2=A0	if (unmap)
> > > =C2=A0=C2=A0		xe_bo_vunmap(bo);
> > > =C2=A0=C2=A0	xe_bo_unlock(bo);
> > > -out_backup:
> > > -	xe_bo_vunmap(backup);
> > > -	xe_bo_unlock(backup);
> > > -	if (!bo->backup_obj)
> > > -		xe_bo_put(backup);
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> >=20
>=20

