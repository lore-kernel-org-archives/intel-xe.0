Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F3CD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 12:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416F010EE0B;
	Wed, 13 May 2026 12:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="np04ZyAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0610E305;
 Wed, 13 May 2026 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778674773; x=1810210773;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Jd+9QMatKBgg5TdEneTlpOlcAbdeYvdIakacox0Jjms=;
 b=np04ZyAUSy9ghis2MJ4YnsKo+Gr7b55qYkMwZ4Zqgx9VI6dkcOjQjTHc
 yZkzlV5LOZKX0mWHKdV399I5rsBfIP/rKLn9vuDOXyliW3nLjYKC26KgM
 nf+ItJcfqTXRhQO0KVlpUJ6oBddRZnM8rhn3rYrYd9X8vsMzIYoKBAq36
 rjeNYZ2z5vaGEJQD5vT6Y8pt0fMJoJue9pttDqmC/Saqc7lPUGBZXURUj
 6VYS5hB75LzNnJVUlQJlWgU9EDqT+8QW1sstZknMpI2wwZAmPzWZ7y/hT
 sWWcmx+3ho7liX5QMwokkD6OUcupXK8RP7U6EXIgYTlOX26K/HmJrJjUG w==;
X-CSE-ConnectionGUID: BXh8C871TteLurH47vrT/Q==
X-CSE-MsgGUID: itCSdxIzRGOzpRDxdCfe+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90701071"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="90701071"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:19:32 -0700
X-CSE-ConnectionGUID: dAzH67WcSz6DaJzp+D67/w==
X-CSE-MsgGUID: Hd5NixSsRjGTEuSy3Ltw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="233800847"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.124])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:19:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH] drm/i915/backlight: Sanitize BIOS-enabled PCH PWM in
 full-AUX VESA path
In-Reply-To: <DM3PPF208195D8D4780D4941DF91E62C287E3062@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260513080819.849479-1-suraj.kandpal@intel.com>
 <b21c1fc24b8f87958183f360b3d2cd4d9986875b@intel.com>
 <DM3PPF208195D8D4780D4941DF91E62C287E3062@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Wed, 13 May 2026 15:19:28 +0300
Message-ID: <a67308908b41bbb13a9dd74b24207b19fdaa2667@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 13 May 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
>> Subject: Re: [PATCH] drm/i915/backlight: Sanitize BIOS-enabled PCH PWM in
>> full-AUX VESA path
>> 
>> On Wed, 13 May 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> > In full-AUX VESA mode (aux_enable && aux_set) the driver never touches
>> > the native PCH PWM. If BIOS left PWM CTL register enabled, the PCH PWM
>> > keeps system alive during s2idle and blocks S0ix.
>> > Always run pwm_funcs->setup() so pwm_enabled reflects real HW state,
>> > and on first enable in full-AUX mode call pwm_funcs->disable() once to
>> > clear the stale bit. Runtime behaviour is otherwise unchanged.
>> >
>> > Fixes: 40d2f5820951 ("drm/i915/backlight: Remove try_vesa_interface")
>> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> > ---
>> >  .../drm/i915/display/intel_dp_aux_backlight.c | 32
>> > +++++++++++++------
>> >  1 file changed, 23 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > index a8d56ebf06a2..c828c568fb8b 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> > @@ -496,6 +496,17 @@ intel_dp_aux_vesa_enable_backlight(const struct
>> intel_crtc_state *crtc_state,
>> >  	struct intel_panel *panel = &connector->panel;
>> >  	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>> >
>> > +	/*
>> > +	 * In full AUX VESA mode the native PWM is never driven by us. If BIOS
>> > +	 * left it enabled, the PCH PWM keeps the system alive and blocks
>> > +	 * S0ix. Sanitize it once via pwm_funcs->disable.
>> > +	 */
>> > +	if (panel->backlight.edp.vesa.info.aux_enable &&
>> > +	    panel->backlight.edp.vesa.info.aux_set &&
>> > +	    panel->backlight.pwm_enabled)
>> > +		panel->backlight.pwm_funcs->disable(conn_state,
>> > +
>> intel_backlight_invert_pwm_level(connector, 0));
>> > +
>> >  	if (!(panel->backlight.edp.vesa.info.aux_enable ||
>> >  	      panel->backlight.edp.vesa.info.luminance_set)) {
>> >  		u32 pwm_level;
>> > @@ -558,15 +569,18 @@ static int intel_dp_aux_vesa_setup_backlight(struct
>> intel_connector *connector,
>> >  				    panel-
>> >backlight.edp.vesa.info.luminance_set),
>> >  		    backlight_unit_str(panel));
>> >
>> > -	if (!panel->backlight.edp.vesa.info.aux_set ||
>> > -	    !panel->backlight.edp.vesa.info.aux_enable) {
>> > -		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
>> > -		if (ret < 0) {
>> > -			drm_err(display->drm,
>> > -				"[CONNECTOR:%d:%s] Failed to setup PWM
>> backlight controls for eDP backlight: %d\n",
>> > -				connector->base.base.id, connector-
>> >base.name, ret);
>> > -			return ret;
>> > -		}
>> > +	/*
>> > +	 * Always probe the native PWM HW state so panel-
>> >backlight.pwm_enabled
>> > +	 * reflects what BIOS left behind. Required for the full-AUX VESA path
>> > +	 * to detect and sanitize a BIOS-enabled PCH PWM that would
>> otherwise
>> > +	 * block S0ix.
>> > +	 */
>> > +	ret = panel->backlight.pwm_funcs->setup(connector, pipe);
>> 
>> This will log something like "Using native PWM for backlight control" in dmesg,
>> which is going to be wildly confusing for AUX backlight.
>
> Yes true I was wondering the same thing.
> I was thinking is changing this message to Setting up PWM function for backlight  makes more sense.

I guess s/Using/Setting up/ works.

Maybe intel_pwm_setup_backlight() needs to say something about
"Using". Then it would align with what intel_dp_aux_backlight.c says
about "Using".

> Or another option is to just
> Have the aux_enable && aux_set check inside these PWM functions to skip this print al together.

Yeah, no. Need to try to maintain division of responsibilities, and
avoid touching data that belongs to the other part.

BR,
Jani.

> We do need this setup to fill up all the pwm related fields inside backlight.
> Moreover this helps us call pwm_funcs->disable which take care of choosing the correct gen of backlight register to disable.
> Which do you think makes more sense Jani.
>
> Regards,
> Suraj Kandpal
>
>> 
>> BR,
>> Jani.
>> 
>> > +	if (ret < 0) {
>> > +		drm_err(display->drm,
>> > +			"[CONNECTOR:%d:%s] Failed to setup PWM backlight
>> controls for eDP backlight: %d\n",
>> > +			connector->base.base.id, connector->base.name, ret);
>> > +		return ret;
>> >  	}
>> >
>> >  	if (panel->backlight.edp.vesa.info.luminance_set) {
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
