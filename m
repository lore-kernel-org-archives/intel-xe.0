Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D074F5A8A5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 18:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C4B10E727;
	Mon, 20 Apr 2026 18:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bRjPIkEH";
	dkim-atps=neutral
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24910E036
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 12:18:11 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-953a5defbbdso363697241.1
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 05:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428290; cv=none;
 d=google.com; s=arc-20240605;
 b=BWpInZhs26jC5sTeqGcjLlQUpYYOy7KKHgkuGOb8On8HO+BUkWz64tQUoAZGapIwR5
 VFR9vfFlUZ+ErSgcGlkj5oFCGQcgLrhphWbmc6ho5TDotZAYRJzP8vagIf+33IMlXKqT
 vamunhGoo9BQg+HzHHPIR1tNQERO0AFzf7qV3KWXFOVONoQU+thIPgI88KjnSFGvEKRE
 Isz2OxTiFqVRCUJA0Aj93OlZnHxe+MqnsCzz0O0MXptYFpgsESl5dwofValZ6YHPoe2k
 OAlx3W0NXuKRU8Fx7iNpL/+3eKV2XwIzTtOwJr2sQPG8jGk2snWW/rbwXUGJzMz7vQ07
 BK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
 fh=a7Z0JC7Qlf6U1FF1EgOo/f5ceeAkBGd7RdCVrY/m794=;
 b=DEIp6sUAXN3O1NAJk1cmSp3EHUSknZz7+IuVLcMLre6qy5MfWZAOhEGPzNz3jTOUST
 ivI/nfjymKQTmX8K3/mCBqfwBR2nnukYlRauh22VVjwiaEVK6AyDR0ugB7a47PIH4ez+
 CT5VAZfMv5CDmpuL5INA8fqnRiOXiKeuApPnfAwUK0xSoEbS99OnzyzkHIfxJuI17wV1
 oI7gkR277x8H90T2t/qAXXrPg8hcM4Bcdf0bDbawUxUzbuVrwuTMSqi+YrMWguGRVBwg
 JT/z++h74Mvn70/XyZkxkKgWeQsP/85ELe6zov+qT72bfYgEeaj5P/STNdL4zomVO+8C
 IdDQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776428290; x=1777033090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
 b=bRjPIkEH3YZ6zkrUU0L0mCtsbhdFrJVBkeldrhNPs+m0yr4+QpHPn95+YAuGQQ04yL
 iodv7FtvR6Rv5Yt0ODWguCFw33fI9xk8/IEzw3mWn0f6N0yRb+fJv0hyC6GLZ2k1I9Ol
 93fGeDfWVegZoaIE45zD8tur3DkV8ck+gjzYTbYJSDH3EhhaJNndY72DDzZXlyKVtTd8
 UMEvRzz6CUYx0bOmLMvjmci8puDEjDy2wudHvYBHwCgMf1gub7mB910kpCA67xudVmaO
 xMFFUDARZFvbSSJublaHazTHjkbnnJtuA1R4YEnxmH6wYVCpnbYhkOT+t2/mISqFrgIR
 CsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776428290; x=1777033090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
 b=KECARXhy4c1NAY6gqHdsD914kARyxLNLVQvwj/k3g5yL4PCNI8tpg58nFVqSeJtsX/
 +6j3E1wrI5tcm6022tRfb/O3cyhqXCfKq2RfLmjHqJ6Gno9+M8dVhHtD8g4PiYXI7Ck9
 1tFSKopsMU3QnORfNik7bBiR1Lm6kq7w1aOpyw+/2zOPPkMnJqxAS24DyB3M8kOExPHr
 jiChArZEJTOVSf00eIc5IV33hCfs7+4R09pqKWbsvyt35Vz18NvpPPGdhV9GBLpX0ysF
 bMlY9g0tR8umjGaBJSTTD1BNu3X+1JPlCw0z0ebl6U3o+TpDInAbcng2PQOHVRVN+fYC
 MaaA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/pcLQGvVLfm1QeTUwwPFqn50tHEfthvYypCszdGaPNpi78xHZyr41iyLJrWblinr7KIUFcxS44bQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYlmENz0WSDIOd2GcPkxZL7MQE9BOX4zR1kmy+mevyYdi3/cMQ
 0JK4tRM2f4XTp12FyBIfqmEtJi0w0mY3ZiLFBSoWsgkDMUTu7q0/hBOanGjK86wMf2GKNFi92Kv
 Vx5yuQKUStFT/ezLvpuJWQDDWzG4A6Cg=
X-Gm-Gg: AeBDietcSZQ1Oee6VxEzSecPscsloMueC3416HZPh01ool4r7ShbyarOVpqEgsyJ63W
 INO0J7+3ho1gw4sEZBWh02XdTe52gKGlLBNz7fAK/eqQCSSvxBPrhfQrpSo/wON2H1qN65P+cLi
 Rxr5l3n4ENY0sMsIk4VyieReHHZXpEXzylct50qbqs8sK0aOaeQ+XSXH6EE72Zx1rlf/r5az+OM
 K/efZQ0bG3HY3gwi2sn58TvoQ37DOlS2YPYrGgncJSzngsLZkfjJgLM6Mxd3fYol0z9WQaPVMzw
 NuQTsAoW3iSOIXq9/w==
X-Received: by 2002:a67:e703:0:b0:602:afbc:ae78 with SMTP id
 ada2fe7eead31-616fb89ea6emr791230137.2.1776428289898; Fri, 17 Apr 2026
 05:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:17:26 +0800
X-Gm-Features: AQROBzDTVswzyUjJ6xkXYjkzbvzXgr8nk22CVU17PBSoxKtVUOrPnYmdya4d4B0
Message-ID: <CAH2e8h4rLZB3E8Rdwy_LtfwtwAKZCOgL18fRFVqGBx32Cm2N2Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 20 Apr 2026 18:05:33 +0000
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

On Thu, Apr 16, 2026 at 7:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

Best wishes,
Pengyu
