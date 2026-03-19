Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B281090223
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 13:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0589010EA12;
	Thu, 19 Mar 2026 13:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfA4HWjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE810EA11;
 Thu, 19 Mar 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773926499; x=1805462499;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lM9y6wzHS7t8xvE/V97hUN4IQ6O4maMTt/WHrvkEZbo=;
 b=kfA4HWjRkX5UsY16+3U15Gppo6DZgtciUg+pD/ZUfgDWtXF2yRcJBFiK
 QaEnst7575mscBaXNsmurO5hGnVlPkN2OS2nQcC5hOgVC4ECgbCKX/Ul4
 liPivgUHgJTTi8RQ3MO9qdd6coXoj3lHvh7q6wJw1lIHviSIwOyTkOQmv
 lu71MOG6/9oSMJ4EfkIKhd8kmZTPvjRo14l0TpzbxYdVJwWBL6UHyKsl/
 lOsCy0ggSOodj/Nu19EY9HoBRmIjEvbYtj+Kc283DwJL9CoDcMSAqJjI0
 eb7BMu6GW4BVgB043skogwjGATU5WHko/Qy2zTS4f/El8Dhk4EvDOeqXT A==;
X-CSE-ConnectionGUID: oXMwkjVNTZC+8yJx9PPWfg==
X-CSE-MsgGUID: 2ggtaw21RtSbnuxbsFdtSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75179599"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="75179599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 06:21:39 -0700
X-CSE-ConnectionGUID: 6UFgQ3xORhWNxCBdU/V67w==
X-CSE-MsgGUID: /T580cNTQBST7wXU5qg0Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="218420524"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 06:21:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/i915/wm: Extract skl_allocate_plane_ddb_nv12()
In-Reply-To: <20260319114034.7093-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
 <20260319114034.7093-5-ville.syrjala@linux.intel.com>
Date: Thu, 19 Mar 2026 15:21:30 +0200
Message-ID: <c9e7d3c8823ad023899b69ac3ac89af837b05b5c@intel.com>
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

On Thu, 19 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Extract skl_allocate_plane_ddb_nv12() as the compute counterpart to
> skl_check_wm_level_nv12(). Mainly to hide some of the clutter from
> skl_crtc_allocate_plane_ddb().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 40 ++++++++++++++------
>  1 file changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/d=
rm/i915/display/skl_watermark.c
> index 24978f312fec..7c4c42dde991 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -1390,9 +1390,9 @@ struct skl_plane_ddb_iter {
>  };
>=20=20
>  static void
> -skl_allocate_plane_ddb(struct skl_plane_ddb_iter *iter,
> -		       const struct skl_wm_level *wm,
> -		       struct skl_ddb_entry *ddb, u64 data_rate)
> +_skl_allocate_plane_ddb(struct skl_plane_ddb_iter *iter,
> +			u16 min_ddb_alloc,
> +			struct skl_ddb_entry *ddb, u64 data_rate)
>  {
>  	u16 size, extra =3D 0;
>=20=20
> @@ -1409,12 +1409,31 @@ skl_allocate_plane_ddb(struct skl_plane_ddb_iter =
*iter,
>  	 * to avoid skl_ddb_add_affected_planes() adding them to
>  	 * the state when other planes change their allocations.
>  	 */
> -	size =3D wm->min_ddb_alloc + extra;
> +	size =3D min_ddb_alloc + extra;
>  	if (size)
>  		iter->start =3D skl_ddb_entry_init(ddb, iter->start,
>  						 iter->start + size);
>  }
>=20=20
> +static void
> +skl_allocate_plane_ddb(struct skl_plane_ddb_iter *iter,
> +		       const struct skl_wm_level *wm,
> +		       struct skl_ddb_entry *ddb, u64 data_rate)
> +{
> +	_skl_allocate_plane_ddb(iter, wm->min_ddb_alloc, ddb, data_rate);
> +}
> +
> +static void
> +skl_allocate_plane_ddb_nv12(struct skl_plane_ddb_iter *iter,
> +			    const struct skl_wm_level *wm,
> +			    struct skl_ddb_entry *ddb_y, u64 data_rate_y,
> +			    const struct skl_wm_level *uv_wm,
> +			    struct skl_ddb_entry *ddb, u64 data_rate)
> +{
> +	_skl_allocate_plane_ddb(iter, wm->min_ddb_alloc, ddb_y, data_rate_y);
> +	_skl_allocate_plane_ddb(iter, uv_wm->min_ddb_alloc, ddb, data_rate);
> +}
> +
>  static int
>  skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
>  			    struct intel_crtc *crtc)
> @@ -1521,15 +1540,14 @@ skl_crtc_allocate_plane_ddb(struct intel_atomic_s=
tate *state,
>  			continue;
>=20=20
>  		if (DISPLAY_VER(display) < 11 &&
> -		    crtc_state->nv12_planes & BIT(plane_id)) {
> +		    crtc_state->nv12_planes & BIT(plane_id))
> +			skl_allocate_plane_ddb_nv12(&iter, &wm->wm[level],
> +						    ddb_y, crtc_state->rel_data_rate_y[plane_id],
> +						    &wm->uv_wm[level],
> +						    ddb, crtc_state->rel_data_rate[plane_id]);
> +		else
>  			skl_allocate_plane_ddb(&iter, &wm->wm[level],
> -					       ddb_y, crtc_state->rel_data_rate_y[plane_id]);
> -			skl_allocate_plane_ddb(&iter, &wm->uv_wm[level],
>  					       ddb, crtc_state->rel_data_rate[plane_id]);
> -		} else {
> -			skl_allocate_plane_ddb(&iter, &wm->wm[level],
> -					       ddb, crtc_state->rel_data_rate[plane_id]);
> -		}
>=20=20
>  		if (DISPLAY_VER(display) >=3D 30) {
>  			*min_ddb =3D wm->wm[0].min_ddb_alloc;

--=20
Jani Nikula, Intel
