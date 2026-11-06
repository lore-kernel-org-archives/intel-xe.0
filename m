Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16582606A328
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ExoKeXFU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2270112934;
	Fri,  6 Nov 2026 09:18:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42E91128E6;
 Fri,  6 Nov 2026 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793956692; x=1825492692;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zijwWqLD79Pzyt6Qcp7xQV5SdCDGyem/UPlmMov8lQk=;
 b=ExoKeXFUTTnWUJ4j1uVlhGAo4RxH1LH6mkpan+qRTjkOpVMluU3K107K
 YW5OtXPvawWGTQzwxKzlInr4xNZYyEtdVAXIHeqtLaHy3RXKONFC84GpE
 jmztfyz5sQc8fu64m2LaX/nuMwq+RmuYBVpYKIL2dDnNmvUu/uda9UoYx
 FjyEwIcuPREEPjv2Qpa6Bq/wyH7YGqhKg2uMzgTZnIpS306mYmzD5oM98
 TNqQ51svriRhWz6QyA4S/zmW9XHQXQpXWpE9YhI85EJ4v3EZ2gfl2yMVy
 84z+Fppno9lzTepsyEfZx6uq+CVcD4LCznPxGplauK7icO5LOuv754ZNz Q==;
X-CSE-ConnectionGUID: gJ8M/cKvQtyabtq+wXbAJw==
X-CSE-MsgGUID: Og1PRnHXRgGejR1ZFj5rbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2645282"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2645282"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:18:11 -0800
X-CSE-ConnectionGUID: 0B8osx5FQKWpGtlzghh4cw==
X-CSE-MsgGUID: 4emR8BgHSnyOIbEzx+su0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8995566"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:18:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/i915/irq: Relocate gen11_gu_misc_irq_ack()
In-Reply-To: <20261105203427.8696-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
 <20261105203427.8696-2-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 11:18:07 +0200
Message-ID: <153a76a68e6c44ef7fa942337c656d15590b4f1a@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The Gunit misc interrupts (GEN11_GU_MISC_*) aren't a display thing.
> Currently the irq ack/handler live in intel_display_irq.c, whereas
> the irq reset/postingstall lives in i915_irq.c.
>
> gen11_gu_misc_irq_ack() belongs with its reset/postinstall
> counterparts in i915_irq.c, so move it there. The handler we'll
> leave in the display code.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

This could be followed up with moving GEN11_GU_MISC_* macros from
include/drm/intel/intel_gmd_interrupt_regs.h to an i915 core internal
header.

> ---
>  .../gpu/drm/i915/display/intel_display_irq.c  | 23 ++---------------
>  .../gpu/drm/i915/display/intel_display_irq.h  |  3 +--
>  drivers/gpu/drm/i915/i915_irq.c               | 25 ++++++++++++++++---
>  3 files changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index b8d7e8de4ee8..af8d6737d36c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -1587,28 +1587,9 @@ static bool gen8_display_irq_handler(struct intel_=
display *display,
>  	return true;
>  }
>=20=20
> -u32 gen11_gu_misc_irq_ack(struct intel_display *display, const u32 maste=
r_ctl)
> +void gen11_gu_misc_irq_handler(struct intel_display *display)
>  {
> -	u32 iir;
> -
> -	if (!(master_ctl & GEN11_GU_MISC_IRQ))
> -		return 0;
> -
> -	intel_display_rpm_assert_block(display);
> -
> -	iir =3D intel_de_read_fw(display, GEN11_GU_MISC_IIR);
> -	if (likely(iir))
> -		intel_de_write_fw(display, GEN11_GU_MISC_IIR, iir);
> -
> -	intel_display_rpm_assert_unblock(display);
> -
> -	return iir;
> -}
> -
> -void gen11_gu_misc_irq_handler(struct intel_display *display, const u32 =
iir)
> -{
> -	if (iir & GEN11_GU_MISC_GSE)
> -		intel_opregion_asle_intr(display);
> +	intel_opregion_asle_intr(display);
>  }
>=20=20
>  static bool gen11_display_irq_handler(struct intel_display *display,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/g=
pu/drm/i915/display/intel_display_irq.h
> index 84446bf53401..00dfed88eab7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
> @@ -52,8 +52,7 @@ void bdw_disable_vblank(struct drm_crtc *crtc);
>  void ilk_display_irq_master_disable(struct intel_display *display, u32 *=
de_ier, u32 *sde_ier);
>  void ilk_display_irq_master_enable(struct intel_display *display, u32 de=
_ier, u32 sde_ier);
>=20=20
> -u32 gen11_gu_misc_irq_ack(struct intel_display *display, const u32 maste=
r_ctl);
> -void gen11_gu_misc_irq_handler(struct intel_display *display, const u32 =
iir);
> +void gen11_gu_misc_irq_handler(struct intel_display *display);
>=20=20
>  struct intel_display_irq_state {
>  	u32 master_ctl;
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 932409b943ad..1d03ac90b7e2 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -491,6 +491,21 @@ static inline void gen11_master_intr_enable(void __i=
omem * const regs)
>  	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, GEN11_MASTER_IRQ);
>  }
>=20=20
> +static u32 gen11_gu_misc_irq_ack(void __iomem * const regs,
> +				 u32 master_ctl)
> +{
> +	u32 iir;
> +
> +	if (!(master_ctl & GEN11_GU_MISC_IRQ))
> +		return 0;
> +
> +	iir =3D raw_reg_read(regs, GEN11_GU_MISC_IIR);
> +	if (likely(iir))
> +		raw_reg_write(regs, GEN11_GU_MISC_IIR, iir);
> +
> +	return iir;
> +}
> +
>  static irqreturn_t gen11_irq_handler(int irq, void *arg)
>  {
>  	struct drm_i915_private *i915 =3D arg;
> @@ -516,11 +531,12 @@ static irqreturn_t gen11_irq_handler(int irq, void =
*arg)
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
>  		intel_display_irq_handler(display, NULL);
>=20=20
> -	gu_misc_iir =3D gen11_gu_misc_irq_ack(display, master_ctl);
> +	gu_misc_iir =3D gen11_gu_misc_irq_ack(regs, master_ctl);
>=20=20
>  	gen11_master_intr_enable(regs);
>=20=20
> -	gen11_gu_misc_irq_handler(display, gu_misc_iir);
> +	if (gu_misc_iir & GEN11_GU_MISC_GSE)
> +		gen11_gu_misc_irq_handler(display);
>=20=20
>  	pmu_irq_stats(i915, IRQ_HANDLED);
>=20=20
> @@ -583,11 +599,12 @@ static irqreturn_t dg1_irq_handler(int irq, void *a=
rg)
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
>  		intel_display_irq_handler(display, NULL);
>=20=20
> -	gu_misc_iir =3D gen11_gu_misc_irq_ack(display, master_ctl);
> +	gu_misc_iir =3D gen11_gu_misc_irq_ack(regs, master_ctl);
>=20=20
>  	dg1_master_intr_enable(regs);
>=20=20
> -	gen11_gu_misc_irq_handler(display, gu_misc_iir);
> +	if (gu_misc_iir & GEN11_GU_MISC_GSE)
> +		gen11_gu_misc_irq_handler(display);
>=20=20
>  	pmu_irq_stats(i915, IRQ_HANDLED);

--=20
Jani Nikula, Intel
