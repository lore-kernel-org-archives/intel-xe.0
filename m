Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18230CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DE810F33A;
	Thu, 21 May 2026 14:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="fpPt8P12";
	dkim-atps=neutral
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B410F35D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:41:01 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c82a6278a4cso4807626a12.3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 07:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374461; cv=none;
 d=google.com; s=arc-20240605;
 b=DwktuFY9exPbuhKHHJ6ThoAeXkJwpCWQ0s75bTIr+xLYEJn/kpVYF//5WhCE27YjNu
 /R7o+AN3YSWTniSriN4bvBH1SsE2MSyMq4CsL0S0GD8gOwv+zXqk775G0VJOf6IYCE26
 L8J2n7eyYfMo66McRXfcOJx8otHtYSWRlbMRlxQ4JjVlFLPyi96C+VURgsCl6npuT0YP
 +ff/3bqLvm8HvTAiA5isQWFoG60jls8CKJUAmM1GszOL7dumWwgzd3vRQWBS3eJIcLCZ
 iYWQ3xy1BWE2NSa1ZBhwtSsfl1FTewje3G6T/eqrsjDA7tt+q4MkDyhf6Pd/WbhFWfnY
 FvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
 fh=Ru55B6ZMOlZbUY7T91iBZR5nmywnNroU3ilv0LDnDhs=;
 b=g00GQVQV0+R46csJaSWqZd4pgCZpjHBm4Yzjoo+C7pa19Yyy2RVN+jXCiUBMUBQ2h4
 s2dX6NclkmpAYcP/ozHYBETTQVfcaAzABgR0jK4RIxBxWg+EiZVGlhRnJ25atSzOWHoV
 pC6cur5A+oqNR6A3apNdf2jN/n8xu2eMhx56oSqAGibC7sx6EIV60auQL/HxekGpO2cP
 bje5nbSV9G3iW5Z0N9aXbhFEvUUAF2ItsLLQIGq7TaWYZm2FK/lbFE7R4atq5NXVA3mM
 ElsCnBuPua0vOkjeUo7YJPanA17eSJLhLFJqzPXLUnU3kZW3MNui7/PMkcL7nukG4NFd
 K3Vg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1779374461; x=1779979261;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
 b=fpPt8P12fUNdMUXb8E4v259pENQikVsG8rYsQX6klE1idNU7TA3Wk5GZPOs2b7o7zm
 Xnrpaw0VzDMnV4nBB5dDvF/L41ZV8nclP0R6AE4yfyZPy7LhGft291pLTtSy0bVi8Gd0
 9RWc8Oa7nDq25dIPb8aapdWb9Rdvz2fElhEiGiAh+oTQKyChnTHv+Nrk5ZE80VT9WvPl
 J0IoNIjOB/JFLhjSv0rCuarR1wv0Wk1BfmdY+2gGNRcCrHFTiJGyYhbDyIDw8WP0Ocg8
 BlGJxSS79Cc7MXZ7k0NMtOUM13msZFeKwV9q/NCKE2igzXuQNa2shRDjz95xSWZfCE31
 X1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779374461; x=1779979261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
 b=jcfGZVC7qsmGG42R3MbJSSO0GKYd2L87WWZ/mvN4wqGJ9onVMIUZkl6T/90r/QP+nl
 63tbS0Ljbj8CkWHjBfsGEv9Jcm9W8xOIGU6T+tW42e1bdK/fa27Us0juqmQcecUgbOVA
 WFAIYQRU6BfceQbsGQlb/1YjZEFg0XH1RYUFvenkVoarAXqu9rs3XvXm5CoHXaNu6U0v
 e4uXKUfL46//GmhQupy3haO+rqYqSMJ6YBo3QazDf3voha0fyPo0aXbUPmnQaumEYS40
 ppUBNwpSpAr51WJ80DSnLGwt/+EWe3CLVndhJ1ZqqY4D6/6MrMBVWbTBKVuupE4cXqvs
 MejA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9syZWz2MyrJIDnpIlxPSAKTBY2H+zQzbRl20noajERzfpFszOgiVR+4TWWojzqbzGk8YW/eIAxog==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweKEpWicVIqxAHt6PFOSVaFiSxL9XB8YkavX3K8ExjeFrgs7We
 CD+ErO5SldfrS5ba9vLn6xMsb0gBQWS92r05y5V/DTEheXe5fKZ1Y09eRpx80VqFWDamabCTLHX
 abdqmszBWqtvlLw79NP4JdFyXAgGfiekjJPak7ZkRug==
X-Gm-Gg: Acq92OHqcDV/sPYu5MNZ80WopVSXac7B84NhfzQmI7HWYRbAf92K/hk6HOCdnrR6YJu
 jSkKoK+vTLW8uJ2hByTiRVMw65Pu4mn2lOLEqgI/xz6bvj8udlW8gFeCdD2v+8ViDrZ+2M2N4rg
 oANx/7MdeeJX+l5YsSKVhBf72RDRXoWRYIrTaKzRcgO6JVd5cmWvKb7Wb88cYV3OpW2S3ZglRHd
 TochMuGNTPFvKVsdRCb1q5pzniCo7g54PBh1+jVZFRxgDUKqZ9HsUM6XGxhfxQSEUm6xDhz0yfR
 uoetq9vVdISUq1v+XOEXZzDc3On5VgTXTDT6zTTaszCAU9uw3w==
X-Received: by 2002:a17:903:1b10:b0:2bc:e62a:979b with SMTP id
 d9443c01a7336-2bea33d166emr36661465ad.30.1779374460988; Thu, 21 May 2026
 07:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-20-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-20-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:40:49 +0100
X-Gm-Features: AVHnY4LM5MR-pydhp54-iciGhQnPfxKOlxWC92SZdhfzMOyTtShVga8wCcjC3D0
Message-ID: <CAPj87rOBvjw4v+PER+6+FMuDRajXNnPSKAke8a=tVgiSRg8QTg@mail.gmail.com>
Subject: Re: [PATCH v14 20/28] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
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
 wayland-devel@lists.freedesktop.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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

On Thu, 23 Apr 2026 at 20:06, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> +       bridge = drm_bridge_chain_get_first_bridge(encoder);
> +       if (!bridge)
> +               return 0;
> +
> +       bstate = drm_atomic_get_bridge_state(conn_state->state, bridge);
> +       if (!bstate)
> +               return 0;

IS_ERR() + PTR_ERR()

Cheers,
Daniel
