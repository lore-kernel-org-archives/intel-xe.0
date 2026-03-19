Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BFE108E1FF
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 12:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E52210E9E8;
	Thu, 19 Mar 2026 12:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7lvpyTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2410E9EF;
 Thu, 19 Mar 2026 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773923333; x=1805459333;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=L/bU8VT6g12Bhe1eWs10tg7CXJnoSoItJBMbxiSJqPw=;
 b=J7lvpyTRvqkSURMA4XuP859I0N1CJmk8TGBkecWRxtoQQdZfGcmWAsrs
 CzZTzVtUwbjnkgQ9Cg442czDlSr2G91EYOh2dT4vTdZST4Qp0lgbsBvts
 b52qry+mey+JvKL/quZaWPFGA6h0bAz+ZWgQ5Od/OHV3g9ixsU5UZvQ8g
 7wRG56K3EOvBCj02CPu6002KxpcXBpBfyTph4GCsPhG+sbUm6xmfKDYgx
 ro7iJXQ6NyQxUaDZoaHAgvjqn8NtcNyzhvD1qI1uF7TKwu1ey5xTFCYUN
 54HpCHTgWGxsRxJEVJi1hbxvL5/K4zMxJjsuH+0xYL2Y/JvzeoxB7Pfp9 Q==;
X-CSE-ConnectionGUID: FAKG43kISyKcSn84Rn9fWw==
X-CSE-MsgGUID: hM2ITJdpQ8imX6I/uBC4oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78895116"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78895116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 05:28:52 -0700
X-CSE-ConnectionGUID: 76518HoLTsijSBnUONUCWw==
X-CSE-MsgGUID: C/n89U7CSSanMC1bzSBDtw==
X-ExtLoop1: 1
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 05:28:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/i915/wm: Reorder the arguments to
 skl_allocate_plane_ddb()
In-Reply-To: <20260319114034.7093-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
 <20260319114034.7093-3-ville.syrjala@linux.intel.com>
Date: Thu, 19 Mar 2026 14:28:47 +0200
Message-ID: <d7e207ae183b7608760fdf76a51ac60c5505c4d6@intel.com>
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
> Group the ddb and data_rate together in the skl_allocate_plane_ddb()
> arguments. Upcoming changes will adjust the UV plane handling and
> keeing the ddb allocation and the data rate used to calculate it
> together will help with clarity.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/d=
rm/i915/display/skl_watermark.c
> index 0f99a3264f05..1664b84d0387 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -1391,9 +1391,8 @@ struct skl_plane_ddb_iter {
>=20=20
>  static void
>  skl_allocate_plane_ddb(struct skl_plane_ddb_iter *iter,
> -		       struct skl_ddb_entry *ddb,
>  		       const struct skl_wm_level *wm,
> -		       u64 data_rate)
> +		       struct skl_ddb_entry *ddb, u64 data_rate)
>  {
>  	u16 size, extra =3D 0;
>=20=20
> @@ -1523,13 +1522,13 @@ skl_crtc_allocate_plane_ddb(struct intel_atomic_s=
tate *state,
>=20=20
>  		if (DISPLAY_VER(display) < 11 &&
>  		    crtc_state->nv12_planes & BIT(plane_id)) {
> -			skl_allocate_plane_ddb(&iter, ddb_y, &wm->wm[level],
> -					       crtc_state->rel_data_rate_y[plane_id]);
> -			skl_allocate_plane_ddb(&iter, ddb, &wm->uv_wm[level],
> -					       crtc_state->rel_data_rate[plane_id]);
> +			skl_allocate_plane_ddb(&iter, &wm->wm[level],
> +					       ddb_y, crtc_state->rel_data_rate_y[plane_id]);
> +			skl_allocate_plane_ddb(&iter, &wm->uv_wm[level],
> +					       ddb, crtc_state->rel_data_rate[plane_id]);
>  		} else {
> -			skl_allocate_plane_ddb(&iter, ddb, &wm->wm[level],
> -					       crtc_state->rel_data_rate[plane_id]);
> +			skl_allocate_plane_ddb(&iter, &wm->wm[level],
> +					       ddb, crtc_state->rel_data_rate[plane_id]);
>  		}
>=20=20
>  		if (DISPLAY_VER(display) >=3D 30) {

--=20
Jani Nikula, Intel
