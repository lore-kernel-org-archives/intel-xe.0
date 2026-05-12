Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E7ACD4851
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 10:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3B110E2F8;
	Tue, 12 May 2026 10:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLl8Ziac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB5A10E2F8;
 Tue, 12 May 2026 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778582912; x=1810118912;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QZgLnludgqHy+zk/QMFxd0FbIc3BUwgZifollD34RgA=;
 b=bLl8ZiacvRj81t0h12gsnZ0430jRuZuadHexgPkKADLN+GUPjK8UqiQS
 53vXUKRtgLtemAYGFQSFHeCRV03p0WH37LY1aCOvGDaSPB15L7hw+u4uR
 G2QrbkG8UHYnc5rgwPu8jNs4GgTNYfgLwxuTqRNjRFgfY9gloWHusINso
 vn/eL56unPd2egNQC7zxHClCoBS6yb9iYdASPE8koX+wg/9CCHXr5bbCF
 SEZEQ1OlxN5JIxvQxE2zKDebtOEFJQa7StVXnC/9SSUYZ2MVi0XH0FLn9
 c2WdHycmniY3cfH2Ft6u7jJoWDvpLqMXq8hs2FTWOMoh13TglHjF7HlPM g==;
X-CSE-ConnectionGUID: 8chSfjBjTfGRdarzx1Q0tA==
X-CSE-MsgGUID: FcPrQSrES/GSg4J5IoxI/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90589452"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90589452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:48:29 -0700
X-CSE-ConnectionGUID: tYQP95IKRqmonz6SDG+LnQ==
X-CSE-MsgGUID: 8ecKhElmQGCu1GUoUBFxkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="236880081"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:48:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/14] drm/xe: Abstract the initial FB PTE checks a bit
In-Reply-To: <20260511214122.8468-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-10-ville.syrjala@linux.intel.com>
Date: Tue, 12 May 2026 13:48:22 +0300
Message-ID: <4cc2bd3086c250786df3a059cec22921242575d9@intel.com>
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

On Tue, 12 May 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Add a few helpers that allow us to abstract the xe initial FB PTE
> check a bit. Still very ad-hoc compared to the nicely abstracted
> i915 counterpart, but whatever.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index b7e0685351bb..0dabc5709d01 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -18,8 +18,19 @@
>  #include "xe_fb_pin.h"
>  #include "xe_ggtt.h"
>  #include "xe_mmio.h"
> +#include "xe_ttm_stolen_mgr.h"

Not sure how this is related to the changes here.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  #include "xe_vram_types.h"
>=20=20
> +static bool is_pte_local(u64 pte)
> +{
> +	return pte & XE_GGTT_PTE_DM;
> +}
> +
> +static bool need_pte_local(struct xe_device *xe)
> +{
> +	return IS_DGFX(xe);
> +}
> +
>  static struct xe_bo *
>  initial_plane_bo(struct xe_device *xe,
>  		 struct intel_initial_plane_config *plane_config)
> @@ -43,13 +54,13 @@ initial_plane_bo(struct xe_device *xe,
>  	if (IS_DGFX(xe)) {
>  		u64 pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
>=20=20
> -		if (!(pte & XE_GGTT_PTE_DM)) {
> -			drm_err(&xe->drm,
> -				"Initial plane programming missing DM bit\n");
> +		if (is_pte_local(pte) !=3D need_pte_local(xe)) {
> +			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
>  			return NULL;
>  		}
>=20=20
>  		phys_base =3D pte & ~(page_size - 1);
> +
>  		flags |=3D XE_BO_FLAG_VRAM0;
>=20=20
>  		/*

--=20
Jani Nikula, Intel
