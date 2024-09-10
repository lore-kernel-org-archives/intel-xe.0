Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91790EE01EB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 22:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3186C10E930;
	Tue, 10 Sep 2024 22:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M8eU1/C1";
	dkim-atps=neutral
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD8010E0A1
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 22:58:16 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-718e482930bso2320932b3a.2
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726009093; x=1726613893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lpX6a2VZYI0Q3F5tVeOcgdqhZYYv8tYMbEYQg5NYqLQ=;
 b=M8eU1/C1SzYNrlvR0nPWwrLPZ8PoYo2yS776siaP3bJj0KHYUTgGCEWUIqnSegr+pD
 fs3XU9icJKRNHqeX3Td7hY93cCS5oFPyzyHnb53f2myP+cujU+h+PF4DGk/iPbzbjiiz
 Z2yu1KRvv1GF4+KB8BX+Iz/EzaMqkTF9UB0vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726009093; x=1726613893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lpX6a2VZYI0Q3F5tVeOcgdqhZYYv8tYMbEYQg5NYqLQ=;
 b=CK+73hDEOQBiYmL5J0HthAbSo4UJr219gIHYvQTWVV/enNpoeR2UO418ffcs3eZIvl
 xyVK0ujnAsHFpRBrr/6eAnlg0pRHkYF1R2lYP5hG4C/kG8ujJHGNC3AIIRPK9y7uWIIG
 QEnFe6f9GfjlDKGYVVS5xT/Dw2cthJ2LZVai6fKKZpkEV+bnH2fBrxkfrqUPXrOJHik6
 3Hw+7+RyozDMBaXxMJuu4BXuLc3lPXcXTsQZdUfHcVpGCo0J+Qjq3R0PXFjqb3xBrPcU
 fxBgRzp6gbumj1V+2nAgk+9HjMA2ZawA7PXmB6KJf5iqMHhM2lME7NbbJ7P4jhw7M7sU
 MAEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzAqNcZVovplK35/JInyDTcWm/W0xccdbBhJlFf1K3mHDn5sS+xjBjyIVO1Kj+IGw3z6MNM+xYig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwldeVqD67nIzrzXuD4YXdWT6M38ApEPZ0g9Fmw5p+ydzpRb/JO
 OuMOqRHuSxBs9+5AxwGiA9uidwAJoOmdmiSazuSOcyr9xcnh1h0Xum6kUs2TLQ9HAD7CHOzF4JM
 =
X-Google-Smtp-Source: AGHT+IHsJA9qAH/vD4OnLTItLoVXVTVewzFkgWkSMbE3lpQiESvnvQxiEtSnIzSTpqH8jUTYUZnIEw==
X-Received: by 2002:a05:6a21:a4c1:b0:1cf:2d62:8584 with SMTP id
 adf61e73a8af0-1cf5e072e5dmr3093573637.11.1726009093271; 
 Tue, 10 Sep 2024 15:58:13 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com.
 [209.85.214.177]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d823cf2f1fsm5230344a12.25.2024.09.10.15.58.12
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 15:58:12 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2059204f448so51122655ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 15:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+BihvRh8zf50pO5zzp8hzkc9QvSBtB+oq2utMkkTGd9xFfH1LNan5w58dcfDoz5/MhCco78E0cA==@lists.freedesktop.org
X-Received: by 2002:a17:902:c94b:b0:205:8b9e:964b with SMTP id
 d9443c01a7336-2074c6ae1b8mr29905655ad.39.1726009091533; Tue, 10 Sep 2024
 15:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com>
 <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 15:57:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
Message-ID: <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
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

On Tue, Sep 10, 2024 at 3:04=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Building with clang, W=3D1, CONFIG_PM=3Dn and CONFIG_OF_GPIO=3Dn leads to
> warning about unused ti_sn_pwm_pin_request() and
> ti_sn_pwm_pin_release(). Fix by annotating them with __maybe_unused.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm happy to land this in drm-misc-next unless there are any extra
dependencies. Let me know. In some sense I guess this could even be
considered a "Fix", though I guess given the history of the compiler
options that might be a bit of a stretch.

-Doug
