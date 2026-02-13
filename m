Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E884EF48DD
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 08:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C96C10E7B3;
	Fri, 13 Feb 2026 08:04:54 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B74E10E7A5
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 08:04:53 +0000 (UTC)
Received: from 37-33-41-57.bb.dnainternet.fi ([37.33.41.57]
 helo=[192.168.101.110])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vqnjT-00000002LLY-2SJR; Fri, 13 Feb 2026 09:36:57 +0200
Message-ID: <2a699e43cb8123bc27507d9240af1f46ab1c6315.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 09:36:54 +0200
In-Reply-To: <aY6uooHNa6cfXAOr@intel.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
 <20260212184737.352515-2-luciano.coelho@intel.com>
 <aY6uooHNa6cfXAOr@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/15] drm/i915/display: convert audio workaround to
 new framework
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

On Fri, 2026-02-13 at 06:54 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Feb 12, 2026 at 08:45:59PM +0200, Luca Coelho wrote:
> > Convert the low-hanging fruits of workaround checks to the workaround
> > framework.  Instead of having display structure checks for the
> > workarounds all over, concentrate the checks in intel_wa.c.
> >=20
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_audio.c      | 16 +++-------------
> >  drivers/gpu/drm/i915/display/intel_display_wa.c |  4 ++++
> >  drivers/gpu/drm/i915/display/intel_display_wa.h |  1 +
> >  3 files changed, 8 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/d=
rm/i915/display/intel_audio.c
> > index 5f3c175afdd2..be4b5dbd36fe 100644
> > --- a/drivers/gpu/drm/i915/display/intel_audio.c
> > +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> > @@ -37,6 +37,7 @@
> >  #include "intel_crtc.h"
> >  #include "intel_de.h"
> >  #include "intel_display_types.h"
> > +#include "intel_display_wa.h"
> >  #include "intel_lpe_audio.h"
> > =20
> >  /**
> > @@ -184,17 +185,6 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36=
bpp[] =3D {
> >  	{ 192000, TMDS_445_5M, 20480, 371250 },
> >  };
> > =20
> > -/*
> > - * WA_14020863754: Implement Audio Workaround
> > - * Corner case with Min Hblank Fix can cause audio hang
>=20
> We are now losing the description of the problem. Not great.
> Not that the description here is super clear, but at least it
> gives me some idea what this is about.
>=20
> Perhaps such descriptions should remain with the implementation?

Sorry, this was accidental.  In all the remaining patches I just kept
the comments at the call site.

I'll add it back.


> > - */
> > -static bool needs_wa_14020863754(struct intel_display *display)
> > -{
> > -	return DISPLAY_VERx100(display) =3D=3D 3000 ||
> > -		DISPLAY_VERx100(display) =3D=3D 2000 ||
> > -		DISPLAY_VERx100(display) =3D=3D 1401;
> > -}
> > -
> >  /* get AUD_CONFIG_PIXEL_CLOCK_HDMI_* value for mode */
> >  static u32 audio_config_hdmi_pixel_clock(const struct intel_crtc_state=
 *crtc_state)
> >  {
> > @@ -440,7 +430,7 @@ static void hsw_audio_codec_disable(struct intel_en=
coder *encoder,
> >  	intel_de_rmw(display, HSW_AUD_PIN_ELD_CP_VLD,
> >  		     AUDIO_OUTPUT_ENABLE(cpu_transcoder), 0);
> > =20
> > -	if (needs_wa_14020863754(display))
> > +	if (intel_display_wa(display, 14020863754))
>=20
> This thing is still a major disaster. There is no way to get from
> here to the list of affected platforms without jumping through crazy
> hoops.

I agree, this whole workarounds stuff is a mess.  There are gazillions
of workarounds spread around the code, and most of them can't be
converted to using this "framework".  Actually, anything that needs
data from elsewhere than struct intel_display doesn't fit in.


> At the very least the intel_display_wa() macro magic needs to die
> and this should just take the enum directly. Then I could at least
> jump to places where said enum value is used fairly quickly with
> cscope.

I totally agree and thought the same.  The macro thing to convert this
number to INTEL_DISPLAY_WA_<number> is useless and just convolutes
things even more.

I'll add a patch to the beginning of this series to remove that.

OTOH, there's a lot to improve, expand and clean up in the way we
handle these.  I'm pretty sure a lot of the workarounds are pretty much
dead-code too, because some of the devices the workarounds are for have
never been released to public.  I bet the majority of the STEP_A0
devices handled in workarounds have never been released.

But this was not the intention of this patch-series.  Here I'm only
moving the "simple ones", i.e. the ones that can be easily be handled
by this framework.

--
Cheers,
Luca.


> >  		intel_de_rmw(display, AUD_CHICKENBIT_REG3, DACBE_DISABLE_MIN_HBLANK_=
FIX, 0);
> > =20
> >  	intel_audio_sdp_split_update(old_crtc_state, false);
> > @@ -572,7 +562,7 @@ static void hsw_audio_codec_enable(struct intel_enc=
oder *encoder,
> > =20
> >  	intel_audio_sdp_split_update(crtc_state, true);
> > =20
> > -	if (needs_wa_14020863754(display))
> > +	if (intel_display_wa(display, 14020863754))
> >  		intel_de_rmw(display, AUD_CHICKENBIT_REG3, 0, DACBE_DISABLE_MIN_HBLA=
NK_FIX);
> > =20
> >  	/* Enable audio presence detect */
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/=
gpu/drm/i915/display/intel_display_wa.c
> > index c2ccdca2c2f3..99ccc383ee70 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > @@ -74,6 +74,10 @@ bool __intel_display_wa(struct intel_display *displa=
y, enum intel_display_wa wa,
> >  			DISPLAY_VERx100(display) =3D=3D 3500;
> >  	case INTEL_DISPLAY_WA_14011503117:
> >  		return DISPLAY_VER(display) =3D=3D 13;
> > +	case INTEL_DISPLAY_WA_14020863754:
> > +		return DISPLAY_VERx100(display) =3D=3D 3000 ||
> > +			DISPLAY_VERx100(display) =3D=3D 2000 ||
> > +			DISPLAY_VERx100(display) =3D=3D 1401;
> >  	case INTEL_DISPLAY_WA_14025769978:
> >  		return DISPLAY_VER(display) =3D=3D 35;
> >  	case INTEL_DISPLAY_WA_15018326506:
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/=
gpu/drm/i915/display/intel_display_wa.h
> > index 767420d5f406..bb1382148b6e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > @@ -29,6 +29,7 @@ bool intel_display_needs_wa_16023588340(struct intel_=
display *display);
> >  enum intel_display_wa {
> >  	INTEL_DISPLAY_WA_13012396614,
> >  	INTEL_DISPLAY_WA_14011503117,
> > +	INTEL_DISPLAY_WA_14020863754,
> >  	INTEL_DISPLAY_WA_14025769978,
> >  	INTEL_DISPLAY_WA_15018326506,
> >  	INTEL_DISPLAY_WA_16023588340,
> > --=20
> > 2.51.0
