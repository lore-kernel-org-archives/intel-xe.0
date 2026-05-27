Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A35CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 13:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFF110F1D2;
	Thu, 28 May 2026 13:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GWa40yXt";
	dkim-atps=neutral
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com
 [209.85.160.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640FD10E22B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 15:19:05 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-43a2ad7bcc4so5473336fac.1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 08:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779895144; cv=none;
 d=google.com; s=arc-20240605;
 b=FzPYldVf7SIXlAW6KSlysUaI8lf3tm3aHebIGo+Gh25C8Mb6zIc0K7hJ6N3BiTQEFa
 h3YWzzJkG07zjc1ukS1cz3PtPMLq/6BBi+afG69mzJUxaanbqAQzsK+hSXl2LPVLYRXB
 /+x8oVkneSjFogdm39TeW1vOEu0cQocWPsRZ8KDz5RhSNowWmkch9FboEY/OA3qHaIKy
 7CBvM482bIYufj2XD2f0ICgMCprT+TaufSuKClb3vPJSf55P0kIjKH93huqBHUWlCHKk
 eIHaC289eRJ9I3kNJMiviypYmEtDZ4+RyHlwF/y4y/Wy0fQPwRXWaLMiUsPzGUWpLycp
 yjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7LRvDWq8hbZrtXlL/OzmRkuzkeMA4RIOOZP+dsA10Pw=;
 fh=NZ6o5A+Tm18T9et0z5ny4cuiH+k3IF9WCyDDgnFLfV4=;
 b=cP45oJjeQI7J30+ue4HvXTGKpFHFa8vwTpIzKjyvJ7xfPEVQ6RKFfBvpvjXmnfCCvS
 L0pteicxODQOHYaHuLuLkRN43rvqEj66RiWi5BVdsb4+tka1Rz5ExaKvppxG5pMlP6ph
 2hgJhJQH6eARErs75wr8+ys69q9WsVVEQgP82NI0EnmcMUUFEpbDWOhsAeYp71CSTFzl
 +4zupaslBy/v0wOKqD0H78VVe/j3NcijG3D1yOpBGO4iFspcolRRJOKjGA09o+pdUoJN
 7EZsVF4JwoaRZ13gbhiGfnOk4tNcpmLlt3oqfZt2zVI8DIuIcNVS75LbnUm20ly5sOJt
 ybbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779895144; x=1780499944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LRvDWq8hbZrtXlL/OzmRkuzkeMA4RIOOZP+dsA10Pw=;
 b=GWa40yXtRZNE2Wo6LdbUkHl9RhAze8oR/LBn1iqootK3+Qfio59YZeb0epm/cqFP5U
 xFIjZgv1v1m5ouh1+24hiXmC/210OaFqOAbCpssn+7fDDXryZHncshtPSwBNatYyo9Aa
 yYIQL4CiT95cRzCwfRelaOWcU2HP+U0VWikbvFbgvP/4nqLrE4NRlwDOGhuqgH/auMqZ
 7XJhJnva9ihg4ObY0bbfFdzd6N8exXbuSYQZdKVpfVXQ117qNONeH6Pcs45TqQGXGcoz
 qojiEEfrqwe0AQQiUZ0tz8UHrAB4q3KDjtpd1m8rJ0mlppMkLGoY6+lOYmlmoZMu5iEe
 NoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779895144; x=1780499944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7LRvDWq8hbZrtXlL/OzmRkuzkeMA4RIOOZP+dsA10Pw=;
 b=HSOKA63zpl784J7/F8lbIRN0iKcJwnYCyh47CK9nrju8ocguryN97tzNM3yopk3oWS
 TrFcQQfeYXVd3oOyN0rVEfR6DPMWzuXCdSrwdiFFgHTFVQIvMTsS/rVB+/+/GA5NEuVw
 kw0QbltTYNaqgzqA2a0eSG1aia6TLzywh8krPNviVf9LLW29UMXlapRxtXEGlCfOpoO8
 y6JUVgeAiTMrGtguA/1HRl9PZ+7VVz64R6SlkAFR9uSDGQMDPHYijdiFtEbCiw8UNFKs
 fgkTcadRrgb0h9TUMMarzCF3hgLMv4C61rA4ZTCILo3g0gp/iaQxDzDjZdHSeK/dRKOH
 mmLQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+gM1xxvHTPf9qGH6J6cLQEWIp9sfY3SFoKKKLKP1n3UtnjXytjIab0ugXTkYv7lMAmY070Ymu+lg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7EBa8aLppah1zrPzFTi8bFc38GrMTIHkREYOqCGWrBWvUmb2N
 1jAWJ+7EXhJHoJp45DY1w8Iwu5NDmkrPaDU+FQs/iJQQN0afDcsYux17KuRUBKG5cqhbBI0SVBi
 dhLQdqaemUw6a5/9s7PfLMM+Zc0JtPrw=
X-Gm-Gg: Acq92OGg8J2iyXGrC1jLjLLwAPXZkqXYRRTxboRxRDSUFUMDaFWbfpIR5DlbJZVen26
 sTuwpxv7z20gvmt6I59M9fcY8fNABrtsOZtzVQ1h2ozEvCQ6OM1i8aAMG0qgxbSax9mOEUHcKlZ
 wTINPSTbYJLz1ddioqbZmBcX4ODl9e65l7eOEai710WxAlrZ2lGCnAGIZef7pr+dK+B+FGP4KPC
 eiXtHIKqbcJRudfeS33TkpE0bAA6YyB0PA7+WADDjo0KQ5MasV+IJ2bnIBLaIsA38lT267Odgi4
 ygx5zjIaVw==
X-Received: by 2002:a05:6820:178a:b0:67c:1e60:3e90 with SMTP id
 006d021491bc7-69d7ead7d36mr12221633eaf.6.1779895144228; Wed, 27 May 2026
 08:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260527115311.13398-1-zhanwei919@gmail.com>
 <ahb3VMRCQpofblbW@black.igk.intel.com>
In-Reply-To: <ahb3VMRCQpofblbW@black.igk.intel.com>
From: =?UTF-8?B?5Y2gd2Vp?= <zhanwei919@gmail.com>
Date: Wed, 27 May 2026 23:18:52 +0800
X-Gm-Features: AVHnY4IiIrYCVLBF4XWxDARC7wP_O5GrLj1re-8BUianaKxWN4OIP872Vp02R4Y
Message-ID: <CA+qUFcnP-XEPHJD-+djRydD92-bAz5bxxVaRHGJ3nrpwtq4m7w@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/xe/hwmon: report a single fan for DG2 instead of
 two
To: Raag Jadav <raag.jadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 28 May 2026 13:46:27 +0000
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

Thanks for the detailed explanation -- that make sense

I can think of two paths forward:

1) Have fan_input_read() return -ENODATA if one channel has started
 reporting pulses but another remains silent for, say, 30 seconds.
 This way the phantom entry still appears in sysfs but userspace
 tools like `sensors` can handle the "no data" case gracefully
 instead of showing a misleading 0 RPM.

2) Drop the code change entirely and instead add a short note in
 Documentation/gpu/xe/xe_hwmon.rst explaining that on DG2 boards
 where the OEM routes multiple physical fans through a shared tach
 line, fan{2,3}_input may read 0, so future contributors don't end
 up re-attempting the same v1 patch I just sent.


What do you think?


Raag Jadav <raag.jadav@intel.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=8827=E6=97=
=A5=E5=91=A8=E4=B8=89 21:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, May 27, 2026 at 07:53:11PM +0800, Zhan Wei wrote:
> > xe_hwmon_pcode_read_fan_control() currently hardcodes *uval =3D 2 when
> > queried with FSC_READ_NUM_FANS on DG2. This causes fan2_input to be
> > exposed via sysfs, but on the tested Arc A750 LE (DG2 G10, PCI ID
> > 0x56a1) fan2_input reads 0 RPM permanently while fan1_input correctly
> > reports ~800 RPM with both physical fan physically spinning.
> >
> > The RPM is calculated delta-based from a tach pulse counter:
> >
> >     rotations =3D (reg_val - fi->reg_val_prev) / 2;
> >
> > so a constant-zero RPM means the register at offset 0x138170
> > (BMG_FAN_2_SPEED) simply does not accumulate pulses on DG2 silicon.
> > The i915 driver does not expose fan2 on DG2 at all -- it only maps
> > PCU_PWM_FAN_SPEED (0x138140, identical to BMG_FAN_1_SPEED), consistent
> > with the observation that only one fan tach register is wired on DG2.
>
> i915 is for legacy cards (like DG1) which only has a single channel
> in hardware. I just happen to extend the support to DG2 for the folks
> that might be using it.
>
> > Report a single fan for DG2 to keep the phantom fan2_input out of
> > sysfs.  Battlemage paths are unchanged.
> >
> > Tested on Arc A750 LE (DG2 G10): with this patch applied, fan2_input
> > no longer appears in /sys/class/hwmon/hwmonX/ and `sensors xe-pci-0300`
> > shows fan1 only.
> >
> > Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
> > Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
> > ---
> > Open questions for reviewers: this is verified only on DG2 G10. Owners
> > of G11 (e.g. ASRock Challenger A750) and G12 (e.g. Sparkle Titan A750
> > with three physical fans) -- does fan2_input or fan3_input ever read
> > non-zero in your setup? If so, the right fix is a per-subplatform
> > table rather than a flat 1.
>
> There's no straight answer here :)
>
> root@DUT2147DG2FRD:/home/gta# cat /sys/class/drm/card0/device/device
> 0x56a1
>
> root@DUT2147DG2FRD:/home/gta# sensors xe-pci-0300
> xe-pci-0300
> Adapter: PCI adapter
> pkg:         758.00 mV
> fan1:         636 RPM
> fan2:         652 RPM
> pkg:          +47.0=C2=B0C
> vram:         +50.0=C2=B0C
> pkg:              N/A  (max =3D 190.00 W)
> pkg:          14.37 kJ
>
>
> The way this works is upto the OEMs how they design their cards. Some reu=
se
> a single channel for multiple physical fans while some use 1:1 mapped mul=
tiple
> channels for each fan.
>
> This is unfortunately not possible to figure out from the driver without
> FSC_READ_NUM_FANS command (which has been found to be not working on some
> cards and hence the hardcoded value).
>
> Raag
>
> >  drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmo=
n.c
> > index de3f2aeffc3f..2a60a76b1971 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -860,9 +860,15 @@ static int xe_hwmon_pcode_read_fan_control(const s=
truct xe_hwmon *hwmon, u32 sub
> >  {
> >       struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> >
> > -     /* Platforms that don't return correct value */
> > +     /*
> > +      * The PCODE FAN_SPEED_CONTROL subcommands return an error on DG2=
, so we
> > +      * answer the FSC_READ_NUM_FANS query here. DG2 only wires a sing=
le fan
> > +      * tachometer register (BMG_FAN_1_SPEED =3D=3D 0x138140, shared w=
ith i915's
> > +      * PCU_PWM_FAN_SPEED); BMG_FAN_2/3_SPEED read 0 on DG2 silicon. R=
eporting
> > +      * one fan keeps a phantom fan2_input that always reads 0 out of =
sysfs.
> > +      */
> >       if (hwmon->xe->info.platform =3D=3D XE_DG2 && subcmd =3D=3D FSC_R=
EAD_NUM_FANS) {
> > -             *uval =3D 2;
> > +             *uval =3D 1;
> >               return 0;
> >       }
> >
> > --
> > 2.43.0
> >
