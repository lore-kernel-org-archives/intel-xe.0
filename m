Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BCECC6B27
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 15:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B622C10EA66;
	Wed, 14 Oct 2026 15:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4044D10E111;
 Wed, 14 Oct 2026 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791992902; x=1823528902;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=DSVdF60TxO0Usam3OnDb+0WDnP7hZYnmY70danGRc2I=;
 b=jbhWLJtQ1KXOVsmQQkWOBcIOjMySMmbJLm6theAh3E271rXCNK1tmfcN
 wHsJSNDs5PvKxPyYK9EO32XO4ZCleJijZ1ZsQDaWkg5I35lYnTvgNINDN
 lSWGhp4G4wIPSK20LlJYvyHxThQeA1lPbTGNoWdmv6H0HO5aWJ6WZKuEX
 lUYgVAxcjlJTCwamaahooULM9mCziV8DMCrDqs18dNiOO6B9zxITUPGT8
 mm/PvChos83/8fVBaPmVVkp7Ah1R1SdLMoZSeD71f4g5OOj+YQAqxnla1
 wswZIL3+0gmuHH9iDYUgkIzgqS7SecuXX6NceyP1W/VOj52oU5r3LPzON g==;
X-CSE-ConnectionGUID: vunXz6xCTliwbqxCgqoczQ==
X-CSE-MsgGUID: gjAy6z6+SiKnZfa/uoWPRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="751089"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="751089"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:48:22 -0700
X-CSE-ConnectionGUID: rcxiHdFPQQq6Ywqum84EcA==
X-CSE-MsgGUID: J+T5bhqiRVKTJyKETQh6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1424146"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:48:20 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261007222314.5714-5-ville.syrjala@linux.intel.com>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-5-ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/i915/gmbus: Fix i2c bit banging for PTL+
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 14 Oct 2026 18:48:17 +0300
Message-ID: <179199289730.125250.2949692993509316966@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Hi,

This didn't cherry pick cleanly into drm-intel-fixes.

Do we still want to send this into v7.3 given how fresh and
relatively non-trivial it is and we're past -rc7 already?

If so, we'd need a version that applies on drm-intel-fixes and I can
then send an extra PR to see if it will get pulled in time still.

Regards, Joonas

Quoting Ville Syrjala (2026-10-08 01:23:13)
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> The current implementation of w/a 16025573575 does not actually work.
> The GPIO register mask bits are write only, and thus he read-modify-write
> cycles we do will not preserve them. Furthermore the implementation makes
> no effort to preserve the actual direction/output value bits, which is
> a must if all the mask bits were actually set all the time.
>=20
> Rewrite the whole thing so that we always set all the mask bits,
> and correctly preserve the previous state of the direction/output value
> bits. And do that on all platforms so that we only have a single codepath
> to worry about. As a bonus this approach will also make the code
> work on upcoming platforms where the mask bits no longer even exist.
>=20
> Smoke tested on alm,cl,tgl,lnl,ptl.
>=20
> Fixes: 7565fd5dcb0b ("drm/i915/gmbus: Add Wa_16025573575 for PTL/WCL for =
bit-bashing")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 98 ++++++++++++++--------
>  1 file changed, 61 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
> index 854f439ac5ba..b6c63a466233 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -246,25 +246,45 @@ static void bxt_gmbus_clock_gating(struct intel_dis=
play *display,
>                      !enable ? BXT_GMBUS_GATING_DIS : 0);
>  }
> =20
> -static u32 get_reserved(struct intel_gmbus *bus)
> +static u32 gpio_mask_bits(struct intel_display *display)
>  {
> -       struct intel_display *display =3D bus->display;
> -       u32 preserve_bits =3D 0;
> +       return GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
> +               GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
> +}
> +
> +static u32 gpio_preserved_bits(struct intel_display *display)
> +{
> +       u32 val =3D GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_VAL_OUT |
> +               GPIO_DATA_DIR_OUT | GPIO_DATA_VAL_OUT;
> =20
>         /*
>          * On gen2/3 these are either internal pullup disables, or
>          * documented as reserved bits that need to be preserved.
>          */
>         if (DISPLAY_VER(display) < 4)
> -               preserve_bits |=3D GPIO_DATA_PULLUP_DISABLE |
> +               val |=3D GPIO_DATA_PULLUP_DISABLE |
>                         GPIO_CLOCK_PULLUP_DISABLE;
> =20
> -       /* Wa_16025573575: the masks bits need to be preserved through ou=
t */
> -       if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
> -               preserve_bits |=3D GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_M=
ASK |
> -                                GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
> +       return val;
> +}
> =20
> -       return intel_de_read_fw(display, bus->gpio_reg) & preserve_bits;
> +static u32 gpio_read_reg(struct intel_gmbus *bus)
> +{
> +       struct intel_display *display =3D bus->display;
> +       u32 val;
> +
> +       val =3D intel_de_read_fw(display, bus->gpio_reg);
> +
> +       val &=3D gpio_preserved_bits(display);
> +
> +       /*
> +        * Wa_16025573575:
> +        * The (write only!) masks bits need to be kept set through out
> +        * on PTL. Do it always to keep the code uniform for all platform=
s.
> +        */
> +       val |=3D gpio_mask_bits(display);
> +
> +       return val;
>  }
> =20
>  static int get_clock(void *data)
> @@ -287,16 +307,16 @@ static void set_clock(void *data, int state_high)
>  {
>         struct intel_gmbus *bus =3D data;
>         struct intel_display *display =3D bus->display;
> -       u32 reserved =3D get_reserved(bus);
> -       u32 clock_bits;
> +       u32 val;
> =20
> -       if (state_high)
> -               clock_bits =3D GPIO_CLOCK_DIR_IN | GPIO_CLOCK_DIR_MASK;
> -       else
> -               clock_bits =3D GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_DIR_MASK |
> -                            GPIO_CLOCK_VAL_MASK;
> +       val =3D gpio_read_reg(bus);
> =20
> -       intel_de_write_fw(display, bus->gpio_reg, reserved | clock_bits);
> +       val &=3D ~(GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_VAL_OUT);
> +
> +       if (!state_high)
> +               val |=3D GPIO_CLOCK_DIR_OUT;
> +
> +       intel_de_write_fw(display, bus->gpio_reg, val);
>         intel_de_posting_read_fw(display, bus->gpio_reg);
>  }
> =20
> @@ -304,32 +324,36 @@ static void set_data(void *data, int state_high)
>  {
>         struct intel_gmbus *bus =3D data;
>         struct intel_display *display =3D bus->display;
> -       u32 reserved =3D get_reserved(bus);
> -       u32 data_bits;
> +       u32 val;
> =20
> -       if (state_high)
> -               data_bits =3D GPIO_DATA_DIR_IN | GPIO_DATA_DIR_MASK;
> -       else
> -               data_bits =3D GPIO_DATA_DIR_OUT | GPIO_DATA_DIR_MASK |
> -                       GPIO_DATA_VAL_MASK;
> +       val =3D gpio_read_reg(bus);
> =20
> -       intel_de_write_fw(display, bus->gpio_reg, reserved | data_bits);
> +       val &=3D ~(GPIO_DATA_DIR_OUT | GPIO_DATA_VAL_OUT);
> +
> +       if (!state_high)
> +               val |=3D GPIO_DATA_DIR_OUT;
> +
> +       intel_de_write_fw(display, bus->gpio_reg, val);
>         intel_de_posting_read_fw(display, bus->gpio_reg);
>  }
> =20
>  static void
> -ptl_handle_mask_bits(struct intel_gmbus *bus, bool set)
> +gpio_set_mask(struct intel_gmbus *bus, bool enable)
>  {
>         struct intel_display *display =3D bus->display;
> -       u32 reg_val =3D intel_de_read_fw(display, bus->gpio_reg);
> -       u32 mask_bits =3D GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
> -                       GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
> -       if (set)
> -               reg_val |=3D mask_bits;
> +       u32 val;
> +
> +       val =3D gpio_read_reg(bus);
> +
> +       val &=3D ~(GPIO_DATA_DIR_OUT | GPIO_CLOCK_DIR_OUT |
> +                GPIO_DATA_VAL_OUT | GPIO_CLOCK_VAL_OUT);
> +
> +       if (enable)
> +               val |=3D gpio_mask_bits(display);
>         else
> -               reg_val &=3D ~mask_bits;
> +               val &=3D ~gpio_mask_bits(display);
> =20
> -       intel_de_write_fw(display, bus->gpio_reg, reg_val);
> +       intel_de_write_fw(display, bus->gpio_reg, val);
>         intel_de_posting_read_fw(display, bus->gpio_reg);
>  }
> =20
> @@ -344,8 +368,8 @@ intel_gpio_pre_xfer(struct i2c_adapter *adapter)
> =20
>         intel_gmbus_reset(display);
> =20
> -       if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
> -               ptl_handle_mask_bits(bus, true);
> +       if (gpio_mask_bits(display))
> +               gpio_set_mask(bus, true);
> =20
>         set_data(bus, 1);
>         set_clock(bus, 1);
> @@ -362,8 +386,8 @@ intel_gpio_post_xfer(struct i2c_adapter *adapter)
>         set_data(bus, 1);
>         set_clock(bus, 1);
> =20
> -       if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
> -               ptl_handle_mask_bits(bus, false);
> +       if (gpio_mask_bits(display))
> +               gpio_set_mask(bus, false);
> =20
>         if (display->platform.pineview)
>                 pnv_gmbus_clock_gating(display, true);
> --=20
> 2.55.0
>
