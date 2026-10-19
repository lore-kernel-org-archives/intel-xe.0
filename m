Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5D3CCF2E4
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C7E10EC51;
	Mon, 19 Oct 2026 11:42:23 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CEE10E582
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 11:04:10 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-8446af403b5so937239a34.2
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 04:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407850; cv=none;
 d=google.com; s=arc-20260327;
 b=foypLEh4WFZbZD3/MFc0MbNRFSLp4PobpV3k8dHX2GE47hzpcxkt2uezlTrCLjeK8+
 i/JF+SB/6TePbs7+SYfMY0IkX/PG9iXcVI4QoYYdgpzqVyjOWiswseGUlaT5u4ECTWse
 y+gB0UWTcK9qh4PIKMMFiZ7uUmNEfY2ROwXHr4W+eCjIfHpSJXAY/q4KiX38gfmX3vEM
 Z9JaftGUK1okRxBGZKu9MyzuPQE292t31uM/7tu/QPm2mTmEvys8YcRm6jdwwGH9ya47
 aBPrfRNHC9JcQTxt5pAmbjyx0VGi5QZVh/RankFGsHo6KFE2Zt0hGLwYVVUGxfZovET5
 GXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
 fh=VL2HOzM1ezXWpPdazw0V2LH9UM8Jb7sHcE0Moi8ue08=;
 b=GJhSY79ad7fTpYEBGgw968DR/bmlRJ6mw7T0K5F87jB4ZEGD88WImcTAT7ybonmOEK
 Zlj2zXaLq8zXC2Xd/Dv6uhgjoclQWFB/aQk9sqhDYSE2YJgtCqgedEuyoClvEV7r7VvU
 2fgc+/Hm/FYE1V3is/rr1eOfc5zNqiT9ehMEVf1Vdvf6tGrDBTDriZO8X6cZ5Nl0hmBF
 8SeCMtiMym0I7ES0ZDzQG+vu/jmfTEfeai7c7B5k6vWYuzM9mfKc6NqMjugL//uY351Z
 vWr/NAP/KBvrkv/d1yNzApTMSDrcLPWnPa9vohf8HyKanmYI4MOoYpRxiajUOKNEyvlI
 ju3A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792407850; x=1793012650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
 b=GYXb1IoLlVASGqdbM168SG8nht6qafUj/TZK3DNe5SlBWXvQgWxen6sd5zAmXtC9P2
 hegWuooftETZeOyRD0+qqk+fDzxpv0yCLmBcU7x4g/Gn+k/CeTjKPjhHoT43BHfqi/tc
 nhM+79AgTpAbJ6XC2OJRkKEbISuTMzre6lyAmkVZ9bIv+5xO+r4l+s0oyKsyVuAcp3MJ
 qKHB69mL9yH+JMcPYURh4dANqb4FbQo4Ovg/tql7Nunl+ugpGEgBL5mCzy2JfZo68nG+
 2lCoFTAe02smDSQHCp+G6piC0rV1cLHZ/+PRlQobjG5tR1C8Vi7VG11YmfvACp77iNKu
 MqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792407850; x=1793012650;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2RjmAJkJaRfKW8CM604T3xdOE/8FYHsXLHXgCKfQYGM=;
 b=xNmOpUMfj5C7r163312sPZ6EXTdkRdmnnUS0f42tXJsNBliJsganlG96slcsXdczdn
 1J5JPIERIpPM+NLPk67zAvfzhYCgf0voF/xADMd4/26kfFsc82Zqt+aGqs7m4YYhi8AN
 jqiy0VArfh0LBaYevc76KNpmoQd0K71F9n9ZxKeqgmGaLmk0lky+aM1QGmMI92KPMbh8
 HsSkyqgjC2UrN0uvtEsf224r8/zuzrVjleWeWyWMInIN62d3UqxSeXjXjnxySfyHS9LQ
 95tPPjxlzfIo+WEbDuNAqXYBtxCTp3B39YhSGQff9v0TVLUQYCSeYhFT7ZSnQLcYf8mK
 wnyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBysfVYO9P3JsTfwXCTs43DeG9KuHTOVJ4PTHzYTcsyH71zIAH33VHiUFm2xo7wBlnDh11lj+yxL2w==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK+Ict0F0/LkiH3R0CLgoLQUUrYRSGxjXSJEEKL0V63I2EFIEvt
 kZHw4R+3XQk6maL0UZT0PE+iRsZqHlHYNfV4bSqo5GdG4emT0DnUGJ92jzhabm2gLiMN2hYQcqK
 M4Nimt42RjTKw3abt+eEcKrU60817fVA=
X-Gm-Gg: AYBFou0D2Wac3/DXlSimCkum+LgGZRjCXTTMNobZG3mOSsIQThZ5fkQDN5XEYkmePsS
 AGDPSBhxdEMGa7HLGT31I6z0Q06czXNw2O1ZraAfzfyAjIoGHCpOfxqwTCCBQH8B/OfuooLNBXx
 ++hnh70h+lde9JwirdFP7W6aqJ9c31GzpETposAz0RLGWmFX37iQWa/R/Iqm0CtGn7LEmmyFcwA
 UAdSFjVMIfgi0HFtbboVQejzGe9ai5LnkTl7AKKJTJl+osjzhkgEPHlu1kBIpRBHyGrl6MuxB2F
 lOtx7Z/p+bLw7Di1+FcQq84h1e2yxt/K1qOswXFxjEwh6FS6MaYX7lFhRvMsAWNlbhhfD+u8pYA
 C/78D1kO062/4e8EdDAXcqiWTmDi1wt7HQQv721Kj
X-Received: by 2002:a05:6808:3509:b0:53a:6769:c35b with SMTP id
 5614622812f47-53ccaf1f442mr5332468b6e.12.1792407849778; Mon, 19 Oct 2026
 04:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261018-vlv-dsi-owned-gpios-v1-1-3ca18bcda670@gmail.com>
 <atXp2NSPKZUPj8sq@ashevche-desk.local>
In-Reply-To: <atXp2NSPKZUPj8sq@ashevche-desk.local>
From: Michael Anderson <mwwa919@gmail.com>
Date: Mon, 19 Oct 2026 07:03:57 -0400
X-Gm-Features: AclHuK8biEMfZ_1GVer949iI38PfSha8JvD86j9Plx2_choI2YB3QRBY5aZp0yo
Message-ID: <CAL-Wm=O-Gr3CuvCn8iSQceQMhu=LGFz0SPhmWeFL=RiVnoprdw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dsi: Use owned panel/backlight GPIOs in VLV MIPI
 sequences
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:42:17 +0000
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

Thanks for looking at this. I'd like to make sure I understand before
doing a v2.

Here both users of pin 10 are i915 itself: intel_dsi_vbt_gpio_init()
takes it as the "backlight" enable GPIO (soc_panel_gpio_table,
PPS_BLC_SOC), and the VBT MIPI sequences on this tablet then toggle the
same pin as the panel reset (low in ASSERT_RESET, high-low-high in
DEASSERT_RESET). Do you mean describing pin 10 with a software-node
"reset-gpios" reference and having both paths go through
reset_control_*(), or something else?

One concern: the VBT drives explicit pulses on the pin, and shared reset
controls are refcounted, so a pulse from one path wouldn't reach the line
while the other holds it deasserted. Would an exclusive reset obtained
once by i915 and used by both paths work instead, or am I missing how
reset-gpio handles this?

Thanks,
Mike


On Mon, Oct 19, 2026 at 5:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 18, 2026 at 04:12:40PM -0400, Mike Anderson via B4 Relay wrot=
e:
>
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
>
> Ah, nice, this should be solved via using reset-gpio, which is exactly fi=
xed
> for the reset shared lines case.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Michael Anderson
