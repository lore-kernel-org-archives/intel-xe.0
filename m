Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9D3CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 12:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350410E14E;
	Thu, 14 Aug 2025 12:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYAp1zza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17FD10E14E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755174272; x=1786710272;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gPaUcqnCPSWaTEFosY0PEhmdV5StmjG1MsYZAq6rPbM=;
 b=VYAp1zza2680AA/ALE6NR9sdB3WnMRJuhRnv+xLdom/H2ayA3ek/fPiv
 GvhWbIx3ouwFD4GCGlKeW0lts/BGIadjIZBPrdeVO1Q6GTmAVVqlGvadm
 KnB6KfRhrOM64HGm3Z00gvMCMnuGXP34nVTXBgcAPjafPvTVZtkKOja05
 yZwqeHUUAFRzH8pOZwQ7GoMlMcn6cZPMc8QzHSMDaI/QYLFp/GW3FmLgp
 xuPyXH0LDeZxglQ9aBBufLnhwoph0Gbo9oLIGwxG8YBLRwwREkVWZvG8L
 tZHTraLpodn8WUKXqcBMita5zuG+IBg6ah/KmVpmi00optEefHFTdP7Q6 g==;
X-CSE-ConnectionGUID: AtX3rU9mQEGB1TWblzkjMA==
X-CSE-MsgGUID: jWOWwokDTIqUYgyJDL9rrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57391172"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57391172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 05:24:31 -0700
X-CSE-ConnectionGUID: cBzqqW8OS7GHK2S1yDOOAA==
X-CSE-MsgGUID: GGnayU1SQaKQlfucmn4OYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171207172"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.149])
 ([10.245.244.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 05:24:29 -0700
Message-ID: <e1c080a5dc2e9b1903e93ceadb19870d1e2c07a2.camel@linux.intel.com>
Subject: Re: [PATCH 07/15] drm/xe: Convert SVM validation for exhaustive
 eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Thu, 14 Aug 2025 14:24:27 +0200
In-Reply-To: <aJyv9J8I/NGYpmHj@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-8-thomas.hellstrom@linux.intel.com>
 <aJyv9J8I/NGYpmHj@lstrano-desk.jf.intel.com>
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

On Wed, 2025-08-13 at 08:32 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:13PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Convert SVM validation to support exhaustive eviction,
> > using xe_validation_guard().
> >=20
>=20
> Do we not need to validation guard + xe_vm_set_validation_exec around
> xe_vm_range_rebind, given that on first fault of range we can
> allocate
> PTs?

Yes, you're right. I see this comment in a later patch as well.
The reason the asserts didn't trigger here is that we were leaking an
xe_vm_set_validation(). I'm fixing that up in v2 and add more asserts
so that's much less likely to happen.

Ideally we'd want to pass the drm_exec (perhaps part of a pt_details
struct) all the way down to pt allocation. But when I tried that during
developement the headers became quite bloated.

/Thomas


>=20
> Matt
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c | 63 ++++++++++++++++++--------------=
-
> > ----
> > =C2=A01 file changed, 30 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 39e3aa6df25a..ba85665d85d4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -699,51 +699,48 @@ static int xe_drm_pagemap_populate_mm(struct
> > drm_pagemap *dpagemap,
> > =C2=A0	struct xe_device *xe =3D vr->xe;
> > =C2=A0	struct device *dev =3D xe->drm.dev;
> > =C2=A0	struct drm_buddy_block *block;
> > +	struct xe_validation_ctx vctx;
> > =C2=A0	struct list_head *blocks;
> > -	struct drm_exec *exec;
> > +	struct drm_exec exec;
> > =C2=A0	struct xe_bo *bo;
> > -	ktime_t time_end =3D 0;
> > -	int err, idx;
> > +	int err =3D 0, idx;
> > =C2=A0
> > =C2=A0	if (!drm_dev_enter(&xe->drm, &idx))
> > =C2=A0		return -ENODEV;
> > =C2=A0
> > =C2=A0	xe_pm_runtime_get(xe);
> > -	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > -
> > - retry:
> > -	bo =3D xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
> > -				 ttm_bo_type_device,
> > -				 (IS_DGFX(xe) ?
> > XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> > -				 XE_BO_FLAG_CPU_ADDR_MIRROR,
> > exec);
> > -	if (IS_ERR(bo)) {
> > -		err =3D PTR_ERR(bo);
> > -		if (xe_vm_validate_should_retry(NULL, err,
> > &time_end))
> > -			goto retry;
> > -		goto out_pm_put;
> > -	}
> > =C2=A0
> > -	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> > -				&dpagemap_devmem_ops, dpagemap,
> > end - start);
> > -
> > -	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > >blocks;
> > -	list_for_each_entry(block, blocks, link)
> > -		block->private =3D vr;
> > +	xe_validation_guard(&vctx, &xe->val, &exec, 0, err, false)
> > {
> > +		bo =3D xe_bo_create_locked(xe, NULL, NULL, end -
> > start,
> > +					 ttm_bo_type_device,
> > +					 (IS_DGFX(xe) ?
> > XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> > +				=09
> > XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (IS_ERR(bo)) {
> > +			err =3D PTR_ERR(bo);
> > +			xe_validation_retry_on_oom(&vctx, &err);
> > +			break;
> > +		}
> > =C2=A0
> > -	xe_bo_get(bo);
> > +		drm_pagemap_devmem_init(&bo->devmem_allocation,
> > dev, mm,
> > +					&dpagemap_devmem_ops,
> > dpagemap, end - start);
> > =C2=A0
> > -	/* Ensure the device has a pm ref while there are device
> > pages active. */
> > -	xe_pm_runtime_get_noresume(xe);
> > -	err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation, mm,
> > -					=C2=A0=C2=A0=C2=A0 start, end,
> > timeslice_ms,
> > -					=C2=A0=C2=A0=C2=A0
> > xe_svm_devm_owner(xe));
> > -	if (err)
> > -		xe_svm_devmem_release(&bo->devmem_allocation);
> > +		blocks =3D &to_xe_ttm_vram_mgr_resource(bo-
> > >ttm.resource)->blocks;
> > +		list_for_each_entry(block, blocks, link)
> > +			block->private =3D vr;
> > =C2=A0
> > -	xe_bo_unlock(bo);
> > -	xe_bo_put(bo);
> > +		xe_bo_get(bo);
> > =C2=A0
> > -out_pm_put:
> > +		/* Ensure the device has a pm ref while there are
> > device pages active. */
> > +		xe_pm_runtime_get_noresume(xe);
> > +		err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation, mm,
> > +						=C2=A0=C2=A0=C2=A0 start, end,
> > timeslice_ms,
> > +						=C2=A0=C2=A0=C2=A0
> > xe_svm_devm_owner(xe));
> > +		if (err)
> > +			xe_svm_devmem_release(&bo-
> > >devmem_allocation);
> > +		xe_bo_unlock(bo);
> > +		xe_bo_put(bo);
> > +	}
> > =C2=A0	xe_pm_runtime_put(xe);
> > =C2=A0	drm_dev_exit(idx);
> > =C2=A0
> > --=20
> > 2.50.1
> >=20

