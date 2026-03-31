Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259A4FF60EF
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 10:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC24210EA4C;
	Tue, 31 Mar 2026 10:03:56 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14D310EA42;
 Tue, 31 Mar 2026 10:03:55 +0000 (UTC)
Received: from 87-93-178-238.bb.dnainternet.fi ([87.93.178.238]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1w7Vwl-00000003pq8-2Tqg; Tue, 31 Mar 2026 13:03:52 +0300
Message-ID: <d916a82d01456ede8a080484998b74af19286df5.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 jani.nikula@linux.intel.com
Date: Tue, 31 Mar 2026 13:03:42 +0300
In-Reply-To: <acK9lVDxOV_hXPiN@intel.com>
References: <20260324143420.310800-1-luciano.coelho@intel.com>
 <20260324143420.310800-7-luciano.coelho@intel.com>
 <acK9lVDxOV_hXPiN@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] drm/i915/display: move HSW and BDW clock gating
 init to display
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

On Tue, 2026-03-24 at 18:36 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Tue, Mar 24, 2026 at 04:29:55PM +0200, Luca Coelho wrote:
> > Move the HSW and BDW display clock gating programming into the display
> > code.  In this case we need two different helpers, because the common
> > code between these two is split in the middle.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  .../i915/display/intel_display_clock_gating.c | 33 +++++++++++++++++++
> >  .../i915/display/intel_display_clock_gating.h |  6 ++++
> >  drivers/gpu/drm/i915/intel_clock_gating.c     | 31 +++--------------
> >  3 files changed, 43 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c =
b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > index e3b7522b4101..0b2edf6acb79 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
> > @@ -123,3 +123,36 @@ void intel_display_glk_init_clock_gating(struct in=
tel_display *display)
> >  		       intel_de_read(display, GEN9_CLKGATE_DIS_0) |
> >  		       PWM1_GATING_DIS | PWM2_GATING_DIS);
> >  }
> > +
> > +static void
> > +intel_display_hsw_init_clock_gating_common(struct intel_display *displ=
ay,
> > +					   u32 unmask_vbl)
>=20
> Passing that as a parameter feels a bit obfuscated.
>=20
> > +{
> > +	enum pipe pipe;
> > +
> > +	/* WaPsrDPAMaskVBlankInSRD:hsw */
> > +	intel_de_rmw(display, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PIPE_IN_SRD)=
;
> > +
> > +	for_each_pipe(display, pipe) {
> > +		/* WaPsrDPRSUnmaskVBlankInSRD:hsw,bdw */
> > +		intel_de_rmw(display, CHICKEN_PIPESL_1(pipe), 0, unmask_vbl);
>=20
> If we want to share the function then I'd probably just do
> a platform check here.

True, I'll skip passing it and just add the platform check in this
function.


>=20
> > +	}
> > +}
> > +
> > +void intel_display_bdw_hsw_init_clock_gating(struct intel_display *dis=
play)
> > +{
> > +	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
> > +	intel_de_rmw(display, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
> > +}
>=20
> Why do we have two different functions that shared by
> both platforms?

It's because for BDW there is this one in between the two common calls:

	/* WaSwitchSolVfFArbitrationPriority:bdw */
	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);

...this is probably independent from the other two and it may be okay
to move it before the common code, but I wanted to avoid that.

Do you think it's safe to change the order from:

1. CHICKEN_PIPESL_1
2. GAM_ECOCHK
3. CHICKEN_PAR1_1

...to this?

1. GAM_ECOCHK
2. CHICKEN_PIPESL_1
3. CHICKEN_PAR1_1

If that's the case, then it can be simplified.


> > +
> > +void intel_display_bdw_init_clock_gating(struct intel_display *display=
)
> > +{
> > +	intel_display_hsw_init_clock_gating_common(display,
> > +						   BDW_UNMASK_VBL_TO_REGS_IN_SRD);
> > +}
> > +
> > +void intel_display_hsw_init_clock_gating(struct intel_display *display=
)
> > +{
> > +	intel_display_hsw_init_clock_gating_common(display,
> > +						   HSW_UNMASK_VBL_TO_REGS_IN_SRD);
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h =
b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> > index 4abd34fa5832..0eb240f2f69e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
> > @@ -14,12 +14,18 @@ void intel_display_kbl_init_clock_gating(struct int=
el_display *display);
> >  void intel_display_cfl_init_clock_gating(struct intel_display *display=
);
> >  void intel_display_bxt_init_clock_gating(struct intel_display *display=
);
> >  void intel_display_glk_init_clock_gating(struct intel_display *display=
);
> > +void intel_display_bdw_hsw_init_clock_gating(struct intel_display *dis=
play);
> > +void intel_display_bdw_init_clock_gating(struct intel_display *display=
);
> > +void intel_display_hsw_init_clock_gating(struct intel_display *display=
);
> >  #else
> >  static inline void intel_display_skl_init_clock_gating(struct intel_di=
splay *display) {}
> >  static inline void intel_display_kbl_init_clock_gating(struct intel_di=
splay *display) {}
> >  static inline void intel_display_cfl_init_clock_gating(struct intel_di=
splay *display) {}
> >  static inline void intel_display_bxt_init_clock_gating(struct intel_di=
splay *display) {}
> >  static inline void intel_display_glk_init_clock_gating(struct intel_di=
splay *display) {}
> > +static inline void intel_display_bdw_hsw_init_clock_gating(struct inte=
l_display *display) {}
> > +static inline void intel_display_bdw_init_clock_gating(struct intel_di=
splay *display) {}
> > +static inline void intel_display_hsw_init_clock_gating(struct intel_di=
splay *display) {}
> >  #endif
> > =20
> >  #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
> > diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/dr=
m/i915/intel_clock_gating.c
> > index 777314e0c75d..a8e3eb6f06c8 100644
> > --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> > @@ -284,23 +284,12 @@ static void skl_init_clock_gating(struct drm_i915=
_private *i915)
> > =20
> >  static void bdw_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	struct intel_display *display =3D i915->display;
> > -	enum pipe pipe;
> > -
> > -	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
> > -	intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ=
_DIS);
> > +	intel_display_bdw_hsw_init_clock_gating(i915->display);
> > =20
> >  	/* WaSwitchSolVfFArbitrationPriority:bdw */
> >  	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SO=
L);
> > =20
> > -	/* WaPsrDPAMaskVBlankInSRD:bdw */
> > -	intel_uncore_rmw(&i915->uncore, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PI=
PE_IN_SRD);
> > -
> > -	for_each_pipe(display, pipe) {
> > -		/* WaPsrDPRSUnmaskVBlankInSRD:bdw */
> > -		intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(pipe),
> > -				 0, BDW_UNMASK_VBL_TO_REGS_IN_SRD);
> > -	}
> > +	intel_display_bdw_init_clock_gating(i915->display);
> > =20
> >  	/* WaVSRefCountFullforceMissDisable:bdw */
> >  	/* WaDSRefCountFullforceMissDisable:bdw */
>=20
> ...
> WaKVMNotificationOnConfigChange:bdw somewhere in here is also a display
> thing.

I missed that.


> And given that I think sharing anything between the platforms in
> this patch is a bit premature. I think it would be better to just
> move things as is, and do the code sharing refactoring as a followup
> once it's easier to see what's common and what isn't.

Okay, this is better indeed.  It won't help with the ordering for BDW,
but I'll try to do something.

--
Cheers,
Luca.


> > @@ -332,20 +321,8 @@ static void bdw_init_clock_gating(struct drm_i915_=
private *i915)
> > =20
> >  static void hsw_init_clock_gating(struct drm_i915_private *i915)
> >  {
> > -	struct intel_display *display =3D i915->display;
> > -	enum pipe pipe;
> > -
> > -	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
> > -	intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ=
_DIS);
> > -
> > -	/* WaPsrDPAMaskVBlankInSRD:hsw */
> > -	intel_uncore_rmw(&i915->uncore, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PI=
PE_IN_SRD);
> > -
> > -	for_each_pipe(display, pipe) {
> > -		/* WaPsrDPRSUnmaskVBlankInSRD:hsw */
> > -		intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(pipe),
> > -				 0, HSW_UNMASK_VBL_TO_REGS_IN_SRD);
> > -	}
> > +	intel_display_bdw_hsw_init_clock_gating(i915->display);
> > +	intel_display_hsw_init_clock_gating(i915->display);
> > =20
> >  	/* This is required by WaCatErrorRejectionIssue:hsw */
> >  	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
> > --=20
> > 2.53.0
