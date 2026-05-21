Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4791ACD5BB4
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57D410F372;
	Thu, 21 May 2026 14:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="X4Cm0eRa";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612F110F371
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:53:53 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3665b67ed66so4023745a91.1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 07:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779375233; cv=none;
 d=google.com; s=arc-20240605;
 b=Nu2kEezA8JUgbxyXEtblqdco3blmxWK/gDkbVUdzjLonaOi8V8W//r1K96FiESVWFa
 8dUo3kfsA+q0AYrGLYDj/LrgI7Vzde2pZzenDsyDlF2QJDVJizDhmAjxlgQyIiz1dK6c
 gStnB9ccL3nOQIqH3JwPRL6mQxazwMSw+XkJ85Yfzp2bTK+iPj8NU1s9LKNTe73S1KUP
 g1p8p/EJA/VOvzfzkwTrheVYvswHuipM8EfKBmXwCMPDg5geXtD3zowBhTh7b6IKbBpe
 19ojdj1lfoqchJIrxfcdVqK+RqlXd9eAqXLW2W7M96DN7nfEeCnXGg1d1DS+z7uITeWM
 +U9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
 fh=XfnlDNdHGmAwwGtrDiZPaeY8dASGZQHuAliILkFWBS0=;
 b=HbIuk55BsJnHXgsQY90SxEW3KAtNE4RGThAlb1OAx475kujGe/RGBc1T3lsY9NXnWz
 AGtx9LULjNXlPGgQUlFOlYexA5t4u38yP6c3G0PF0a4Tm2tgsDz5YZeckXYVQWroZx7g
 vKB6JTqz7Reb5dtPIHnhtdsgd4Kd1nFjt7u1+g75HySQl0RI6tXOMWu2RyA+bW/Zmrf6
 fWeGnthjYKnHmO4xWA2dGnsoZlznLISo7VxrgJ2yZ4Yqu2ogXUwJRFeLn9EyN3U7SMed
 F2KYRJmA+puFqN2fMKnh2o/Z00+/60EqZUM3Mg57jiAg/poKqJ2wTRJq5k2B+9CHIlPj
 b4BQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1779375233; x=1779980033;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
 b=X4Cm0eRalOhD7aPfWdgBAVBQsTDZXCODGprWlAk7HpUnnY+QmW9ikUAQrBoFUV066h
 PDq+nDNKvUEK2MsIIG6juPz1PheewyhtGHPFuPAPBtp2mrTxzoJghs+yb/ppOeUeoZea
 hoO6TCqDTrAq0SopDvvkHIDjNYLqX7sCHKPLZvyHx1qYa4pGVD4MupVlPKM+IVFcW5Sa
 A5qso4bpIuub5uH4u1gwjA3BzgPAxnmrVcCSjEs1Z2bIlIHfGiu9gkCs3B2WsL7cLyyv
 BPcsGzUNRznfDwlBxAoewe/5/5HxNBKViHyx5FnJziIrSFAIAgz48nptWdoERrpqnJYU
 6gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779375233; x=1779980033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
 b=b0yx9Djic5uR4Sy9vSX/K4sOKjXhTiFrR3dqJh49nM7ntofiZDML1hFJqlk0w7EBRV
 feUPgmmL69Au6AeVE1jetCdxbq0Eb8RbKd08El0p7MTGcsK9DLgXo4UdAHCWsPgoxLi+
 trimQP0yJn8r2PQAl7EjzEtZC0SkHoV7/84/n2OQzOoaYQrXbQHgqaM9JOyTGaZoptV0
 lVQH5gHVIYlgE5ijCa68u/NIhHGelTsuSjR+hzcqPOapscbFoNum9CS0mZYl53K7i+Or
 cDy+lNwiji2P8WcLxYQUL9Y5BX8BISO82DNTO1IyREwKh4EK4QdhjyeqCTIM8Q6oiYLz
 zXwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8RzHyDjC7elFrBXw1/flSIOfcF/LoGiSnqeGkO49AULNlYfj2LlaDUUi+jr2X5blkkjcdilLU+XA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoDVJy8kgPE6EHPjsTBdcn64s/TcurGKJniuEzg7asgp5fU164
 0LUVoY8EzAwgxuMwkMWWh53A2cGE7XyNbQTNspex5XCvzPLB2h90V7YbtyVtbVZa1r1rKpqhoO0
 UXFAZv2zk1tFJGVSd+f8p7fgYyc9m7l4zEJzxuk+CAw==
X-Gm-Gg: Acq92OEH44a0RYF/HdPR8Yugb3hceYSHabe69LOHV+0VB3uiz8QUhU01eomznnW0zYK
 3DOMKGZJDvlcqcUg/hIJUYmM5LwSLXUz8Ib87tg0DMSh22qyAWJwPFnR4cHY/++FehUegk1/Geo
 d/AVQ57J7zpHd4ugsGZc4tLpyp/nnbEYr+VWb9ogh+9s3nB55lVDmZOeIXt1/SX39ejWzV1SKRU
 F9EgTAeGuDnr5REB5PMzgT4DUm/8ARlBrxufd2xz50UFpQXa+PxlNPS+7dm/b6jB6opNSsu6ejE
 GY7l3TiypMOGlHGWTZisNGTcQlMlYnBYaEJSCnU=
X-Received: by 2002:a17:90b:2d50:b0:368:78da:803 with SMTP id
 98e67ed59e1d1-36a451816e0mr3680773a91.12.1779375232901; Thu, 21 May 2026
 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:53:41 +0100
X-Gm-Features: AVHnY4KPQYYiaRNDiAsU-wmS8JuOZnjSnShN4CXgg2DHzWx0LVSgQ_nHQROoprA
Message-ID: <CAPj87rOFnB+csoswOOSBR2-=abtCDbsKq2uJ_PgYKPWh-G8m9w@mail.gmail.com>
Subject: Re: [PATCH v14 00/28] Add new general DRM property "color format"
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
 Andri Yngvason <andri@yngvason.is>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andy Yan <andyshrk@163.com>
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

Hi there,

On Thu, 23 Apr 2026 at 20:04, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> We have an implementation in Weston at
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1825 that
> adds support for this property. This patch series has been tested
> against that MR on i915 (HDMI, DP), amdgpu (HDMI, DP) and on rockchip
> (HDMI).

This MR is R-b me.

> General notes on the approach taken by me: instead of silently switching
> to a different format than was explicitly requested, or even worse,
> outputting something to the sink the sink doesn't support, bubble up an
> error to userspace instead. "color format" is a "I want this" type
> property, not a "force this" type property, i.e. the kernel will respect
> the limits imposed by the hardware.

Yes! If userspace wants a fallback chain, it should encode it itself
through a series of test commits, rather than adding the sequential
logic to the kernel. Doing that might work for one axis, but pretty
quickly disintegrates when there are multiple parameters to perhaps
fall back on.

I had minor comments on 03 and 20, but they're Rb me with the obvious
fixes. 11, 12, and 19 are Acked-by me, as I don't quite know the
hardware specifics well enough to say. The rest are Reviewed-by me.

I suggest you merge the common code and VOP2/DW-QP implementations via
drm-misc, leaving Intel and AMD to merge through their own trees
whenever they're ready. We'll merge the Weston implementation when it
lands in DRM.

Thanks to you and all prior cooks for all the work, and to Maxime and
Dmitry for the help and review as well.

Cheers,
Daniel
