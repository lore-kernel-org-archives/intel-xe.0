Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D73ACD6E41
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 07:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A0D10E752;
	Wed, 27 May 2026 07:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="opMpjJBI";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DC710E73B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 07:24:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bd2d8bb1068so2112836366b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866678; cv=none;
 d=google.com; s=arc-20240605;
 b=GVh7mcjelVG//BXFGYwfBYenrT6ASku4EsXig5p9upNcz6GLEJmdLjXiiwWvjHvqij
 CASoC/iJo8FlCH7Vuf7Vm954TOs/7dYAsXV3Xlnf4IrB6WgS/aj5G7cHzZ2E/KsCeiGL
 JwP4sw7YVab0feL18LRr7vgowp1szv2sIuhryxSJUUWz7+nA2BQjSuyH/t1pdArbR2jo
 glgQ+QBi6FyGClz00DjKeoYpCqiEyjMywPNvIBJa8syE+9zTp879AASlWB6SNRwRe7SQ
 XosZxahUO45hV9oE7h8mcv3645sSBMjRkjQsDjBmVbWtP7kMhVesJ6ds4v0uCXVaqONG
 wapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=;
 fh=lsZak5QWXRp6JrQ+WlGnYtO1EJDsfOW6VO/cUomLiLI=;
 b=If5jraqgOawS/H1XylbacoOYihIwQVvCaqEujmjlmAQeW+CWMrUQobO9JZfzt6OKPi
 7ikh5CiLqfmbn6Ybhhp+RcPlWfZqNSXDT+dKs3WWhCD/XaHBLxniUFCsjBS8IOGv3jO5
 GOpXSGQjZvyU/P970tjqVADB3FR1xDvMYBUEx0JIPECR7ZPmCn8QnUrI6nM73ckPsm8w
 AlBmgwFQzRAE6IEgvXZHGKxqQdWTEKk+VAIN0uUvpJUXGayV7mf3y372mWEJjwYPOwIS
 KWwwVrr5CN9HHdk4Q6MKKOAgGb5stfCBxGyxaI4U+dgYrPRTfsHzbLvoqpiQI1wa1A0Q
 ADNQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779866678; x=1780471478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=;
 b=opMpjJBIp94sBx+B7qOKCQXMseZvkP5Pktlj5O08sH7quEDmj7XXL5YeRvkRdDPNsw
 5T0t8DKFcF/qjKRGYs5PebHdmyoC47xEPDT91CPWkSggg3RzJeZks3x4MblZcFbVSl4y
 V3WzTcxgRsJ6tg6JivMoX4HUt/gt4RZccq4Q2xfchW9k9oQGq4JUTfvnSCtjv2KJNR4d
 VUXVLrk2V6Jd7CyDx598hwq/D2zftt9c9KnbazLEoyafIYI0a/q2icOixw1m3WZRMY6i
 MZ1aNJoCZcH2RRHHOBKVWkwHC7qM66PAg+8Kk/dDx0Kcpk8dOfmk8jbsS7yFvieJAc5P
 yuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779866678; x=1780471478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=;
 b=Luglslf9JR+YeOxQcZtt+hbrD7WXDzRlO16IRHh7giCUDCntdBsWiED2Tk55Y7mPPi
 hejkGBGKkjFczeQnVJKNT/XkTS7oFc4Nr+QJ24PG8BMxhUZvn+VM2dCVbbh9GmlgCT1o
 s5mNbvlWteejBRFWsbGiPMG+WSuw9HFdgNJ0h/d7WjIsO6MUUYGmo+aYGipaaEszHqOD
 JKTZKlon7hbjvbBAmqok6wDopkFTvborzNOs1pWpfStkf1qmoxDurmzJ0rCFK6sBzB0J
 lMpb+9fm2v3jfy+sBfQ78sEOKxxda/nf89ugAIYK0dE6soz3WH9MV2t9/J6cu7ZYiAYx
 b6eg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/w8mKit2uEgeEM+itqdafea6qktbYpq8PRYTSxoIX7E0lnKgm/ABcHlDvyurwbcDGssRW21m3hvg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywny+uRJEiRHDsGCnJbX0N0jJBh/LVRtEx8YBIJqNLCDbtjavj6
 xr9qJrKTyOaHc5sxnSn50YYlGuVf4zBg9H2KXgUuDmkdktvrXBeuISnLtAYn+DyisUNl3fimJLH
 ihrt8hZCCriKcSf98/ICtLUfMe6jtXCEFr2fgIm/9
X-Gm-Gg: Acq92OFCAA9g3ClAvLjZLJIUkcdMc552+XWG1Mj+xPvD5YTe1ajD5FhlZ/g7cpiQrv6
 Q2438NvMO5TILl8d86HIcfcN/16sBOj+j9aJWy0FyCYrjeI1grK9voe8wySXxoY+f3OwNRsCrJ9
 lsvD4x4sgnnuBNDJVgtC7242yH93v4+olLIVTdrimw9mq78n12aLmjuT9nuuYKIYFUadFhh7EfK
 NxjarRMd23eR6+gmfMen5Y8KWHclnbsJ+5VRMGzaA3794olazL47R9bfWb3SiqYDVCC6Y5EZAuY
 Q3oaqHxOKfZspnUxoeNocKU6SmSvo5ma9R2KL4QSZvDZd/T6+mtDm+nJDGEncO78r4eYK3C3Zcp
 uESkKv7btt23Si/7o
X-Received: by 2002:a17:907:b59a:b0:bd3:893c:c44f with SMTP id
 a640c23a62f3a-bdd25fd111amr982141566b.19.1779866677452; Wed, 27 May 2026
 00:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <adgNxaFhbQaxC5E_@intel.com>
 <u4ononk4cpccx77gvlywtfen5rmyslvr72v7olkhdrjf65aqce@xo777vofhcan>
 <20260413141000.0e190dcc@kmaincent-XPS-13-7390>
 <3698b69f20481ff9c6fb1002b46f9862a1fdd03d@intel.com>
In-Reply-To: <3698b69f20481ff9c6fb1002b46f9862a1fdd03d@intel.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 27 May 2026 00:24:25 -0700
X-Gm-Features: AVHnY4JySRBm-2P_CbFmaw_WGo2zCHSC-tgnDBB7us3VQxRDYsfxZLlA23v6OE0
Message-ID: <CAMNLLoQmwW-QkuiSyageGWBeuUDUVZWmWyXRD-vkAGZbg1kTzw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] Add support for DisplayPort link training
 information report
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

Thank you Jani and Ville and others for your feedback on this approach.
I think adding the current negotiated link rate , lane count and DSC
status as part of a connector property is a great
way to standardize this instead of every driver adding a debugfs for
this same information.

Please find my comments for why OS would use this information as below:


On Mon, Apr 13, 2026 at 6:30=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Mon, 13 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> > On Fri, 10 Apr 2026 00:36:09 +0300
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> >> On Thu, Apr 09, 2026 at 11:36:21PM +0300, Ville Syrj=C3=A4l=C3=A4 wrot=
e:
> >> > On Thu, Apr 09, 2026 at 07:08:16PM +0200, Kory Maincent wrote:
> >> > > DisplayPort link training negotiates the physical-layer parameters=
 needed
> >> > > for a reliable connection: lane count, link rate, voltage swing,
> >> > > pre-emphasis, and optionally Display Stream Compression (DSC). Cur=
rently,
> >> > > each driver exposes this state in its own way, often through
> >> > > driver-specific debugfs entries, with no standard interface for us=
erspace
> >> > > diagnostic and monitoring tools.
> >> > >
> >> > > This series introduces a generic, DRM-managed framework for exposi=
ng DP
> >> > > link training state as standard connector properties, modeled afte=
r the
> >> > > existing HDMI helper drmm_connector_hdmi_init().
> >> > >
> >> > > The new drmm_connector_dp_init() helper initializes a DP connector=
 and
> >> > > registers the following connector properties to expose the negotia=
ted link
> >> > > state to userspace:
> >> > >
> >> > > - num_lanes:      negotiated lane count (1, 2 or 4)
> >> > > - link_rate:      negotiated link rate
> >> > > - dsc_en:         whether Display Stream Compression is active
> >> > > - voltage_swingN: per-lane voltage swing level (lanes 0-3)
> >> > > - pre_emphasisN:  per-lane pre-emphasis level (lanes 0-3)
> >> >
> >> > I don't see why any real userspace would be interested in those (apa=
rt
> >> > from maybe DSC). If this is just for diagnostics and whatnot then I
> >> > think sysfs/debugfs could be a better fit.
> >>
> >> I'd agree here. Please consider implementing it as a debugfs interface=
,
> >> possibly reusing the Intel's format.
> >
> > Sorry, I completely forgot to include a paragraph explaining the ration=
ale
> > behind using DRM properties.
> >
> > This DisplayPort link information report was requested by OSes to allow=
 them to
> > assess the capabilities of each DisplayPort connector on the system, an=
d to
> > guide users from the most to least capable ones. It will also enable th=
e OS to
> > warn the user when a cable is too long or experiencing noise (indicated=
 by high
> > voltage swing and pre-emphasis levels).
>
> The selection of the number of lanes or link rate are at the discretion
> of the driver, or link policy manager in DP spec terms. It does not
> really convey the capabilities of the *connectors* but rather the
> current *link*. Ditto for enabling DSC.

I agree that it would be up to each driver to have a policy
on choosing link rate/lane count and when to enable DSC and then if it fail=
s
fallback to lower link rate/lane count as per the VESA spec.

Currently this information is only available through a debugfs and not stan=
dard
across the drivers. However adding it as part of the connector property wou=
ld
be useful for the userspace, such as DRM HWC to use this information along
with the link status property to understand the reason for reduced
resolutions/modes
exposed to userspace.  This can be used to provide better diagnostics and u=
seful
information up to the end user.
DSC being enabled or not or what was the final negotiated link rate
and lane count
could be used to take smarter mode configuration handling choices in
the usersapce
For example for MST, if usersapce can know the negotiated link parameters
usersapce can be smarter in choosing resolutions on each of the downstream =
sinks
based on the total link bandwidth between source and the hub.

At the end it just helps the OSs to provide better control to the user
in certain scenarios.
I agree that Voltage swing and pre emphasis values can be removed and we
can focus on adding property for link rate, lane count and dsc info
like enabled/disabled, compressed bpp etc.

Regards
Manasi



>
> I don't think the voltage swing and pre-emphasis are really diagnostic
> measures either, but a response to measuring and adapting to the
> link. And if the link training failed, the driver may have already
> reduced the number of lanes and link rate to compensate. So you could
> appear to have the perfect link only because it was so bad at high link
> rate that it was reduced already.
>
> The policies may also vary from driver to driver, and possibly depending
> on what makes sense for the hardware (e.g. power consumption with or
> without DSC).
>
> I think "link information report ... requested by OSs" is vague, and I
> don't think the concept has been completely thought through. I can't see
> how you could present reliable and actionable information to the user
> with what the patch at hand provides. Or how it could work in a generic
> manner across drivers.
>
> Overall sounds like an XY problem [1]. We should focus on what you're
> trying to achieve first, in userspace, and only then think about what
> the appropriate kernel mechanism should be.
>
> I don't think this is it.
>
>
> BR,
> Jani.
>
>
> [1] https://en.wikipedia.org/wiki/XY_problem
>
>
> >
> > Since this is information that OSes will consume on a regular basis, ex=
posing
> > it directly as DRM properties seems the most appropriate approach.
>
>
>
>
>
> --
> Jani Nikula, Intel
