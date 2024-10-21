Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2952D15D86
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 12:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FE10E4C0;
	Mon, 21 Oct 2024 12:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ft04Dkyz";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9F110E4BC
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:56 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so44525721fa.2
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513074; x=1730117874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9yzL3cq6refE/8jHrgfUykQ00f5QT9/9b/0xTf+sbg=;
 b=ft04Dkyz7OsCWy/rwwMiMdPMTUHhexmOW4DDhe3q3Mg1zwizxbJ5j1cfhDLxU4HiBi
 29PsCgqU2K0tfuibgfWZw+N8DirJqB4eUNbVCp1vNEangBJGtKjAln1PTpEM90Lwqaez
 WQFCISxDrID5T7fgijUMD0n1Fqhp5Mk/s7xOgSE1RW7s3yBRaM9r+4sNHrtKbOTXDd1U
 qcuqobYSqjy586hcYSEKh24w7V0W+H404+2heh7aHDCRjFy/3Do3toGxMtWn6XoZ1ZRE
 B9tTiHIQYA5f9BS2WgpnuXKmjO5zLCpv+dGWzIKtfITnyjYz8lnxnW5AFTTw6NBARVbC
 Aq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513074; x=1730117874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9yzL3cq6refE/8jHrgfUykQ00f5QT9/9b/0xTf+sbg=;
 b=beInSTJTB1wLSaV155/U2Cm+iGJMCDHlQVnNjkSsbgJAlCXj/LsyzvPRSaBO9h/9G8
 +vq+wj9oUkDiNgJ+nF7/I840XubR1N0KzYpG05RAIhLtQf0+lw/hbFpBYv840CGEKo87
 V/TdCzE6aFPUv68P65gXkwoQ17qrFoDQGE5X9gWLH7z77fNYU8zbtidSBKgRbxBQexso
 OpjO+uvC5PM88JujxndIvYyofMXVOv3L7gC29tP52wdHAh/aMCvi6BS70lJ7jwVNBDjp
 wtQhx5GnnO+84o1PvyJloDo2DyA8t1a5yMh9mNUqUvbseYtj9EgFzyjJHo0ybPI25Ljy
 H8wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6a9zJppMS867Vem0C7SiHyvxolmSmBBmTuyGo3z4DkLj9GJCA1qdFMfP/k5yguJNeyGl/KikY0A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytHykKrcp4SiK0DL4N+B7yDQIVcM8f1ocg3c3ZveSU00cH60er
 AFKpIOl//LdvKQMfnMToizjDS0xqe7TEJYHV8IuzlbqfsfrPJtgnopul7fxtCRI=
X-Google-Smtp-Source: AGHT+IEsjekVnrcVqImxMZbmo0i6wP10FDI9NRJIYrGYKmreelLfg+89QH4satNGiJJ0wxtZuHKbxw==
X-Received: by 2002:a05:6512:2393:b0:539:f65b:401 with SMTP id
 2adb3069b0e04-53a154a2413mr4923387e87.57.1729513073979; 
 Mon, 21 Oct 2024 05:17:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: (subset) [PATCH 00/28] drm: Remove DRM aperture helpers
Date: Mon, 21 Oct 2024 15:17:43 +0300
Message-Id: <172950935856.2053501.4410265648664199730.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 30 Sep 2024 15:02:58 +0200, Thomas Zimmermann wrote:
> DRM's aperture helpers are merely wrappers around the respective
> helpers in drivers/video/. The DRM interface existed first, but was
> later generalized for use with fbdev and a few other graphics-related
> places in the kernel. It is time to remove the DRM wrappers and call
> the video helpers directly.
> 
> No functional changes intended. This series should replace one interface
> with another. Individual patches could go into the various trees and the
> DRM wrappers can be removed when all driver changes have been merged.
> 
> [...]

Applied, thanks!

[11/28] drm/msm: Use video aperture helpers
        https://gitlab.freedesktop.org/lumag/msm/-/commit/42170670ee76

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
