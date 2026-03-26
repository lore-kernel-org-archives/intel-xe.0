Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FDA10AB82E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 23:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB8710E688;
	Thu, 26 Mar 2026 23:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="f6mcdnoe";
	dkim-atps=neutral
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725EB10E688
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 23:10:26 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-66b0e894336so1307376a12.1
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 16:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774566625; cv=none;
 d=google.com; s=arc-20240605;
 b=QA8xWzcjW43VSMsS9f3LkmtYzsDJ/9s9Y8rJ3zJB3eIGzahgGMaCsvF9UgzoIR4OFi
 yWVaZwtjysc6HXCUqE/a5RtjpSYPFfx+ksEJH/ddraun4z/wry77F2Zm0O7aERw5w/B9
 26MX3YaB+4ox2ppZ393AHU9awjt90Cz2GlZe3ETphj+Oduv4XYypLmVV5plZPTZ1W82a
 7DRfBEroBEu0wG12OPeviiw5+/HY4vIPqInBmUGY5U6pVGlla2vWLHw5yAN83EN1mJa4
 vc0vqP8e7xF58r0ms4Yq8kKnxVImor12KpJ9SGc/L1WTlL+bA5DTJZerD/CVcUOsazkZ
 sLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lMnBDraAu6yP/RcSCO6XqW6ZMBeg0tSQOJWtfQm1suI=;
 fh=uLGc51nP7pnnyyM0YC9+LcDc6Dkc8KUbHZ4wKmdbGA4=;
 b=SF0yZKpCiYzpwg1649MpCpiMT7LrfeyG711KAHyPVdGHbgw9Q5mASN6oa9RgceP6c8
 0jQsGoQAVcn+VD4Z4WVGr9X2Vumwswzqpm69N6KNKitO4G0z5eOVZ8NmVeKKaKY06lEm
 iOh5kH6Ko1jbgwnKGU8QA+R89ykamvT9KZQSrwaWBdvgU+UCsg75WNysX4PX1EyFpp1S
 RjD9I1zU+7h1czZHYd2TIXZP/eRW/JyG6sa6v4jv1spOYn3OCs4vjaqs1EARamGgl+rz
 53G/v2+ON573wi+ng/A6FJ8SJaRWieEpKbeGl6BATGoh27bVQh/Ib5x23V7T3R/HjcXh
 6hNQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1774566625; x=1775171425;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lMnBDraAu6yP/RcSCO6XqW6ZMBeg0tSQOJWtfQm1suI=;
 b=f6mcdnoeuUqkpYvYl7hpv+sdDwjJTLVFPdEm6L2QIRzOWScmsz0e1/WkWx0eMgk/WD
 p/wnLuQWX9Xewrr+RUVzCEQTc6u7NAt9Uu+v2bWCgwrjPD6Etvzqr05i6Ldz0IrXshmc
 qOtH8Fqg6VXmWbsZiHJpBhZTQZd/WYmP55kakybqwvb+/EPbP5gzS0sFpPf7vkV0OhlZ
 jal/p8AhSU2sB59mBb1uAw283bZT3aYSHNp7ilbPMhyCDgBwqdZl5wsYZfGnME4/7KRV
 IFgVDldRdpphPFs+NN0pycWSxKcATwVGPF1ftstoxzRT8z9/TUPEu+j5jZPuUWQmDYi7
 kVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774566625; x=1775171425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMnBDraAu6yP/RcSCO6XqW6ZMBeg0tSQOJWtfQm1suI=;
 b=YZbBg6bWz8emAl5jnI0GDe43MZvnvMFoI8s8zJ35ZRUQQpFzr5tqu01BWbMdThM3Mi
 BScucMid9uE6UWV9j26eZB2NGKG2efC+MqGdnyWJgmmBzGARnLRcSqrpJ3zR+hbi0JIA
 yQ6A0ReXSClw+1XBJPMwVYXpvbReScYoYkLpH0WQXBzESmwps7Mo66LeTCOk+GZztZNv
 5zRO3GTP9TyUd2N1hV10GOsdR3/JP5G5i4JHEpP5RbHjXWIiHeEMAA7RC08ZpUDB9uWk
 erI5AQ6S2QuPAAWbkyiHKQgJ4MYw1n4C+H76sNwnXla7j21vU4Fos0duvn7q2DubRFEQ
 m1OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUecZoqKQKoWvzv/ZPhYJfOfKV6AeF/yNHzpctykijXiUHC+zFgLsdPAdB+mN8jUI3zgWaNvFckdQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlIOwkFULzkOZcMcbHX0Jx6kM8/tSzCXk4H2oWfJ2JWTt2m/Kb
 vuCJb9136bfuPCO/Lp3h7qODOpuHQaplObFHf1JSZfiG+ms8Hgb0eR97Ma6jwgf/A4EPY/Bdtny
 f6hSBZ6TEcSTG/5ZLAQWHc8zCvTJw78OlJVnBOzgY
X-Gm-Gg: ATEYQzwzrfjTEvgCdEBbtEg1L5rwIhUT0bxdAdJNuPxhb4hymiDCsOyn5GVRo6SuDpL
 3P1tjWTDPTuXw/WHHFg9Pms3Rs4LyINWV1l6gGWrSQQDZIEXk/jIgf/tHD+1//hLE5z823jgJ5l
 Qd4mHgnzTC2siAYiv8o03pngq9WJh3jrYQlc+eYiHZFP8lA+HuXbo9NLVtjpCwPYmubQFohSoIc
 XXknoNKIMIPwNFMZnm7fSIDLRRDqg46xfJdiG7VMrobR189493ZCe9uBSm8PKTigU0f7GTRs0YV
 16IpaSFVmrNGIGT820B5sRivuq+5f6E9BXn7hYiP2bkstZJGjjFW56YgSW40FbDfytxHvg==
X-Received: by 2002:a05:6402:5389:b0:668:488a:d3da with SMTP id
 4fb4d7f45d1cf-66b28f7dcb4mr102767a12.25.1774566624584; Thu, 26 Mar 2026
 16:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260317220908.130968-1-jdsultan@google.com>
 <20260317220908.130968-3-jdsultan@google.com>
 <08c99b0d-6adb-423b-9c4b-2e8add00f5d3@lankhorst.se>
In-Reply-To: <08c99b0d-6adb-423b-9c4b-2e8add00f5d3@lankhorst.se>
From: Juasheem Sultan <jdsultan@google.com>
Date: Thu, 26 Mar 2026 16:10:13 -0700
X-Gm-Features: AQROBzCwpu_z9c9Z5mlqnunGZTrOwmzyT32hhDJ5WxCc6ScuAs725TzOB2Orvyg
Message-ID: <CAH6Pru5Me2pY31JF2GP61k3gy8XDaLfmH7U6jpAwXoYvGEZBwA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/i915/display: Sync state to BIOS for seamless
 handoff
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Manasi Navare <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>,
 Sean Paul <seanpaul@google.com>, Samuel Jacob <samjaco@google.com>, 
 Rajat Jain <rajatja@google.com>
Content-Type: multipart/alternative; boundary="0000000000004b1d31064df57dfb"
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

--0000000000004b1d31064df57dfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for looking at this.

You're saying instead of manually adopting the state that I should focus on
modifying the comparisons that we do to determine if we can perform a
fastset?

-Juasheem

On Wed, Mar 18, 2026 at 5:00=E2=80=AFAM Maarten Lankhorst <dev@lankhorst.se=
> wrote:

> Hey,
>
> Den 2026-03-17 kl. 23:09, skrev Juasheem Sultan:
> > Align DP timings and C10 PLL state with BIOS values if within a 0.5%
> > clock threshold. This prevents minor mismatches from triggering a full
> > modeset during the first atomic commit, ensuring a flicker-free handoff=
.
> >
> > Signed-off-by: Juasheem Sultan <jdsultan@google.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 67 ++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> > index c4246481fc2f..22e5e931f134 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -6397,6 +6397,71 @@ static int
> intel_atomic_check_config_and_link(struct intel_atomic_state *state)
> >
> >       return ret;
> >  }
> > +
> > +// Helper function to sanitize pll state
> > +static void intel_sanitize_pll_state(struct intel_crtc_state
> *old_crtc_state,
> > +             struct intel_crtc_state *new_crtc_state)
> > +{
> > +     int j;
> > +
> > +     for (j =3D 4; j < 9; j++) {
> > +             if (new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] !=3D
> > +
>  old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j]) {
> > +                     new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] =
=3D
> > +
>  old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j];
> > +             }
> > +     }
> > +}
> > +
> > +/*
> > + * intel_dp_sanitize_seamless_boot - Snap driver state to BIOS state
> for seamless handoff.
> > + * @state: the atomic state to sanitize
> > + *
> > + * This function compares the driver's calculated new_state with the
> inherited BIOS state
> > + * (old_state). If they are within a small threshold (e.g., 0.5% for
> clock), it "snaps"
> > + * the new_state to match the BIOS state exactly. This prevents minor
> state mismatches
> > + * that would otherwise force a full modeset (and a screen flicker)
> during the initial
> > + * kernel handoff.
> > + */
> > +static void intel_dp_sanitize_seamless_boot(struct intel_atomic_state
> *state)
> > +{
> > +     struct intel_display *display =3D to_intel_display(state);
> > +     struct intel_crtc_state *new_crtc_state, *old_crtc_state;
> > +     struct intel_crtc *crtc;
> > +     struct intel_encoder *encoder;
> > +     int i;
> > +
> > +     for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> new_crtc_state, i) {
> > +             /*
> > +              * We must check old_crtc_state->inherited because
> new_crtc_state->inherited
> > +              * is cleared at the start of intel_atomic_check for
> userspace commits.
> > +              */
> > +             if (!old_crtc_state->inherited ||
> !new_crtc_state->hw.active)
> > +                     continue;
> > +
> > +             if (intel_crtc_has_dp_encoder(new_crtc_state)) {
> > +                     int old_clock =3D
> old_crtc_state->hw.adjusted_mode.crtc_clock;
> > +                     int new_clock =3D
> new_crtc_state->hw.adjusted_mode.crtc_clock;
> > +                     int threshold =3D old_clock / 200; /* 0.5% */
> > +
> > +                     if (abs(new_clock - old_clock) <=3D threshold) {
> > +                             new_crtc_state->hw.pipe_mode.crtc_clock =
=3D
> old_clock;
> > +
>  new_crtc_state->hw.adjusted_mode.crtc_clock =3D old_clock;
> > +                             new_crtc_state->pixel_rate =3D
> old_crtc_state->pixel_rate;
> > +                             new_crtc_state->dp_m_n =3D
> old_crtc_state->dp_m_n;
> > +                     }
> > +             }
> > +
> > +             for_each_intel_encoder_mask(display->drm, encoder,
> > +                             new_crtc_state->uapi.encoder_mask) {
> > +                     if (intel_encoder_is_c10phy(encoder)) {
> > +                             if
> (!new_crtc_state->dpll_hw_state.cx0pll.ssc_enabled)
> > +
>  intel_sanitize_pll_state(old_crtc_state, new_crtc_state);
> > +                     }
> > +             }
> > +     }
> > +}
> > +
> >  /**
> >   * intel_atomic_check - validate state object
> >   * @dev: drm device
> > @@ -6447,6 +6512,8 @@ int intel_atomic_check(struct drm_device *dev,
> >       if (ret)
> >               goto fail;
> >
> > +     intel_dp_sanitize_seamless_boot(state);
> > +
> >       for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) =
{
> >               if (!intel_crtc_needs_modeset(new_crtc_state))
> >                       continue;
>
> This might fix boot state, but in a way that complicates the code
> considerably.
>
> Have you considered updating intel_pipe_config_compare instead?
>
> Kind regards,
> ~Maarten Lankhorst
>

--0000000000004b1d31064df57dfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>Thanks for looking at this.=
=C2=A0</div><div><br>You&#39;re saying instead of manually adopting the sta=
te that I should focus on modifying the comparisons that we do to determine=
 if we can perform a fastset?=C2=A0</div><div><br></div><div>-Juasheem</div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Mar 18, 2026 at 5:00=E2=80=AFAM Maarten Lank=
horst &lt;<a href=3D"mailto:dev@lankhorst.se">dev@lankhorst.se</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hey,<br>
<br>
Den 2026-03-17 kl. 23:09, skrev Juasheem Sultan:<br>
&gt; Align DP timings and C10 PLL state with BIOS values if within a 0.5%<b=
r>
&gt; clock threshold. This prevents minor mismatches from triggering a full=
<br>
&gt; modeset during the first atomic commit, ensuring a flicker-free handof=
f.<br>
&gt; <br>
&gt; Signed-off-by: Juasheem Sultan &lt;<a href=3D"mailto:jdsultan@google.c=
om" target=3D"_blank">jdsultan@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_display.c | 67 ++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 67 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gp=
u/drm/i915/display/intel_display.c<br>
&gt; index c4246481fc2f..22e5e931f134 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_display.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_display.c<br>
&gt; @@ -6397,6 +6397,71 @@ static int intel_atomic_check_config_and_link(s=
truct intel_atomic_state *state)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +// Helper function to sanitize pll state<br>
&gt; +static void intel_sanitize_pll_state(struct intel_crtc_state *old_crt=
c_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct intel_crtc_sta=
te *new_crtc_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int j;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (j =3D 4; j &lt; 9; j++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_crtc_state-&g=
t;dpll_hw_state.cx0pll.c10.pll[j] !=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_crtc_state-&gt;dpll_hw_state.cx0pll.=
c10.pll[j]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0new_crtc_state-&gt;dpll_hw_state.cx0pll.c10.pll[j] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_crtc_state-&gt;dpll_hw_state.cx0pll.=
c10.pll[j];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * intel_dp_sanitize_seamless_boot - Snap driver state to BIOS state =
for seamless handoff.<br>
&gt; + * @state: the atomic state to sanitize<br>
&gt; + *<br>
&gt; + * This function compares the driver&#39;s calculated new_state with =
the inherited BIOS state<br>
&gt; + * (old_state). If they are within a small threshold (e.g., 0.5% for =
clock), it &quot;snaps&quot;<br>
&gt; + * the new_state to match the BIOS state exactly. This prevents minor=
 state mismatches<br>
&gt; + * that would otherwise force a full modeset (and a screen flicker) d=
uring the initial<br>
&gt; + * kernel handoff.<br>
&gt; + */<br>
&gt; +static void intel_dp_sanitize_seamless_boot(struct intel_atomic_state=
 *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct intel_display *display =3D to_intel_displa=
y(state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct intel_crtc_state *new_crtc_state, *old_crt=
c_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct intel_crtc *crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct intel_encoder *encoder;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for_each_oldnew_intel_crtc_in_state(state, crtc, =
old_crtc_state, new_crtc_state, i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We must check old_=
crtc_state-&gt;inherited because new_crtc_state-&gt;inherited<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is cleared at the =
start of intel_atomic_check for userspace commits.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!old_crtc_state-&=
gt;inherited || !new_crtc_state-&gt;hw.active)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (intel_crtc_has_dp=
_encoder(new_crtc_state)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int old_clock =3D old_crtc_state-&gt;hw.adjusted_mode.crtc_clock;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int new_clock =3D new_crtc_state-&gt;hw.adjusted_mode.crtc_clock;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int threshold =3D old_clock / 200; /* 0.5% */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (abs(new_clock - old_clock) &lt;=3D threshold) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_crtc_state-&gt;hw.pipe_mode.crtc_clo=
ck =3D old_clock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_crtc_state-&gt;hw.adjusted_mode.crtc=
_clock =3D old_clock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_crtc_state-&gt;pixel_rate =3D old_cr=
tc_state-&gt;pixel_rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_crtc_state-&gt;dp_m_n =3D old_crtc_s=
tate-&gt;dp_m_n;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_intel_encode=
r_mask(display-&gt;drm, encoder,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_crtc_state-&gt;uapi.encoder_mask) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (intel_encoder_is_c10phy(encoder)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!new_crtc_state-&gt;dpll_hw_state.cx=
0pll.ssc_enabled)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_saniti=
ze_pll_state(old_crtc_state, new_crtc_state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* intel_atomic_check - validate state object<br>
&gt;=C2=A0 =C2=A0* @dev: drm device<br>
&gt; @@ -6447,6 +6512,8 @@ int intel_atomic_check(struct drm_device *dev,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0intel_dp_sanitize_seamless_boot(state);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_new_intel_crtc_in_state(state, crtc=
, new_crtc_state, i) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!intel_crtc_=
needs_modeset(new_crtc_state))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;<br>
<br>
This might fix boot state, but in a way that complicates the code considera=
bly.<br>
<br>
Have you considered updating intel_pipe_config_compare instead?<br>
<br>
Kind regards,<br>
~Maarten Lankhorst<br>
</blockquote></div>

--0000000000004b1d31064df57dfb--
