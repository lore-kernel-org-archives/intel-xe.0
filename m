Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA71E64AAE
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 13:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DD710E47A;
	Tue,  3 Dec 2024 13:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kzS0bno6";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD3C10E47A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 13:58:12 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ffd796ba0aso54722591fa.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Dec 2024 05:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234291; x=1733839091; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pj5SaA33rGzeah/pbmVRQIoqaIyNVExU4n/MvIb6OOM=;
 b=kzS0bno6VkoUaC6sICl5OB/3XbyxpU/aaO2kIlsL6o0CRZKNEXkgzAmHQNK4A+r4Rw
 wCG53nqIWVrcA+FAh68x3Q1n7S2BfORvR8MlNEenXVibjdlPzGMOobwiO8Cj5MhUlOHE
 tpzFhPyA42GKe1Ta85WPycoh3z7EZFNWpS8CDKXxvSrripw1jzehX0+W2obfBGAdDML8
 3jg16VcLw3h8VN8L1ZtKdpdrHwd5Y86GFSY6fZytB6Y3du9l1sDUqgoJV3fAgJG2Sgzt
 mDODnErzAOrcLuY/CXJwc8cZLJVBuyTqjrmzJJSILNzvm2nzOl7hVgjon2XoQED+f3gG
 38jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234291; x=1733839091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pj5SaA33rGzeah/pbmVRQIoqaIyNVExU4n/MvIb6OOM=;
 b=SrbfbBUIhuthAuXW2ZXGQ6WbPo57btU3aYVyalq82ShG7rDFKluIJZwVWEFnakFpG5
 V06y1zdWURI/2bDqi8TksTghbyJYC0N3TTP9szki27XN3Y9PNL6VlxgqOQqgzdykHCS6
 3YwA1ilsdFFYDlQ4IKgmcR+6uChWkk8ioi3xG2qa1Y7vDnqi/gTnOjXv/o8xr7s+4T8v
 Y8IKHobdIK+Y3J7hHHyV+E2ItJO+dvU7iGeTCaZiahuqM/AmquwKUVX3kNVY4A/vOYHE
 xW0bKi7cDYwq2lgq/z2gpjIRrgQ/cwLwD8RpVUrLbd31tFjQHMLOjzSHf2oFeJOfO2Ye
 wwow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW70u7cD/CZOPCcxKuGJww7ruTZHYKKFZFzoV0iLnGR/O8N5aSVQDo3Y2sZyfJsU6dNT0Tt1XOfMg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLmFBJ1qkw1UrnxAoxgZ2jKEXMDeQM/8kxwuBV8vE6I8/nnRYD
 4JfBjpnQx/Z8YTVL6AeWuwZ4++yCXxkPyrvc6s2RnYGZuoC4Gq0Lfb4T0mSCDW0=
X-Gm-Gg: ASbGncvcSm6Dqq34A2SeCBPXuq1pGdzxqKjD7rVPRaDEQ1cE6E+1pMGbhCfKjU/KtrM
 JqA78lydx6LgFGU/VQo8XsC7grFoUZ1d2mnp8y82kdhD074RScAn9OSUEdkdMAGj7GOZ58sN93p
 R18DbII/fbYQ8Gu0TgZ17mlPP8Bt4En7KZfJMXMmnQq73w+BaWFYV7tTlH977UESqZ7iFIypLL1
 L/cpRlmnlnAlO744XuFdeNqkNXgXKCliM7QcMGilM/CuJ56btLMCo1PjqKjcAYV7VlyWUKK6JIQ
 77gPO+IK9K4Gp4N0mU7gBoz/HXw1uQ==
X-Google-Smtp-Source: AGHT+IHfqup3wRu/YlQwHjftG9hZZW4Odf6KSlTWBL24IqkfpJKbOUgrh1DX0z2m6JH7KpitaUiUxw==
X-Received: by 2002:a05:6512:2810:b0:53d:cf78:f240 with SMTP id
 2adb3069b0e04-53e12a2e9bcmr1842991e87.35.1733234290592; 
 Tue, 03 Dec 2024 05:58:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496a43sm1829234e87.213.2024.12.03.05.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:58:09 -0800 (PST)
Date: Tue, 3 Dec 2024 15:58:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
Message-ID: <n2zmw4wquxzht6gvlx6yjurpobgwlsryh75n5gw65j5vjclhgr@jqubqjispqsr>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
 <ca906dc4-ac72-4a76-a670-36c011c853c9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca906dc4-ac72-4a76-a670-36c011c853c9@quicinc.com>
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

On Mon, Dec 02, 2024 at 07:27:45PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/30/2024 3:55 PM, Dmitry Baryshkov wrote:
> > Reading access to connector->eld can happen at the same time the
> > drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> > order to protect connector->eld from concurrent access.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Ack to merge through drm-misc?

-- 
With best wishes
Dmitry
