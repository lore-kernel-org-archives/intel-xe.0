Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D411E9B356
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 10:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77E610E47D;
	Mon,  2 Mar 2026 10:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxFgovx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EDC10E47D;
 Mon,  2 Mar 2026 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772447309; x=1803983309;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8hkbqVkUuFz6gD/zkyflv6Q+771Z+sT+xFeABUeeKlI=;
 b=jxFgovx8YgFkrjpk808az8QhTDClIFJbIGcECIqix8r0alBqQRbSb2op
 rFolAb23WU9n5NyySU1IPnUUWDE1BK6xnPfBUoTZOTJ/EJCZEgZmcZcmN
 WSAfdxw0bsVGMQykNG8boUraSeWKzlnOmIPwKz8uLQYItUH+KaP4d125N
 cwr7bnydf2rTYtrEwNFEXVXgefgGlujUD5wvzdwxBtVQZ0KKgil8Pvyhl
 hQj8A1nOIB2yEEqan5rPwzk/S4ZxB9p7xa80Bl9nv7UmGN7Z31I5TPo/3
 evfJNz4Sf4bTaU+rLaGiNQoloija7rkp6oY8tRrOsDcdgLAD7rxrSEbJZ w==;
X-CSE-ConnectionGUID: jbrg1weRTcerX3g607P/uQ==
X-CSE-MsgGUID: cmceg74oRTmya+ztDul9fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84544600"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84544600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:28:28 -0800
X-CSE-ConnectionGUID: a0AgzD4aRBiINwvT/jiGQg==
X-CSE-MsgGUID: Dcw9Wo+0T9SJPllKlY9MDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="215267416"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:28:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 1/8] drm/i915/backlight: Use default/max brightness
 for VESA AUX backlight init
In-Reply-To: <DM3PPF208195D8DBB70E17DC6764BC5A276E37EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
 <20260224034526.2730130-2-suraj.kandpal@intel.com>
 <1a76dfe14cbc90b4aaec6f0e54b4e8df9f480efa@intel.com>
 <DM3PPF208195D8DACF643E4D0D138F0128CE375A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <9f9be7c4361428b7ccb77dcc04f93b0eda024c8b@intel.com>
 <DM3PPF208195D8DBB70E17DC6764BC5A276E37EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Mon, 02 Mar 2026 12:28:23 +0200
Message-ID: <676746dc5a9fe839e3ed071dee1c8e89174ce0ea@intel.com>
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

On Mon, 02 Mar 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: RE: [PATCH v3 1/8] drm/i915/backlight: Use default/max brightness for
>> VESA AUX backlight init
>> 
>> On Wed, 25 Feb 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> >> Subject: Re: [PATCH v3 1/8] drm/i915/backlight: Use default/max
>> >> brightness for VESA AUX backlight init
>> >>
>> >> On Tue, 24 Feb 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> >> > If the brightness fetched from VBT/previous state is 0 on backlight
>> >> > initialization, then set the brightness to a default/max value.
>> >> > Whenever the minimum brightness is reported as 0 there are chances
>> >> > we end up with blank screen. This confuses the user into thinking
>> >> > the display is acting weird. This occurs in eDP 1.5 when we are
>> >> > using PANEL_LUMINANCE_OVERRIDE mode to mainpulate brightness via
>> >> > luminance values.
>> >> >
>> >> > Closes:
>> >> > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
>> >> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> >> > Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>> >> > ---
>> >> > v1 -> v2:
>> >> > - Let users set brightness to 0, make it so that it's just not done
>> >> > by default (Arun)
>> >> >
>> >> > v2 -> v3:
>> >> > -Update commit header and message (Arun)
>> >> >
>> >> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
>> >> >  1 file changed, 4 insertions(+)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > index eb05ef4bd9f6..c40ce310ad97 100644
>> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> >> > @@ -564,6 +564,8 @@ static int
>> >> > intel_dp_aux_vesa_setup_backlight(struct
>> >> intel_connector *connector,
>> >> >  		}
>> >> >  		panel->backlight.level =
>> >> intel_dp_aux_vesa_get_backlight(connector, 0);
>> >> >  		panel->backlight.enabled = panel->backlight.level != 0;
>> >> > +		if (!panel->backlight.level)
>> >> > +			panel->backlight.level = panel->backlight.max;
>> >>
>> >> How does this help when .enabled is still based on level != 0 above?
>> >>
>> >
>> > Well we keep the backlight.enabled as false if we read a 0 back from the DPCD
>> or the current level state is 0.
>> > This is to maintain the policy that if during setup we get 0 as
>> > backlight value eDP backlight is currently disabled (which means
>> > __intel_backlight_enable needs be called). We then change the current
>> > level to max so that when backlight enable is called after setup from
>> intel_backlight_update, we enable backlight with max level so that we do not
>> end up with a blank screen. This is also where we set backlight.enabled = true.
>> > This is  to tackle different eDP behavior where, some preserve the
>> > last brightness value programmed in them (in that case users want the
>> > same brightness to continue) while others don't and just 0 it out instead of
>> having some default value (in that case we keep backlight.enabled = false later
>> to be made true during the __intel_backlight_enable call).
>> > We face these scenarios in some compositors during the pass key phase
>> > where the compositor is still totally not doing everything and does not send
>> us any explicit brightness value to set thinking eDP would have some basic
>> default value of it's own . We end up getting a 0 from DPCD and we enable and
>> set the backlight enable with 0 value which anyways later causes us to call
>> backlight disable.
>> > In this case during authentication in some compositors like Fedora
>> > there are cases where we do not get a explicitly backlight value till the user
>> has to blindly enter their Passkey, after which the compositor sends us some
>> sane value which we then program.
>> 
>> There's a long history of problems with the PWM backlight unexpectedly going
>> from 0 to max.
>
> Right but at least with this now luminance values will continue if DPCD maintains its state if we get a value back, otherwise we set a
> Default value.

What's the brightness control mode *before* we enable luminance control?

When taking over, we should try to read the current brightness setting
with the current brightness control method. If we're switching to
luminance control, the existing luminance value is meaningless.

AFAICT drm_edp_backlight_probe_state() uses bl->luminance_set to
determine the value to read, not the current mode. At a glance, seems
wrong to me.

Of course, regressions have priority, so a revert should also be a
consideration before quickly going for adding level = max in there.

> Can we proceed with getting this merged ? Would really help the user.

The real problem with quick fixes to help the user is that they have the
potential to make it a lot harder for a lot more users and developers in
the long run.


BR,
Jani.

>
> Regards,
> Suraj Kandpal
>
>> 
>> BR,
>> Jani.
>> 
>> >
>> > Regards,
>> > Suraj Kandpal
>> >
>> >> >  		drm_dbg_kms(display->drm,
>> >> >  			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level
>> >> is controlled through DPCD\n",
>> >> >  			    connector->base.base.id, connector->base.name);
>> >> @@ -573,6
>> >> > +575,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct
>> >> intel_connector *connector,
>> >> >  		if (current_mode ==
>> >> DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
>> >> >  			panel->backlight.level = current_level;
>> >> >  			panel->backlight.enabled = panel->backlight.level != 0;
>> >> > +			if (!panel->backlight.level)
>> >> > +				panel->backlight.level = panel->backlight.max;
>> >>
>> >> Ditto.
>> >>
>> >> >  		} else {
>> >> >  			panel->backlight.level = panel->backlight.max;
>> >> >  			panel->backlight.enabled = false;
>> >>
>> >> --
>> >> Jani Nikula, Intel
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
