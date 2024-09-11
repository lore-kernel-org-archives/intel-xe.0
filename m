Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E92EE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5AC10EA82;
	Wed, 11 Sep 2024 20:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FWmKulFv";
	dkim-atps=neutral
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8392E10E9EB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:08:00 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6c548eb3354so1360096d6.2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726085278; x=1726690078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UenxOqMB8aSc4sONnJe1Vz69L/1xBEXPOvkJcAvqc4=;
 b=FWmKulFvIRkv1A06cAhP+u+gkok19jH7tcjGM6jiUXm+V2II+T7xWh1akKxMZuRFB4
 HQ4l2d9LDF3w6I07yVou/+kSOAR5sNISklW/XYr3Gt8+RIa9oP+tvED2rATCYV6AAiy3
 ZRBqhrHwJk81+XEJdnAaZ1cuql1OpLcHTsRsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726085278; x=1726690078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UenxOqMB8aSc4sONnJe1Vz69L/1xBEXPOvkJcAvqc4=;
 b=BFGeRpyJVsRUns3Cx25ow3/6gkLYrdcdmq0xsZfnWViQQpVCHD/ESbxC6K01jezw0k
 KJFDr85xAFrg+l7+Q3hIEEBuQ8dTvpw3D9+Oki/utijis/sGSY4I3Tr+ToWfnFNY5WjK
 ZQMZHdGBphbGYRWrq91Bz+wxtALMetpJEvSe5nrWrrLHa6YYW8KWzpiDSXVMMp9KhZIr
 7LIH1M2PhQyHRniM8S/nMAn688aRnA6asRc+dGijxQX5TSls/sfXYWcyvfEcLp7wmgjw
 UuP7btn6Xp0LT12DQlXx0QySwcPKELI4Bux6zEfiiS9Ke0k2bez6m4khSTGDIPCGLQyr
 gnVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVArtDk7YerBaSEWZG+hKJcsY60Lot6dDGAwIdJfeWOmR+zoyidEy1lhE27KCrL1n2L7p0xykodug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0RSmRNPfsNzt73pLqWh1OWoYuXM2A1rwqHf58tPdD2973cUI1
 wZqL78o85rauJpd8Ig+TRNjkoGj7aXz0lIBytTHWZGJPYttZqZNlosCUYBEEo03VfDvjmmlkasg
 =
X-Google-Smtp-Source: AGHT+IEh1AHsPQfgCPG8dxSfnL2mdAdJr3FDfmXKwwqr7dezOcJu8W0bQzVxLrs4qHqiSujyLRmclQ==
X-Received: by 2002:a05:6214:2b90:b0:6c5:112e:4e32 with SMTP id
 6a1803df08f44-6c57355a223mr5982556d6.19.1726085278414; 
 Wed, 11 Sep 2024 13:07:58 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
 [209.85.219.53]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5347749b7sm45570536d6.125.2024.09.11.13.07.57
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 13:07:57 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6c351809a80so1198106d6.1
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 13:07:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfsu73HaIDAi8+j3IepRfdfhw/ZzlkMv3lrY7+zkvGarpdpcFUf6axbC46h/CWRSt/aVKyPiFL/Q==@lists.freedesktop.org
X-Received: by 2002:a05:6214:5984:b0:6c3:5dcf:bf5a with SMTP id
 6a1803df08f44-6c5735940b9mr13497026d6.37.1726085276966; Wed, 11 Sep 2024
 13:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com>
 <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
 <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
 <87h6amk49e.fsf@intel.com>
In-Reply-To: <87h6amk49e.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Sep 2024 13:07:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vi58YipOuyy9uhU=ps=tUW8h33znpjfJW9VigJ-b8nHA@mail.gmail.com>
Message-ID: <CAD=FV=Vi58YipOuyy9uhU=ps=tUW8h33znpjfJW9VigJ-b8nHA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: ti-sn65dsi86: annotate
 ti_sn_pwm_pin_{request, release} with __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
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

Hi,

On Wed, Sep 11, 2024 at 1:02=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Tue, 10 Sep 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Tue, Sep 10, 2024 at 3:04=E2=80=AFAM Jani Nikula <jani.nikula@intel.=
com> wrote:
> >>
> >> Building with clang, W=3D1, CONFIG_PM=3Dn and CONFIG_OF_GPIO=3Dn leads=
 to
> >> warning about unused ti_sn_pwm_pin_request() and
> >> ti_sn_pwm_pin_release(). Fix by annotating them with __maybe_unused.
> >>
> >> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused stat=
ic
> >> inline functions for W=3D1 build").
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >>
> >> Cc: Douglas Anderson <dianders@chromium.org>
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Nathan Chancellor <nathan@kernel.org>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'm happy to land this in drm-misc-next unless there are any extra
> > dependencies. Let me know. In some sense I guess this could even be
> > considered a "Fix", though I guess given the history of the compiler
> > options that might be a bit of a stretch.
>
> drm-misc-next is fine. Agree on not considering this a fix.

It's only been on the list a day but it's simple so I just landed it
to drm-misc-next:

[4/8] drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request,
release} with __maybe_unused
      commit: 868cd000c19f77e4c25ce87c47b6f951facf4394
