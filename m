Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889C606A887
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dgEKOPb/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6A810EC1C;
	Fri, 13 Nov 2026 12:00:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403F610E7B2;
 Fri, 13 Nov 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794571206; x=1826107206;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bE/NO0zKGnOIU0CsB5ZzRSMzZGRL3aqJ1dZbmbl+Jgs=;
 b=dgEKOPb/EO+DXzncFNX3zIeZ1Pk1pxPYD34Xt9GaCgr8/So0lPk0AHBb
 5Wu0iNCfQXc2pDc4asbJOLHgBkbOXD481R0NqN+Qa5XuBpdfkXqsvLjix
 qyj11cUSefdNjiCIrxHtvYyladz5mGs2b6Ms3Tikjx7EfvYEL2T/LtBS5
 MXQ5CLlcyhoL1hB3d42khuR1qh7Hrlenl2x204k743C/4JQllz6nVlAI1
 REAly06uhrWye9Cbl7/2zeAg0lss3Z52cwVepXKVyZ3rlH+bE/UX+Oygr
 dkwl4HNAVUDc4xqGyiaMxVNpjzLPOYNvwAwGptjbowHWYRp8yYaRHUJSZ g==;
X-CSE-ConnectionGUID: 6faF5PELRWSRZqldZWuSNA==
X-CSE-MsgGUID: u3z0JmYuRzycGoILtR/JhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3465395"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3465395"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 04:00:05 -0800
X-CSE-ConnectionGUID: m6cLMHXyQo+jPx0cjNJ62Q==
X-CSE-MsgGUID: Q2/6VutpQ16pN+9b/G/Gqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9324928"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 04:00:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 14/15] drm/i915/pfit: Account for pfit downscaling in
 pixel rate on GMCH platforms
In-Reply-To: <avW0G8HNImWkdT_0@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-15-ville.syrjala@linux.intel.com>
 <shbezg62hmcqseiclkdfdgmcqef2x6dcqzg4xwh6lorkshydkq@2ihuuarp5vj7>
 <avW0G8HNImWkdT_0@intel.com>
Date: Fri, 13 Nov 2026 14:00:01 +0200
Message-ID: <d5b8659acbb8918ec8a8277ed071c680e822fec9@intel.com>
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

On Thu, 12 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Nov 12, 2026 at 10:47:47AM +0100, Micha=C5=82 Grzelak wrote:
>> On Mon, Oct 19, 2026 at 04:53:08PM GMT, Ville Syrjala wrote:
>> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >=20
>> > Now that we have crtc_state->pch.dst populated on GMCH platforms
>> > we can use the existing ILK+ code to calculate the downscale
>> > adjusted pixel rate correctly on GMCH platforms.
>> >=20
>> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_display.c | 23 +++++++-------------
>> >  1 file changed, 8 insertions(+), 15 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gp=
u/drm/i915/display/intel_display.c
>> > index 200426bf0c59..6b813efff955 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> > @@ -2278,7 +2278,8 @@ static bool intel_crtc_supports_double_wide(cons=
t struct intel_crtc *crtc)
>> >  		(crtc->pipe =3D=3D PIPE_A || display->platform.i915g);
>> >  }
>> >=20=20
>> > -static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_st=
ate)
>> > +static unsigned int
>>=20
>> Is there any consensus on when to use u32 and when unsigned int? I see
>> that here it is because of pixel_rate_cdclk being defined as unsigned
>> int, but asking for general guidance.
>
> My general rules are roughly this:
> 1. Just plain old 'int' for most things
> 2. Use 'unsigned int' for some address/offset calculations and whatnot
>    where negative values are never a thing
> 3. u32 for hardware registers and so forth

Agreed.

I'd further emphasize to use the explicitly sized types when a specific
size constraint exists. Like you say, hardware, binary formats.

If you're thinking "the value range always fits in n bits", it's almost
invariably the wrong reason to use a sized type. It's usually the wrong
optimization, it's the wrong way to limit the result. There are some
cases where you do want to reduce the size of a type just because of the
memory footprint (think big arrays, widely used structs), but they need
to be justified.

Similarly, using an unsigned type to gain an extra bit is also almost
invariably the wrong thing to do. Use a bigger type instead. But there
are exceptions, you need to know what you're doing, and you need to
justify it.

Outside of the above guidelines, I think choosing when to use unsigned
without the explicit size is the hardest one.

> The pixel rate stuff should perhaps just all be 'int', but that
> would probably need to double check a few things before doing that.
>
> The one slight annoyance with signed ints is that stupid static
> analyzers may start to nag you about unchecked negative values
> even if they're not actually possible.
>
> But a signed int is almost always the safer option in case you end
> up using it in some arithmetic expression where negative results are
> a possibility. Even a single 'unsigned int' there will probably=20
> convert the whole expression to unsigned due to C rules on integer
> promotion/conversion, and then you negative result will become a
> really large positive result.

Yeah, I think the whole "can't be negative" argument is usually trading
it for "can't be really large positive either". Usually you're just
better off checking the negatives. Especially when you don't really have
an upper bound, and you have to figure out an arbitrary upper bound just
to check for things that could've been obvious checks for negative
values.

HTH,
Jani.


>
>>=20
>> Since that's a side question:
>>=20
>> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>
>>=20
>> BR,
>> Micha=C5=82
>>=20
>> > +intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
>> >  {
>> >  	u32 pixel_rate =3D crtc_state->hw.pipe_mode.crtc_clock;
>> >  	struct drm_rect src;
>> > @@ -2299,7 +2300,8 @@ static u32 ilk_pipe_pixel_rate(const struct inte=
l_crtc_state *crtc_state)
>> >  				   pixel_rate);
>> >  }
>> >=20=20
>> > -static u32 ilk_pipe_pixel_rate_cdclk(const struct intel_crtc_state *c=
rtc_state)
>> > +static unsigned int
>> > +intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
>> >  {
>> >  	struct intel_display *display =3D to_intel_display(crtc_state);
>> >  	u32 pixel_rate =3D crtc_state->hw.pipe_mode.crtc_clock;
>> > @@ -2345,19 +2347,10 @@ static void intel_mode_from_crtc_timings(struc=
t drm_display_mode *mode,
>> >=20=20
>> >  static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *cr=
tc_state)
>> >  {
>> > -	struct intel_display *display =3D to_intel_display(crtc_state);
>> > -
>> > -	if (HAS_GMCH(display)) {
>> > -		/* FIXME calculate proper pipe pixel rate for GMCH pfit */
>> > -		crtc_state->pixel_rate =3D
>> > -			crtc_state->hw.pipe_mode.crtc_clock;
>> > -		crtc_state->pixel_rate_cdclk =3D crtc_state->pixel_rate;
>> > -	} else {
>> > -		crtc_state->pixel_rate =3D
>> > -			ilk_pipe_pixel_rate(crtc_state);
>> > -		crtc_state->pixel_rate_cdclk =3D
>> > -			ilk_pipe_pixel_rate_cdclk(crtc_state);
>> > -	}
>> > +	crtc_state->pixel_rate =3D
>> > +		intel_pipe_pixel_rate(crtc_state);
>> > +	crtc_state->pixel_rate_cdclk =3D
>> > +		intel_pipe_pixel_rate_cdclk(crtc_state);
>> >  }
>> >=20=20
>> >  static void intel_joiner_adjust_timings(const struct intel_crtc_state=
 *crtc_state,
>> > --=20
>> > 2.55.0
>> >=20
>> >=20

--=20
Jani Nikula, Intel
