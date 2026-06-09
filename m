Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6597CCD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B610E209;
	Tue,  9 Jun 2026 20:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="Io6GWpt6";
	dkim-atps=neutral
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07910E37B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:12:01 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-36da8439078so5325024a91.2
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Jun 2026 13:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781035921; cv=none;
 d=google.com; s=arc-20240605;
 b=S6oAgsA9b3ho7DUArUlVRcJfr/19x191eTNY7oky+RJ2RfHVYnYa1hu5E+zQQesxqg
 7R+yHFO7AVDhoDIinzucl5Fm0Pf8YbH1oLGuJ7Wj/mvBQq0NfWQwZdGhGLcHYXIuB/Vm
 KsWf42LqsWNnNgoQLgMun8RhQ5Xmj/J1tfQN7DSlD3YEXyVKamAeFS6oVQaN4AJz1Kzl
 E/SRFJOtJI93lUB5LV2ixAnER+zz3Ldj5+rqf5yzh13Cwr+GZB6blVA0NSCtxu6Dfisc
 AbLL4MNAr69wKSm3gTE90efIWfwhkf99uHG1EilBmIKKdavsIzYAMlCHMnrrXUxd/46n
 vMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
 fh=7m0PDbr/Z2y2l90QzXQiYmQVGCOUA6H6JeyrZDLJCZ8=;
 b=kLB63FZkB4ZbnaxX/veHbe9XRmf9cKLlKc+bSIKWg6zcZ4PiOt9hU4M85988YZ70UA
 Q+LesoAvdBQx9s426F9ZcSSvxLTqXv384wrIQgBzQM51kcBeslfecCq6S8E1MRwYUbNS
 AUduKrUvHjqgZLk9EHnLZrtwn88qbyI2O4wmqXVutfjI4Hqya3B1HMC0csrOHWdbm8Tr
 Gc1P7OvOMazJj80T4PiNXawrtK97JzgcnmoVtdo1VF6V2nLuEwzw6HLnvD5k2LUSJ+br
 5UaGXPtCIlCP6dTiq+d5Q7OC9kFaDqQIU6zQIK3DrBvBS0ee9qBjFzvhyH2nMTAEbjpj
 Tq0w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1781035921; x=1781640721;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
 b=Io6GWpt62/Gv/hyGboRumqyDPBqmK48RMS/LWQjoe3l1/+gg0mPwtFR9RZrYo5zrMF
 dTHM7QPQvj2OCdN8wF9jDgVSd8skMH9J50XOyWbjVJkdybrgmS7t4Gb9KClxygrdkO1F
 Fb0hfjjjguTi1bdiMnBUARPpimPf238PplHHiGjzC0MH+Vbvt0kYoWtU9c+/AfFIaO4C
 AzAeG6aM7LnU1/ndPe5pSjvVEX8Fho9hHIZQICq+eeUlcDEZUqry93r+N3BmnmQ+kYNp
 7W6Gjxl61cghxZi1rL0VU9OTjhofVrRSzstptUIzNhPBVPw+nIp7jwFMET7tbMzcwbw9
 EGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781035921; x=1781640721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
 b=RDUajg6aZXytNi6DBzPtO+LEwltTLuC6OD4K9tBlqodEkLC4DRvPm3b3Ouw4+y39qA
 fBSRVoViPKSGY9oooTXCF5BHZJwiBr/phcMZ/g7fESyBQOEsSmeocNjEKBpiDs+O/ros
 vTVSDeOt2R5AnWis5WdoUJwoF7oviysTrKNkUaUq5vhtnZrH78U1qYPiK3iU63ClYqxI
 iXx7Hm8RxwtPZt7WQBYKOvQo1pca3/YoW1fLtLb6tuwAgwXP/KJCzBhi/X7zDgx6L1dr
 OQEXgaw/LkaIGmp/y8RgsgT75adNZbp6xjOUl8mdFY1qekics9LOSXCHW8SW6yll2KGE
 1Iwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HIeOp9dh+aPWPn594y3U2zlz9l/Vf7HO+SVRxKP7mIeeHVbwOK3Nv+o7exkCoKG8I27hHS0OSKA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK+P1u7LppCikjVF11vi81r/lghn4T87ycup7ERZXuiL3JiJIM
 lHvR/PaQrwaNwtZHjH3Fxgo2h4RnR0r0IUKtzGiszXUFiJmiCtKoPGV/WlNAZ+nazhQVePiUe7k
 3J/UZ60FuCzVnEUlJOSorOtvTjeh2kmURop15OiGsoA==
X-Gm-Gg: Acq92OGMU/sZAVn3JpepQy/JSLkyhvEBNHLxf9LTUfslNIWI0XSCvtPT40+kIXMj3Tc
 RBOSiZyrJihKlPXUlf9wlnjFpVGCSTJeUBHUuk321xZ6yXUJWKvpGYVSsvqkr4D0bz4zE3DRfF9
 ZBqMwFdtsIvID4Tjora5db2Ws5JUmcmT+pZhTR17nafDLg4d4cJO2ZFh+Sve5AFVTLQnKeX8RDs
 f2hl0MUyhjEt+63IUU/IOHpbnzL6bTX9XHhkpk64RLy7cwciVrvWeOq50lBt/Gdv7yjL/6V3wK1
 FarxGFJtcnhhJU/B8A==
X-Received: by 2002:a17:90b:3bcb:b0:367:cb53:7435 with SMTP id
 98e67ed59e1d1-370f1525ed1mr21923499a91.24.1781035921449; Tue, 09 Jun 2026
 13:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 9 Jun 2026 21:11:46 +0100
X-Gm-Features: AVVi8Cf7R-IrVdYhsGfa6ARvQUl6VjYbn-pxlLXZ6UvxdCSIBKSlKWHfn1zLb40
Message-ID: <CAPj87rNhTViuff5qWeoGkPgyRvP0uOAcUGpcJJPTkPR2b8fJcw@mail.gmail.com>
Subject: Re: [PATCH v17 00/28] Add new general DRM property "color format"
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

Hi Nicolas,

On Tue, 9 Jun 2026 at 13:44, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> this is a follow-up to
> https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/
> which in of itself is a follow-up to
> https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
> a new DRM connector property has been added allowing users to
> force a particular color format.
>
> That in turn was actually also a follow-up from Werner Sembach's posted at
> https://lore.kernel.org/dri-devel/20210630151018.330354-1-wse@tuxedocomputers.com/
>
> As the number of cooks have reached critical mass, I'm hoping I'll be
> the last person to touch this particular series.

Thanks for seeing this through!

I've pushed this now, minus the Intel patches which they can merge
through their own tree. The AMD tree required a pretty trivial
conflict resolution which seems to work OK here.

Cheers,
Daniel
