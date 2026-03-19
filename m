Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13951090227
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 13:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34F410E152;
	Thu, 19 Mar 2026 13:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzi5lBu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CDD10E13A;
 Thu, 19 Mar 2026 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773927878; x=1805463878;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=n6ucgPxM1PjvzqgUHkXG7ElCMPPgJVEVcKFcsR157q8=;
 b=mzi5lBu7q7Le+qlep6ze9gLTF7+vz09JB6lgQ84nUakCNzeJo0A1EXnQ
 hf43VeUSrmFsW/BDDmCjvUmC7Ls9J+AH/lgMALyF1iIS/7WBOpDcMYcLt
 WwSslJFCgpnm00g6JXJPE/4ErYbidJ0iVUablLX5wZGsU6n9AaAzsvBiZ
 K66wprVsHI3HY8JsVBbmoUm717eqynv1V1zPhMUTyLfImX/RQNjr43wWB
 XPLtUAKQZNqvJRJm2KsttdYDoWlCYwqHEGFcW3MNPrtcDTjXJR+6j7/Hj
 4rL+T53y4JzDQfPW+gFwIwJQOSeAXJnVS8uHe2q/56JScnm7Ui4QmVGvZ w==;
X-CSE-ConnectionGUID: Sch46zjORTax8i/U4zQV1w==
X-CSE-MsgGUID: iZuIAuADQB2AtqmJcPZRXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85624931"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="85624931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 06:44:38 -0700
X-CSE-ConnectionGUID: sr/aoHDwTpqVriHHM+htWQ==
X-CSE-MsgGUID: mpM7bIP1Tk6sLL2EdWm7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="227089362"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 06:44:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/i915/wm: Include ddb_y in
 skl_print_wm_changes() on pre-icl
In-Reply-To: <20260319114034.7093-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
 <20260319114034.7093-9-ville.syrjala@linux.intel.com>
Date: Thu, 19 Mar 2026 15:44:29 +0200
Message-ID: <b7e66b0a5203d6d96f8415f3effc5c5ba7544c2e@intel.com>
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
> Pre-icl doesn't use a separate hardware plane for Y scanout,
> and instead it's all handled magially by the hardware. We

*magically

> do still need to allocate DDB space for the Y color plane
> though (PLANE_NV12_BUF_CFG). Include that information in the
> debugs so that we know where it ended up.
>
> On icl+ the equivalent information is dumped as the hardware
> Y plane's normal ddb allocation.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/d=
rm/i915/display/skl_watermark.c
> index 8687026935e9..345767349988 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -2735,10 +2735,17 @@ skl_print_wm_changes(struct intel_atomic_state *s=
tate)
>  			old =3D &old_crtc_state->wm.skl.plane_ddb[plane_id];
>  			new =3D &new_crtc_state->wm.skl.plane_ddb[plane_id];
>=20=20
> -			if (skl_ddb_entry_equal(old, new))
> +			if (!skl_ddb_entry_equal(old, new))
> +				skl_print_plane_ddb_changes(plane, old, new, "  ddb");

Superfluous whitespace in "  ddb"?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +
> +			if (DISPLAY_VER(display) >=3D 11)
>  				continue;
>=20=20
> -			skl_print_plane_ddb_changes(plane, old, new, "ddb");
> +			old =3D &old_crtc_state->wm.skl.plane_ddb_y[plane_id];
> +			new =3D &new_crtc_state->wm.skl.plane_ddb_y[plane_id];
> +
> +			if (!skl_ddb_entry_equal(old, new))
> +				skl_print_plane_ddb_changes(plane, old, new, "ddb_y");
>  		}
>=20=20
>  		for_each_intel_plane_on_crtc(display->drm, crtc, plane) {

--=20
Jani Nikula, Intel
