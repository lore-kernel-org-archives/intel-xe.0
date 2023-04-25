Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBE7C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 02:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE3B10E248;
	Tue, 25 Apr 2023 02:19:30 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C310E248
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 02:19:28 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-51b603bb360so5318097a12.2
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682389167; x=1684981167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOv9FbmJdl2m1rSQFGKiCAajEzpl4kZ5wosLjLPPYA0=;
 b=Rji3wJ1LG+oO0HaFnXyLHLw7SHn8Wy3MTFq951jX7X2Z//YKKc5QwGZXvMVJPXaAod
 tHcoTSNHPHUz3DY7iaH26biQ/7zZyinWWcghbAV7Av7bhtGxsla06TBFUNUtkY1no+Up
 OPzMr65Wa7J31T17es66uLJR2x7ML/bWOV8ACqaQ1Ij7SWX6XgxcfpAi/xJZgPaH6/tM
 2C9787gLcNlDeNrE5RbFv+0lAdNq0Ykc032rsaaef0+Pt3OTwuL6K0asICQsEgC0jHq6
 cmfZKxoNYiZ9CB5L0k7IZFeZ24VOvjY8l8s64/w4T4ax5I+VFsqgWhgCrWFZ1pGDUcDc
 hCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682389167; x=1684981167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOv9FbmJdl2m1rSQFGKiCAajEzpl4kZ5wosLjLPPYA0=;
 b=b/BPmFi0NBxBvIcyAiznxsX9TJdNMIyj/SG4jtv4yVf7lvJcXx1lMpKdxeCW4ThxSX
 UylfFy+O7KFFYyxqr877fG2eHjNVWE8nHyNrUJ3X2jjg+l5Gyt9WW9/vRdghXYFWVo8g
 7R7HIrpIZI2YsIRhA1BolneZnGqIQ9pEDY9Eq14nNPy4ne4OvPifZe32RUvM7TI0Vtgw
 4ggKoWyLrvTX2HNcK0R/s+WAf92kEYQGbpH0TfCJ81ZqUpDOvP5rOSLdweSA6Z7yuLSa
 lZExHVGN+3BrlZE32JJ24gXYxe3S7AypkP/iNDfY0GygZacPPjsDtGAABo1ctQz6tPtM
 QEMw==
X-Gm-Message-State: AAQBX9fgQDoojp2Bx+vA6Md5WNQ+ZXOhhX9l6TvuoIsqcA05MT50ghsr
 5k0VzwriT9305NuSJ5nDWZ3/8cUofRQWYw==
X-Google-Smtp-Source: AKy350bjeVDQ75Yi1NAfDNLCAF2hoTq/xxJ8IyKtSR4ddXZcMZk9weH+cnne/3TKMqtwnj7cCaAHcQ==
X-Received: by 2002:a05:6a21:9988:b0:f6:3548:e4af with SMTP id
 ve8-20020a056a21998800b000f63548e4afmr620740pzb.25.1682389166948; 
 Mon, 24 Apr 2023 19:19:26 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a62870c000000b0063b7f3250e9sm7986731pfe.7.2023.04.24.19.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 19:19:26 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 19:19:21 -0700
Message-Id: <20230425021921.1695760-2-kode54@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425021921.1695760-1-kode54@gmail.com>
References: <20230425021921.1695760-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Enable the compat ioctl functionality
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

This is required at the minimum for the DRM UAPI to function from
32-bit userspace with a 64-bit kernel.

Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..00f1d9e386f1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -113,7 +113,7 @@ static const struct file_operations xe_driver_fops = {
 	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
-//	.compat_ioctl = i915_ioc32_compat_ioctl,
+	.compat_ioctl = drm_compat_ioctl,
 	.llseek = noop_llseek,
 };
 
-- 
2.40.0

