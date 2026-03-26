Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A9106F310
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 09:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5010E9D5;
	Thu, 26 Mar 2026 09:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdJAtgsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915BE10E9D5;
 Thu, 26 Mar 2026 09:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774516565; x=1806052565;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VVNtqFibuUBSpPzRv+9JQvmbfYSVzfjnTWXPBH0A7Tw=;
 b=YdJAtgsgchxL3sV5Xtha9Y+oPv7EsrEIuzHJYdQpKOHfrZdlqXFfTjJ9
 zjqpY7gNkoPpEo4qoC3P4gQAebeI73IAypq4RpMjYRr6ch0X5JQBeFr/S
 K8I30V8a5QP9cZIsupby5GtxH2tb8bshr27tEDbmj1/vwZ3Ve2xxXX1ej
 b4bQGj3rO4+694n0cEQLEmDODRJMZsl95SfRKT8iboH4Aejtc+Iz4ksoh
 twxF/1fUVk9U98i4ArXbgpsvbqvTWqm7wo5UbOmBaZJPtTaYzq/OjjV4D
 VGR9UGMACVzRGr0l/5faAM7obwcm5gnZQ8/iNbg7PrBMib+y8NmaKfrVF Q==;
X-CSE-ConnectionGUID: bcmgrqQ+TaqVaj7tLa4fmg==
X-CSE-MsgGUID: PaS1CJpDRmyyKGeOob2C/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75531661"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75531661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:16:05 -0700
X-CSE-ConnectionGUID: vmD3J0e4TVGmEPR/xZ1chQ==
X-CSE-MsgGUID: kFQuCjAZSeiGmOGziLgiaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="248369170"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:16:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/12] drm/i915/qgv: Use intel_de_read() for
 MTL_MEM_SS_INFO* reads
In-Reply-To: <20260325185342.11482-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
 <20260325185342.11482-2-ville.syrjala@linux.intel.com>
Date: Thu, 26 Mar 2026 11:15:59 +0200
Message-ID: <6d3e1656d5d67abbdc0264c934a25dad460b8905@intel.com>
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
> The MTL_MEM_SS_INFO* are just regular display registers. Use
> intel_de_read() to access them.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bw.c   | 6 +++---
>  drivers/gpu/drm/i915/display/intel_dram.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i9=
15/display/intel_bw.c
> index 07b4531a4376..18b80147ddc7 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -9,6 +9,7 @@
>=20=20
>  #include "intel_bw.h"
>  #include "intel_crtc.h"
> +#include "intel_de.h"
>  #include "intel_display_core.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
> @@ -211,12 +212,11 @@ static int icl_pcode_restrict_qgv_points(struct int=
el_display *display,
>  static int mtl_read_qgv_point_info(struct intel_display *display,
>  				   struct intel_qgv_point *sp, int point)
>  {
> -	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
>  	u32 val, val2;
>  	u16 dclk;
>=20=20
> -	val =3D intel_uncore_read(uncore, MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
> -	val2 =3D intel_uncore_read(uncore, MTL_MEM_SS_INFO_QGV_POINT_HIGH(point=
));
> +	val =3D intel_de_read(display, MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
> +	val2 =3D intel_de_read(display, MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
>  	dclk =3D REG_FIELD_GET(MTL_DCLK_MASK, val);
>  	sp->dclk =3D DIV_ROUND_CLOSEST(16667 * dclk, 1000);
>  	sp->t_rp =3D REG_FIELD_GET(MTL_TRP_MASK, val);
> diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/=
i915/display/intel_dram.c
> index bd281d4b4c05..f05796417485 100644
> --- a/drivers/gpu/drm/i915/display/intel_dram.c
> +++ b/drivers/gpu/drm/i915/display/intel_dram.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/intel/intel_pcode_regs.h>
>=20=20
> +#include "intel_de.h"
>  #include "intel_display_core.h"
>  #include "intel_display_utils.h"
>  #include "intel_display_regs.h"
> @@ -767,8 +768,7 @@ static int gen12_get_dram_info(struct intel_display *=
display, struct dram_info *
>=20=20
>  static int xelpdp_get_dram_info(struct intel_display *display, struct dr=
am_info *dram_info)
>  {
> -	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
> -	u32 val =3D intel_uncore_read(uncore, MTL_MEM_SS_INFO_GLOBAL);
> +	u32 val =3D intel_de_read(display, MTL_MEM_SS_INFO_GLOBAL);
>=20=20
>  	switch (REG_FIELD_GET(MTL_DDR_TYPE_MASK, val)) {
>  	case 0:

--=20
Jani Nikula, Intel
