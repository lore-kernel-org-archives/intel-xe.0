Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5AB10A1E7C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3376D10E983;
	Thu, 26 Mar 2026 11:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbGPCFyF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6579010E982;
 Thu, 26 Mar 2026 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774525366; x=1806061366;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vboXN/91W4oEY2RLavkrBsyXEEAh7eNXriQdlQXdsEU=;
 b=PbGPCFyFSqhbsFQ1JizIqu4wMak8W7qt7pHKPg8F4QWbVi0WDfHXFoVl
 LY/9+/eb1AUKUfeIgeiDIgC9jgqSZintKsPhdH5nrLQAPemx8VIKsRlt8
 59A3OoaMyG27NJUb+rTvpP4rhrz3NJfwbo+haA2VqDBUBtlKCtTZsDC8O
 9+CsTcSeIy3KxTM3rtjK77vh9lw4vHGCESF3pIhXHrVQkNFWu/NKhs7IT
 wyDhz8Pfg1gOpIO1MHbCmEic+Jh7V3/Ws0n6FYjkIf3b/hTNL3K5tueij
 8LTRjJed4Bo6Rozxhv5zBnjUr/8fn1Ri1XFhGL+LcfdtE3POkYwd+ki70 A==;
X-CSE-ConnectionGUID: JoBkkQGCT9OIdrF0jF76ZQ==
X-CSE-MsgGUID: Yy7AXdTBSD2qAKSqGIiygA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75295962"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75295962"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:42:46 -0700
X-CSE-ConnectionGUID: EzwiHYppR+GhcGarz1TfXA==
X-CSE-MsgGUID: i3YsYy9+TCqxs8ViR9V3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="226621627"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:42:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/12] drm/i915/vrr: Use intel_de_read64_2x32()
In-Reply-To: <20260325185342.11482-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
 <20260325185342.11482-11-ville.syrjala@linux.intel.com>
Date: Thu, 26 Mar 2026 13:42:40 +0200
Message-ID: <1099d2f851c636adf6397cd869c3c0ed5d355084@intel.com>
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

On Wed, 25 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the pointless use of intel_de_read64_2x32_volatile()
> with the simpler intel_de_read64_2x32().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index ae5385e92889..fae1186a90b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1053,11 +1053,9 @@ void intel_vrr_get_config(struct intel_crtc_state =
*crtc_state)
>=20=20
>  	if (crtc_state->cmrr.enable) {
>  		crtc_state->cmrr.cmrr_n =3D
> -			intel_de_read64_2x32_volatile(display, TRANS_CMRR_N_LO(display, cpu_t=
ranscoder),
> -						      TRANS_CMRR_N_HI(display, cpu_transcoder));
> +			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder=
));
>  		crtc_state->cmrr.cmrr_m =3D
> -			intel_de_read64_2x32_volatile(display, TRANS_CMRR_M_LO(display, cpu_t=
ranscoder),
> -						      TRANS_CMRR_M_HI(display, cpu_transcoder));
> +			intel_de_read64_2x32(display, TRANS_CMRR_M_LO(display, cpu_transcoder=
));
>  	}
>=20=20
>  	if (DISPLAY_VER(display) >=3D 13) {

--=20
Jani Nikula, Intel
