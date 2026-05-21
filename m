Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F449CD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F357210F337;
	Thu, 21 May 2026 14:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="B0KS206S";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0A010E528
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:13:11 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-83975e992e1so2425686b3a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372791; cv=none;
 d=google.com; s=arc-20240605;
 b=ZzWurf67UdnpiNg7TsWLIxA48YaVzlNdp4W5dXR+QTfnRr1l8/bbMOVO7h/xN2xJbx
 1oTetDiHmvOqK1bA71cgNA1RXxarW7UiPpynz64F1vRok1UQciSz8GK9IBuscpDtjEf9
 HYK/cTgVxC8SubOjgzv1696j/AuXx/uqIEzq1oZDtDduyApmI+A2g66STYdPrCz/W/EA
 3Xkxt7/PH/JUuV2GGbIAwnuJXn4uwBw8WLg3qbGaahHMRF5/nfh17JkQdHvOFJc6IG34
 LKyXnlUXdTba9lndtqOQR85wuZ9EZBY5ueDNzFPe0iC4HjzDQ8p/dYYsKw84hL+pwE44
 ZSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
 fh=epuwCHiPRQD0e4zjjmtnyB0Y2znxcClajCQNwxI0Dpg=;
 b=EvnADqL/jKYNI6yOo7HHuUnsNcnK6ODtU2s/chdBGEf7EnQPeZ8cw8CC7cki6emU1U
 Urn9tcFA9cXpHV5Wb1gAgi2ru39WOMyG1t9hti2P2oIJJz0+/4qQMH7ND1FtHh6/f4Vc
 92xWZH7UwHEPzXH1R1AEY6lDp/6sFxD9ZKWDoMe3jBfpHSy6NVajVb8LXZGcX7h+k0sc
 1eCpefelD7YnHmrMVJ6K3Y6sZKeXMgG277Ew1UlgL3b1vhYC95mIp2aD7n4HgWYUGW9t
 JG4rFii00OkCkzXzffiseTAV9COgnox0vuiGB0FnUII+t8UjjtUuZuRtE6QAi626AG58
 7kAg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1779372791; x=1779977591;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
 b=B0KS206SJCDMlPBj3enN0FsCW+bO+4qoyBjEbW/roKfA8sJwk/nfyATTMyS+9k1Bsc
 F+j7F9k2ubY32CFqKo+cXnsazki1e1I0ster1uIDj8Kyy4sHYuZuBlDMrUX6BCpQIuSW
 Pgb5txZ6LQ53Be20KEG+ZVZN8Uf6ptBqiZqDxwOGJcu8JMOHGhkvpqFT/FA2jmj0+IHM
 OYywnIpcZYYvDnk7z367KV+anBeBUnuGIVtvFj/8dUDCFqBEwaqhHo1JrWYKDpECAt0K
 z14Hb9qOlw8IkC1saAzEr01e/V8QRYPio5xwP/XNk6oko3d7OY1/B5Baj6BS6QwTnLLk
 6zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779372791; x=1779977591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
 b=sUlxEyk88MzhKouTry4HtbM5WlDr/dh4nxyBdOCkpW4UZ7ywW7IzITegd5HdK5zkQX
 GGqD9wiPP9QRiNPUyVKmJLiwtpekMOYx5KrGOLQCReiY6nhKBXNitTu36Pu8NgepqzJd
 B2uQBjX6/hCEJdBWJNnJAQ2KbsTcgSHor2PnoJCdTVaT7clYKNUyJapRPuapSdZQPA4G
 W5IGQM04x3uakqhSHRlyIQiZXOJ08k/iv1+EaRGAEHzxQnCX1ilLLEGeTR2prW0HDF4G
 CZkd0PMZpY+HGOF7WyW9fMtnqFVCqwdoMA9abgxRhGHvat9litOfn7AwZ8KhmcWx+jUk
 1/Og==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0WS54OuQw1OTTyJ4oDspGhrieFe29ZEk5hGaBIA5K5AhXcUs8EuatYEC2eRKaiSvLUQSQJhu3yg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKT30Vz2sKipl9rNIY4MWnhB8nyGtlumg9dYtJ3GxK2UM3wBHF
 v0HCsz9yMPb5/KQtEwN5a0k6GaV9Tn1BiqzNKHz+vHdOH2jGqgP/4dAU2LW5su+QVP0OKNQFix6
 KVdFY32cvJ17Jw0WA+Iu0rTkP0vrPuZyqZAiIEWnEBw==
X-Gm-Gg: Acq92OHraQHdyt/8uK/+eV/vXjKLcAbr7Ma2LOIAskSlIcNIlx/AcG1VEwyTg8V4SUy
 h7Sgscb4vOEP8Ii6x6UMa7ixJtLC4UTrttGnIy9pUSmlVfX2x9R4fvTby6ONlkHP4oSmWkMVHw3
 bU2GEaH/+meWuv5LWAyDikDKxH7G8DPQrJYFoSp93xcAPlDoizY3Y3Drw8PItkYQW6Sd7pq5iK9
 nnZTZmE8RXZ5MJkjR6EvHasaz8oG6XxPqCsOS1/7h/ZhuucYNJi0AyDLi/4fV1cieUp+vEQaKfv
 NmUdRJQPDy+RReE68Gb1SJmA/PjOA3Kt7Pj05us=
X-Received: by 2002:a05:6a00:170c:b0:83f:2568:d45f with SMTP id
 d2e1a72fcca58-8414ae0067emr3410992b3a.23.1779372790773; Thu, 21 May 2026
 07:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-3-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-3-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:12:59 +0100
X-Gm-Features: AVHnY4IhuE52xfR4O7ZsBvGU9UxEW_nGPaKeUuOJKbLW6yd-ftNZQIcte9EpFTU
Message-ID: <CAPj87rOgkSAhVzzHyuKEGPxVYeDhJKLGVNrBA2BkG00gvMJjYQ@mail.gmail.com>
Subject: Re: [PATCH v14 03/28] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 23 Apr 2026 at 20:04, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> +       } else if (property == connector->color_format_property) {
> +               if (val > INT_MAX || !drm_connector_color_format_valid(val)) {
> +                       drm_dbg_atomic(connector->dev,
> +                                      "[CONNECTOR:%d:%s] unknown color format %llu\n",
> +                                      connector->base.id, connector->name, val);
> +                       return -EINVAL;
> +               }

Shouldn't this already be ensured by drm_property_change_valid_get()?

Cheers,
Daniel
