Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0D3606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IgO6szis
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E139D10E408;
	Wed, 11 Nov 2026 12:22:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E8710E408
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794399754; x=1825935754;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=y2dqGhOa93wXUVaiO7Kp14vgI2P+rsdkg+4VLWvm4r8=;
 b=IgO6szisyk5XIUdm+uezDq0jbQmzoTW4iOZeEsb+TBG8lmxPWI13csP4
 OGrtRKegvpsUmJ7NJTqiI76Yu58azq/iiCVlQVy6Ut1hvmBNAQ4mIozUt
 b8vgNH4ytoWShLojYYEgW0zLULufb/8aUrYAd2qYq3Pgc9y9xqgWABEu9
 skEQwueq1tAbpOhDVJ6GEJMC26LOzAw5iIDmM2N90fVc3jq7d9LC33tDd
 hv5eme9e9ME/HYZTu7sYavq14qq4xqEEAn1ffXRIzR0s1zN46aHjSyWfu
 fTkxWCqDeTT5Yu5ZRxGVJedlVYt/GEM3shlKL8Sv9mSdME5TRhD8qGkPd g==;
X-CSE-ConnectionGUID: 4Teg+XEPSo2INtiN69OJzQ==
X-CSE-MsgGUID: 7vY4JOqfR1qkevPUfstioQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079485"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3079485"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:22:34 -0800
X-CSE-ConnectionGUID: bCXsTv4CRryuFtfx8WC3zQ==
X-CSE-MsgGUID: k3wOa2j8ShSLM1+W40C+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8503562"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.171])
 ([10.245.245.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:22:33 -0800
Message-ID: <e009602187fd07904afb6672f6a36587fc59cb0f.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/dma-buf: Validate BOs on export to charge the
 exporter
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie
 <airlied@redhat.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org
Date: Wed, 11 Nov 2026 13:22:30 +0100
In-Reply-To: <fc3a08df-bc2e-47bf-a0f8-a7e284e5f3c2@intel.com>
References: <20261111100929.2228-1-thomas.hellstrom@linux.intel.com>
 <fc3a08df-bc2e-47bf-a0f8-a7e284e5f3c2@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Matt

Thanks for reviewing!

On Wed, 2026-11-11 at 12:18 +0000, Matthew Auld wrote:
> On 11/11/2026 10:09, Thomas Hellstr=C3=B6m wrote:
> > xe_gem_prime_export() calls ttm_bo_setup_export() to make sure the
> > exporter is charged for the memory backing an exported BO. However,
> > that only populates a TTM_PL_SYSTEM tt. A BO that has been evicted,
> > or
> > that has deferred backing, will instead get its memory allocated
> > when
> > the importer maps it. For p2p imports this happens through
> > xe_bo_validate() in xe_dma_buf_map(), so the importer, not the
> > exporter, is charged for the allocation.
> >=20
> > Call xe_bo_validate() at export time instead, so that the BO is
> > moved
> > into its preferred placement and the exporter is charged.
>=20
> Is it maybe also worth mentioning somewhere the unreclaimable pages=20
> angle? I could be mistaken here, but I think that was maybe also the=20
> issue I saw in a workload. For example:
>=20
> 1. Create say 100G VRAM buffer. Use DEFERRED. This leaves lingering
> tt=20
> structure.
>=20
> 2. Validate it on native side. This is now resident in VRAM. But
> still=20
> has lingering tt.
>=20
> 3. Export it. This now populates 100G worth of TT pages due to
> lingering=20
> tt. But we now have a populated VRAM buffer which is also populated
> with=20
> 100G TT pages. That 100G TT pages is not reclaimable and is hidden
> from=20
> shrinker since this still just looks like normal VRAM buffer.

Since we have another patch to fix that, which I hope will go in before
this one, I think mentioning it here will be unnecessary.

>=20
> >=20
> > Do the purgeable checks and the validation in the same
> > xe_validation_guard() transaction, to avoid locking the BO twice.
> >=20
> > The commit message and code was drafted using LLM.
> >=20
> > Link:
> > https://patchwork.freedesktop.org/patch/747480/?series=3D172524&rev=3D1
> > Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v6.18+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks!

Thomas

>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_dma_buf.c | 76 +++++++++++++++++----------=
-
> > -----
> > =C2=A0 1 file changed, 39 insertions(+), 37 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index 5bf13dc4b61d..90c9b90de552 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -263,60 +263,62 @@ struct drm_gem_object
> > *xe_dma_buf_to_gem(struct drm_device *dev,
> > =C2=A0 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj,
> > int flags)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0=C2=A0	struct dma_buf *buf;
> > -	struct ttm_operation_ctx ctx =3D {
> > -		.interruptible =3D true,
> > -		.no_wait_gpu =3D true,
> > -		/* We opt to avoid OOM on system pages allocations
> > */
> > -		.gfp_retry_mayfail =3D true,
> > -		.allow_res_evict =3D false,
> > -	};
> > -	int ret;
> > +	int ret =3D 0;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (bo->vm)
> > =C2=A0=C2=A0		return ERR_PTR(-EPERM);
> > =C2=A0=20
> > -	/*
> > -	 * Reject exporting purgeable BOs. DONTNEED BOs can be
> > purged
> > -	 * at any time, making the exported dma-buf unusable.
> > Purged BOs
> > -	 * have no backing store and are permanently invalid.
> > -	 */
> > -	ret =3D xe_bo_lock(bo, true);
> > -	if (ret)
> > -		return ERR_PTR(ret);
> > +	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec,
> > +			=C2=A0=C2=A0=C2=A0 (struct xe_val_flags) {.interruptible
> > =3D true}, ret) {
> > +		ret =3D drm_exec_lock_obj(&exec, &bo->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (ret)
> > +			break;
> > =C2=A0=20
> > -	if (xe_bo_madv_is_dontneed(bo)) {
> > -		ret =3D -EBUSY;
> > -		goto out_unlock;
> > -	}
> > +		/*
> > +		 * Reject exporting purgeable BOs. DONTNEED BOs
> > can be purged
> > +		 * at any time, making the exported dma-buf
> > unusable. Purged BOs
> > +		 * have no backing store and are permanently
> > invalid.
> > +		 */
> > +		if (xe_bo_madv_is_dontneed(bo)) {
> > +			ret =3D -EBUSY;
> > +			break;
> > +		}
> > =C2=A0=20
> > -	if (xe_bo_is_purged(bo)) {
> > -		ret =3D -EINVAL;
> > -		goto out_unlock;
> > -	}
> > +		if (xe_bo_is_purged(bo)) {
> > +			ret =3D -EINVAL;
> > +			break;
> > +		}
> > =C2=A0=20
> > -	xe_bo_willneed_get_locked(bo);
> > -	xe_bo_unlock(bo);
> > +		/*
> > +		 * Make sure the BO is backed in its preferred
> > placement so that
> > +		 * the exporter, rather than the importer, is
> > charged for the
> > +		 * memory allocation.
> > +		 */
> > +		ret =3D xe_bo_validate(bo, NULL, false, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_validation_retry_on_oom(&ctx, &ret);
> > +		if (ret)
> > +			break;
> > =C2=A0=20
> > -	ret =3D ttm_bo_setup_export(&bo->ttm, &ctx);
> > +		xe_bo_willneed_get_locked(bo);
> > +	}
> > =C2=A0=C2=A0	if (ret)
> > -		goto out_put;
> > +		return ERR_PTR(ret);
> > =C2=A0=20
> > =C2=A0=C2=A0	buf =3D drm_gem_prime_export(obj, flags);
> > =C2=A0=C2=A0	if (IS_ERR(buf)) {
> > -		ret =3D PTR_ERR(buf);
> > -		goto out_put;
> > +		xe_bo_lock(bo, false);
> > +		xe_bo_willneed_put_locked(bo);
> > +		xe_bo_unlock(bo);
> > +		return buf;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	buf->ops =3D &xe_dmabuf_ops;
> > =C2=A0=C2=A0	return buf;
> > -
> > -out_put:
> > -	xe_bo_lock(bo, false);
> > -	xe_bo_willneed_put_locked(bo);
> > -out_unlock:
> > -	xe_bo_unlock(bo);
> > -	return ERR_PTR(ret);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static struct drm_gem_object *
