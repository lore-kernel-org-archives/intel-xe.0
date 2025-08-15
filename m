Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D79ACA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 06:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FC210E23E;
	Fri, 15 Aug 2025 06:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k22qBZ1K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247CE10E23E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755241039; x=1786777039;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Gk3x/vzDyowtQqGiGbTZn35f27oq6xAKlYq/110opM0=;
 b=k22qBZ1KdHgJE62nCNOxKEqOW/qiaZSBM6dcpIQHJGC1NNq06nmR3uqi
 2+/qxlo8ha408ycB5Y7Uo8VS46LQvbNAUpQpJ+xzFqVN6bDgbqyaCW7Pa
 nBgDtzFkB3I/+x83hTmxaK/gqhEDL0c3DIX1ThKyQIH+2tYomJDtubI5B
 BbtY0XlaOqJuaVrNtvOCabGUwsQ6c3ht7OoaHqri3bcBAYS7ABTqB5IDn
 ovPPyxKYIIC9tTxQI1HGxmuMYVdghjYi7S9OXWDOKgyPuKWbN7ir/FrFh
 LuIEH8NsyyDtOM+tmakLoLK2Cc/qca+e2GNKVqI8wRN0MfAtYOnF9jAh9 A==;
X-CSE-ConnectionGUID: zJneQvfQQMiQNPsR5/7Vrw==
X-CSE-MsgGUID: ZeK1Rf7ITguntfFCpxwEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82998367"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="82998367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 23:57:18 -0700
X-CSE-ConnectionGUID: xJLtkoJHSsytyk922IyIsg==
X-CSE-MsgGUID: pfud7R2KTJOmWgqFwn5/5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="190663611"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 23:57:17 -0700
Message-ID: <5132cd40f871dce781be29a33ff8eb2840ef5015.camel@linux.intel.com>
Subject: Re: [PATCH 11/15] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Fri, 15 Aug 2025 08:57:14 +0200
In-Reply-To: <aJ5JI3mOyxeNYS2c@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
 <aJ5JI3mOyxeNYS2c@lstrano-desk.jf.intel.com>
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

On Thu, 2025-08-14 at 13:37 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:17PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Convert dma-buf migration to XE_PL_TT and dma-buf import to
> > support exhaustive eviction, using xe_validation_guard().
> > It seems unlikely that the import would result in an -ENOMEM,
> > but convert import anyway for completeness.
> >=20
> > The dma-buf map_attachment() functionality unfortunately doesn't
> > support passing a drm_exec, which means that foreign devices
> > validating a dma-buf that we exported will not, unless they are
> > xeKMD devices, participate in the exhaustive eviction scheme.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 59 +++++++++++++++++++++++-----=
-
> > ----
> > =C2=A01 file changed, 42 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index 78a827d4e726..56df1d84df21 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -163,16 +163,27 @@ static int xe_dma_buf_begin_cpu_access(struct
> > dma_buf *dma_buf,
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > =C2=A0	bool reads =3D=C2=A0 (direction =3D=3D DMA_BIDIRECTIONAL ||
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 direction =3D=3D DMA_FROM_=
DEVICE);
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > +	int ret =3D 0;
> > =C2=A0
> > =C2=A0	if (!reads)
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	/* Can we do interruptible lock here? */
> > -	xe_bo_lock(bo, false);
> > -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> > -	xe_bo_unlock(bo);
> > -
> > +	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec,
> > 0, ret, false) {
> > +		ret =3D drm_exec_lock_obj(&exec, &bo->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (ret)
> > +			goto out;
>=20
> Does this work? The label is out of scope, which I believe is a no-no
> with guards if I correctly understand the rules detailed in the
> cleanup.h kernel documentation.

Good point.

My impression is that it would work in this particular case, since we
just exit a scope.

But since it obviously goes against the guidelines in cleanup.h we
shouln't be using these and replace them with a break and an error
check after the guard if needed.

I'll fix this up and look at other instances of this to.

Thanks,
Thomas


>=20
> > +
> > +		ret =3D xe_bo_migrate(bo, XE_PL_TT, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_validation_retry_on_oom(&ctx, &ret);
> > +	}
> > +out:
> > +	/* If we failed, cpu-access takes place in current
> > placement. */
> > +	(void)ret;
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > @@ -211,24 +222,38 @@ xe_dma_buf_init_obj(struct drm_device *dev,
> > struct xe_bo *storage,
> > =C2=A0{
> > =C2=A0	struct dma_resv *resv =3D dma_buf->resv;
> > =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_gem_object *dummy_obj;
> > +	struct drm_exec exec;
> > =C2=A0	struct xe_bo *bo;
> > -	int ret;
> > -
> > -	dma_resv_lock(resv, NULL);
> > -	bo =3D ___xe_bo_create_locked(xe, storage, NULL, resv, NULL,
> > dma_buf->size,
> > -				=C2=A0=C2=A0=C2=A0 0, /* Will require 1way or
> > 2way for vm_bind */
> > -				=C2=A0=C2=A0=C2=A0 ttm_bo_type_sg,
> > XE_BO_FLAG_SYSTEM, exec);
> > -	if (IS_ERR(bo)) {
> > -		ret =3D PTR_ERR(bo);
> > -		goto error;
> > +	int ret =3D 0;
> > +
> > +	dummy_obj =3D drm_gpuvm_resv_object_alloc(&xe->drm);
> > +	if (!dummy_obj)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	dummy_obj->resv =3D resv;
> > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false)
> > {
> > +		ret =3D drm_exec_lock_obj(&exec, dummy_obj);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (ret)
> > +			goto error;
> > +
> > +		bo =3D ___xe_bo_create_locked(xe, storage, NULL,
> > resv, NULL, dma_buf->size,
> > +					=C2=A0=C2=A0=C2=A0 0, /* Will require
> > 1way or 2way for vm_bind */
> > +					=C2=A0=C2=A0=C2=A0 ttm_bo_type_sg,
> > XE_BO_FLAG_SYSTEM, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (IS_ERR(bo)) {
> > +			ret =3D PTR_ERR(bo);
> > +			xe_validation_retry_on_oom(&ctx, &ret);
> > +			goto error;
>=20
> Same question / issue here with goto error label.
>=20
> Matt
>=20
> > +		}
> > =C2=A0	}
> > -	dma_resv_unlock(resv);
> > +	drm_gem_object_put(dummy_obj);
> > =C2=A0
> > =C2=A0	return &bo->ttm.base;
> > =C2=A0
> > =C2=A0error:
> > -	dma_resv_unlock(resv);
> > =C2=A0	return ERR_PTR(ret);
> > =C2=A0}
> > =C2=A0
> > --=20
> > 2.50.1
> >=20

