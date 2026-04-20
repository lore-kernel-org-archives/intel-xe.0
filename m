Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB370F5A8BC
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 20:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2E210EB3F;
	Mon, 20 Apr 2026 20:08:34 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCB810EB24;
 Mon, 20 Apr 2026 20:08:32 +0000 (UTC)
Received: from 88-113-64-214.elisa-laajakaista.fi ([88.113.64.214]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wEuuw-00000004RKz-33ii; Mon, 20 Apr 2026 23:08:28 +0300
Message-ID: <64634ea3166e45c02d8f21c0cf5db59183374cb4.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Date: Mon, 20 Apr 2026 23:08:25 +0300
In-Reply-To: <62156adba622de6f4ae294c09479bb1293c97c0e@intel.com>
References: <20260420103705.3453499-1-luciano.coelho@intel.com>
 <20260420103705.3453499-6-luciano.coelho@intel.com>
 <62156adba622de6f4ae294c09479bb1293c97c0e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v3 5/8] drm/i915/display: move GLK clock gating init to
 display
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

On Mon, 2026-04-20 at 15:18 +0300, Jani Nikula wrote:
> On Mon, 20 Apr 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > Move the GLK-specific display clock gating programming into display
> > intel_display_clock_gating.c, to remove more dependencies from i915 to
> > display registers.
> >=20
> > Now that all remaining Gen9-family callers moved into display, we can
> > move the shared Gen9 display clock gating helper into display and
> > remove the old local helper from intel_clock_gating.c.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  .../i915/display/intel_display_clock_gating.c | 57 +++++++++++++++++++
> >  .../i915/display/intel_display_clock_gating.h |  1 +
> >  drivers/gpu/drm/i915/intel_clock_gating.c     | 44 +-------------
> >  3 files changed, 59 insertions(+), 43 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c =
b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > index 59041c807d6d..b2cb18478577 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > @@ -6,11 +6,39 @@
> >  #include <drm/intel/intel_gmd_misc_regs.h>
> > =20
> >  #include "intel_de.h"
> > +#include "intel_display.h"
> >  #include "intel_display_clock_gating.h"
> > +#include "intel_display_core.h"
> >  #include "intel_display_regs.h"
> > =20
> > +static void intel_display_gen9_init_clock_gating(struct intel_display =
*display)
> > +{
> > +	/* See Bspec note for PSR2_CTL bit 31, Wa#828:skl,bxt,kbl,cfl */
> > +	intel_de_rmw(display, CHICKEN_PAR1_1, 0, SKL_EDP_PSR_FIX_RDWRAP);
> > +
> > +	/* WaEnableChickenDCPR:skl,bxt,kbl,glk,cfl */
> > +	intel_de_rmw(display, GEN8_CHICKEN_DCPR_1, 0, MASK_WAKEMEM);
> > +
> > +	/*
> > +	 * WaFbcWakeMemOn:skl,bxt,kbl,glk,cfl
> > +	 * Display WA #0859: skl,bxt,kbl,glk,cfl
> > +	 */
> > +	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_MEMORY_WAKE);
> > +}
> > +
> >  void intel_display_skl_init_clock_gating(struct intel_display *display=
)
> >  {
> > +	/*
> > +	 * WaCompressedResourceDisplayNewHashMode:skl,kbl
> > +	 * Display WA #0390: skl,kbl
> > +	 *
> > +	 * Must match Sampler, Pixel Back End, and Media. See
> > +	 * WaCompressedResourceSamplerPbeMediaNewHashMode.
> > +	 */
> > +	intel_de_rmw(display, CHICKEN_PAR1_1, 0, SKL_DE_COMPRESSED_HASH_MODE)=
;
> > +
> > +	intel_display_gen9_init_clock_gating(display);
> > +
> >  	/*
> >  	 * WaFbcTurnOffFbcWatermark:skl
> >  	 * Display WA #0562: skl
> > @@ -20,6 +48,17 @@ void intel_display_skl_init_clock_gating(struct inte=
l_display *display)
> > =20
> >  void intel_display_kbl_init_clock_gating(struct intel_display *display=
)
> >  {
> > +	/*
> > +	 * WaCompressedResourceDisplayNewHashMode:skl,kbl
> > +	 * Display WA #0390: skl,kbl
> > +	 *
> > +	 * Must match Sampler, Pixel Back End, and Media. See
> > +	 * WaCompressedResourceSamplerPbeMediaNewHashMode.
> > +	 */
> > +	intel_de_rmw(display, CHICKEN_PAR1_1, 0, SKL_DE_COMPRESSED_HASH_MODE)=
;
> > +
> > +	intel_display_gen9_init_clock_gating(display);
> > +
> >  	/*
> >  	 * WaFbcTurnOffFbcWatermark:kbl
> >  	 * Display WA #0562: kbl
> > @@ -29,6 +68,8 @@ void intel_display_kbl_init_clock_gating(struct intel=
_display *display)
> > =20
> >  void intel_display_cfl_init_clock_gating(struct intel_display *display=
)
> >  {
> > +	intel_display_gen9_init_clock_gating(display);
> > +
> >  	/*
> >  	 * WaFbcTurnOffFbcWatermark:cfl
> >  	 * Display WA #0562: cfl
> > @@ -38,6 +79,8 @@ void intel_display_cfl_init_clock_gating(struct intel=
_display *display)
> > =20
> >  void intel_display_bxt_init_clock_gating(struct intel_display *display=
)
> >  {
> > +	intel_display_gen9_init_clock_gating(display);
> > +
> >  	/*
> >  	 * Wa: Backlight PWM may stop in the asserted state, causing backligh=
t
> >  	 * to stay fully on.
> > @@ -60,3 +103,17 @@ void intel_display_bxt_init_clock_gating(struct int=
el_display *display)
> >  	 */
> >  	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
> >  }
> > +
> > +void intel_display_glk_init_clock_gating(struct intel_display *display=
)
> > +{
> > +	intel_display_gen9_init_clock_gating(display);
> > +
> > +	/*
> > +	 * WaDisablePWMClockGating:glk
> > +	 * Backlight PWM may stop in the asserted state, causing backlight
> > +	 * to stay fully on.
> > +	 */
> > +	intel_de_write(display, GEN9_CLKGATE_DIS_0,
> > +		       intel_de_read(display, GEN9_CLKGATE_DIS_0) |
> > +		       PWM1_GATING_DIS | PWM2_GATING_DIS);
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h =
b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> > index 6bc84a9a4342..a7784db9d97a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> > @@ -12,5 +12,6 @@ void intel_display_skl_init_clock_gating(struct intel=
_display *display);
> >  void intel_display_kbl_init_clock_gating(struct intel_display *display=
);
> >  void intel_display_cfl_init_clock_gating(struct intel_display *display=
);
> >  void intel_display_bxt_init_clock_gating(struct intel_display *display=
);
> > +void intel_display_glk_init_clock_gating(struct intel_display *display=
);
> > =20
> >  #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
> > diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/dr=
m/i915/intel_clock_gating.c
> > index 4c1937d922b2..777314e0c75d 100644
> > --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> > @@ -49,36 +49,8 @@ struct drm_i915_clock_gating_funcs {
> >  	void (*init_clock_gating)(struct drm_i915_private *i915);
> >  };
> > =20
> > -static void gen9_init_clock_gating(struct drm_i915_private *i915)
> > -{
> > -	if (HAS_LLC(i915)) {
>=20
> The commit message should explain why removing this is okay.

Good point.  This check was incidental because it just happened that
the only Gen9 platforms that need this workaround (namely SKL and KBL)
have LLC.  Now that the code is moved, the check is not needed and we
apply the workaround in the SKL/KBL-specific functions instead of doing
it in the Gen9 function protected by HAS_LLC().

--
Cheers,
Luca.
