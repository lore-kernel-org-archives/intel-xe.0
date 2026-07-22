Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA44C531D4
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 14:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12D810E5A3;
	Thu, 23 Jul 2026 14:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cxxP+TRs";
	dkim-atps=neutral
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1721E10E486
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 16:44:32 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-66843304cbaso4944069d50.2
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 09:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784738671; cv=none;
 d=google.com; s=arc-20260327;
 b=PQrNCZnQLoE1rhfVrPDPpsr1rjatirOAoxexQfFJxzhrbK8IZNuejPjlFlz523YCbC
 pXiims7K13k+BLeiH8KCg5YCWXqYPv1Kvd2qyCP0qJACYv6CEf8Tw1O0tX9smsc77Ggr
 04Q0XCartABAVlfXne5rtr2l8Y1TsaPJFOCxs5ksRDX2J5Qgo9aovY5YWg5/mSCJKR07
 5PN5Aba5Ln26I3tZezRDhWW297FKKcoAJlIwS8J3UVrxlfznG3CPn9mkCDuupH/uRgIu
 W5B1DwbNbflrW8No6tnXFrmPw2wp8g5ATTsvV8VXjGOgl2Hbej8TSTCLVeOTxgkh6pE7
 NFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6vCGv/RyeVFnoEW9tIkNt/ZBPJkW6RlvdlpEDoVrknM=;
 fh=XnapBgugXetTQ40pEqjLeiCqUx3OEmLRGS0x5CtLrTM=;
 b=szRGjb8nZZNw2beXZitoWpoMu0umaM20z3wKiwMW/m+/rO777Z16JvTVikRLeysPTC
 KrAZsvcPjbY/40oZJgHScjiTvSZVFs+mIgvuE5P+d26NrSvxO3t10zronA1pvfySRgak
 zN+cNnquKcW8faQce1uDNT9XHCRshX9q9eOCoA6lYGXrrv2Ug+4XIfZ8wcPiuHT7htKT
 T0CK2m0gziNg+fycFojufCuPdNyfPy9NBR7/Td0s+3e2H3BJufXH+hFVk0qvrIoHLVvj
 SNbvxvjQ2cZ9bF8SY3B7JLell0wV7aBPz/JODIJQ+VjljoGtqOrDloOllM4sBmIU1zAd
 bV0g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784738671; x=1785343471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6vCGv/RyeVFnoEW9tIkNt/ZBPJkW6RlvdlpEDoVrknM=;
 b=cxxP+TRsZNEYoMoImEPnTeVew6g/0iA7Mq8Iw3ftRIATxSK8Fdtdlg04EmZTF26LdD
 4WeNKGPMpb9YyA0XpjWSDWz7Coh6o01x9uccCgt/Qk7UFIUUBgix4mixREeMVUlVH5Yp
 +gO8Zji646Xm5pUE2rx2aMFrEUvyDK+GySSTMKnNP8X7qHMGg84B2nAPTBIcEq3yuFcY
 mM3YG3GzOlEP85QOyukJwZu7ztxlwwHu4/iwmK9xDowaOERDsUDDya6hyABfZVbSt4Aw
 GHRoOArSaWVPWtv9LhaJJTSFReyWYMMIxDE+BFN7ND2/m0Gcog5QEHYtI+3EIjaaLF9U
 KlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784738671; x=1785343471;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6vCGv/RyeVFnoEW9tIkNt/ZBPJkW6RlvdlpEDoVrknM=;
 b=FumNcHCCl57Kv2DN8Stix2q3fDzoaQh+o0wxOoC6Lfxi9h5J780g9pRftMRqw2X54y
 vAahxP2+4ujEO3ZZfkUU3UvTP8KVw3Az0F/k6OaynVlQEWGFoYfbkBx5Wk9Rm5q8154P
 WCkGWs9oN5niEhH796oZil8xlV3JhNtjdyaT8ULKyx/ibaHt3WTSeDXWLE5nJ0snJ5BY
 V+yomiVkLah8IV2FV6ZdXCzDrCt53oDGCsY1Hh+tHBxnNXFbL2EdWXMp7NTyhh+VMBFI
 450roSHJ9zPlsT0Ta42v8mU1drO0mfOKAqfX30E15g4xXQZ7b4PoHJ3FDQEph1WRG7VH
 PbCw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+Rd/REwJvyuaPi69gcH9cHY33AuqyfLi1p4wJa61egOV2Q2rYC/u7lgOvxFRv4+c8+UE/veha3g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1sb3kDNGzLSvBpR1aCcXV2ADW+OCO4wtgtyxCS7v+1G5r/IM9
 7VtkRixX3Od/AtQX2LNkz377/vt+s40/sGxqVPxfP+ZzCw7vNwrYZ0S0phlYSadj5Ml68xg6FSn
 z1VNWSZWVOLOJ5N+zBYJP7GwJFWVIozU=
X-Gm-Gg: AR+sD10izty4WjWmHzl9nhMv3dQ7s4zobQBQMXXGASB7oQ/QPC5FuBoD/viKiwzSC6h
 O1uKVt8Hg8cXE87qtIotToQEBAWhY50yAovm2CaLdZ8r7dDCS13aJXs7bfx9OmaN5uX3mEq7xiz
 PzhgFaiiodus0H/X23XfXK95JyipfQ8gPfkvhALtdFbU6omldhoRCHtgZ6XfE/BxOhMJ1mFsqQE
 kbdgfnGpQ/K6IV0gwEj440VC7LizzmFMmK3hIRakcjCHTUMtnpzZAjSb5gN5GPZM8DVhacK+yJx
 cImw/i8T3yxIeMjIyPFukRgnpaw=
X-Received: by 2002:a53:a6d0:0:b0:667:e2e1:4c with SMTP id
 956f58d0204a3-6683bb03e7bmr4142068d50.2.1784738668720; 
 Wed, 22 Jul 2026 09:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260722154802.3760046-1-johnfoushee@gmail.com>
 <DS4PPFE901A304F30C76A6DDF48BDAAE920E3C12@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F30C76A6DDF48BDAAE920E3C12@DS4PPFE901A304F.namprd11.prod.outlook.com>
From: John Foushee <johnfoushee@gmail.com>
Date: Wed, 22 Jul 2026 09:44:16 -0700
X-Gm-Features: AUfX_mwNuDWTzYcYl8OndK4uZQVeNS7dreLBBMCpSlV4-VUHUR7Lah18YjNHuuI
Message-ID: <CAGsDCxQ30bUzMbzSigA-o55zX=vzyeP91g38ZDvzJftppp17uA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/backlight: allow hybrid pin-enable + AUX
 brightness panels
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 Jul 2026 14:08:16 +0000
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

> Hi John this fix has been already floated, reviewed and merged some days
> ago to drm-intel-next.
>
> https://patchwork.freedesktop.org/series/170522/

Thanks, glad it's fixed, and happy to see the same conclusion; please
disregard my patch.

For the record: independently root-caused and tested the same change on a
Google Pixel Slate (nocturne, Tianma Y156ZAN02.0: advertises
BRIGHTNESS_AUX_SET_CAP without AUX_ENABLE_CAP, ignores PWM for brightness,
and resets the AUX brightness register on every panel power cycle, so it
resumes from suspend to a permanently black screen without this fix). With
the equivalent change on 7.1.4 the panel's AUX brightness register is
restored across suspend/resume and full-range brightness control works,
so feel free to count that as a

Tested-by: John Foushee <johnfoushee@gmail.com>

for commit 7d594b24 on real affected hardware.

One question: the regression (ed8be780bdbc upstream / 102d44b3a8fa in
mainline) is present in the shipping 7.1.x stable series, but 7d594b24
doesn't carry Cc: stable. Will the Fixes: tag be enough for it to be picked
up for 7.1.x/7.2.x, or should it be nominated to stable explicitly?
Affected devices are unusable after any suspend without it, so a backport
would matter to users on current stable kernels.

Diagnosis details, DPCD dumps and EDID, if useful:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16679

Thanks,
John


On Wed, Jul 22, 2026 at 9:22=E2=80=AFAM Kandpal, Suraj <suraj.kandpal@intel=
.com> wrote:
>
>
> > Subject: [PATCH] drm/i915/backlight: allow hybrid pin-enable + AUX brig=
htness
> > panels
> >
> > Commit 102d44b3a8fa ("drm/i915/backlight: Fix VESA backlight possible c=
heck
> > condition") restricted the VESA backlight path to fully AUX-based panel=
s
> > (enable and adjustment both via AUX), on the grounds that the hybrid
> > configurations are not currently supported.
> >
> > The hybrid pin-enable + AUX-adjustment configuration is however already
> > handled: intel_dp_aux_vesa_enable_backlight() falls back to the PWM fun=
cs
> > for enable when info.aux_enable is unset, and
> > drm_edp_backlight_init() supports aux_set without aux_enable.
> >
> > At least one panel requires this configuration to work at all: the Tian=
ma
> > Y156ZAN02.0 in the Google Pixel Slate (nocturne) advertises
> > DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP but not
> > DP_EDP_BACKLIGHT_AUX_ENABLE_CAP (DP_EDP_GENERAL_CAP_1 =3D 0xfb,
> > DP_EDP_BACKLIGHT_ADJUSTMENT_CAP =3D 0xff). The panel ignores the PWM
> > pin for brightness adjustment, and resets its AUX brightness register
> > (DP_EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB) to 0 whenever panel power is
> > cycled. With the PWM backlight funcs selected, the panel comes back bla=
ck
> > after every suspend/resume or DPMS off/on cycle while all driver-visibl=
e state
> > (link training, PPS, PWM duty) looks healthy.
> > Firmware rewrites the register at boot, which masks the problem until t=
he first
> > runtime panel power cycle.
> >
> > Allow the hybrid configuration by requiring only AUX brightness adjustm=
ent
> > capability; backlight enable keeps using the pin/PWM path via the exist=
ing
> > fallback.
> >
> > Tested on the Google Pixel Slate (KBL-Y) on 7.1.4: i915 now selects the=
 VESA
> > AUX backlight interface, the panel's AUX brightness register is restore=
d across
> > suspend/resume, and brightness control works over the full range where =
it
> > previously had no effect.
> >
> > Fixes: 102d44b3a8fa ("drm/i915/backlight: Fix VESA backlight possible c=
heck
> > condition")
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16679
> > Cc: stable@vger.kernel.org
> > Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: John Foushee <johnfoushee@gmail.com>
>
> Hi John this fix has been already floated, reviewed and merged some days =
ago to drm-intel-next.
>
> https://patchwork.freedesktop.org/series/170522/
>
> Regards,
> Suraj Kandpal
>
> > ---
> >  .../gpu/drm/i915/display/intel_dp_aux_backlight.c    | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 7a6c07f..a5c03c3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -616,11 +616,15 @@ check_if_vesa_backlight_possible(struct intel_dp
> > *intel_dp)
> >       u8 bit_min, bit_max;
> >
> >       /*
> > -      * Since we only support Fully AUX Based VESA Backlight interface=
 make
> > sure
> > -      * backlight enable is possible via AUX along with backlight adju=
stment
> > +      * Brightness adjustment must be possible via AUX. Backlight *ena=
ble*
> > +      * may come either via AUX (DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> > or via the
> > +      * BL_ENABLE pin, which the VESA backlight code already supports =
by
> > +      * falling back to the PWM funcs for enable when aux_enable is no=
t set.
> > +      * Some panels (e.g. Tianma Y156ZAN02.0 in the Google Pixel Slate=
)
> > +      * support only that hybrid configuration and ignore the PWM pin =
for
> > +      * brightness adjustment.
> >        */
> > -     if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP
> > &&
> > -           intel_dp->edp_dpcd[2] &
> > DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> > +     if (!(intel_dp->edp_dpcd[2] &
> > +DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
> >               return false;
> >
> >       ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
> > --
> > 2.47.3
>


--=20

@foush
