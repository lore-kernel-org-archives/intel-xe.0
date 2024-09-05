Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DBCD4F58
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 12:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D05C10E888;
	Thu,  5 Sep 2024 12:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nhVcv5ug";
	dkim-atps=neutral
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2429D10E88B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 12:40:28 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6c91f9fb0acso5861757b3.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Sep 2024 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725540027; x=1726144827; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
 b=nhVcv5ughuNkDAPQOnDmixPZCMQ0qmCTw8MD/x+AZUPUsiIe73Fp1Qa2BPybssylN2
 QwwsJNh0b/5EKFw1UG2EVKG8MJZwjSBstGGFEjaI0wKtksUMzdddSly/Aw/srpWd+nbP
 6Y1rI8cVnLQwQHOKtIfdjA6FJTHiDZAe/oEolANoG23fEJqCcw2jMrIa56pgMhl5Upbi
 jDz+JPgB8kmTDNCmdNiPONUYitV6U7QkKy6a4myaCECl9r7wZFfs8oslIFFflw4dgezq
 iF7jkA+E4EPL61ObCa7pZiDTs/lJMSIrGejkyrO3T3G1T9R8BTYXweSwCsZLpvX460cb
 GGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725540027; x=1726144827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
 b=Mpaj9XEbomIqr5WpHuPSqkbk/heuknZyn0/x8MFLBqf83Y4RPRrl+UelWk0f5nRC5Y
 QbC89wRNDPQD363aUbGDxi4b5JOgJ+CbU50RQFoa9hGfJ449dk/80BLvA7RGW9ZwYcqk
 j848LOnGRDywT3DpjaKkCgbrUMOZ/Z6t2QWlCMLtETr1obVPTW6mz9lLS/DSYr6T5AMs
 oKWep7HmxEEUEel/Ut1sFd4D0VE/qL0njFtmbErMS6nHEbAojXOOU1F+jhVGeAsOKsvd
 bl+YYQpmDpRMRhwuh5QHerxi3q95v6OsCXge8odwDVhcHRz8bxFRkS162W3Niw0gu7Nr
 gkig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRofjivcAohARLq69lPPZqXeN1QgEHzrRRRCqYnTevTMIh35wFssFw7Oo9qZhzaovD/1vNU8I1Lg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfHvQHRUTcy63aqCqtVis7WSFCfDFOzwjrILB2s+V6IVi7IP5W
 yZY2G8g4+0a2OQH9aRmexVXS5k4ZMvJZR1deVt/5bRH5AxhVcYKwMnAXt3mtT/u1FDY1yDTmLOS
 qmoeY6HukgZysC/xnZmXXyK47aAUULessehklug==
X-Google-Smtp-Source: AGHT+IFIWLL0YlxXEHzETETRS/4fXk/TAU6J/4Fvm95WECnhr++irvMb/d6wkqFe1PbO8tUu5xvRXYLr+luqmfEBPLA=
X-Received: by 2002:a05:690c:6481:b0:6d5:7b2f:60a0 with SMTP id
 00721157ae682-6d57b2f64f8mr207770997b3.34.1725540026953; Thu, 05 Sep 2024
 05:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
 <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
In-Reply-To: <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Sep 2024 15:40:15 +0300
Message-ID: <CAA8EJprBwTH8R9-b68g-U6yA-FN6z_pt4YComNCj-xvXwvzcCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
To: Maxime Ripard <mripard@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
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

On Thu, 5 Sept 2024 at 10:48, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, 05 Sep 2024 06:08:20 +0300, Dmitry Baryshkov wrote:
> > Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
> > original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
> > helpers") and were later reported by LKP.
> >
> >
>
> Applied to misc/kernel.git (drm-misc-next).

Thanks!


-- 
With best wishes
Dmitry
