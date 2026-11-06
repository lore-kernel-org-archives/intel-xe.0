Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B1606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NuacBkHy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAB1112F14;
	Fri,  6 Nov 2026 16:40:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E196112F0D;
 Fri,  6 Nov 2026 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793983211; x=1825519211;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8BMRy9mn1zMB9zDbnYxVfXPAdG58ILoS7UrIunxE4dc=;
 b=NuacBkHyxEkWYGsfcNrxR+11xS5ZUSGP3VJHczVpS0DArujIqTtUXckN
 FyYaJ5pn5oPvb9Ht7go269F8ykeJOmP6H9Ze0zJCuzzz5iMEBhbLzSA2u
 rDIUx86QsULToZPNaqFXLx1mPGLDTWpWbwGZbES/7Ktm81JW8cc4QSQMj
 /NVgGJlOhMaPcID6x74+gK2WT26G1vSdZG241F8FPPaL0ULmdC8M82/SD
 ZU5t4RluPLGFfhbWuIqO8oUFSEze0rIGvxhkqfuERLEzRQSNh9aFmlF21
 KzrMtVOuQvQDguTwd1efB+PCF86dI+h8rLESNfTfiBTrsQD2AskX6FnUg g==;
X-CSE-ConnectionGUID: ZdkoGT2wQNufcF9Hm0cPiQ==
X-CSE-MsgGUID: jA/Av1lYTVWH1lNXs99KQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2841654"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2841654"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 08:39:54 -0800
X-CSE-ConnectionGUID: e/F+ClwqSo6noPQwXDjefA==
X-CSE-MsgGUID: ke+md9pbSEejrU/CNjEZYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7648254"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 08:39:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7/9] drm/i915/de: Move unclaimed mmio detection into
 display code
In-Reply-To: <20261104221842.18799-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-8-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 18:39:50 +0200
Message-ID: <62e0866cc39795f9428688e2723282d16157e72a@intel.com>
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
> The FPGA_DBG/CLAIM_ER unclaimed mmio access detection only
> works for display registers. Therefore checking it for GT
> registers/etc is completely pointless. Hoist the whole thing
> into the display code. Eventually we'll also want to hook this
> up for xe, but for now we keep it i915 only to avoid too many
> functional changes in one go.
>
> Note that i915 used a separate spinlock to protect the
> mmio debug tracking. But basically whenever it would grab that
> lock it was already holding uncore.lock, so the double locking
> was rather pointless. When moving this into the display code
> we'll just protect it all with the same display mmio.lock that
> already provides any needed serialization of register accesses.
>
> This will of course speed up the non-fw GT register accesses
> with mmio debug enabled since we never do the two extra
> FPGA_DBG/CLAIM_ER reads for them.
>
> Note that we do lose the FPGA_DBG!=3D0xffffffff sanity check for
> non-display register accesses now. Possibly the GT side should
> use some harmless GT register for that instead. But I didn't
> bother looking for one at this time.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Some commentary inline, but didn't spot anything wrong, really.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c       | 175 +++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_de.h       |   3 +
>  drivers/gpu/drm/i915/display/intel_display.c  |   3 +-
>  .../gpu/drm/i915/display/intel_display_core.h |   7 +
>  .../drm/i915/display/intel_display_driver.c   |  15 ++
>  .../drm/i915/display/intel_display_driver.h   |   3 +
>  .../drm/i915/display/intel_display_params.c   |   4 +
>  .../drm/i915/display/intel_display_params.h   |   1 +
>  .../gpu/drm/i915/display/intel_display_regs.h |   8 +
>  drivers/gpu/drm/i915/i915_driver.c            |  12 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   1 -
>  drivers/gpu/drm/i915/i915_params.c            |   4 -
>  drivers/gpu/drm/i915/i915_params.h            |   1 -
>  drivers/gpu/drm/i915/i915_reg.h               |   7 -
>  drivers/gpu/drm/i915/intel_uncore.c           | 193 +-----------------
>  drivers/gpu/drm/i915/intel_uncore.h           |  24 ---
>  16 files changed, 222 insertions(+), 239 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 8b7a4e696ff9..0a51105e0fba 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_print.h>
>=20=20
>  #include "intel_de.h"
> +#include "intel_display_regs.h"
>=20=20
>  static int intel_de_wait_for_register(struct intel_display *display,
>  				      intel_reg_t reg, u32 mask, u32 value,
> @@ -163,8 +164,127 @@ u16 intel_de_read16(struct intel_display *display, =
intel_reg_t reg)
>  	return intel_uncore_read16(__to_uncore(display), reg);
>  }
>=20=20
> +static bool ivb_check_for_unclaimed_mmio(struct intel_display *display)
> +{
> +	u32 dbg;
> +
> +	dbg =3D intel_de_read_fw(display, FPGA_DBG);
> +	if (likely(!(dbg & FPGA_DBG_RM_NOCLAIM)))
> +		return false;
> +
> +	/*
> +	 * Bugs in PCI programming (or failing hardware) can occasionally cause
> +	 * us to lose access to the MMIO BAR.  When this happens, register
> +	 * reads will come back with 0xFFFFFFFF for every register and things
> +	 * go bad very quickly.  Let's try to detect that special case and at
> +	 * least try to print a more informative message about what has
> +	 * happened.
> +	 *
> +	 * During normal operation the FPGA_DBG register has several unused
> +	 * bits that will always read back as 0's so we can use them as canaries
> +	 * to recognize when MMIO accesses are just busted.
> +	 */
> +	if (unlikely(dbg =3D=3D ~0))
> +		drm_err(display->drm,
> +			"Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\=
n");
> +
> +	intel_de_write_fw(display, FPGA_DBG, FPGA_DBG_RM_NOCLAIM);
> +
> +	return true;
> +}
> +
> +static bool vlv_check_for_unclaimed_mmio(struct intel_display *display)
> +{
> +	u32 cer;
> +
> +	cer =3D intel_de_read_fw(display, CLAIM_ER);
> +	if (likely(!(cer & (CLAIM_ER_OVERFLOW | CLAIM_ER_CTR_MASK))))
> +		return false;
> +
> +	intel_de_write_fw(display, CLAIM_ER, CLAIM_ER_CLR);
> +
> +	return true;
> +}
> +
> +static void check_unclaimed_mmio_pre(struct intel_display *display,
> +				     intel_reg_t reg, bool write)
> +{
> +	lockdep_assert_held(&display->mmio.lock);
> +
> +	if (!display->params.mmio_debug)
> +		return;
> +
> +	if (display->mmio.funcs->check_for_unclaimed_mmio(display))
> +		drm_dbg_kms(display->drm,
> +			    "Unclaimed access detected before %s register 0x%x\n",
> +			    write ? "write to" : "read from",
> +			    i915_mmio_reg_offset(reg));
> +}
> +
> +static void check_unclaimed_mmio_post(struct intel_display *display,
> +				      intel_reg_t reg, bool write)
> +{
> +	lockdep_assert_held(&display->mmio.lock);
> +
> +	if (!display->params.mmio_debug)
> +		return;
> +
> +	if (drm_WARN(display->drm,
> +		     display->mmio.funcs->check_for_unclaimed_mmio(display),
> +		     "Unclaimed %s register 0x%x\n",
> +		     write ? "write to" : "read from",
> +		     i915_mmio_reg_offset(reg)))
> +		/* Only report the first N failures */
> +		display->params.mmio_debug--;
> +}
> +
> +bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
> +{
> +	bool ret;
> +
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> +		return false;
> +
> +	spin_lock_irq(&display->mmio.lock);
> +	ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
> +	spin_unlock_irq(&display->mmio.lock);
> +
> +	return ret;
> +}
> +
> +bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
> +{
> +	bool ret =3D false;
> +
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> +		return false;
> +
> +	spin_lock_irq(&display->mmio.lock);
> +
> +	if (display->mmio.unclaimed_mmio_check <=3D 0)
> +		goto out;
> +
> +	if (display->mmio.funcs->check_for_unclaimed_mmio(display)) {
> +		if (!display->params.mmio_debug) {
> +			drm_dbg_kms(display->drm,
> +				    "Unclaimed register detected, "
> +				    "enabling oneshot unclaimed register reporting. "
> +				    "Please use i915.mmio_debug=3DN for more information.\n");
> +			display->params.mmio_debug++;
> +		}
> +		display->mmio.unclaimed_mmio_check--;

Side note, with the current usage (both before and after the patch) this
could be replaced with a bool instead of an int. Maybe there's some idea
behind it being an int.

> +		ret =3D true;
> +	}
> +
> +out:
> +	spin_unlock_irq(&display->mmio.lock);
> +
> +	return ret;
> +}
> +
>  #define __MMIO_WAKELOCK		BIT(0)
>  #define __MMIO_LOCK		BIT(1)
> +#define __MMIO_UNCLAIMED	BIT(2)
>=20=20
>  static __always_inline void
>  __mmio_wakelock_pre(struct intel_display *display, intel_reg_t reg,
> @@ -198,6 +318,22 @@ __mmio_lock_post(struct intel_display *display, unsi=
gned long irqflags,
>  		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
>  }
>=20=20
> +static __always_inline void
> +__mmio_unclaimed_pre(struct intel_display *display, intel_reg_t reg,
> +		     const bool write, const unsigned int mmio_flags)
> +{
> +	if (mmio_flags & __MMIO_UNCLAIMED)
> +		check_unclaimed_mmio_pre(display, reg, write);
> +}
> +
> +static __always_inline void
> +__mmio_unclaimed_post(struct intel_display *display, intel_reg_t reg,
> +		      const bool write, const unsigned int mmio_flags)
> +{
> +	if (mmio_flags & __MMIO_UNCLAIMED)
> +		check_unclaimed_mmio_post(display, reg, write);
> +}
> +
>  static __always_inline u32
>  __intel_de_read(struct intel_display *display, intel_reg_t reg,
>  		const unsigned int mmio_flags)
> @@ -207,9 +343,11 @@ __intel_de_read(struct intel_display *display, intel=
_reg_t reg,
>=20=20
>  	__mmio_wakelock_pre(display, reg, mmio_flags);
>  	__mmio_lock_pre(display, &irqflags, mmio_flags);
> +	__mmio_unclaimed_pre(display, reg, false, mmio_flags);
>=20=20
>  	val =3D intel_uncore_read(__to_uncore(display), reg);
>=20=20
> +	__mmio_unclaimed_post(display, reg, false, mmio_flags);
>  	__mmio_lock_post(display, irqflags, mmio_flags);
>  	__mmio_wakelock_post(display, reg, mmio_flags);
>=20=20
> @@ -224,9 +362,11 @@ __intel_de_write(struct intel_display *display, inte=
l_reg_t reg, u32 val,
>=20=20
>  	__mmio_wakelock_pre(display, reg, mmio_flags);
>  	__mmio_lock_pre(display, &irqflags, mmio_flags);
> +	__mmio_unclaimed_pre(display, reg, true, mmio_flags);
>=20=20
>  	intel_uncore_write(__to_uncore(display), reg, val);
>=20=20
> +	__mmio_unclaimed_post(display, reg, true, mmio_flags);
>  	__mmio_lock_post(display, irqflags, mmio_flags);
>  	__mmio_wakelock_post(display, reg, mmio_flags);
>  }
> @@ -269,6 +409,32 @@ static const struct intel_mmio_funcs snb_mmio_funcs =
=3D {
>  	.write =3D snb_mmio_write,
>  };
>=20=20
> +#define IVB_MMIO_FLAGS (__MMIO_LOCK | __MMIO_UNCLAIMED)
> +
> +static u32 ivb_mmio_read(struct intel_display *display, intel_reg_t reg)
> +{
> +	return __intel_de_read(display, reg, IVB_MMIO_FLAGS);
> +}
> +
> +static void ivb_mmio_write(struct intel_display *display, intel_reg_t re=
g, u32 val)
> +{
> +	__intel_de_write(display, reg, val, IVB_MMIO_FLAGS);
> +}
> +
> +#undef IVB_MMIO_FLAGS
> +
> +static const struct intel_mmio_funcs ivb_mmio_funcs =3D {
> +	.read =3D ivb_mmio_read,
> +	.write =3D ivb_mmio_write,
> +	.check_for_unclaimed_mmio =3D ivb_check_for_unclaimed_mmio,
> +};
> +
> +static const struct intel_mmio_funcs vlv_mmio_funcs =3D {
> +	.read =3D ivb_mmio_read,
> +	.write =3D ivb_mmio_write,
> +	.check_for_unclaimed_mmio =3D vlv_check_for_unclaimed_mmio,
> +};
> +
>  #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
>=20=20
>  static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
> @@ -304,7 +470,11 @@ void intel_de_init(struct intel_display *display)
>  	spin_lock_init(&display->mmio.lock);
>=20=20
>  	if (driver_is_i915()) {
> -		if (DISPLAY_VER(display) >=3D 6)
> +		if (display->platform.valleyview || display->platform.cherryview)
> +			display->mmio.funcs =3D &vlv_mmio_funcs;
> +		else if (DISPLAY_VER(display) >=3D 7)
> +			display->mmio.funcs =3D &ivb_mmio_funcs;
> +		else if (DISPLAY_VER(display) >=3D 6)
>  			display->mmio.funcs =3D &snb_mmio_funcs;
>  		else
>  			display->mmio.funcs =3D &i9xx_mmio_funcs;
> @@ -314,4 +484,7 @@ void intel_de_init(struct intel_display *display)
>  		else
>  			display->mmio.funcs =3D &i9xx_mmio_funcs;
>  	}
> +
> +	if (display->mmio.funcs->check_for_unclaimed_mmio)
> +		display->mmio.unclaimed_mmio_check =3D 1;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 760b8bc31f9b..310f81edc09d 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -14,6 +14,7 @@
>  struct intel_mmio_funcs {
>  	u32 (*read)(struct intel_display *display, intel_reg_t reg);
>  	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
> +	bool (*check_for_unclaimed_mmio)(struct intel_display *display);
>  };
>=20=20
>  static inline struct intel_uncore *__to_uncore(struct intel_display *dis=
play)
> @@ -22,6 +23,8 @@ static inline struct intel_uncore *__to_uncore(struct i=
ntel_display *display)
>  }
>=20=20
>  void intel_de_init(struct intel_display *display);
> +bool intel_de_unclaimed_mmio_detected(struct intel_display *display);
> +bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display=
);
>=20=20
>  u8 intel_de_read8(struct intel_display *display, intel_reg_t reg);
>  void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 =
val);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index cf9190969da7..1077cc27052d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7740,7 +7740,6 @@ static void intel_atomic_dsb_finish(struct intel_at=
omic_state *state,
>  static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  {
>  	struct intel_display *display =3D to_intel_display(state);
> -	struct intel_uncore *uncore =3D to_intel_uncore(display->drm);
>  	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>  	struct intel_crtc *crtc;
>  	struct intel_power_domain_mask put_domains[I915_MAX_PIPES] =3D {};
> @@ -7954,7 +7953,7 @@ static void intel_atomic_commit_tail(struct intel_a=
tomic_state *state)
>  		 * so enable debugging for the next modeset - and hope we catch
>  		 * the culprit.
>  		 */
> -		intel_uncore_arm_unclaimed_mmio_detection(uncore);
> +		intel_de_arm_unclaimed_mmio_detection(display);
>  	}
>=20=20
>  	power_async_delay =3D intel_display_power_select_target_dc_state(state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index aded2af8c92a..cb18ee040b5d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -539,11 +539,18 @@ struct intel_display {
>  		 * serializes all display register accesses done
>  		 * using intel_de_{read,write}(), but not those
>  		 * done using intel_de_{read,write}_fw().
> +		 *
> +		 * The lock also protects mmio.mmio_debug and
> +		 * mmio.unclaimed_mmio_check.
>  		 */
>  		spinlock_t lock;
>=20=20
>  		struct intel_uncore *uncore;
>  		const struct intel_mmio_funcs *funcs;
> +
> +		/* protected by mmio.lock */
> +		int mmio_debug;
> +		int unclaimed_mmio_check;
>  	} mmio;
>=20=20
>  	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index 0c7bec7d7f01..778d6c7ca4c8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -30,6 +30,7 @@
>  #include "intel_crtc.h"
>  #include "intel_cursor.h"
>  #include "intel_dbuf_bw.h"
> +#include "intel_de.h"
>  #include "intel_display_clock_gating.h"
>  #include "intel_display_core.h"
>  #include "intel_display_debugfs.h"
> @@ -973,3 +974,17 @@ void intel_display_driver_pm_runtime_resume(struct i=
ntel_display *display)
>=20=20
>  	skl_watermark_ipc_update(display);
>  }
> +
> +void intel_display_driver_mmio_resume_early(struct intel_display *displa=
y)
> +{
> +	if (intel_de_unclaimed_mmio_detected(display))
> +		drm_dbg_kms(display->drm,
> +			    "Unclaimed access during suspend, bios?\n");
> +}
> +
> +void intel_display_driver_mmio_suspend_late(struct intel_display *displa=
y)
> +{
> +	if (intel_de_arm_unclaimed_mmio_detection(display))
> +		drm_err(display->drm,
> +			"Unclaimed access detected prior to suspending\n");
> +}

Not super thrilled about adding more display hooks for the drivers to
call. Can we move these to existing display hooks in a follow-up?

> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/driver=
s/gpu/drm/i915/display/intel_display_driver.h
> index 1ae2ad7e95f6..6f04a92902fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
> @@ -32,6 +32,9 @@ void intel_display_driver_pm_suspend_late(struct intel_=
display *display, bool s2
>  void intel_display_driver_pm_resume_early(struct intel_display *display);
>  void intel_display_driver_pm_resume(struct intel_display *display);
>=20=20
> +void intel_display_driver_mmio_suspend_late(struct intel_display *displa=
y);
> +void intel_display_driver_mmio_resume_early(struct intel_display *displa=
y);
> +
>  /* interface for intel_display_reset.c */
>  int __intel_display_driver_resume(struct intel_display *display,
>  				  struct drm_atomic_commit *state,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/driver=
s/gpu/drm/i915/display/intel_display_params.c
> index ca0ef466bb10..ace3081461de 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -143,6 +143,10 @@ intel_display_param_named_unsafe(enable_dmc_wl, int,=
 0400,
>  	"(-1=3Duse per-chip default, 0=3Ddisabled, 1=3Denabled, 2=3Dmatch any r=
egister, 3=3Dalways locked) "
>  	"Default: -1");
>=20=20
> +intel_display_param_named(mmio_debug, int, 0400,
> +	"Enable the MMIO debug code for the first N failures (default: off). "
> +	"This may negatively affect performance.");
> +

Perhaps this should be changed to _unsafe (in a follow-up).

>  __maybe_unused
>  static void _param_print_bool(struct drm_printer *p, const char *driver_=
name,
>  			      const char *name, bool val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driver=
s/gpu/drm/i915/display/intel_display_params.h
> index 5c5a1a1358c3..bcbca95318d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -51,6 +51,7 @@ struct drm_printer;
>  	param(bool, psr_safest_params, false, 0400) \
>  	param(bool, enable_psr2_sel_fetch, true, 0400) \
>  	param(int, enable_dmc_wl, -1, 0400) \
> +	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
>  	/*
>  	 * Debugfs-only knob (per-device): no matching module_param is register=
ed
>  	 * in intel_display_params.c on purpose. Runtime-toggle via debugfs.
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/=
gpu/drm/i915/display/intel_display_regs.h
> index bbdbc27629d7..f213bdffcc8d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -3287,4 +3287,12 @@ enum skl_power_gate {
>  #define   FW_BLC_SELF_FIFO_MASK    REG_BIT(16) /* 945 only */
>  #define   FW_BLC_SELF_EN           REG_BIT(15) /* 945 only */
>=20=20
> +#define FPGA_DBG		_MMIO(0x42300)
> +#define   FPGA_DBG_RM_NOCLAIM	REG_BIT(31)
> +
> +#define CLAIM_ER		_MMIO(VLV_DISPLAY_BASE + 0x2028)
> +#define   CLAIM_ER_CLR		REG_BIT(31)
> +#define   CLAIM_ER_OVERFLOW	REG_BIT(16)
> +#define   CLAIM_ER_CTR_MASK	REG_GENMASK(15, 0)
> +
>  #endif /* __INTEL_DISPLAY_REGS_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 5787f40ac62e..923b239714b7 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -238,8 +238,6 @@ static int i915_driver_early_probe(struct drm_i915_pr=
ivate *dev_priv)
>=20=20
>  	intel_step_init(dev_priv);
>=20=20
> -	intel_uncore_mmio_debug_init_early(dev_priv);
> -
>  	spin_lock_init(&dev_priv->gpu_error.lock);
>=20=20
>  	intel_sbi_init(display);
> @@ -1281,6 +1279,8 @@ static int i915_drm_resume_early(struct drm_device =
*dev)
>  		drm_err(&dev_priv->drm,
>  			"Resume prepare failed: %d, continuing anyway\n", ret);
>=20=20
> +	intel_display_driver_mmio_resume_early(display);
> +

There's intel_display_driver_pm_resume_early() just below context here
that could call this.

>  	for_each_gt(gt, dev_priv, i)
>  		intel_gt_resume_early(gt);
>=20=20
> @@ -1546,9 +1546,7 @@ static int i915_pm_runtime_suspend(struct device *k=
dev)
>  	enable_rpm_wakeref_asserts(rpm);
>  	intel_runtime_pm_driver_release(rpm);
>=20=20
> -	if (intel_uncore_arm_unclaimed_mmio_detection(&dev_priv->uncore))
> -		drm_err(&dev_priv->drm,
> -			"Unclaimed access detected prior to suspending\n");
> +	intel_display_driver_mmio_suspend_late(display);

Maybe this could be in intel_display_driver_pm_runtime_suspend_late()?

>=20=20
>  	/*
>  	 * FIXME: Temporary hammer to avoid freezing the machine on our DGFX
> @@ -1587,9 +1585,7 @@ static int i915_pm_runtime_resume(struct device *kd=
ev)
>  	if (root_pdev)
>  		pci_d3cold_enable(root_pdev);
>=20=20
> -	if (intel_uncore_unclaimed_mmio(&dev_priv->uncore))
> -		drm_dbg(&dev_priv->drm,
> -			"Unclaimed access during suspend, bios?\n");
> +	intel_display_driver_mmio_resume_early(display);

The below could call this.

I guess the juggling could be in a follow-up, since the patch is already
a bit much and hard to review.

>  	intel_display_driver_pm_runtime_resume_early(display);
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index dafee3dcd1c5..95637ada00d7 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -185,7 +185,6 @@ struct drm_i915_private {
>  	struct i915_dsm dsm;
>=20=20
>  	struct intel_uncore uncore;
> -	struct intel_uncore_mmio_debug mmio_debug;
>=20=20
>  	struct i915_virtual_gpu vgpu;
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i9=
15_params.c
> index 34ed82bb1b1a..377d3c005580 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -88,10 +88,6 @@ i915_param_named_unsafe(force_probe, charp, 0400,
>  i915_param_named(memtest, bool, 0400,
>  	"Perform a read/write test of all device memory on module load (default=
: off)");
>=20=20
> -i915_param_named(mmio_debug, int, 0400,
> -	"Enable the MMIO debug code for the first N failures (default: off). "
> -	"This may negatively affect performance.");
> -
>  i915_param_named_unsafe(enable_guc, int, 0400,
>  	"Enable GuC load for GuC submission and/or HuC load. "
>  	"Required functionality can be selected using bitmask values. "
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i9=
15_params.h
> index 4d9d4cd3220d..0cb46609f4a3 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -53,7 +53,6 @@ struct drm_printer;
>  	param(char *, huc_firmware_path, NULL, 0400) \
>  	param(char *, gsc_firmware_path, NULL, 0400) \
>  	param(bool, memtest, false, 0400) \
> -	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
>  	param(unsigned int, reset, 3, 0600) \
>  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
>  	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT=
, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index d873072b7a92..806e5a56471d 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -325,13 +325,6 @@
>  #define GEN7_MEDIA_MAX_REQ_COUNT	_MMIO(0x4070)
>  #define GEN7_GFX_MAX_REQ_COUNT		_MMIO(0x4074)
>=20=20
> -#define FPGA_DBG		_MMIO(0x42300)
> -#define   FPGA_DBG_RM_NOCLAIM	REG_BIT(31)
> -
> -#define CLAIM_ER		_MMIO(VLV_DISPLAY_BASE + 0x2028)
> -#define   CLAIM_ER_CLR		REG_BIT(31)
> -#define   CLAIM_ER_OVERFLOW	REG_BIT(16)
> -#define   CLAIM_ER_CTR_MASK	REG_GENMASK(15, 0)
>=20=20
>  #define VLV_GU_CTL0	_MMIO(VLV_DISPLAY_BASE + 0x2030)
>  #define VLV_GU_CTL1	_MMIO(VLV_DISPLAY_BASE + 0x2034)
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index abd695e880c1..b53059c1a782 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -56,15 +56,6 @@ fw_domains_get(struct intel_uncore *uncore, enum force=
wake_domains fw_domains)
>  	uncore->fw_get_funcs->force_wake_get(uncore, fw_domains);
>  }
>=20=20
> -void
> -intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915)
> -{
> -	spin_lock_init(&i915->mmio_debug.lock);
> -	i915->mmio_debug.unclaimed_mmio_check =3D 1;
> -
> -	i915->uncore.debug =3D &i915->mmio_debug;
> -}
> -
>  static const char * const forcewake_domain_names[] =3D {
>  	"render",
>  	"gt",
> @@ -512,66 +503,6 @@ intel_uncore_forcewake_reset(struct intel_uncore *un=
core)
>  	return fw; /* track the lost user forcewake domains */
>  }
>=20=20
> -static bool
> -fpga_check_for_unclaimed_mmio(struct intel_uncore *uncore)
> -{
> -	u32 dbg;
> -
> -	dbg =3D __raw_uncore_read32(uncore, FPGA_DBG);
> -	if (likely(!(dbg & FPGA_DBG_RM_NOCLAIM)))
> -		return false;
> -
> -	/*
> -	 * Bugs in PCI programming (or failing hardware) can occasionally cause
> -	 * us to lose access to the MMIO BAR.  When this happens, register
> -	 * reads will come back with 0xFFFFFFFF for every register and things
> -	 * go bad very quickly.  Let's try to detect that special case and at
> -	 * least try to print a more informative message about what has
> -	 * happened.
> -	 *
> -	 * During normal operation the FPGA_DBG register has several unused
> -	 * bits that will always read back as 0's so we can use them as canaries
> -	 * to recognize when MMIO accesses are just busted.
> -	 */
> -	if (unlikely(dbg =3D=3D ~0))
> -		drm_err(&uncore->i915->drm,
> -			"Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\=
n");
> -
> -	__raw_uncore_write32(uncore, FPGA_DBG, FPGA_DBG_RM_NOCLAIM);
> -
> -	return true;
> -}
> -
> -static bool
> -vlv_check_for_unclaimed_mmio(struct intel_uncore *uncore)
> -{
> -	u32 cer;
> -
> -	cer =3D __raw_uncore_read32(uncore, CLAIM_ER);
> -	if (likely(!(cer & (CLAIM_ER_OVERFLOW | CLAIM_ER_CTR_MASK))))
> -		return false;
> -
> -	__raw_uncore_write32(uncore, CLAIM_ER, CLAIM_ER_CLR);
> -
> -	return true;
> -}
> -
> -static bool
> -check_for_unclaimed_mmio(struct intel_uncore *uncore)
> -{
> -	bool ret =3D false;
> -
> -	lockdep_assert_held(&uncore->debug->lock);
> -
> -	if (intel_uncore_has_fpga_dbg_unclaimed(uncore))
> -		ret |=3D fpga_check_for_unclaimed_mmio(uncore);
> -
> -	if (intel_uncore_has_dbg_unclaimed(uncore))
> -		ret |=3D vlv_check_for_unclaimed_mmio(uncore);
> -
> -	return ret;
> -}
> -
>  static void forcewake_early_sanitize(struct intel_uncore *uncore,
>  				     unsigned int restore_forcewake)
>  {
> @@ -617,9 +548,6 @@ void intel_uncore_resume_early(struct intel_uncore *u=
ncore)
>  {
>  	unsigned int restore_forcewake;
>=20=20
> -	if (intel_uncore_unclaimed_mmio(uncore))
> -		drm_dbg(&uncore->i915->drm, "unclaimed mmio detected on resume, cleari=
ng\n");
> -
>  	if (!intel_uncore_has_forcewake(uncore))
>  		return;
>=20=20
> @@ -1734,59 +1662,6 @@ ilk_dummy_write(struct intel_uncore *uncore)
>  	__raw_uncore_write32(uncore, RING_MI_MODE(RENDER_RING_BASE), 0);
>  }
>=20=20
> -static void
> -__unclaimed_reg_debug(struct intel_uncore *uncore,
> -		      const i915_reg_t reg,
> -		      const bool read)
> -{
> -	if (drm_WARN(&uncore->i915->drm,
> -		     check_for_unclaimed_mmio(uncore),
> -		     "Unclaimed %s register 0x%x\n",
> -		     read ? "read from" : "write to",
> -		     i915_mmio_reg_offset(reg)))
> -		/* Only report the first N failures */
> -		uncore->i915->params.mmio_debug--;
> -}
> -
> -static void
> -__unclaimed_previous_reg_debug(struct intel_uncore *uncore,
> -			       const i915_reg_t reg,
> -			       const bool read)
> -{
> -	if (check_for_unclaimed_mmio(uncore))
> -		drm_dbg(&uncore->i915->drm,
> -			"Unclaimed access detected before %s register 0x%x\n",
> -			read ? "read from" : "write to",
> -			i915_mmio_reg_offset(reg));
> -}
> -
> -static inline bool __must_check
> -unclaimed_reg_debug_header(struct intel_uncore *uncore,
> -			   const i915_reg_t reg, const bool read)
> -{
> -	if (likely(!uncore->i915->params.mmio_debug) || !uncore->debug)
> -		return false;
> -
> -	/* interrupts are disabled and re-enabled around uncore->lock usage */
> -	lockdep_assert_held(&uncore->lock);
> -
> -	spin_lock(&uncore->debug->lock);
> -	__unclaimed_previous_reg_debug(uncore, reg, read);
> -
> -	return true;
> -}
> -
> -static inline void
> -unclaimed_reg_debug_footer(struct intel_uncore *uncore,
> -			   const i915_reg_t reg, const bool read)
> -{
> -	/* interrupts are disabled and re-enabled around uncore->lock usage */
> -	lockdep_assert_held(&uncore->lock);
> -
> -	__unclaimed_reg_debug(uncore, reg, read);
> -	spin_unlock(&uncore->debug->lock);
> -}
> -
>  #define __vgpu_read(x) \
>  static u##x \
>  vgpu_read##x(struct intel_uncore *uncore, i915_reg_t reg, bool trace) { \
> @@ -1842,15 +1717,11 @@ __gen2_read(64)
>  #define GEN6_READ_HEADER(x) \
>  	u32 offset =3D i915_mmio_reg_offset(reg); \
>  	unsigned long irqflags; \
> -	bool unclaimed_reg_debug; \
>  	u##x val =3D 0; \
>  	assert_rpm_wakelock_held(uncore->rpm); \
> -	spin_lock_irqsave(&uncore->lock, irqflags); \
> -	unclaimed_reg_debug =3D unclaimed_reg_debug_header(uncore, reg, true)
> +	spin_lock_irqsave(&uncore->lock, irqflags)
>=20=20
>  #define GEN6_READ_FOOTER \
> -	if (unclaimed_reg_debug) \
> -		unclaimed_reg_debug_footer(uncore, reg, true);	\
>  	spin_unlock_irqrestore(&uncore->lock, irqflags); \
>  	trace_i915_reg_rw(false, reg, val, sizeof(val), trace); \
>  	return val
> @@ -1948,15 +1819,11 @@ __gen2_write(32)
>  #define GEN6_WRITE_HEADER \
>  	u32 offset =3D i915_mmio_reg_offset(reg); \
>  	unsigned long irqflags; \
> -	bool unclaimed_reg_debug; \
>  	trace_i915_reg_rw(true, reg, val, sizeof(val), trace); \
>  	assert_rpm_wakelock_held(uncore->rpm); \
> -	spin_lock_irqsave(&uncore->lock, irqflags); \
> -	unclaimed_reg_debug =3D unclaimed_reg_debug_header(uncore, reg, false)
> +	spin_lock_irqsave(&uncore->lock, irqflags)
>=20=20
>  #define GEN6_WRITE_FOOTER \
> -	if (unclaimed_reg_debug) \
> -		unclaimed_reg_debug_footer(uncore, reg, false); \
>  	spin_unlock_irqrestore(&uncore->lock, irqflags)
>=20=20
>  #define __gen6_write(x) \
> @@ -2490,7 +2357,6 @@ static int sanity_check_mmio_access(struct intel_un=
core *uncore)
>  int intel_uncore_init_mmio(struct intel_uncore *uncore)
>  {
>  	struct drm_i915_private *i915 =3D uncore->i915;
> -	struct intel_display *display =3D i915->display;
>  	int ret;
>=20=20
>  	ret =3D sanity_check_mmio_access(uncore);
> @@ -2525,19 +2391,9 @@ int intel_uncore_init_mmio(struct intel_uncore *un=
core)
>  	GEM_BUG_ON(intel_uncore_has_forcewake(uncore) !=3D !!uncore->funcs.read=
_fw_domains);
>  	GEM_BUG_ON(intel_uncore_has_forcewake(uncore) !=3D !!uncore->funcs.writ=
e_fw_domains);
>=20=20
> -	if (HAS_FPGA_DBG_UNCLAIMED(display))

This macro becomes unused, along with struct intel_display_device_info
.has_fpga_dbg member. I think it's fine to remove this from the device
info, since it's not coming and going, but is fairly stable across
platforms. Again, can be follow-up.

BR,
Jani.

> -		uncore->flags |=3D UNCORE_HAS_FPGA_DBG_UNCLAIMED;
> -
> -	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> -		uncore->flags |=3D UNCORE_HAS_DBG_UNCLAIMED;
> -
>  	if (IS_GRAPHICS_VER(i915, 6, 7))
>  		uncore->flags |=3D UNCORE_HAS_FIFO;
>=20=20
> -	/* clear out unclaimed reg detection bit */
> -	if (intel_uncore_unclaimed_mmio(uncore))
> -		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\=
n");
> -
>  	return 0;
>  }
>=20=20
> @@ -2800,51 +2656,6 @@ int __intel_wait_for_register(struct intel_uncore =
*uncore,
>  	return ret;
>  }
>=20=20
> -bool intel_uncore_unclaimed_mmio(struct intel_uncore *uncore)
> -{
> -	bool ret;
> -
> -	if (!uncore->debug)
> -		return false;
> -
> -	spin_lock_irq(&uncore->debug->lock);
> -	ret =3D check_for_unclaimed_mmio(uncore);
> -	spin_unlock_irq(&uncore->debug->lock);
> -
> -	return ret;
> -}
> -
> -bool
> -intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
> -{
> -	bool ret =3D false;
> -
> -	if (drm_WARN_ON(&uncore->i915->drm, !uncore->debug))
> -		return false;
> -
> -	spin_lock_irq(&uncore->debug->lock);
> -
> -	if (unlikely(uncore->debug->unclaimed_mmio_check <=3D 0))
> -		goto out;
> -
> -	if (unlikely(check_for_unclaimed_mmio(uncore))) {
> -		if (!uncore->i915->params.mmio_debug) {
> -			drm_dbg(&uncore->i915->drm,
> -				"Unclaimed register detected, "
> -				"enabling oneshot unclaimed register reporting. "
> -				"Please use i915.mmio_debug=3DN for more information.\n");
> -			uncore->i915->params.mmio_debug++;
> -		}
> -		uncore->debug->unclaimed_mmio_check--;
> -		ret =3D true;
> -	}
> -
> -out:
> -	spin_unlock_irq(&uncore->debug->lock);
> -
> -	return ret;
> -}
> -
>  /**
>   * intel_uncore_forcewake_for_reg - which forcewake domains are needed t=
o access
>   * 				    a register
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/i=
ntel_uncore.h
> index 4ec7c545d04e..9047d7d4d855 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -39,11 +39,6 @@ struct intel_runtime_pm;
>  struct intel_uncore;
>  struct intel_gt;
>=20=20
> -struct intel_uncore_mmio_debug {
> -	spinlock_t lock; /** lock is also taken in irq contexts. */
> -	int unclaimed_mmio_check;
> -};
> -
>  enum forcewake_domain_id {
>  	FW_DOMAIN_ID_RENDER =3D 0,
>  	FW_DOMAIN_ID_GT,        /* also includes blitter engine */
> @@ -142,8 +137,6 @@ struct intel_uncore {
>=20=20
>  	unsigned int flags;
>  #define UNCORE_HAS_FORCEWAKE		BIT(0)
> -#define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> -#define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
>  #define UNCORE_HAS_FIFO			BIT(3)
>  #define UNCORE_NEEDS_FLR_ON_FINI	BIT(4)
>=20=20
> @@ -180,8 +173,6 @@ struct intel_uncore {
>  	} *fw_domain[FW_DOMAIN_ID_COUNT];
>=20=20
>  	unsigned int user_forcewake_count;
> -
> -	struct intel_uncore_mmio_debug *debug;
>  };
>=20=20
>  /* Iterate over initialised fw domains */
> @@ -198,18 +189,6 @@ intel_uncore_has_forcewake(const struct intel_uncore=
 *uncore)
>  	return uncore->flags & UNCORE_HAS_FORCEWAKE;
>  }
>=20=20
> -static inline bool
> -intel_uncore_has_fpga_dbg_unclaimed(const struct intel_uncore *uncore)
> -{
> -	return uncore->flags & UNCORE_HAS_FPGA_DBG_UNCLAIMED;
> -}
> -
> -static inline bool
> -intel_uncore_has_dbg_unclaimed(const struct intel_uncore *uncore)
> -{
> -	return uncore->flags & UNCORE_HAS_DBG_UNCLAIMED;
> -}
> -
>  static inline bool
>  intel_uncore_has_fifo(const struct intel_uncore *uncore)
>  {
> @@ -228,15 +207,12 @@ intel_uncore_set_flr_on_fini(struct intel_uncore *u=
ncore)
>  	return uncore->flags |=3D UNCORE_NEEDS_FLR_ON_FINI;
>  }
>=20=20
> -void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
>  void intel_uncore_init_early(struct intel_uncore *uncore,
>  			     struct intel_gt *gt);
>  int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phy=
s_addr);
>  int intel_uncore_init_mmio(struct intel_uncore *uncore);
>  void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>  					  struct intel_gt *gt);
> -bool intel_uncore_unclaimed_mmio(struct intel_uncore *uncore);
> -bool intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *unco=
re);
>  void intel_uncore_cleanup_mmio(struct intel_uncore *uncore);
>  void intel_uncore_fini_mmio(struct drm_device *dev, void *data);
>  void intel_uncore_suspend(struct intel_uncore *uncore);

--=20
Jani Nikula, Intel
