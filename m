Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2BBC54734
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8133D10E169;
	Wed, 28 Aug 2024 08:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEDVNSCS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D993110E169
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724833393; x=1756369393;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wrmVxsbyFMJ0CDmyB78Hx7aeK0ZPNAEXZD8NvnTfL7c=;
 b=NEDVNSCSsDS+bWRm7DihTIFjzzL+Aul3aujX0mDY71gsQKUT1Wiccyu/
 UTt5Lz7A7+voG687PAag92d0r9VtyEjwyznAd6FGAijWkuIV/kVcmtztk
 f9m42TLNcfWwd9FYlj2YiPE5oCXisQ5Iz/L8GupXxwCLFPyVp3DO00sPd
 cKDkBziHxLcE9KujzbpC+WqOQixvze6SU3vbpPRogyoEuqkiYa5+g53QW
 6uErYqwsUBcjfqAqmGvZt5U38pJcceFGYJVESOMXiYRG+SnJSfVSlxOlg
 4W4x1u6rb2RRvnso+EI4zdunrXL4bhPE5OGoLmo9+N9QV6E5LYlJbGedP w==;
X-CSE-ConnectionGUID: SeOEE9jRQvSAVxzBP8gj+w==
X-CSE-MsgGUID: eSJIa9IQT1y2t5NXjPoWig==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13255525"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="13255525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:23:12 -0700
X-CSE-ConnectionGUID: eANRupZbSeixxHTUY71unA==
X-CSE-MsgGUID: oIa4xkwKSPCe4hYlYZmdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67829389"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.168])
 ([10.245.244.168])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:23:11 -0700
Message-ID: <757264cd5bd81ed416ad87cc31657ac6e35d5345.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip CCS clear for WB type BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Wed, 28 Aug 2024 10:23:09 +0200
In-Reply-To: <20240827154910.24841-1-nirmoy.das@intel.com>
References: <20240827154910.24841-1-nirmoy.das@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi,

On Tue, 2024-08-27 at 17:49 +0200, Nirmoy Das wrote:
> HW treats any access to 1-way or 2-way coherent memory as compression
> disabled memory. So for such BOs there is no need to do CCS clearing.
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cbe7bf098970..24701272e3af 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
> =C2=A0	struct device *dev;
> =C2=A0	struct sg_table sgt;
> =C2=A0	struct sg_table *sg;
> +	bool skip_ccs_clear:1;
> =C2=A0};
> =C2=A0
> =C2=A0static int xe_tt_map_sg(struct ttm_tt *tt)
> @@ -404,6 +405,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe-
> >mem.gpu_page_clear_sys)
> =C2=A0		page_flags |=3D TTM_TT_FLAG_CLEARED_ON_FREE;
> =C2=A0
> +	/* compression is not allowed for cached BO so ccs clear can
> be skipped. */
> +	tt->skip_ccs_clear =3D caching =3D=3D ttm_cached;

In theory, BOs that are promoted to fb (not created with the SCANOUT
flag) can AFAICT have caching remaining at ttm_cached, yet still sent
to the display engine, reading uninitialized ccs.

Also I think LNL will be the only HW having the "feature" that clean
cache-lines are written back so in the future we might allow 0-coherent
with ttm_cached.

So IMO we need to improve the detection of "skip_ccs_clear" here.
Otherwise, I'm all for the optimizaion.

/Thomas


> =C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> extra_pages);
> =C2=A0	if (err) {
> =C2=A0		kfree(tt);
> @@ -664,13 +667,16 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	struct ttm_resource *old_mem =3D ttm_bo->resource;
> =C2=A0	u32 old_mem_type =3D old_mem ? old_mem->mem_type :
> XE_PL_SYSTEM;
> =C2=A0	struct ttm_tt *ttm =3D ttm_bo->ttm;
> +	struct xe_ttm_tt *xe_tt =3D container_of(ttm_bo->ttm, struct
> xe_ttm_tt,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm);
> =C2=A0	struct xe_migrate *migrate =3D NULL;
> =C2=A0	struct dma_fence *fence;
> =C2=A0	bool move_lacks_source;
> =C2=A0	bool tt_has_data;
> =C2=A0	bool needs_clear;
> =C2=A0	bool handle_system_ccs =3D (!IS_DGFX(xe) &&
> xe_bo_needs_ccs_pages(bo) &&
> -				=C2=A0 ttm && ttm_tt_is_populated(ttm)) ?
> true : false;
> +				=C2=A0 ttm && ttm_tt_is_populated(ttm) &&
> +				=C2=A0 !xe_tt->skip_ccs_clear) ? true :
> false;
> =C2=A0	bool clear_system_pages;
> =C2=A0	int ret =3D 0;
> =C2=A0

