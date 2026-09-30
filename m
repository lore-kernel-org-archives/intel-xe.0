Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1ACA5FCD
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 14:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD46710E98D;
	Wed, 30 Sep 2026 14:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CudfoPdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1706B10E14E;
 Wed, 30 Sep 2026 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790777719; x=1822313719;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JKNTWJ7wVtVJZZ8zxAPTRVS9+QKjhghjSwBF/gZH1SE=;
 b=CudfoPdhvPsiYJHK4Bbt6ULbSaJ2Kqzgd2jmdZ+ufIC5UEO3MuS6viMa
 EYYfhx9RwYWlkF2SLQMZRu+H/ot9sQeAX9veGALmIWSctI0UxIb8LQURD
 BroMdHmJjeqAWClmSO/ZtU5xc+HCm1qUFf3HhqohL8t8iLG0/Q+UrHu7h
 Y91aCS/bvIN7Tf/TRyaNEl4MuC0TvioUNtjjUGNewGcmLJWDOo/5EWIV6
 GxgIvR8c+BL4B+NzMtGlxgvo9BjUUvpkoYJ5tbLNZb//EDXQhNXskuAUU
 qyG7sxEuwNVoxx44XhcRHLCD/qLhUQxR1C6y9BdzVFR1QFZexy1YMEPzn A==;
X-CSE-ConnectionGUID: 8m1e1yrCT/u9TE7U/ryOcA==
X-CSE-MsgGUID: F2gl6Jh9SaSl4bnEz3pHAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90469982"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90469982"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:14:58 -0700
X-CSE-ConnectionGUID: nhHqCdAWQayCOXhJKw//KA==
X-CSE-MsgGUID: VAjeGIDtQ2Kl5i+SD1aVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="273782527"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:14:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/i915/gmbus: Switch GMBUS fully to _fw()
 register accesses
In-Reply-To: <20260930131619.17218-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
 <20260930131619.17218-1-ville.syrjala@linux.intel.com>
Date: Wed, 30 Sep 2026 17:14:53 +0300
Message-ID: <80fbc8a0c45810eea37f6bfc38a92a485b9af832@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 30 Sep 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Switch the gmbus code over from _notrace() to _fw() register
> accesses.
>
> My original goal was just to eliminate the _notrace() variants
> to shrink the intel_de.h API a bit, but while doing this I
> stumbled on a huge performance issue with the current code;
> Bit banging turns out to be extremely expensive on PCH
> platforms while in DC5/6, and cause turns out not to be the
> actual south GMBUS/GPIO register accesses, but rather the
> extra north FPGA_DBG register access done from the non _fw()
> register access functions. Those accesses cause a DC5/6 exit
> which take a huge chunk of time.
>
> $ time echo detect > /sys/class/drm/card0/HDMI-A-1/status
> -real	0m16.281s
> +real	0m1.459s
> ...
>
> There does still seem to be a smallish (maybe ~15%) performance
> penalty for accessing PCH registers while in DC5/6. Not really
> sure what's causing it, but seems to be small enough to not cause
> a huge performance problem for bit banging. When not in DC5/6
> the same HDMI detect cycle takes ~1.25 seconds. If we want to
> further speed that up we could completely disable DC5/6 during
> big banged i2c transfers. Currently we only do that on BXT/GLK
> because there the GMBUS hardware lives on the SoC and thus is
> affected by DC states, even for non-bit banged transfers.
>
> Note that by using the _fw() register accessors we also lose the
> uncore.lock protection, but that's fine because everything is
> already protected by the gmbus mutex, and nothing else should
> live on the same cachelines of registers. So even platforms like
> IVB/HSW which may have some issues with concurrent register
> accesses to the same cacheline are still covered.
>
> v2: Drop the accidental wait_for_fw_ms()->wait_for_ms() change
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I'm basically losing track when we're okay to use the _fw variants and
when not. Because it's not just forcewake anymore, it's also the DMC
wakelock now.

I've been complaining about pretty much the same thing with the display
PREEMPT_RT changes.

I'm sure a lot of people know exactly when it's okay, but then there's
also going to be a lot of cargo culting around _fw. :(

This does seem fine, though.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_de.h    |  6 ++++
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 32 +++++++++++-----------
>  2 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 102979019429..8144588d3cf7 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -158,6 +158,12 @@ intel_de_rmw_fw(struct intel_display *display, intel=
_reg_t reg, u32 clear, u32 s
>  	return old;
>  }
>=20=20
> +static inline void
> +intel_de_posting_read_fw(struct intel_display *display, intel_reg_t reg)
> +{
> +	intel_de_read_fw(display, reg);
> +}

Side note, I've thought about adding intel_de_write_post() to do the
posting read internally. Probably 99% of the intel_de_posting_read()
calls could be handled with that, reducing quite a bit of duplication,
especially for verbose cases like:

	intel_de_write(display, BXT_BLC_PWM_CTL(panel->backlight.controller), pwm_=
ctl);
	intel_de_posting_read(display, BXT_BLC_PWM_CTL(panel->backlight.controller=
));
->
	intel_de_write_post(display, BXT_BLC_PWM_CTL(panel->backlight.controller),=
 pwm_ctl);


BR,
Jani.


> +
>  static inline u32
>  intel_de_read_notrace(struct intel_display *display, intel_reg_t reg)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
> index 60a70dea5d85..13bc6ab6b2f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -218,8 +218,8 @@ to_intel_gmbus(struct i2c_adapter *i2c)
>  void
>  intel_gmbus_reset(struct intel_display *display)
>  {
> -	intel_de_write(display, GMBUS0(display), 0);
> -	intel_de_write(display, GMBUS4(display), 0);
> +	intel_de_write_fw(display, GMBUS0(display), 0);
> +	intel_de_write_fw(display, GMBUS4(display), 0);
>  }
>=20=20
>  static void pnv_gmbus_clock_gating(struct intel_display *display,
> @@ -262,7 +262,7 @@ static u32 get_reserved(struct intel_gmbus *bus)
>  		preserve_bits |=3D GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
>  				 GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
>=20=20
> -	return intel_de_read_notrace(display, bus->gpio_reg) & preserve_bits;
> +	return intel_de_read_fw(display, bus->gpio_reg) & preserve_bits;
>  }
>=20=20
>  static int get_clock(void *data)
> @@ -271,10 +271,10 @@ static int get_clock(void *data)
>  	struct intel_display *display =3D bus->display;
>  	u32 reserved =3D get_reserved(bus);
>=20=20
> -	intel_de_write_notrace(display, bus->gpio_reg, reserved | GPIO_CLOCK_DI=
R_MASK);
> -	intel_de_write_notrace(display, bus->gpio_reg, reserved);
> +	intel_de_write_fw(display, bus->gpio_reg, reserved | GPIO_CLOCK_DIR_MAS=
K);
> +	intel_de_write_fw(display, bus->gpio_reg, reserved);
>=20=20
> -	return (intel_de_read_notrace(display, bus->gpio_reg) & GPIO_CLOCK_VAL_=
IN) !=3D 0;
> +	return (intel_de_read_fw(display, bus->gpio_reg) & GPIO_CLOCK_VAL_IN) !=
=3D 0;
>  }
>=20=20
>  static int get_data(void *data)
> @@ -283,10 +283,10 @@ static int get_data(void *data)
>  	struct intel_display *display =3D bus->display;
>  	u32 reserved =3D get_reserved(bus);
>=20=20
> -	intel_de_write_notrace(display, bus->gpio_reg, reserved | GPIO_DATA_DIR=
_MASK);
> -	intel_de_write_notrace(display, bus->gpio_reg, reserved);
> +	intel_de_write_fw(display, bus->gpio_reg, reserved | GPIO_DATA_DIR_MASK=
);
> +	intel_de_write_fw(display, bus->gpio_reg, reserved);
>=20=20
> -	return (intel_de_read_notrace(display, bus->gpio_reg) & GPIO_DATA_VAL_I=
N) !=3D 0;
> +	return (intel_de_read_fw(display, bus->gpio_reg) & GPIO_DATA_VAL_IN) !=
=3D 0;
>  }
>=20=20
>  static void set_clock(void *data, int state_high)
> @@ -302,8 +302,8 @@ static void set_clock(void *data, int state_high)
>  		clock_bits =3D GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_DIR_MASK |
>  			     GPIO_CLOCK_VAL_MASK;
>=20=20
> -	intel_de_write_notrace(display, bus->gpio_reg, reserved | clock_bits);
> -	intel_de_posting_read(display, bus->gpio_reg);
> +	intel_de_write_fw(display, bus->gpio_reg, reserved | clock_bits);
> +	intel_de_posting_read_fw(display, bus->gpio_reg);
>  }
>=20=20
>  static void set_data(void *data, int state_high)
> @@ -319,15 +319,15 @@ static void set_data(void *data, int state_high)
>  		data_bits =3D GPIO_DATA_DIR_OUT | GPIO_DATA_DIR_MASK |
>  			GPIO_DATA_VAL_MASK;
>=20=20
> -	intel_de_write_notrace(display, bus->gpio_reg, reserved | data_bits);
> -	intel_de_posting_read(display, bus->gpio_reg);
> +	intel_de_write_fw(display, bus->gpio_reg, reserved | data_bits);
> +	intel_de_posting_read_fw(display, bus->gpio_reg);
>  }
>=20=20
>  static void
>  ptl_handle_mask_bits(struct intel_gmbus *bus, bool set)
>  {
>  	struct intel_display *display =3D bus->display;
> -	u32 reg_val =3D intel_de_read_notrace(display, bus->gpio_reg);
> +	u32 reg_val =3D intel_de_read_fw(display, bus->gpio_reg);
>  	u32 mask_bits =3D GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
>  			GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
>  	if (set)
> @@ -335,8 +335,8 @@ ptl_handle_mask_bits(struct intel_gmbus *bus, bool se=
t)
>  	else
>  		reg_val &=3D ~mask_bits;
>=20=20
> -	intel_de_write_notrace(display, bus->gpio_reg, reg_val);
> -	intel_de_posting_read(display, bus->gpio_reg);
> +	intel_de_write_fw(display, bus->gpio_reg, reg_val);
> +	intel_de_posting_read_fw(display, bus->gpio_reg);
>  }
>=20=20
>  static int

--=20
Jani Nikula, Intel
