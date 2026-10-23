Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D36606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CBB112AA6;
	Fri, 23 Oct 2026 10:44:33 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5818A10E5FE;
 Fri, 23 Oct 2026 10:44:32 +0000 (UTC)
Received: from 176-93-65-246.bb.dnainternet.fi ([176.93.65.246]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xKCl9-00000004eTk-0WBU; Fri, 23 Oct 2026 13:44:29 +0300
Message-ID: <5303e0cc610f7af82090a9b34837505dfa06ba07.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 13:44:39 +0300
In-Reply-To: <0e895449ca26f0509ad92ee3a78af8dbc96d2880@intel.com>
References: <20261020090723.803321-1-luciano.coelho@intel.com>
 <20261020090723.803321-3-luciano.coelho@intel.com>
 <0e895449ca26f0509ad92ee3a78af8dbc96d2880@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
Subject: Re: [PATCH v5 2/2] drm/i915/display: separate display and core
 clock gating
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

On Fri, 2026-10-23 at 13:08 +0300, Jani Nikula wrote:
> On Tue, 20 Oct 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > We still call intel_clock_gating_init() from display when leaving
> > PC8+ and after a GPU reset.  The core clock gating code then calls
> > back into display, so we have dependencies in both directions.
> >=20
> > Move display and PCH clock gating into the display code and restore
> > the HSW/BDW GT and uncore workarounds from the device-level resume
> > paths instead.  Core clock gating is also handled separately when a
> > GPU reset affects display.
> >=20
> > Display doesn't need the core interface anymore, so build its clock
> > gating implementation for Xe and remove the compatibility header.
>=20
> So the end result here is pretty much what I want (*), but I'm slightly
> scared about the size of the patch and the number of changes. If there's
> a regression, can we pinpoint and fix it?

Yeah, I hear you, but I couldn't find any way to split this that would
not be quite artificial, or I would have to handle the init/resume in
both ways temporarily and I think that would make things worse.



> I didn't spot anything specifically wrong here, but there are a lot of
> changes and I might have missed some implications.
>=20

This was so entangled and spread around that I think only time will
tell if I got some detail wrong.


> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks! I finally did it! :D


> (*) In intel_display_driver_probe_nogem() I think we'll eventually want
>     early return for !HAS_DISPLAY(). But that should probably be a
>     separate change.

Yes, this makes sense, but I tried to keep the old functionality
wherever possible.  I'll send a patch with this change.

--
Cheers,
Luca.



> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  .../i915/display/intel_display_clock_gating.c | 13 ++++
> >  .../drm/i915/display/intel_display_driver.c   | 12 ++++
> >  .../drm/i915/display/intel_display_power.c    |  4 +-
> >  .../drm/i915/display/intel_display_reset.c    |  4 +-
> >  drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++
> >  drivers/gpu/drm/i915/i915_driver.c            |  6 ++
> >  drivers/gpu/drm/i915/i915_gem.c               |  9 ++-
> >  drivers/gpu/drm/i915/intel_clock_gating.c     | 70 +++++++------------
> >  drivers/gpu/drm/i915/intel_clock_gating.h     |  1 +
> >  drivers/gpu/drm/xe/Makefile                   |  1 +
> >  .../compat-i915-headers/intel_clock_gating.h  | 14 ----
> >  11 files changed, 71 insertions(+), 67 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_=
gating.h
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c =
b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > index 7961c0f10bb5..b0162d78d1c9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > @@ -11,6 +11,7 @@
> >  #include "intel_display_clock_gating.h"
> >  #include "intel_display_core.h"
> >  #include "intel_display_regs.h"
> > +#include "intel_pch.h"
> > =20
> >  static void intel_display_gen9_init_clock_gating(struct intel_display =
*display)
> >  {
> > @@ -69,6 +70,8 @@ static void intel_display_kbl_init_clock_gating(struc=
t intel_display *display)
> > =20
> >  static void intel_display_cfl_init_clock_gating(struct intel_display *=
display)
> >  {
> > +	intel_pch_init_clock_gating(display);
> > +
> >  	/*
> >  	 * WaCompressedResourceDisplayNewHashMode:skl,kbl (and cfl, cml)
> >  	 * Display WA #0390: skl,kbl (and cfl, cml)
> > @@ -166,6 +169,8 @@ static void intel_display_bdw_init_clock_gating(str=
uct intel_display *display)
> >  	intel_display_bdw_clock_gating_disable_fbcq(display);
> >  	intel_display_bdw_clock_gating_vblank_in_srd(display);
> >  	intel_display_bdw_clock_gating_kvm_notif(display);
> > +
> > +	intel_pch_init_clock_gating(display);
> >  }
> > =20
> >  static void intel_display_hsw_init_clock_gating(struct intel_display *=
display)
> > @@ -183,6 +188,8 @@ static void intel_display_hsw_init_clock_gating(str=
uct intel_display *display)
> >  		intel_de_rmw(display, CHICKEN_PIPESL_1(pipe), 0,
> >  			     HSW_UNMASK_VBL_TO_REGS_IN_SRD);
> >  	}
> > +
> > +	intel_pch_init_clock_gating(display);
> >  }
> > =20
> >  static void intel_display_disable_trickle_feed(struct intel_display *d=
isplay)
> > @@ -228,6 +235,8 @@ static void intel_display_ilk_init_clock_gating(str=
uct intel_display *display)
> >  	intel_de_rmw(display, ILK_DISPLAY_CHICKEN2, 0, ILK_ELPIN_409_SELECT);
> > =20
> >  	intel_display_disable_trickle_feed(display);
> > +
> > +	intel_pch_init_clock_gating(display);
> >  }
> > =20
> >  static void intel_display_gen6_init_clock_gating(struct intel_display =
*display)
> > @@ -260,6 +269,8 @@ static void intel_display_gen6_init_clock_gating(st=
ruct intel_display *display)
> >  		       ILK_DPFDUNIT_CLOCK_GATE_ENABLE);
> > =20
> >  	intel_display_disable_trickle_feed(display);
> > +
> > +	intel_pch_init_clock_gating(display);
> >  }
> > =20
> >  static void intel_display_ivb_init_clock_gating(struct intel_display *=
display)
> > @@ -268,6 +279,8 @@ static void intel_display_ivb_init_clock_gating(str=
uct intel_display *display)
> >  	intel_de_rmw(display, ILK_DISPLAY_CHICKEN1, 0, ILK_FBCQ_DIS);
> > =20
> >  	intel_display_disable_trickle_feed(display);
> > +
> > +	intel_pch_init_clock_gating(display);
> >  }
> > =20
> >  static void intel_display_g4x_init_clock_gating(struct intel_display *=
display)
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driv=
ers/gpu/drm/i915/display/intel_display_driver.c
> > index 77009dca7d0d..87571b1f03a0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> > @@ -29,6 +29,7 @@
> >  #include "intel_crtc.h"
> >  #include "intel_cursor.h"
> >  #include "intel_dbuf_bw.h"
> > +#include "intel_display_clock_gating.h"
> >  #include "intel_display_core.h"
> >  #include "intel_display_debugfs.h"
> >  #include "intel_display_driver.h"
> > @@ -462,6 +463,15 @@ int intel_display_driver_probe_nogem(struct intel_=
display *display)
> >  {
> >  	int ret;
> > =20
> > +	/*
> > +	 * Apply the display and PCH clock gating workarounds before gem/GT
> > +	 * init starts pushing memory traffic through the GT, matching the
> > +	 * timing the old core intel_clock_gating_init() hooks used to
> > +	 * provide.  Do this before the HAS_DISPLAY() check below, since the
> > +	 * core hooks used to call it unconditionally.
> > +	 */
> > +	intel_display_init_clock_gating(display);
> > +
> >  	if (!HAS_DISPLAY(display))
> >  		return 0;
> > =20
> > @@ -839,6 +849,8 @@ void intel_display_driver_pm_resume(struct intel_di=
splay *display)
> >  	struct drm_modeset_acquire_ctx ctx;
> >  	int ret;
> > =20
> > +	intel_display_init_clock_gating(display);
> > +
> >  	if (!HAS_DISPLAY(display))
> >  		return;
> > =20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drive=
rs/gpu/drm/i915/display/intel_display_power.c
> > index 1b60ce2dd00c..1ec0890f2afb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> > @@ -13,11 +13,11 @@
> >  #include "intel_alpm.h"
> >  #include "intel_backlight_regs.h"
> >  #include "intel_cdclk.h"
> > -#include "intel_clock_gating.h"
> >  #include "intel_combo_phy.h"
> >  #include "intel_crtc.h"
> >  #include "intel_de.h"
> >  #include "intel_display.h"
> > +#include "intel_display_clock_gating.h"
> >  #include "intel_display_power.h"
> >  #include "intel_display_power_map.h"
> >  #include "intel_display_power_well.h"
> > @@ -1597,7 +1597,7 @@ static void hsw_disable_pc8(struct intel_display =
*display)
> >  	intel_init_pch_refclk(display);
> > =20
> >  	/* Many display registers don't survive PC8+ */
> > -	intel_clock_gating_init(display->drm);
> > +	intel_display_init_clock_gating(display);
> >  }
> > =20
> >  static void intel_pch_reset_handshake(struct intel_display *display,
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drive=
rs/gpu/drm/i915/display/intel_display_reset.c
> > index 504ec7043cd9..a39ab2cc638b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_reset.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
> > @@ -8,8 +8,8 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_print.h>
> > =20
> > -#include "intel_clock_gating.h"
> >  #include "intel_cx0_phy.h"
> > +#include "intel_display_clock_gating.h"
> >  #include "intel_display_core.h"
> >  #include "intel_display_driver.h"
> >  #include "intel_display_reset.h"
> > @@ -99,7 +99,7 @@ void intel_display_reset_finish(struct intel_display =
*display, bool test_only)
> >  		 */
> >  		intel_pps_unlock_regs_wa(display);
> >  		intel_display_driver_init_hw(display);
> > -		intel_clock_gating_init(display->drm);
> > +		intel_display_init_clock_gating(display);
> >  		intel_cx0_pll_power_save_wa(display);
> >  		intel_hpd_init(display);
> > =20
> > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i9=
15/gt/intel_reset.c
> > index bd1f26336ac4..e3d5d36a1f41 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > @@ -24,6 +24,7 @@
> >  #include "i915_reg.h"
> >  #include "i915_wait_util.h"
> >  #include "intel_breadcrumbs.h"
> > +#include "intel_clock_gating.h"
> >  #include "intel_engine_pm.h"
> >  #include "intel_engine_regs.h"
> >  #include "intel_gt.h"
> > @@ -1439,6 +1440,9 @@ static void intel_gt_reset_global(struct intel_gt=
 *gt,
> > =20
> >  		intel_gt_reset(gt, engine_mask, reason);
> > =20
> > +		if (need_display_reset)
> > +			intel_clock_gating_init(&i915->drm);
> > +
> >  		if (reset_display)
> >  			intel_display_reset_finish(display, !need_display_reset);
> >  	}
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/=
i915_driver.c
> > index 9e047c27a153..40df577cacb4 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1285,6 +1285,8 @@ static int i915_drm_resume_early(struct drm_devic=
e *dev)
> > =20
> >  	intel_display_driver_pm_resume_early(display);
> > =20
> > +	intel_clock_gating_resume(&dev_priv->drm);
> > +
> >  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> > =20
> >  	return ret;
> > @@ -1528,6 +1530,8 @@ static int i915_pm_runtime_suspend(struct device =
*kdev)
> > =20
> >  		intel_irq_resume(dev_priv);
> > =20
> > +		intel_clock_gating_resume(&dev_priv->drm);
> > +
> >  		for_each_gt(gt, dev_priv, i)
> >  			intel_gt_runtime_resume(gt);
> > =20
> > @@ -1595,6 +1599,8 @@ static int i915_pm_runtime_resume(struct device *=
kdev)
> > =20
> >  	intel_irq_resume(dev_priv);
> > =20
> > +	intel_clock_gating_resume(&dev_priv->drm);
> > +
> >  	/*
> >  	 * No point of rolling back things in case of an error, as the best
> >  	 * we can do is to hope that things will still work (and disable RPM)=
.
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i91=
5_gem.c
> > index 1209d5f1fc8d..b746ca66f49c 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -1176,11 +1176,10 @@ int i915_gem_init(struct drm_i915_private *dev_=
priv)
> >  	}
> > =20
> >  	/*
> > -	 * Despite its name intel_clock_gating_init applies both display
> > -	 * clock gating workarounds; GT mmio workarounds and the occasional
> > -	 * GT power context workaround. Worse, sometimes it includes a contex=
t
> > -	 * register workaround which we need to apply before we record the
> > -	 * default HW state for all contexts.
> > +	 * Despite its name intel_clock_gating_init applies GT MMIO workaroun=
ds
> > +	 * and the occasional GT power context workaround. Worse, sometimes i=
t
> > +	 * includes a context register workaround which we need to apply befo=
re
> > +	 * we record the default HW state for all contexts.
> >  	 *
> >  	 * FIXME: break up the workarounds and apply them at the right time!
> >  	 */
> > diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/dr=
m/i915/intel_clock_gating.c
> > index 6faf29c8d887..bd3cca81f602 100644
> > --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> > @@ -30,8 +30,6 @@
> >  #include <drm/intel/intel_gmd_misc_regs.h>
> >  #include <drm/intel/mchbar_regs.h>
> > =20
> > -#include "display/intel_display_clock_gating.h"
> > -#include "display/intel_pch.h"
> >  #include "gt/intel_engine_regs.h"
> >  #include "gt/intel_gt.h"
> >  #include "gt/intel_gt_mcr.h"
> > @@ -56,13 +54,6 @@ static void bxt_init_clock_gating(struct drm_i915_pr=
ivate *i915)
> >  	 * GEN8_HDCUNIT_CLOCK_GATE_DISABLE_HDCREQ applies on 3x6 GT SKUs only=
.
> >  	 */
> >  	intel_uncore_rmw(&i915->uncore, GEN8_UCGCTL6, 0, GEN8_HDCUNIT_CLOCK_G=
ATE_DISABLE_HDCREQ);
> > -
> > -	intel_display_init_clock_gating(i915->display);
> > -}
> > -
> > -static void glk_init_clock_gating(struct drm_i915_private *i915)
> > -{
> > -	intel_display_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void ilk_init_clock_gating(struct drm_i915_private *i915)
> > @@ -72,9 +63,6 @@ static void ilk_init_clock_gating(struct drm_i915_pri=
vate *i915)
> >  			   SVSMUNIT_CLOCK_GATE_DISABLE);
> >  	intel_uncore_write(&i915->uncore, PCH_3DCGDIS1,
> >  			   VFMUNIT_CLOCK_GATE_DISABLE);
> > -
> > -	intel_display_init_clock_gating(i915->display);
> > -	intel_pch_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void gen6_check_mch_setup(struct drm_i915_private *i915)
> > @@ -90,8 +78,6 @@ static void gen6_check_mch_setup(struct drm_i915_priv=
ate *i915)
> > =20
> >  static void gen6_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	intel_display_init_clock_gating(i915->display);
> > -
> >  	intel_uncore_write(&i915->uncore, GEN6_UCGCTL1,
> >  			   intel_uncore_read(&i915->uncore, GEN6_UCGCTL1) |
> >  			   GEN6_BLBUNIT_CLOCK_GATE_DISABLE |
> > @@ -114,8 +100,6 @@ static void gen6_init_clock_gating(struct drm_i915_=
private *i915)
> >  			   GEN6_RCPBUNIT_CLOCK_GATE_DISABLE |
> >  			   GEN6_RCCUNIT_CLOCK_GATE_DISABLE);
> > =20
> > -	intel_pch_init_clock_gating(i915->display);
> > -
> >  	gen6_check_mch_setup(i915);
> >  }
> > =20
> > @@ -154,12 +138,8 @@ static void dg2_init_clock_gating(struct drm_i915_=
private *i915)
> > =20
> >  static void cfl_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	intel_pch_init_clock_gating(i915->display);
> > -
> >  	/* WAC6entrylatency:cfl */
> >  	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_O=
PEN);
> > -
> > -	intel_display_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void kbl_init_clock_gating(struct drm_i915_private *i915)
> > @@ -176,8 +156,6 @@ static void kbl_init_clock_gating(struct drm_i915_p=
rivate *i915)
> >  	if (IS_KABYLAKE(i915) && IS_GRAPHICS_STEP(i915, 0, STEP_C0))
> >  		intel_uncore_rmw(&i915->uncore, GEN6_UCGCTL1,
> >  				 0, GEN6_GAMUNIT_CLOCK_GATE_DISABLE);
> > -
> > -	intel_display_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void skl_init_clock_gating(struct drm_i915_private *i915)
> > @@ -188,14 +166,10 @@ static void skl_init_clock_gating(struct drm_i915=
_private *i915)
> > =20
> >  	/* WAC6entrylatency:skl */
> >  	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_O=
PEN);
> > -
> > -	intel_display_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void bdw_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	intel_display_init_clock_gating(i915->display);
> > -
> >  	/* WaSwitchSolVfFArbitrationPriority:bdw */
> >  	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SO=
L);
> > =20
> > @@ -213,8 +187,6 @@ static void bdw_init_clock_gating(struct drm_i915_p=
rivate *i915)
> >  	/* WaProgramL3SqcReg1Default:bdw */
> >  	gen8_set_l3sqc_credits(i915, 30, 2);
> > =20
> > -	intel_pch_init_clock_gating(i915->display);
> > -
> >  	/* WaDisableDopClockGating:bdw
> >  	 *
> >  	 * Also see the CHICKEN2 write in bdw_init_workarounds() to disable D=
OP
> > @@ -225,24 +197,16 @@ static void bdw_init_clock_gating(struct drm_i915=
_private *i915)
> > =20
> >  static void hsw_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	intel_display_init_clock_gating(i915->display);
> > -
> >  	/* This is required by WaCatErrorRejectionIssue:hsw */
> >  	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
> >  			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
> > =20
> >  	/* WaSwitchSolVfFArbitrationPriority:hsw */
> >  	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SO=
L);
> > -
> > -	intel_pch_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void ivb_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	struct intel_display *display =3D i915->display;
> > -
> > -	intel_display_init_clock_gating(display);
> > -
> >  	/* WaDisableBackToBackFlipFix:ivb */
> >  	intel_uncore_write(&i915->uncore, IVB_CHICKEN3,
> >  			   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE |
> > @@ -273,8 +237,6 @@ static void ivb_init_clock_gating(struct drm_i915_p=
rivate *i915)
> >  	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MA=
SK,
> >  			 GEN6_MBC_SNPCR_MED);
> > =20
> > -	intel_pch_init_clock_gating(display);
> > -
> >  	gen6_check_mch_setup(i915);
> >  }
> > =20
> > @@ -345,7 +307,6 @@ static void g4x_init_clock_gating(struct drm_i915_p=
rivate *i915)
> >  			   GS_UNIT_CLOCK_GATE_DISABLE |
> >  			   CL_UNIT_CLOCK_GATE_DISABLE);
> >  	intel_uncore_write(&i915->uncore, RAMCLK_GATE_D, 0);
> > -	intel_display_init_clock_gating(i915->display);
> >  }
> > =20
> >  static void i965gm_init_clock_gating(struct drm_i915_private *i915)
> > @@ -354,7 +315,6 @@ static void i965gm_init_clock_gating(struct drm_i91=
5_private *i915)
> > =20
> >  	intel_uncore_write(uncore, RENCLK_GATE_D1, I965_RCC_CLOCK_GATE_DISABL=
E);
> >  	intel_uncore_write(uncore, RENCLK_GATE_D2, 0);
> > -	intel_display_init_clock_gating(i915->display);
> >  	intel_uncore_write(uncore, RAMCLK_GATE_D, 0);
> >  	intel_uncore_write16(uncore, DEUC, 0);
> >  	intel_uncore_write(uncore,
> > @@ -437,6 +397,31 @@ void intel_clock_gating_init(struct drm_device *dr=
m)
> >  	i915->clock_gating_funcs->init_clock_gating(i915);
> >  }
> > =20
> > +/**
> > + * intel_clock_gating_resume - restore GT/uncore clock gating after PC=
8+
> > + * @drm: the &struct drm_device
> > + *
> > + * Some HSW/BDW GT and uncore clock gating workarounds, including BDW'=
s
> > + * gen8_set_l3sqc_credits(), don't survive PC8+ and need to be reappli=
ed
> > + * once we're out of it.  This duplicates the display->platform.haswel=
l ||
> > + * display->platform.broadwell check that gates the hsw_disable_pc8() =
call
> > + * on the display side, since core code can't reuse that check directl=
y.
> > + *
> > + * The caller must call this after display has left PC8+ and restored
> > + * LCPLL, but before GT execution resumes, since gen8_set_l3sqc_credit=
s()
> > + * needs the core clock running to access GEN8_L3SQCREG1 via the MCR.
> > + * i915_driver.c is the only place that can see both sides of this, so
> > + * it's the one enforcing the order, from i915_drm_resume_early(),
> > + * i915_pm_runtime_suspend() and i915_pm_runtime_resume().
> > + */
> > +void intel_clock_gating_resume(struct drm_device *drm)
> > +{
> > +	struct drm_i915_private *i915 =3D to_i915(drm);
> > +
> > +	if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> > +		intel_clock_gating_init(drm);
> > +}
> > +
> >  static void nop_init_clock_gating(struct drm_i915_private *i915)
> >  {
> >  	drm_dbg_kms(&i915->drm,
> > @@ -453,7 +438,6 @@ CG_FUNCS(cfl);
> >  CG_FUNCS(skl);
> >  CG_FUNCS(kbl);
> >  CG_FUNCS(bxt);
> > -CG_FUNCS(glk);
> >  CG_FUNCS(bdw);
> >  CG_FUNCS(chv);
> >  CG_FUNCS(hsw);
> > @@ -475,7 +459,7 @@ CG_FUNCS(nop);
> >   * @drm: drm device
> >   *
> >   * Setup the hooks that configure which clocks of a given platform can=
 be
> > - * gated and also apply various GT and display specific workarounds fo=
r these
> > + * gated and also apply various GT and uncore workarounds for these
> >   * platforms. Note that some GT specific workarounds are applied separ=
ately
> >   * when GPU contexts or batchbuffers start their execution.
> >   */
> > @@ -493,8 +477,6 @@ void intel_clock_gating_hooks_init(struct drm_devic=
e *drm)
> >  		i915->clock_gating_funcs =3D &kbl_clock_gating_funcs;
> >  	else if (IS_BROXTON(i915))
> >  		i915->clock_gating_funcs =3D &bxt_clock_gating_funcs;
> > -	else if (IS_GEMINILAKE(i915))
> > -		i915->clock_gating_funcs =3D &glk_clock_gating_funcs;
> >  	else if (IS_BROADWELL(i915))
> >  		i915->clock_gating_funcs =3D &bdw_clock_gating_funcs;
> >  	else if (IS_CHERRYVIEW(i915))
> > diff --git a/drivers/gpu/drm/i915/intel_clock_gating.h b/drivers/gpu/dr=
m/i915/intel_clock_gating.h
> > index 3a4b443d9b8b..cf059bac88d4 100644
> > --- a/drivers/gpu/drm/i915/intel_clock_gating.h
> > +++ b/drivers/gpu/drm/i915/intel_clock_gating.h
> > @@ -9,6 +9,7 @@
> >  struct drm_device;
> > =20
> >  void intel_clock_gating_init(struct drm_device *drm);
> > +void intel_clock_gating_resume(struct drm_device *drm);
> >  void intel_clock_gating_hooks_init(struct drm_device *drm);
> > =20
> >  #endif /* __INTEL_CLOCK_GATING_H__ */
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 10930c924070..12d99ec41e47 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -263,6 +263,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
> >  	i915-display/intel_de.o \
> >  	i915-display/intel_dip.o \
> >  	i915-display/intel_display.o \
> > +	i915-display/intel_display_clock_gating.o \
> >  	i915-display/intel_display_conversion.o \
> >  	i915-display/intel_display_device.o \
> >  	i915-display/intel_display_driver.o \
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.=
h b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
> > deleted file mode 100644
> > index 552975a30ba2..000000000000
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -/* SPDX-License-Identifier: MIT */
> > -/*
> > - * Copyright =C2=A9 2023 Intel Corporation
> > - */
> > -
> > -#ifndef __INTEL_CLOCK_GATING_H__
> > -#define __INTEL_CLOCK_GATING_H__
> > -
> > -struct drm_device;
> > -
> > -static inline void intel_clock_gating_init(struct drm_device *drm) {}
> > -static inline void intel_clock_gating_hooks_init(struct drm_device *dr=
m) {}
> > -
> > -#endif /* __INTEL_CLOCK_GATING_H__ */
