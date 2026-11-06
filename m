Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39609606D833
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPybSW8p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2F112C86;
	Fri,  6 Nov 2026 09:20:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77336112C80;
 Fri,  6 Nov 2026 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793956829; x=1825492829;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OU3Ltwo5Ru65t/cAb/FDxxB4FVNEWd2NNAc9kqZzwv8=;
 b=kPybSW8pdYK5rVl4QNdSTTRpisvsJ2sLBZNcpefq7qKb/X3TJ9zKP3hy
 vqW2w4JKvLmv3r9TO2wjPB7rrP8PnhrlB9Qv1FAaJncCvFKzaUPzR+oDF
 chYUAZLLtbjD7eGNMH973/lGOfXZQsMP7WKfLnqLb3Nl6p+MXF5dks0N9
 PuGInH2u17qkSZJroWbFSAYhjJmdJsjHJv5dDxmLDtchitSD0h3gxCIx0
 GK7d7LdJPHI3YHTEgjJa0vDdJ8TM+J9Rbffe7/NmIAt+3c+RYuM7Qub3z
 uBIYXT/1Hb3Hv/PyU/zLFES1V6q1uY3aOLQhvi5O20Zpu7hUnaKsY730v Q==;
X-CSE-ConnectionGUID: /zE1EcxQTFudE6AHh+RutQ==
X-CSE-MsgGUID: YxgVCfuIS6yiFlhQb/qTrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2767209"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2767209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:20:29 -0800
X-CSE-ConnectionGUID: Tgw1YKkTQteHZUD2+FJ19Q==
X-CSE-MsgGUID: vm3anOyhSLWKYZh387z9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7656909"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:20:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/i915/irq:
 s/gen11_gu_misc_irq_handler()/intel_display_gse_irq_handler()/
In-Reply-To: <20261105203427.8696-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
 <20261105203427.8696-3-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 11:20:24 +0200
Message-ID: <3268178e71f97d173c264a2e3fca968ca71a1480@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Now that gen11_gu_misc_irq_handler() just handles the GSE
> interrupt let's rename it to intel_display_gse_irq_handler().
>
> And now that it's our generic GSE irq handler let's also
> call it for all the GSE interrupts signaled via actual
> display interrupts as well. The old GMCH ASLE/BLC interrupts
> I left calling intel_opregion_asle_intr() directly, just
> because the naming there makes more sense that way.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

This could be followed up with having xe_display_irq_enable() call
intel_display_gse_irq_handler() instead of intel_opregion_asle_intr().

Oh, and xe_display_irq_enable() is also misnamed.

> ---
>  drivers/gpu/drm/i915/display/intel_display_irq.c | 8 ++++----
>  drivers/gpu/drm/i915/display/intel_display_irq.h | 2 +-
>  drivers/gpu/drm/i915/i915_irq.c                  | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index af8d6737d36c..5430eb5245da 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -904,7 +904,7 @@ static void _ilk_display_irq_handler(struct intel_dis=
play *display, u32 de_iir)
>  		intel_dp_aux_irq_handler(display);
>=20=20
>  	if (de_iir & DE_GSE)
> -		intel_opregion_asle_intr(display);
> +		intel_display_gse_irq_handler(display);
>=20=20
>  	if (de_iir & DE_POISON)
>  		drm_err(display->drm, "Poison interrupt\n");
> @@ -971,7 +971,7 @@ static void _ivb_display_irq_handler(struct intel_dis=
play *display, u32 de_iir)
>  		intel_dp_aux_irq_handler(display);
>=20=20
>  	if (de_iir & DE_GSE_IVB)
> -		intel_opregion_asle_intr(display);
> +		intel_display_gse_irq_handler(display);
>=20=20
>  	for_each_pipe(display, pipe) {
>  		if (de_iir & DE_PIPE_VBLANK_IVB(pipe))
> @@ -1279,7 +1279,7 @@ gen8_de_misc_irq_handler(struct intel_display *disp=
lay, u32 iir)
>  			found =3D true;
>  		}
>  	} else if (iir & GEN8_DE_MISC_GSE) {
> -		intel_opregion_asle_intr(display);
> +		intel_display_gse_irq_handler(display);
>  		found =3D true;
>  	}
>=20=20
> @@ -1587,7 +1587,7 @@ static bool gen8_display_irq_handler(struct intel_d=
isplay *display,
>  	return true;
>  }
>=20=20
> -void gen11_gu_misc_irq_handler(struct intel_display *display)
> +void intel_display_gse_irq_handler(struct intel_display *display)
>  {
>  	intel_opregion_asle_intr(display);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/g=
pu/drm/i915/display/intel_display_irq.h
> index 00dfed88eab7..1fd11328a264 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
> @@ -52,7 +52,7 @@ void bdw_disable_vblank(struct drm_crtc *crtc);
>  void ilk_display_irq_master_disable(struct intel_display *display, u32 *=
de_ier, u32 *sde_ier);
>  void ilk_display_irq_master_enable(struct intel_display *display, u32 de=
_ier, u32 sde_ier);
>=20=20
> -void gen11_gu_misc_irq_handler(struct intel_display *display);
> +void intel_display_gse_irq_handler(struct intel_display *display);
>=20=20
>  struct intel_display_irq_state {
>  	u32 master_ctl;
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 1d03ac90b7e2..12082167face 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -536,7 +536,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *a=
rg)
>  	gen11_master_intr_enable(regs);
>=20=20
>  	if (gu_misc_iir & GEN11_GU_MISC_GSE)
> -		gen11_gu_misc_irq_handler(display);
> +		intel_display_gse_irq_handler(display);
>=20=20
>  	pmu_irq_stats(i915, IRQ_HANDLED);
>=20=20
> @@ -604,7 +604,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	dg1_master_intr_enable(regs);
>=20=20
>  	if (gu_misc_iir & GEN11_GU_MISC_GSE)
> -		gen11_gu_misc_irq_handler(display);
> +		intel_display_gse_irq_handler(display);
>=20=20
>  	pmu_irq_stats(i915, IRQ_HANDLED);

--=20
Jani Nikula, Intel
