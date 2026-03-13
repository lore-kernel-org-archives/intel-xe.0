Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF5105F7A6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B36910EC33;
	Fri, 13 Mar 2026 14:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Puklsmdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FA410EC33;
 Fri, 13 Mar 2026 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773411695; x=1804947695;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=UDRYPDXv274vC7jv2QkW2olNdhEMyA6j5smoM2DFxHU=;
 b=PuklsmdokP3/e6UqqptyshDSrBFY5EjUJra/ScEnzIzspbvNoIfJkfiw
 pX04jaift+nXQRMQaMxnQvZ4odb0RNGnl+zJn0ii3XRdHYfukh2KVT0O0
 DUSD7/867jimFlQvV3U4oNn1Mw9NpqbYYHPQzFSH3d3ljCLtonB+88zZd
 lgc6zOWKeMYkBeE+qJ3uewxZbn4Os0DMxZh+C+qJnEazcFE7n135t8PuX
 TvPkvSFjtZwI/toNG9aAyMVtvvBy62pygVVVhcDwzuePeP9CYcKacYlty
 xZ9Juxdef8l6j7xzDq6o7mcsYD2XpeKiCEGgWIikvNbDIwTOV5dp8B7yl w==;
X-CSE-ConnectionGUID: n/g+5PcbT8ONPFyar56PDw==
X-CSE-MsgGUID: P3sDU6sORQ6AV6c6DHVoNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74218330"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74218330"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:21:34 -0700
X-CSE-ConnectionGUID: 4028PaYOSEG8T6ooKqG10g==
X-CSE-MsgGUID: PPi3cZFUTaiCv5zzw7xReQ==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:21:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/de: Move intel_de_wait*() into intel_de.c
In-Reply-To: <20260313111028.25159-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260313111028.25159-1-ville.syrjala@linux.intel.com>
 <20260313111028.25159-3-ville.syrjala@linux.intel.com>
Date: Fri, 13 Mar 2026 16:21:28 +0200
Message-ID: <5c029eac8bab1466ff942cd71ee9d33bd0370da4@intel.com>
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

On Fri, 13 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> intel_de_wait*() end up doing quite a bit of stuff, so the one
> function call overhead from them seems insignificant. Move the
> implementation intel_de.c.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 72 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_de.h | 99 +++++--------------------
>  2 files changed, 92 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 5348c1d51eb8..fce92535bd6a 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -7,6 +7,78 @@
>=20=20
>  #include "intel_de.h"
>=20=20
> +int intel_de_wait_us(struct intel_display *display, i915_reg_t reg,
> +		     u32 mask, u32 value, unsigned int timeout_us,
> +		     u32 *out_value)
> +{
> +	int ret;
> +
> +	intel_dmc_wl_get(display, reg);
> +
> +	ret =3D __intel_wait_for_register(__to_uncore(display), reg, mask,
> +					value, timeout_us, 0, out_value);
> +
> +	intel_dmc_wl_put(display, reg);
> +
> +	return ret;
> +}
> +
> +int intel_de_wait_ms(struct intel_display *display, i915_reg_t reg,
> +		     u32 mask, u32 value, unsigned int timeout_ms,
> +		     u32 *out_value)
> +{
> +	int ret;
> +
> +	intel_dmc_wl_get(display, reg);
> +
> +	ret =3D __intel_wait_for_register(__to_uncore(display), reg, mask,
> +					value, 2, timeout_ms, out_value);
> +
> +	intel_dmc_wl_put(display, reg);
> +
> +	return ret;
> +}
> +
> +int intel_de_wait_fw_ms(struct intel_display *display, i915_reg_t reg,
> +			u32 mask, u32 value, unsigned int timeout_ms,
> +			u32 *out_value)
> +{
> +	return __intel_wait_for_register_fw(__to_uncore(display), reg, mask,
> +					    value, 2, timeout_ms, out_value);
> +}
> +
> +int intel_de_wait_fw_us_atomic(struct intel_display *display, i915_reg_t=
 reg,
> +			       u32 mask, u32 value, unsigned int timeout_us,
> +			       u32 *out_value)
> +{
> +	return __intel_wait_for_register_fw(__to_uncore(display), reg, mask,
> +					    value, timeout_us, 0, out_value);
> +}
> +
> +int intel_de_wait_for_set_us(struct intel_display *display, i915_reg_t r=
eg,
> +			     u32 mask, unsigned int timeout_us)
> +{
> +	return intel_de_wait_us(display, reg, mask, mask, timeout_us, NULL);
> +}
> +
> +int intel_de_wait_for_clear_us(struct intel_display *display, i915_reg_t=
 reg,
> +			       u32 mask, unsigned int timeout_us)
> +{
> +	return intel_de_wait_us(display, reg, mask, 0, timeout_us, NULL);
> +}
> +
> +int intel_de_wait_for_set_ms(struct intel_display *display, i915_reg_t r=
eg,
> +			     u32 mask, unsigned int timeout_ms)
> +{
> +	return intel_de_wait_ms(display, reg, mask, mask, timeout_ms, NULL);
> +}
> +
> +int intel_de_wait_for_clear_ms(struct intel_display *display, i915_reg_t=
 reg,
> +			       u32 mask, unsigned int timeout_ms)
> +{
> +	return intel_de_wait_ms(display, reg, mask, 0, timeout_ms, NULL);
> +}
> +
>  u8 intel_de_read8(struct intel_display *display, i915_reg_t reg)
>  {
>  	/* this is only used on VGA registers (possible on pre-g4x) */
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 8ca5904ba84e..f87b84ab9d6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -86,85 +86,26 @@ intel_de_rmw(struct intel_display *display, i915_reg_=
t reg, u32 clear, u32 set)
>  	return val;
>  }
>=20=20
> -static inline int
> -intel_de_wait_us(struct intel_display *display, i915_reg_t reg,
> -		 u32 mask, u32 value, unsigned int timeout_us,
> -		 u32 *out_value)
> -{
> -	int ret;
> -
> -	intel_dmc_wl_get(display, reg);
> -
> -	ret =3D __intel_wait_for_register(__to_uncore(display), reg, mask,
> -					value, timeout_us, 0, out_value);
> -
> -	intel_dmc_wl_put(display, reg);
> -
> -	return ret;
> -}
> -
> -static inline int
> -intel_de_wait_ms(struct intel_display *display, i915_reg_t reg,
> -		 u32 mask, u32 value, unsigned int timeout_ms,
> -		 u32 *out_value)
> -{
> -	int ret;
> -
> -	intel_dmc_wl_get(display, reg);
> -
> -	ret =3D __intel_wait_for_register(__to_uncore(display), reg, mask,
> -					value, 2, timeout_ms, out_value);
> -
> -	intel_dmc_wl_put(display, reg);
> -
> -	return ret;
> -}
> -
> -static inline int
> -intel_de_wait_fw_ms(struct intel_display *display, i915_reg_t reg,
> -		    u32 mask, u32 value, unsigned int timeout_ms,
> -		    u32 *out_value)
> -{
> -	return __intel_wait_for_register_fw(__to_uncore(display), reg, mask,
> -					    value, 2, timeout_ms, out_value);
> -}
> -
> -static inline int
> -intel_de_wait_fw_us_atomic(struct intel_display *display, i915_reg_t reg,
> -			   u32 mask, u32 value, unsigned int timeout_us,
> -			   u32 *out_value)
> -{
> -	return __intel_wait_for_register_fw(__to_uncore(display), reg, mask,
> -					    value, timeout_us, 0, out_value);
> -}
> -
> -static inline int
> -intel_de_wait_for_set_us(struct intel_display *display, i915_reg_t reg,
> -			 u32 mask, unsigned int timeout_us)
> -{
> -	return intel_de_wait_us(display, reg, mask, mask, timeout_us, NULL);
> -}
> -
> -static inline int
> -intel_de_wait_for_clear_us(struct intel_display *display, i915_reg_t reg,
> -			   u32 mask, unsigned int timeout_us)
> -{
> -	return intel_de_wait_us(display, reg, mask, 0, timeout_us, NULL);
> -}
> -
> -static inline int
> -intel_de_wait_for_set_ms(struct intel_display *display, i915_reg_t reg,
> -			 u32 mask, unsigned int timeout_ms)
> -{
> -	return intel_de_wait_ms(display, reg, mask, mask, timeout_ms, NULL);
> -}
> -
> -static inline int
> -intel_de_wait_for_clear_ms(struct intel_display *display, i915_reg_t reg,
> -			   u32 mask, unsigned int timeout_ms)
> -{
> -	return intel_de_wait_ms(display, reg, mask, 0, timeout_ms, NULL);
> -}
> +int intel_de_wait_us(struct intel_display *display, i915_reg_t reg,
> +		     u32 mask, u32 value, unsigned int timeout_us,
> +		     u32 *out_value);
> +int intel_de_wait_ms(struct intel_display *display, i915_reg_t reg,
> +		     u32 mask, u32 value, unsigned int timeout_ms,
> +		     u32 *out_value);
> +int intel_de_wait_fw_ms(struct intel_display *display, i915_reg_t reg,
> +			u32 mask, u32 value, unsigned int timeout_ms,
> +			u32 *out_value);
> +int intel_de_wait_fw_us_atomic(struct intel_display *display, i915_reg_t=
 reg,
> +			       u32 mask, u32 value, unsigned int timeout_us,
> +			       u32 *out_value);
> +int intel_de_wait_for_set_us(struct intel_display *display, i915_reg_t r=
eg,
> +			     u32 mask, unsigned int timeout_us);
> +int intel_de_wait_for_clear_us(struct intel_display *display, i915_reg_t=
 reg,
> +			       u32 mask, unsigned int timeout_us);
> +int intel_de_wait_for_set_ms(struct intel_display *display, i915_reg_t r=
eg,
> +			     u32 mask, unsigned int timeout_ms);
> +int intel_de_wait_for_clear_ms(struct intel_display *display, i915_reg_t=
 reg,
> +			       u32 mask, unsigned int timeout_ms);
>=20=20
>  /*
>   * Unlocked mmio-accessors, think carefully before using these.

--=20
Jani Nikula, Intel
