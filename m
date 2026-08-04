Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3256C5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 08:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DF710E8C1;
	Tue,  4 Aug 2026 08:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G89Ltv6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7930A10E465;
 Tue,  4 Aug 2026 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785830523; x=1817366523;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=A2dJd325c/8oP9tRzfmxUxGTaNU9FYLVEH8cZe8YXBA=;
 b=G89Ltv6mn81bvWnvqYrhPEd5abGHxzX1P6MPLS+d1EKS/Pzgx9uzGtdF
 UZf1B5653XqgyrUAZVjv5mQjvQdM4x5OQ2OGB3DK3YF86Yql/qWi8FCs+
 UPSws5TFhF5yZ/FZ/94GRXzLCpcIIK9gDIB7QL2zupjGrr9NQ3Iz92Nkv
 Mr5JtaiVmWEEOkOt5WzEa5Ea8sn6JGnBUehJQJX0ppqtnekSvABOhV3wJ
 MauZx0lpeAK2tEEYYfihIcT7hKs+4NF/U+CGbyXD9KoQNTQ/zBobLIl0t
 bTcpLMu0AGK4FGlI72diJ9t7PqYBk3k0X2msI/MENRfg9DH2fYiyhp4up w==;
X-CSE-ConnectionGUID: whbMV9O9RPKrQpoj6mZi7A==
X-CSE-MsgGUID: IX5CQlnnRkCPyeagFlR4Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86573828"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86573828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 01:02:02 -0700
X-CSE-ConnectionGUID: l80Y0IwrRo6pgGJGwkgZcA==
X-CSE-MsgGUID: r4sagKthSGWP7Nrrb9ly3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="286092533"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 01:02:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v2 1/4] drm/i915/display: fix SKL_DSSM register macros
In-Reply-To: <20260803214909.3076716-2-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260803214909.3076716-1-michal.grzelak@intel.com>
 <20260803214909.3076716-2-michal.grzelak@intel.com>
Date: Tue, 04 Aug 2026 11:01:58 +0300
Message-ID: <058226c5ce1d9063891372679b15fd14ba4dc29f@intel.com>
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

On Mon, 03 Aug 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Indent SKL_DSSM register macros. Define mask and register values with
> REG_GENMASK() and REG_FIELD_PREP() instead of bit shifts.

Nitpick, in subject, "fix" is misleading. This is just cleanup without
functional changes.

No need to resend for this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> v1->v2
> - s/REG_GENMASK/REG_FIELD_PREP/ (Jani)
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/=
gpu/drm/i915/display/intel_display_regs.h
> index 0f5018482497..740331ead20a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1779,10 +1779,10 @@
>  #define   XE2LPD_DE_CAP_SCALER_SINGLE	1
>=20=20
>  #define SKL_DSSM				_MMIO(0x51004)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_MASK		(7 << 29)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_24MHz		(0 << 29)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
> -#define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_MASK	REG_GENMASK(31, 29)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_24MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_=
PLL_REFCLK_MASK, 0)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	REG_FIELD_PREP(ICL_DSSM_CDCL=
K_PLL_REFCLK_MASK, 1)
> +#define   ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	REG_FIELD_PREP(ICL_DSSM_CDCL=
K_PLL_REFCLK_MASK, 2)
>=20=20
>  /*GEN11 chicken */
>  #define _PIPEA_CHICKEN				0x70038

--=20
Jani Nikula, Intel
