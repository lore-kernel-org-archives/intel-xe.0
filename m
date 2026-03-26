Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EA6106F30F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 09:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6F10EA01;
	Thu, 26 Mar 2026 09:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmzFgSHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245E510EA01;
 Thu, 26 Mar 2026 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774516599; x=1806052599;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=uASz2FQGEvdbnYjDqt4GtNgCvPe0xwH84f7Yu9oEUOc=;
 b=JmzFgSHorOiTcjGz0CjnvER01fgjhGNHq9k+KaDp/gS/nUSi8G+RplKl
 jt/mHEgrb2HPNZ8TcH1ovuHmP3oC1OlQbDLpU4LzYa8bHaBLmt0hNuJUi
 s6tuo7eyvWIs94lAkwDmgNAIf0sPA7N7eOBkDJhbyE6Ov1wfiRx8qapiI
 6vwGFzDj+HNc4R/btYf+O0FCuXHzmf2nhFkW0OgII3wk2ZU10AGn6yFwA
 aVNi2QVKXGb0buycnAELVNMuZhbfPni7XaZx5bHMjK6diXzjCIlxziBns
 ifeO8t1Mqw5k5Dcm+Ae4wxwGR5frP+b/HKJzWFVuEVHLjhK+m3LAkxGDi g==;
X-CSE-ConnectionGUID: H1mCBj6tSlOAJAurb4rEPA==
X-CSE-MsgGUID: 1KmDTopmTzO6D0N0+j5z1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75763906"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75763906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:16:38 -0700
X-CSE-ConnectionGUID: HzzNoF/XQ9eenWzXH+fgzw==
X-CSE-MsgGUID: /ZB15rGOQMuHvIJuZegKUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224132003"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.169])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:16:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/12] drm/i915/mchbar: Provide intel_mchbar_read*()
 abstraction
In-Reply-To: <20260325185342.11482-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
 <20260325185342.11482-3-ville.syrjala@linux.intel.com>
Date: Thu, 26 Mar 2026 11:16:32 +0200
Message-ID: <87aa3f7918281f5b6a4f90b693c5a80afc47f4f2@intel.com>
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
> MCHBAR registers are a bit special in that:
> - we access them through the mirror
> - the mirror is read only on HSW+
> - the mirror requires the actual MCHBAR to be enabled in device 0:0.0
> - the mirror is gone on MTL+
>
> So I'd prefer to treat MCHBAR registers as a bit special in
> the code as well, and do all accesses to them via dedicated
> functions. Prodive such functions in the form of
> intel_mchbar_read*().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile               |  1 +
>  drivers/gpu/drm/i915/display/intel_mchbar.c | 32 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_mchbar.h | 22 ++++++++++++++
>  drivers/gpu/drm/xe/Makefile                 |  1 +
>  4 files changed, 56 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_mchbar.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_mchbar.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index b677720a1c2d..0e48305df8b2 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -295,6 +295,7 @@ i915-y +=3D \
>  	display/intel_link_bw.o \
>  	display/intel_load_detect.o \
>  	display/intel_lpe_audio.o \
> +	display/intel_mchbar.o \
>  	display/intel_modeset_lock.o \
>  	display/intel_modeset_setup.o \
>  	display/intel_modeset_verify.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_mchbar.c b/drivers/gpu/dr=
m/i915/display/intel_mchbar.c
> new file mode 100644
> index 000000000000..950a36d586c3
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_mchbar.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include "intel_display_core.h"
> +#include "intel_mchbar.h"
> +#include "intel_uncore.h"
> +
> +u16 intel_mchbar_read16(struct intel_display *display,
> +			i915_reg_t reg)

Throughout the patch, surely these would fit on one line?

Regardless,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +{
> +	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
> +
> +	return intel_uncore_read16(uncore, reg);
> +}
> +
> +u32 intel_mchbar_read(struct intel_display *display,
> +		      i915_reg_t reg)
> +{
> +	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
> +
> +	return intel_uncore_read(uncore, reg);
> +}
> +
> +u64 intel_mchbar_read64(struct intel_display *display,
> +			i915_reg_t reg)
> +{
> +	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
> +
> +	return intel_uncore_read64(uncore, reg);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_mchbar.h b/drivers/gpu/dr=
m/i915/display/intel_mchbar.h
> new file mode 100644
> index 000000000000..ced5023c4522
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_mchbar.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef __INTEL_MCHBAR_H__
> +#define __INTEL_MCHBAR_H__
> +
> +#include <linux/types.h>
> +
> +#include "i915_reg_defs.h"
> +
> +struct intel_display;
> +
> +u16 intel_mchbar_read16(struct intel_display *display,
> +			i915_reg_t reg);
> +u32 intel_mchbar_read(struct intel_display *display,
> +		      i915_reg_t reg);
> +u64 intel_mchbar_read64(struct intel_display *display,
> +			i915_reg_t reg);
> +
> +#endif /* __INTEL_MCHBAR_H__ */
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 49de1c22a469..6ae190316b95 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -304,6 +304,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	i915-display/intel_link_bw.o \
>  	i915-display/intel_lspcon.o \
>  	i915-display/intel_lt_phy.o \
> +	i915-display/intel_mchbar.o \
>  	i915-display/intel_modeset_lock.o \
>  	i915-display/intel_modeset_setup.o \
>  	i915-display/intel_modeset_verify.o \

--=20
Jani Nikula, Intel
