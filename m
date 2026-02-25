Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDA9EFD23A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 09:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C33110E732;
	Wed, 25 Feb 2026 09:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ia+vUScu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396ED10E730;
 Wed, 25 Feb 2026 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772012852; x=1803548852;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KDKFs7mJ65npob4Lw38rMKvtzai3MJahqZoZ9FA7UQQ=;
 b=ia+vUScuf/wo8qtpXiU/uDLWa0bCqLHKQbQLxBlkE4NYl62g1tvSc5K0
 8//3dDGDpSi6Z8K06GdXXP4uz+5Ad9TaL5lQwLONK7NPEkODu38dCNySu
 4YJ2wCvU5LqgJKHEhJSoJVwCT+jdTz+XH3MSLOqCkmXbKTevIHJJek7sF
 ubPyomEfnQYsxxsZ+AL2nBPMJatDwA0oaZfRdBOZwsVjedFmsJ0oi0enh
 od9xaZOqr6vImMvEL81N4gUA6VDOjyNCAMhmuJ6ckGlYLNm5TwS/EH6Tn
 NagGJJWmCJpyFcRZCG8LJkE2AtjzyQzw6wf5QSGxn5lE9iSaozg5jxLvJ A==;
X-CSE-ConnectionGUID: 6H4t2NeXRoaSD6XU9vvtXA==
X-CSE-MsgGUID: Lm1JscqoRsOwi3Wo/bB/5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76652832"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76652832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:47:31 -0800
X-CSE-ConnectionGUID: Xh7e24USSna+u6vMn5WRog==
X-CSE-MsgGUID: b18vno3HRzKipbUdWELEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216323679"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:47:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 17/19] drm/i915/overlay: Don't use fetch_and_zero() in
 display code
In-Reply-To: <20260218152806.18885-18-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
 <20260218152806.18885-18-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 11:47:26 +0200
Message-ID: <4cf679b592b1b38850bb14ce297f316fa6c5ea37@intel.com>
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

On Wed, 18 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We don't have fetch_and_zero() on the display side, so stop

Unfortunately, we do have a dupe of it display side too. I wish it would
just die. I approve of the patch anyway.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> using it in the display side intel_overlay_cleanup(). Fortunately
> we don't really have anything to do here apart from freeing the
> data. And we'll keep on clearing the pointer, just in case something
> somewhere cares about it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/d=
rm/i915/display/intel_overlay.c
> index 8b06c2cff7f2..6a2af1f356ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -1554,13 +1554,8 @@ static void i915_overlay_cleanup(struct drm_device=
 *drm)
>=20=20
>  void intel_overlay_cleanup(struct intel_display *display)
>  {
> -	struct intel_overlay *overlay;
> -
> -	overlay =3D fetch_and_zero(&display->overlay);
> -	if (!overlay)
> -		return;
> -
>  	i915_overlay_cleanup(display->drm);
>=20=20
> -	kfree(overlay);
> +	kfree(display->overlay);
> +	display->overlay =3D NULL;
>  }

--=20
Jani Nikula, Intel
