Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088D606A321
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LE1yKObE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B20810E5C2;
	Tue, 20 Oct 2026 12:53:17 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E35E10F0DE
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 23:21:13 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-833e671ee9fso1779320a34.0
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 16:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792452072; cv=none;
 d=google.com; s=arc-20260327;
 b=r/qSX8Uu5PTYRPXBuR/cRSe5KYgTZg/iu6+lBLBQ3hclht38hzFqaUSa8xya7DcPa5
 UfzEp2/4sJFtU8JT7/YPOhBr0NIIfVi6x21+jV2B3/NszkMg8gEHdVQ1Dd+AZ24oF5XN
 WhbuW3Bi2HOQoWX5hWcn+vPXGkqPwhDBSOWW6NtfdzcTnFnPkr+1VY23+AJ6R8VaBWiM
 yTdIAhvrQUz1x7V1UdUxE0Z9FcY0ZDjzPSoistPuhA5VzsQ7cPu7XH0u0PFvXDQgdChm
 Rd3MAM/yH47ZdK74JHZNr2hYeAnscgMSnCtzqNVAZP46zP7sqEnuJ3gCnZ0/6pOAltjV
 o9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SDRnHnRoknSiYUsalL/FFfb9UodnclNsTRZz4O77Pzg=;
 fh=kFrn1Lrx4JzlvYX3VsqNb1PCxRM3/1TgfLcOz04k/ZU=;
 b=BzN0rE5EH5+70H7DJ8WC3bZFQo0TpGP3lRzgREbdRgqYvtVQEzliW7FQgfhskR8d5V
 I2Sw5Gm2cC+ZTWSH4nMPApFlSVq0jw5R3w2RgLC0ZOAauV/AMkbRMjy4504s3M1tM7sE
 JwZNXFSGHg4ZY+Dy5HRTgBrqJ+5H2r3RzXwKb0Hbe94dluLEsPDAwbJUU0SpghiHnjtD
 9LH9vYMUIu/Oo5nXfSzPRj9YauBaYs041i7EVFaM0FEnLebgF88XlqV2hfGTgZO+ht/J
 vd6HS3ZN3WKziXVi+yWNcqY0QttL+xUQ6sb9I7zx+V0MPAHoD3VdM689jcT8xNWqRMbi
 IP2Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792452072; x=1793056872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SDRnHnRoknSiYUsalL/FFfb9UodnclNsTRZz4O77Pzg=;
 b=LE1yKObEIehB5viXY8ywtmmp3I7QXzRPYYrTRRuPf1vGZVTgemQu5EghiawUcTEfeQ
 cdRuN74Th5xa59ci03g2JpZOIZgQMTGIKIoAudrEIqY1EiRzzVJ8bZ2ldv9V4AOdsbi8
 FUyLDLRZDayX+g20MOgpcXgmv2+Yj/IAZg/5IbMpOZ4Vjr538z5m0hzOYHZaPm6G0fGk
 QjwOsUT27Eh1PeCM9fFYXDayJr+LjXC9FxNYkC4n99isULNxe5FUy5T5Q8a6gRTOeNwi
 UhCLus7N3ez1A35yRdv9YuxtaiR2ip5qtfno+HHCZwbLljLK7kJT4pkwfh8wXiTlAaKe
 3/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792452072; x=1793056872;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SDRnHnRoknSiYUsalL/FFfb9UodnclNsTRZz4O77Pzg=;
 b=OLemn2hlg+lYe1KDbszvvZR7rsYgigi2zSuozJnQ3BJ4rI0kgicY+IhN+78G9xCL7m
 Kt+NqiRKZ0zLO6gne7XBYHEYMX5TtWrHifyk3QtAew5uj8Gv6M1hWjKAPnZrlBIbMD0i
 VsBzYWnxlAA4pfAUrLDO4Ls9fDeoqgebXkISCzsefiWISHDcIo44bgJRelQCrl31G1dN
 5MDCxIqUexSAp3Ge+a0TEK8u/azGxfGDVoqBxc0ns5cf6bTPxVyTNcS73Wu7Q39Oovtf
 ZvLNrh5z7cIpIOo/349WDZ9UqdNPAQp/F4gvNxw6GaC8g7h0TdvPAj9gFeqoKGAA8S63
 6QZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzs7XOJDzWrqoE7v3Y3OlldljAXXjpFSRGZQll5gkgiwk58mi0nly0vte+xF++TYS3n/ooobyyiOw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIva5BDHaS6JKmjKy5Ep2ju4tCwIloRxzlcO2dAMEp0egWMNY3a
 n7ufsc2aU9up2PWYZFUtyjmSq1Z8QR3AYmToISeQGRxFgCF/i023P01Ui98Xba3APkPUjyVJWJW
 shTGzHcLy0BPkiDyUnQDsUhNfLowoj3I=
X-Gm-Gg: AYBFou1yVFAQqN+eIFrhqffCRwdK5r1jqPcwHWf2TdydTsjRbTJm+T9GMjgSngaLF9Q
 W4mBM0vB0EAcf856vLc65SAoPRtGItJI8eZKl7anRiFOAeN5M4Eun9qwBvDv4+nDEssr2k3JSkV
 RU0VMeoArsZ748DzA9jLwqDfDlkh83dW60nv56zBNdxAAUC5OPOR9JA191v8Jqq8KnfwjPvqUt5
 +LBXoc+hAx2CbkDR2ED0EzE9ZDX76vEbSJ1cxnQCgo43wY27snuoJgkf90x2A92ssIObVZw1u0k
 nKv3YLqqMBP6OAkeN0jaGkJ7dfPb9rVf3+DA3mkd0WiZvNttXrW+P5KL4nW2txyHq0oS+v+SEAD
 mzEJfUweE+U2Z1M1bqoUtwV5/BU7zWgZIxt56h+vM
X-Received: by 2002:a05:6808:f8f:b0:53c:7298:3591 with SMTP id
 5614622812f47-53cc5b5ba6amr7389614b6e.1.1792452072397; Mon, 19 Oct 2026
 16:21:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-vlv-dsi-owned-gpios-v1-1-3ca18bcda670@gmail.com>
 <atYPlC-f2AQEjYWS@intel.com>
In-Reply-To: <atYPlC-f2AQEjYWS@intel.com>
From: Michael Anderson <mwwa919@gmail.com>
Date: Mon, 19 Oct 2026 19:21:01 -0400
X-Gm-Features: AclHuK8zNi-iWumfIYywLUJws8kEsLt3lRCO9cEQZoc-Vcc1AV0INueMYu3zYtw
Message-ID: <CAL-Wm=OR8FRGC6Vv-5+4u6aUrnPH=jP8RfSOqKXjvwhEyXWREA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dsi: Use owned panel/backlight GPIOs in VLV MIPI
 sequences
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:16 +0000
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 03:39:48PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> Please file a bug
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items and
> attach a copy of /sys/kernel/debug/dri/0/i915_vbt there so that
> we can all see what it looks like.

Done: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17402
with the VBT dump (raw and decoded), i915_display_info and a full
drm.debug=3D0xe dmesg from the unpatched driver.

> I think what we should do is stop using .gpio_panel and/or
> .gpio_backlight when the VBT expects to control them via the
> sequences.

One wrinkle with keying it on which sequences exist: on this tablet the
reset sequences drive pin 10, the one i915 owns as "backlight", and the
VBT has no BACKLIGHT_ON/OFF sequences at all:

  DISPLAY_OFF:     GPIO 10 -> 0
  ASSERT_RESET:    GPIO 10 -> 0
  DEASSERT_RESET:  GPIO 10 -> 1, 0, 1
  (GPIO 11 is never used)

So with your sketch want_panel_gpio would go false (freeing pin 11,
which the VBT doesn't touch) but want_backlight_gpio would stay true and
pin 10 would still be busy. Would it make sense to scan the sequences for
the GPIO numbers they actually use, and skip requesting pin 10 and/or 11
when a sequence references it?

> The big question here is whether we need to keep some kind of
> hybrid approach where one pin is controlled by the sequence and
> the other explicitly by the driver.

This machine looks like that case: pin 10 is driven by the VBT, pin 11
only by the driver. I don't know whether the panel actually needs pin 11
driven; the GOP leaves it high. I can test a build that leaves pin 11
alone if that helps.

Bart pointed out that a timed pulse like DEASSERT_RESET is beyond what
reset-gpio or gpio-shared-proxy can do, so not requesting the pins the
VBT drives looks like the simpler fix to me. If you agree I'll do a v2
along those lines and test it here.

Thanks,
Mike

On Mon, Oct 19, 2026 at 8:39=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Sun, Oct 18, 2026 at 04:12:40PM -0400, Mike Anderson via B4 Relay wrot=
e:
> > From: Mike Anderson <mwwa919@gmail.com>
> >
> > On VLV with PPS_BLC_SOC, intel_dsi_vbt_gpio_init() requests the
> > backlight and panel enable GPIOs (INT33FC:01 pins 10 and 11) for i915
> > itself. Since commit 8241b55f1ded ("drm/i915/dsi: Replace poking of VLV
> > GPIOs behind the driver's back") the GPIO elements of the VBT MIPI
> > sequences also request their pin through gpiolib, so when a sequence
> > toggles one of these two pins the request fails and the toggle is
> > dropped:
> >
> >   i915 0000:00:02.0: [drm] *ERROR* GPIO index 10 request failed (-EBUSY=
)
> >
> > Before that commit the pad registers were written directly, so the
> > sequences could still drive the pins i915 owned.
> >
> > The Toshiba Encore 2 WT8-B (Bay Trail, DSI panel) uses pin 10 as the
> > panel reset line: MIPI_SEQ_ASSERT_RESET drives it low and
> > MIPI_SEQ_DEASSERT_RESET pulses it high-low-high. With every toggle
> > failing, the panel is never reset after i915 sends MIPI_SEQ_DISPLAY_OFF
> > during takeover and stays black, even though the backlight PWM and both
> > enable GPIOs read back as on. The tablet only has a usable display
> > with nomodeset.
> >
> > When a VLV MIPI sequence targets pin 10 or 11 and i915 holds the
> > corresponding descriptor, set it through that descriptor instead of
> > requesting the pin a second time.
> >
> > Fixes: 8241b55f1ded ("drm/i915/dsi: Replace poking of VLV GPIOs behind =
the driver's back")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM sparse
> > Signed-off-by: Mike Anderson <mwwa919@gmail.com>
> > ---
> > This patch was developed with an AI coding assistant (Claude Code,
> > Claude Opus 5.5): it ran the debugging session on the tablet (drm.debug
> > log, gpio/pwm debugfs), traced the -EBUSY to 8241b55f1ded, and wrote th=
e
> > change and the changelog; I reviewed it and tested it on the hardware.
> >
> > Testing, Toshiba Encore 2 WT8-B (Atom Z3735F, BIOS 2.10, VBT MIPI
> > sequence block v2, PPS_BLC_SOC):
> > - Arch Linux v7.2.11-arch1 with this patch backported (applies as is):
> >   the panel lights up at i915 takeover and the Xorg login screen shows;
> >   no "GPIO index ... request failed" errors; gpio-10/11 stay owned as
> >   "backlight"/"panel". Unpatched v7.2.11 and v6.18.57 give a black
> >   panel with five -EBUSY errors during boot.
> > - drm-intel-next: built intel_dsi_vbt.o for i915 (=3Dm and =3Dy) and fo=
r
> >   xe (=3Dm) with W=3D1 and sparse (C=3D2, sparse v0.6.5-rc1): no new
> >   warnings.
> >
> > Not tested: other VLV machines with PPS_BLC_SOC. Their behaviour only
> > changes when their VBT sequences touch pin 10 or 11, which currently
> > fails with -EBUSY anyway.
> > ---
> >  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 32 ++++++++++++++++++++=
+++-----
> >  1 file changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu=
/drm/i915/display/intel_dsi_vbt.c
> > index fe12041e9..85d1cdc6e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> > @@ -54,6 +54,10 @@
> >  #define MIPI_VIRTUAL_CHANNEL_SHIFT   1
> >  #define MIPI_PORT_SHIFT                      3
> >
> > +/* VLV NC pins of the backlight and panel enable GPIOs, see soc_panel_=
gpio_table */
> > +#define VLV_GPIO_NC_BACKLIGHT                10
> > +#define VLV_GPIO_NC_PANEL            11
> > +
> >  struct i2c_adapter_lookup {
> >       u16 target_addr;
> >       struct intel_dsi *intel_dsi;
> > @@ -247,10 +251,12 @@ static void soc_opaque_gpio_set_value(struct inte=
l_connector *connector,
> >       kfree(lookup);
> >  }
> >
> > -static void vlv_gpio_set_value(struct intel_connector *connector,
> > +static void vlv_gpio_set_value(struct intel_dsi *intel_dsi,
> >                              u8 gpio_source, u8 gpio_index, bool value)
> >  {
> > -     struct intel_display *display =3D to_intel_display(connector);
> > +     struct intel_display *display =3D to_intel_display(&intel_dsi->ba=
se);
> > +     struct intel_connector *connector =3D intel_dsi->attached_connect=
or;
> > +     struct gpio_desc *gpio_desc =3D NULL;
> >
> >       /* XXX: this assumes vlv_gpio_table only has NC GPIOs. */
> >       if (connector->panel.vbt.dsi.seq_version < 3) {
> > @@ -265,6 +271,22 @@ static void vlv_gpio_set_value(struct intel_connec=
tor *connector,
> >               }
> >       }
> >
> > +     /*
> > +      * With PPS_BLC_SOC, intel_dsi_vbt_gpio_init() already owns these=
 pins,
> > +      * so requesting them again fails with -EBUSY. Some VBTs still to=
ggle
> > +      * them in their MIPI sequences, e.g. as the panel reset line, so=
 drive
> > +      * them through the descriptors we hold.
> > +      */
> > +     if (gpio_index =3D=3D VLV_GPIO_NC_BACKLIGHT)
> > +             gpio_desc =3D intel_dsi->gpio_backlight;
> > +     else if (gpio_index =3D=3D VLV_GPIO_NC_PANEL)
> > +             gpio_desc =3D intel_dsi->gpio_panel;
>
> Please file a bug
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items and
> attach a copy of /sys/kernel/debug/dri/0/i915_vbt there so that
> we can all see what it looks like.
>
> I think what we should do is stop using .gpio_panel and/or
> .gpio_backlight when the VBT expects to control them via the
> sequences.
>
> The big question here is whether we need to keep some kind of
> hybrid approach where one pin is controlled by the sequence and
> the other explicitly by the driver.
>
> For example https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/1=
4605
> has a VBT where the reset pin is controlled by the VBT but there is no
> backlight stuff whatsoever in there. Well, unless some of those DCS
> commands has something to do with the backlight, but IIRC DCS has no
> standard stuff for backlight so it would all be panel specific. So
> it's not clear if a backlight GPIO pin is needed at all there, of if
> the DCS and/or the PWM alone is sufficient.
>
> Hans, do you still have these funky VLV DSI machines around, and if so
> can you check whether they would need this kind of hybrid approach?
> Sadly all I have is old stuff that doesn't use the VBT sequences at
> all.
>
> If we do need the hybrid approach then it could perhaps look something li=
ke this:
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -917,8 +917,14 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel=
_dsi, bool panel_is_on)
>
>         if (display->platform.valleyview && mipi_config->pwm_blc =3D=3D P=
PS_BLC_SOC) {
>                 gpiod_lookup_table =3D &soc_panel_gpio_table;
> -               want_panel_gpio =3D true;
> -               want_backlight_gpio =3D true;
> +
> +               if (!connector->panel.vbt.dsi.sequence[MIPI_SEQ_ASSERT_RE=
SET] &&
> +                   !connector->panel.vbt.dsi.sequence[MIPI_SEQ_DEASSERT_=
RESET])
> +                       want_panel_gpio =3D true;
> +
> +               if (!connector->panel.vbt.dsi.sequence[MIPI_SEQ_BACKLIGHT=
_OFF] &&
> +                   !connector->panel.vbt.dsi.sequence[MIPI_SEQ_BACKLIGHT=
_ON])
> +                       want_backlight_gpio =3D true;
>
>                 /* Ensure PWM0 pin is muxed as PWM instead of GPIO */
>                 ret =3D pinctrl_register_mappings(soc_pwm_pinctrl_map,
>
> > +
> > +     if (gpio_desc && connector->panel.vbt.dsi.config->pwm_blc =3D=3D =
PPS_BLC_SOC) {
> > +             gpiod_set_value_cansleep(gpio_desc, value);
> > +             return;
> > +     }
> > +
> >       soc_opaque_gpio_set_value(connector, gpio_index,
> >                                 "INT33FC:01", "Panel N", gpio_index, va=
lue);
> >  }
> > @@ -430,7 +452,7 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *i=
ntel_dsi, const u8 *data)
> >       else if (DISPLAY_VER(display) >=3D 9)
> >               bxt_gpio_set_value(connector, gpio_index, value);
> >       else if (display->platform.valleyview)
> > -             vlv_gpio_set_value(connector, gpio_source, gpio_number, v=
alue);
> > +             vlv_gpio_set_value(intel_dsi, gpio_source, gpio_number, v=
alue);
> >       else if (display->platform.cherryview)
> >               chv_gpio_set_value(connector, gpio_source, gpio_number, v=
alue);
> >
> > @@ -886,8 +908,8 @@ static struct gpiod_lookup_table pmic_panel_gpio_ta=
ble =3D {
> >  static struct gpiod_lookup_table soc_panel_gpio_table =3D {
> >       .dev_id =3D "0000:00:02.0",
> >       .table =3D {
> > -             GPIO_LOOKUP("INT33FC:01", 10, "backlight", GPIO_ACTIVE_HI=
GH),
> > -             GPIO_LOOKUP("INT33FC:01", 11, "panel", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP("INT33FC:01", VLV_GPIO_NC_BACKLIGHT, "backlig=
ht", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP("INT33FC:01", VLV_GPIO_NC_PANEL, "panel", GPI=
O_ACTIVE_HIGH),
> >               { }
> >       },
> >  };
> >
> > ---
> > base-commit: 0507cc5a476af0b6d037b19248bdd20dbe27487d
> > change-id: 20261018-vlv-dsi-owned-gpios-cd127ba137e7
> >
> > Best regards,
> > --
> > Mike Anderson <mwwa919@gmail.com>
> >
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel



--=20
Michael Anderson
