Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CE606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BOKkYSmv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1904A112B68;
	Fri, 27 Nov 2026 14:56:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A10112B58;
 Fri, 27 Nov 2026 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795791378; x=1827327378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8GTcF9s0LXdJilY+hGr4R/caO7ZSNZJKM3XykyRfk0s=;
 b=BOKkYSmvQyPgZ91omCYrdPSEunjffU63QcFPj/78gF90hHi35DobSc8s
 woP8XbskKa3c6bFYY8gB+gfNUZTB+xKkA6o/kehpR7JT3ati0Hp2qdGiE
 vJWHx3lJeJlFS2LDJ99h54AfLM6FVoYOkgnrzeE/RdTbHtZpJrqIzoRPc
 JwPxtGAiS+0mA9T9Qapq1JESLLr/br6Z8C56ODUxiA54DCBBm9+hJ4a1S
 rxs+x0Yw67tN76SsFCmjmc5njjsp+5zpBT1xpJ77fKLQ13CyHiRhKrIxB
 PZOJ1HzLalMvd8D9p3uGtfGuZxeB5oyzHzRNMX/080TyUvKxcPutEVUGT w==;
X-CSE-ConnectionGUID: /Pz3YMXiQOOOtsFxK9L9yA==
X-CSE-MsgGUID: pQFgCWoiTN6q3mnEDowpQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4611374"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4611374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:56:17 -0800
X-CSE-ConnectionGUID: 3PLJtEaRTsWykQ2qAPak8w==
X-CSE-MsgGUID: grBnW+EFSsqmWhlpHaj8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12435934"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:56:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/7] drm/i915/de: Add intel_parent_mmio_regs() interface
In-Reply-To: <20261126212728.9034-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
 <20261126212728.9034-6-ville.syrjala@linux.intel.com>
Date: Fri, 27 Nov 2026 16:56:13 +0200
Message-ID: <6731f19435eca53cf77d8df9129945d96601013c@intel.com>
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

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Eliminate the last uncore usage (to get the pointer to the
> memory mapped registers) in intel_de.c with a new
> intel_parent_mmio_regs() interface.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c      | 8 ++------
>  drivers/gpu/drm/i915/display/intel_parent.c  | 5 +++++
>  drivers/gpu/drm/i915/display/intel_parent.h  | 1 +
>  drivers/gpu/drm/i915/i915_driver.c           | 6 ++++++
>  drivers/gpu/drm/xe/display/xe_display.c      | 8 ++++++++
>  include/drm/intel/display_parent_interface.h | 3 +++
>  6 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index f02df9be3807..6d34a03d243a 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -11,7 +11,7 @@
>  #include "intel_display_regs.h"
>  #include "intel_display_rpm.h"
>  #include "intel_display_trace.h"
> -#include "intel_uncore.h"
> +#include "intel_parent.h"
>=20=20
>  static int intel_de_wait_for_register(struct intel_display *display,
>  				      intel_reg_t reg, u32 mask, u32 value,
> @@ -604,11 +604,7 @@ static bool driver_is_i915(void)
>=20=20
>  void intel_de_init(struct intel_display *display)
>  {
> -#ifdef I915
> -	display->mmio.regs =3D to_intel_uncore(display->drm)->regs;
> -#else
> -	display->mmio.regs =3D __compat_uncore_to_mmio(to_intel_uncore(display-=
>drm))->regs;
> -#endif
> +	display->mmio.regs =3D intel_parent_mmio_regs(display);
>=20=20
>  	spin_lock_init(&display->mmio.lock);
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/dr=
m/i915/display/intel_parent.c
> index ed3e21b0a927..24daf61542a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.c
> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
> @@ -451,6 +451,11 @@ bool intel_parent_has_fenced_regions(struct intel_di=
splay *display)
>  	return display->parent->has_fenced_regions && display->parent->has_fenc=
ed_regions(display->drm);
>  }
>=20=20
> +void __iomem *intel_parent_mmio_regs(struct intel_display *display)
> +{
> +	return display->parent->mmio_regs(display->drm);
> +}
> +
>  void intel_parent_transient_data_flush(struct intel_display *display)
>  {
>  	if (display->parent->transient_data_flush)
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/dr=
m/i915/display/intel_parent.h
> index 923cb6464a98..28c1196a260f 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.h
> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
> @@ -155,6 +155,7 @@ int intel_parent_vlv_iosf_write(struct intel_display =
*display, enum vlv_iosf_sb_
>  /* generic */
>  bool intel_parent_has_auxccs(struct intel_display *display);
>  bool intel_parent_has_fenced_regions(struct intel_display *display);
> +void __iomem *intel_parent_mmio_regs(struct intel_display *display);
>  void intel_parent_transient_data_flush(struct intel_display *display);
>  bool intel_parent_vgpu_active(struct intel_display *display);
>  void intel_parent_fence_priority_display(struct intel_display *display, =
struct dma_fence *fence);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 923b239714b7..017871b9aaa2 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -737,6 +737,11 @@ static bool has_fenced_regions(struct drm_device *dr=
m)
>  	return intel_gt_support_legacy_fencing(to_gt(to_i915(drm)));
>  }
>=20=20
> +static void __iomem *mmio_regs(struct drm_device *drm)
> +{
> +	return to_intel_uncore(drm)->regs;
> +}
> +
>  static bool vgpu_active(struct drm_device *drm)
>  {
>  	return intel_vgpu_active(to_i915(drm));
> @@ -763,6 +768,7 @@ static const struct intel_display_parent_interface pa=
rent =3D {
>  	.fence_priority_display =3D fence_priority_display,
>  	.has_auxccs =3D has_auxccs,
>  	.has_fenced_regions =3D has_fenced_regions,
> +	.mmio_regs =3D mmio_regs,
>  	.vgpu_active =3D vgpu_active,
>  };
>=20=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 0236f69a0f88..5ace8295b498 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -447,6 +447,13 @@ static bool has_auxccs(struct drm_device *drm)
>  	return xe->info.platform =3D=3D XE_ALDERLAKE_P;
>  }
>=20=20
> +static void __iomem *mmio_regs(struct drm_device *drm)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +
> +	return xe->mmio.regs;
> +}
> +
>  /*
>   * TDF (Transient-Data-Flush) is needed for Xe2+ where special L3:XD cac=
hing can
>   * be enabled through various PAT index modes. Idea is to use this cachi=
ng mode
> @@ -475,6 +482,7 @@ static const struct intel_display_parent_interface pa=
rent =3D {
>  	.stolen =3D &xe_display_stolen_interface,
>  	.wa =3D &xe_display_wa_interface,
>  	.has_auxccs =3D has_auxccs,
> +	.mmio_regs =3D mmio_regs,
>  	.transient_data_flush =3D transient_data_flush,
>  };
>=20=20
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/i=
ntel/display_parent_interface.h
> index fd799980c941..8dbce1790821 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -314,6 +314,9 @@ struct intel_display_parent_interface {
>  		/** @has_fenced_regions: Support legacy fencing? Optional. */
>  		bool (*has_fenced_regions)(struct drm_device *drm);
>=20=20
> +		/** @mmio_regs: Return the pointer to the memory mapped registers. */
> +		void __iomem *(*mmio_regs)(struct drm_device *drm);
> +
>  		/** @transient_data_flush: Transient data flush. Optional. */
>  		void (*transient_data_flush)(struct drm_device *drm);

--=20
Jani Nikula, Intel
