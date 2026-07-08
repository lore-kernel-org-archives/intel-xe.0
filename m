Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A61C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 12:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE05410F106;
	Wed,  8 Jul 2026 12:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0JswxX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B331410F115
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783514276; x=1815050276;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HmWZcnjkxjwGShMAnKpvXCWgZavbXkBjdSkiakMAU/Q=;
 b=g0JswxX7r1MKOr1DYry6PfKbqTczOOTSSq9N4r+Q3laGsz90efCFymxm
 PKHQC8Jhz6COLnin9MSBlA22vvfDn1Ol8INtpm2cR02mBaNekSd5fSuIi
 8YgEdVWzV2VV9cCerv2ZKKRAibTsqGmzEQgO+FUYtxH3id2JkJgT0zUc+
 ACGSqPL/TbYGAQd1RVU5HqiX0s6mHb/LYPHHnjGfr5/f3aMqOEBdE4Anu
 s2nJW5AgblWDCqllFUYm6w+l/oQH20mNFynLnDC19QEm77I7vt3NJ6rpY
 sVeK6ocAWBJ/1AHICPCTj4Hwdnp9Tw6WSVhJD+6q4fa6EGldvR8IGQaN4 g==;
X-CSE-ConnectionGUID: zSwujDNCRfuKwCwCO0PP/Q==
X-CSE-MsgGUID: fpDtaY1sQGCkfCPkMHBBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84231339"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84231339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 05:37:55 -0700
X-CSE-ConnectionGUID: WBSaY9xqSqCFIACNmCYwdw==
X-CSE-MsgGUID: jH2hvz0qSBqoZnPHGrYL4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="249831970"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.113])
 ([10.245.245.113])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 05:37:54 -0700
Message-ID: <df72ae4a41d526c3db1577532d13260bbe331869.camel@linux.intel.com>
Subject: Re: [PATCH v5 1/2] drm/ttm: Fix UAF on dma-buf attach failure for
 sg BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Christian Konig <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>
Date: Wed, 08 Jul 2026 14:37:51 +0200
In-Reply-To: <20260708091512.205482-5-nitin.r.gote@intel.com>
References: <20260708091512.205482-4-nitin.r.gote@intel.com>
 <20260708091512.205482-5-nitin.r.gote@intel.com>
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

Hi, Nitin,

On Wed, 2026-07-08 at 14:45 +0530, Nitin Gote wrote:
> When a dma-buf importer creates a ttm_bo_type_sg BO with bo-
> >base.resv
> pointing at the exporter's dma_buf->resv and dma_buf_dynamic_attach()
> fails, no dma_buf reference is held. The exporter can be freed before
> the delayed_delete worker calls dma_resv_lock(bo->base.resv), causing
> a
> use-after-free:
>=20
> =C2=A0 Oops: general protection fault, probably for non-canonical address
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x6b6b6b6b6b6b6b9c
> =C2=A0 Workqueue: ttm ttm_bo_delayed_delete [ttm]
> =C2=A0 RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0
>=20
> ttm_bo_individualize_resv() skips the resv swap for all sg BOs to
> keep
> the shared resv available for delayed_delete to release the dma-buf
> mapping. A BO whose attach never succeeded has no mapping to release,
> yet it keeps bo->base.resv pointing at the exporter resv that
> delayed_delete later locks once the exporter is gone.
>=20
> Fix this by checking bo->base.import_attach, which is set only after
> a
> successful attach. The check is placed after dma_resv_copy_fences()
> so
> successful imports still copy fences to _resv before returning,
> keeping
> the shared resv for delayed_delete. Failed imports fall through to
> swap
> resv to _resv, so delayed_delete never locks the stale exporter resv.
>=20
> Closes:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
> Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed cleanup
> path for imported bos")
> Cc: stable@vger.kernel.org=C2=A0# v6.8+
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

It seems you dropped the patch changelog?

Also the WARN_ON_ONCE() we discussed for last version?

/Thomas



> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c | 24 +++++++++++++++---------
> =C2=A01 file changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3980f376e3ba..f157e259dd5f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -203,15 +203,21 @@ static int ttm_bo_individualize_resv(struct
> ttm_buffer_object *bo)
> =C2=A0	if (r)
> =C2=A0		return r;
> =C2=A0
> -	if (bo->type !=3D ttm_bo_type_sg) {
> -		/* This works because the BO is about to be
> destroyed and nobody
> -		 * reference it any more. The only tricky case is
> the trylock on
> -		 * the resv object while holding the lru_lock.
> -		 */
> -		spin_lock(&bo->bdev->lru_lock);
> -		bo->base.resv =3D &bo->base._resv;
> -		spin_unlock(&bo->bdev->lru_lock);
> -	}
> +	/*
> +	 * Successfully imported sg BOs need the shared resv for
> dma-buf
> +	 * cleanup. Failed imports have no attachment or mapping and
> can
> +	 * use the private _resv.
> +	 */
> +	if (bo->type =3D=3D ttm_bo_type_sg && bo->base.import_attach)
> +		return 0;
> +
> +	/* This works because the BO is about to be destroyed and
> nobody
> +	 * references it any more. The only tricky case is the
> trylock on
> +	 * the resv object while holding the lru_lock.
> +	 */
> +	spin_lock(&bo->bdev->lru_lock);
> +	bo->base.resv =3D &bo->base._resv;
> +	spin_unlock(&bo->bdev->lru_lock);
> =C2=A0
> =C2=A0	return r;
> =C2=A0}
