Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86147CA5FC7
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 14:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B54310F448;
	Wed, 30 Sep 2026 14:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZpc6Scy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB6410F448;
 Wed, 30 Sep 2026 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780086; x=1822316086;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=J7tYBJQ39FJhrBIhKB3NBr9yOu3Xk719S3old2oGTbc=;
 b=GZpc6ScyzJCXi9qEGLsP4sI6e1ce3izdI6cDh/eTw9XldO7ykkTSKeOG
 drukpHGbrNfcKkyAfbpeHAWZ8l8Ql8ZOlVjnPfjNjmOofAkE/N8h+LOn1
 tzGVgbJwK/HH6Cyl+lB6x2PmNfq5uAlfEZVI2rIQqY2UaX2TRxnSZk+9b
 gHpMmfkhgYd26ViTuJmiE6ftVXcLBPFjj7SeH9W00qiR0etv+CNow+WVj
 mbt+L6b58mzJCH4a9MDW4gTUJ/2GyXrGpJXr3XS5CmXxptQTc6kZN5/M1
 xSDS+dd0T6NCYAjzNK2owPg0c/TABgWKUHynCvsxr1mKJu5+wsKQAyVGF g==;
X-CSE-ConnectionGUID: j0UkRa7dTn2YPCSYgsv5JQ==
X-CSE-MsgGUID: a3ouGbS6T2qAisEPVDqFzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79086384"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="79086384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:54:45 -0700
X-CSE-ConnectionGUID: KMkvyCaETu6CH+IoLpOQbA==
X-CSE-MsgGUID: afN1Y0XqTXS2Fh5iLwE/PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279504844"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:54:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915/de: Nuke intel_de_{read,write}_notrace()
In-Reply-To: <20260930115303.24285-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
 <20260930115303.24285-3-ville.syrjala@linux.intel.com>
Date: Wed, 30 Sep 2026 17:54:41 +0300
Message-ID: <cb838c2d5a8fff1b557e12fc72f6615375920223@intel.com>
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

On Wed, 30 Sep 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> intel_de_{read,write}_notrace() are now completely unused,
> so nuke them. Reducing the number of different register
> access functions should help a bit with cleaning up the
> final uncore mess between xe vs. i915.
>
> And with this we can also nuke the corresponding xe uncore
> compat wrappers.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.h          | 12 ------------
>  .../drm/xe/compat-i915-headers/intel_uncore.h    | 16 ----------------
>  2 files changed, 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 8144588d3cf7..4ae041a96b31 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -164,18 +164,6 @@ intel_de_posting_read_fw(struct intel_display *displ=
ay, intel_reg_t reg)
>  	intel_de_read_fw(display, reg);
>  }
>=20=20
> -static inline u32
> -intel_de_read_notrace(struct intel_display *display, intel_reg_t reg)
> -{
> -	return intel_uncore_read_notrace(__to_uncore(display), reg);
> -}
> -
> -static inline void
> -intel_de_write_notrace(struct intel_display *display, intel_reg_t reg, u=
32 val)
> -{
> -	intel_uncore_write_notrace(__to_uncore(display), reg, val);
> -}
> -
>  static __always_inline void
>  intel_de_write_dsb(struct intel_display *display, struct intel_dsb *dsb,
>  		   intel_reg_t reg, u32 val)
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/driv=
ers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index 08d7ab933672..b8ea8f5b22d1 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -114,22 +114,6 @@ static inline void intel_uncore_write_fw(struct inte=
l_uncore *uncore,
>  	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>=20=20
> -static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
> -					    i915_reg_t i915_reg)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> -}
> -
> -static inline void intel_uncore_write_notrace(struct intel_uncore *uncor=
e,
> -					      i915_reg_t i915_reg, u32 val)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
> -}
> -
>  static inline bool
>  intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
>  {

--=20
Jani Nikula, Intel
