Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365AC54757
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 09:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A8910E0F6;
	Wed, 28 Aug 2024 09:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrHjsw/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773C410E0F6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724837474; x=1756373474;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qatbLlS2D66CkcO14PUyRB6TlkVwwaRjDuq9FnurrLA=;
 b=DrHjsw/BYLLkNOzxKS0N1Sx3mBBs0nOlNNC0XxqsmE1WvinAiGa7JgnU
 Yor4z87Mcdap6C/XM+wf4NSyKLC5oUhrNES8YdPvfkR9FRVAWjkVqj3xy
 aqQflQgchb3iYct33FvgxkeIQeZ3s7Cm9pZPAqF31Wu3axNfpKj5616bs
 gW11EufUeqaTPYUC53KpOsYWz38MRL88ZFThnQrRNwL2+hSmmOMlh1Egf
 xelYF324inaIAeXfgPtzl6eJtSaFW2XxEe8FPo89TdkIg0qMwIiKjzZnM
 0v4xpGMCViKLwwkHG7GvkzDZJWpJnSz+VHBxasvgK5YccEdve+VbmiB5Q A==;
X-CSE-ConnectionGUID: UIAEhOD+QuSyKyaCUAAIQg==
X-CSE-MsgGUID: 1mzh3tDRQH62Q0pU+cDDsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27153370"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="27153370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:31:13 -0700
X-CSE-ConnectionGUID: oCdv6U2BROqcofGxC80zfQ==
X-CSE-MsgGUID: f+6H0bC8RjuJoHRWXmGl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67841170"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:31:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip CCS clear for WB type BOs
In-Reply-To: <20240827154910.24841-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240827154910.24841-1-nirmoy.das@intel.com>
Date: Wed, 28 Aug 2024 12:31:06 +0300
Message-ID: <871q29yox1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 27 Aug 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
> HW treats any access to 1-way or 2-way coherent memory as compression
> disabled memory. So for such BOs there is no need to do CCS clearing.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cbe7bf098970..24701272e3af 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
>  	struct device *dev;
>  	struct sg_table sgt;
>  	struct sg_table *sg;
> +	bool skip_ccs_clear:1;

There's no benefit in using a bitfield here, I don't think.

BR,
Jani.

>  };
>=20=20
>  static int xe_tt_map_sg(struct ttm_tt *tt)
> @@ -404,6 +405,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buf=
fer_object *ttm_bo,
>  	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe->mem.gpu_page_clear_sy=
s)
>  		page_flags |=3D TTM_TT_FLAG_CLEARED_ON_FREE;
>=20=20
> +	/* compression is not allowed for cached BO so ccs clear can be skipped=
. */
> +	tt->skip_ccs_clear =3D caching =3D=3D ttm_cached;
>  	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_page=
s);
>  	if (err) {
>  		kfree(tt);
> @@ -664,13 +667,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm=
_bo, bool evict,
>  	struct ttm_resource *old_mem =3D ttm_bo->resource;
>  	u32 old_mem_type =3D old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>  	struct ttm_tt *ttm =3D ttm_bo->ttm;
> +	struct xe_ttm_tt *xe_tt =3D container_of(ttm_bo->ttm, struct xe_ttm_tt,
> +					       ttm);
>  	struct xe_migrate *migrate =3D NULL;
>  	struct dma_fence *fence;
>  	bool move_lacks_source;
>  	bool tt_has_data;
>  	bool needs_clear;
>  	bool handle_system_ccs =3D (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
> -				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
> +				  ttm && ttm_tt_is_populated(ttm) &&
> +				  !xe_tt->skip_ccs_clear) ? true : false;
>  	bool clear_system_pages;
>  	int ret =3D 0;

--=20
Jani Nikula, Intel
