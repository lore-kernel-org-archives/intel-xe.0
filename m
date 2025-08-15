Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E570CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 15:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016A110E981;
	Fri, 15 Aug 2025 15:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8o6LMEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5EF10E981
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755270332; x=1786806332;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2/lfcYt9qUcfpmFxehoDGIVbhg+RsFNJgyoRutSQVok=;
 b=g8o6LMEWuQwxC9LvSZUSd/xqTlpbVHD8D0jSM+X5vI4fUD6s8I9UxJCk
 qURu5BICzcKqPfz7+BNljJwvUezXAqd2SLLWBW1dBMjrkHWjYxbcaaInV
 ixGlA3RJa2Al8Mz8rLn/yzTfe5caJArkq5y8KQFHTP5lDsIBWWxSoip7q
 3ui13d3Y+NgXGfTGJ+9J0P2MvxZ0KjyiGRUnRuZn8b2bQtF68jHmptbiO
 BCf5ghyzAtZc8EIeV1hjtY5kNMakO/YUbubLrGY5pBYpOZMtLTngmTi1k
 nHCY/f+RwgbIhsi9ipWGWoOMCpKkYRBpEHbGyVzG85YK1JrX4LJx8kx46 g==;
X-CSE-ConnectionGUID: 9U1YYmugTNawqwP9joQ1bA==
X-CSE-MsgGUID: HjPDGSfhTmyDRzdyq0h0BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57548279"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57548279"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 08:05:32 -0700
X-CSE-ConnectionGUID: KQDiAXArR++fkujtV8hJow==
X-CSE-MsgGUID: ytk5kcZyRoqhED2ZFoJDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="204210587"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 08:05:30 -0700
Message-ID: <d3f1f6d1cb5054e3890b77aa9990cbedf2336bca.camel@linux.intel.com>
Subject: Re: [PATCH 11/15] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Fri, 15 Aug 2025 17:05:27 +0200
In-Reply-To: <aJ0Fpv73LuczBZqW@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
 <aJ0Fpv73LuczBZqW@lstrano-desk.jf.intel.com>
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

On Wed, 2025-08-13 at 14:37 -0700, Matthew Brost wrote:
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
> > +
> > +		ret =3D xe_bo_migrate(bo, XE_PL_TT, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_validation_retry_on_oom(&ctx, &ret);
> > +	}
> > +out:
> > +	/* If we failed, cpu-access takes place in current
> > placement. */
> > +	(void)ret;
>=20
> Do you need the above line of code? I don't see this often in kernel
> code.

It's merely to annotate that we don't care about the returned value.
But I can remove it.

/Thomas


>=20
> Nit aside, patch LGTM.
>=20
> Matt
>=20
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

