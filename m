Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F41BD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 11:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA38910E513;
	Tue,  9 Dec 2025 11:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTn1Nq82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5B710E510;
 Tue,  9 Dec 2025 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765278188; x=1796814188;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2KcHTrM76uUY1TcCooo0dfx9HS5AmZEv1e7RejcwORg=;
 b=XTn1Nq82ITGpgEyO5B7ZBi+MiNt0QdHC+uDD6UU/hBBMpxPauo9FRbbR
 DIFZEehKNDLPEo4GSyuy6VYvSVS5PmkoMT++Mdnj2TEdFbO72ZVsjuX7x
 W9CMNIXkoXWmmdTar8EF1Th8nMIqFNaefgXQCLU2A5WfOtGAR01V/xJTg
 NjvLlw+FeOhZiQXIOyr2fFkygNy1TAlQ8C4qQQvs50GdYspRxoyjLL9i+
 kmDPFfecV3Ovh+A2TGqwWVfz2lgEnhP9rFXbdyp9ysx0BR/smtrf8Vgxi
 jGfbCCx+HO3o+Mb88AdZa5SMUG4ItNtW5NS/NXvqAKarpo31QjVq5tSBm w==;
X-CSE-ConnectionGUID: 8N518ooQQdaEDpI4PPwsBQ==
X-CSE-MsgGUID: Mo86Jm82TueyhWrksEkdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71088469"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="71088469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:03:07 -0800
X-CSE-ConnectionGUID: /FPZ+t4lTNWY0bH3gD19iw==
X-CSE-MsgGUID: PXKotNJKQSCZut8Y/LwQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196658303"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:03:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 19/19] drm/i915: Document the GMCH_CTRL register a bit
In-Reply-To: <20251208182637.334-20-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251208182637.334-1-ville.syrjala@linux.intel.com>
 <20251208182637.334-20-ville.syrjala@linux.intel.com>
Date: Tue, 09 Dec 2025 13:03:02 +0200
Message-ID: <29ba4ddecf7d907c26e19da8ad5f585aabebd9c8@intel.com>
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

On Mon, 08 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The actual GMCH_CRTL lives in the host bridge aka. device 0),

Superfluous ) or missing (.

> but device 2 has a read-only mirror on i85x/i865+. Docuemnent

*Document

> that fact.
>
> Also remove the ancient tales about where the defines are used.
> Those haven't been true in a long time.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/drm/intel/i915_drm.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/include/drm/intel/i915_drm.h b/include/drm/intel/i915_drm.h
> index c633ce62f2bf..8eee23f94e26 100644
> --- a/include/drm/intel/i915_drm.h
> +++ b/include/drm/intel/i915_drm.h
> @@ -39,11 +39,11 @@ bool i915_gpu_turbo_disable(void);
>  extern struct resource intel_graphics_stolen_res;
>=20=20
>  /*
> - * The Bridge device's PCI config space has information about the
> - * fb aperture size and the amount of pre-reserved memory.
> - * This is all handled in the intel-gtt.ko module. i915.ko only
> - * cares about the vga bit for the vga arbiter.
> + * The Bridge device's (device 0) PCI config space has information
> + * about the fb aperture size and the amount of pre-reserved memory.
>   */
> +
> +/* device 2 has a read-only mirror */
>  #define SNB_GMCH_CTRL		0x50
>  #define   SNB_GMCH_GGMS_SHIFT	8 /* GTT Graphics Memory Size */
>  #define   SNB_GMCH_GGMS_MASK	0x3
> @@ -54,6 +54,7 @@ extern struct resource intel_graphics_stolen_res;
>  #define   BDW_GMCH_GMS_SHIFT	8
>  #define   BDW_GMCH_GMS_MASK	0xff
>=20=20
> +/* device 2 has a read-only mirror from i85x/i865 onwards */
>  #define I830_GMCH_CTRL			0x52
>  #define   I830_GMCH_GMS_MASK		(0x7 << 4)
>  #define   I830_GMCH_GMS_LOCAL		(0x1 << 4)

--=20
Jani Nikula, Intel
