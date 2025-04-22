Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A91AC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 07:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C1F10E505;
	Tue, 22 Apr 2025 07:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoX23+qF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B373F10E505
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745305280; x=1776841280;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=w2VA7PhM0Mhg43jpiIvV4Pk7WNVrZ2jw/iRo3GGcx8k=;
 b=EoX23+qFkpLOik2t6/Z336IwxNfgEiAarFhldOeQFkF9UzaC8+P3EZbE
 pWFw6lQdtEu1JmKqkQSNr+udT5/3AfGAJ4ssXdFfRS7YnJ88obp0vZzQu
 zvCHP5ypP/8+1m8dPRM/Qo5BA4qfPDkupnlP9VdS8m5SPLp+QLwHH1cy3
 l5WbNvz76b3u1LydUc7D9sWoocxrxAztQtcWgvyGlr4BbgNtgoUOvwIet
 N15sG/mOKsEKWPVhLm2wuoaVJcbehIN8PyhBNcaOx/Iw/n9uBrE76C2jT
 T4HmqMhf/pvhwVHmmitOsGJMJprSJCrjVhJsEoPAjRf4EL3+LDtrzsZ4n w==;
X-CSE-ConnectionGUID: tlq2vExqT2y7Zuco2ojbqw==
X-CSE-MsgGUID: aAOK6T6wRFOxvrU2rHFjHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46737796"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46737796"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:01:16 -0700
X-CSE-ConnectionGUID: X3cUH/hxQEKTg9NHBGA8iw==
X-CSE-MsgGUID: ocH0frYbSIaQzO+EEY2MWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132809092"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.95])
 ([10.245.246.95])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:01:14 -0700
Message-ID: <52554ca70519b3567a68cc8bf3c5c7b819975e89.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: share bo dma-resv with backup object
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 09:01:11 +0200
In-Reply-To: <9442833c-9bb8-4247-8c36-6ac5396dad86@intel.com>
References: <20250416150913.434369-5-matthew.auld@intel.com>
 <20250416150913.434369-7-matthew.auld@intel.com>
 <848f97a54c37795a25eaa45016e48a14815379a1.camel@linux.intel.com>
 <9442833c-9bb8-4247-8c36-6ac5396dad86@intel.com>
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

On Thu, 2025-04-17 at 09:45 +0100, Matthew Auld wrote:
> On 16/04/2025 16:43, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-04-16 at 16:09 +0100, Matthew Auld wrote:
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
> > > v2:
> > > =C2=A0=C2=A0 - Hold reference to the parent bo to be sure the shared =
dma-
> > > resv
> > > can't
> > > =C2=A0=C2=A0=C2=A0=C2=A0 go out of scope too soon. (Thomas)
> > >=20
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > Another thought: What if someone releases the last "ordinary"
> > reference
> > on an object that has a backup object so that the only remaining
> > reference is the backup object. Can that happen?
> >=20
> > I have a vague recollection of having to deal with that for i915...
>=20
> I don't think that can happen in xe, since the xe_bo_unpin() has to
> be=20
> explicitly called before the object is finally put(), and the unpin
> will=20
> make sure to drop its reference on the backup object, if it's still=20
> there, breaking the circular reference and starting the chain
> reaction.

OK, makes sense.=20

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>



>=20
> >=20
> > /Thomas
> >=20
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 28 +++++++++++++------------
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo_types.h |=C2=A0 2 ++
> > > =C2=A0=C2=A02 files changed, 15 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index c337790c81ae..79adaee5a0e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1120,13 +1120,15 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
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
> > > =C2=A0=C2=A0	}
> > > +	backup->parent_obj =3D xe_bo_get(bo); /* Released by
> > > bo_destroy */
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (xe_bo_is_user(bo) || (bo->flags &
> > > XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> > > =C2=A0=C2=A0		struct xe_migrate *migrate;
> > > @@ -1177,7 +1179,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > > =C2=A0=20
> > > =C2=A0=C2=A0out_backup:
> > > =C2=A0=C2=A0	xe_bo_vunmap(backup);
> > > -	xe_bo_unlock(backup);
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		xe_bo_put(backup);
> > > =C2=A0=C2=A0out_unlock_bo:
> > > @@ -1212,17 +1213,12 @@ int xe_bo_restore_pinned(struct xe_bo
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
> > > @@ -1271,15 +1267,14 @@ int xe_bo_restore_pinned(struct xe_bo
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
> > > @@ -1532,6 +1527,9 @@ static void xe_ttm_bo_destroy(struct
> > > ttm_buffer_object *ttm_bo)
> > > =C2=A0=C2=A0	if (bo->vm && xe_bo_is_user(bo))
> > > =C2=A0=C2=A0		xe_vm_put(bo->vm);
> > > =C2=A0=20
> > > +	if (bo->parent_obj)
> > > +		xe_bo_put(bo->parent_obj);
> > > +
> > > =C2=A0=C2=A0	mutex_lock(&xe->mem_access.vram_userfault.lock);
> > > =C2=A0=C2=A0	if (!list_empty(&bo->vram_userfault_link))
> > > =C2=A0=C2=A0		list_del(&bo->vram_userfault_link);
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index 81396181aaea..eb5e83c5f233 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -30,6 +30,8 @@ struct xe_bo {
> > > =C2=A0=C2=A0	struct ttm_buffer_object ttm;
> > > =C2=A0=C2=A0	/** @backup_obj: The backup object when pinned and
> > > suspended
> > > (vram only) */
> > > =C2=A0=C2=A0	struct xe_bo *backup_obj;
> > > +	/** @parent_obj: Ref to parent bo if this a backup_obj
> > > */
> > > +	struct xe_bo *parent_obj;
> > > =C2=A0=C2=A0	/** @size: Size of this buffer object */
> > > =C2=A0=C2=A0	size_t size;
> > > =C2=A0=C2=A0	/** @flags: flags for this buffer object */
> >=20
>=20

