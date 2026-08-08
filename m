Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D074BC5AC67
	for <intel-xe@archiver.kernel.org>; Sat,  8 Aug 2026 16:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2510E060;
	Sat,  8 Aug 2026 16:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ro3/+Rm/";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC6B10E03C
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Aug 2026 14:49:27 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso33551055ad.0
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Aug 2026 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786200567; x=1786805367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oj+LpxJwmFVdLd+RvTFySlTh8hVfSNWlJ1ThruNqG6Q=;
 b=ro3/+Rm/rq3gZyYvYLmbCpGs5HSqry3+MjeLxDsevMsPfQNfls9aHQXR6MhlV0r2Es
 lM5pVge4K2KvhEX8p7sj+QSKn2Ky6TxJ4KfGOdIM9bNOsSWYpZ0+ARkHUXvzHeVwFTuU
 Uc6Bc4YpBFkynjYPt1ufCgxtwoFW3u1tAX5/dBQXWRWdHcU8VjpdruieanFfWHRodnoA
 vvgHgyiiyfLzXCMtjCEVshcsgUFJL+d1l3nLUGJ0maPFsDXZJXMWmNd/RAXG7ailmacX
 ztw1aEwE6X8HZ7F+2RnwzqEk2dlhhFDm2PT8aYyE9gNXcV7Yxu2dW7ND9AE9QlpS/QpD
 yCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786200567; x=1786805367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oj+LpxJwmFVdLd+RvTFySlTh8hVfSNWlJ1ThruNqG6Q=;
 b=dmpKsHLzYk1DAc+9bGLGKPXCrH385WNhwZz96FGtNTyBBvLLay88+/sPzMUxkEX+DM
 9x7VpJC5K2jyEhB/ZBFx7JBw6crw5HJumN7WyykBa5LUh3EAoMp2bUyT9cn7e56hbjnT
 Z2yPNcOXLxvVcAR1YLlpgg+AudDR1LE/eGsTFd7hQyUaTTKeY/HGNyFWrY7rfPwNMNj4
 gqJ1zLkerw3vfHxE7iusc4P06hTFFYm0wQawWbUe+n9kgjQwblSiPZN7oMVBD+JNxdWF
 YwaibiS7F7gB8Lu59F4Bdx1kaiNfAuKy2bdh4C6rOy9dyS8Dr5ejOF43VNtjrmEwgEWr
 rvAQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIRchE69r+WLeMlBuaGJGC97nmPi2OzEHojv7AihN/Qk04U+eS2qqAj3QzKC+CBtNHST0hOda6ug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx62rTFrXVVCWifcMif9EEdkKpDcgzQRPgLXGwj5OVicsgXpKRb
 PWDsr9QaJ/ZupFR+2y+utMV//QXGP+KtQMW69A3PDsamIJLUz/kDfCMS
X-Gm-Gg: AR+sD13eQxbDVJJWRhLfguFEutHKWOvDvt98UdykkaPIzzsU4Z8YP/DFI1RrzApJe0o
 66B1jmyh6+uNCrUQpfN3z+TXbzW+pjSDhckhrBla0k/hy3EThp0LCFSKOSpkE3M+xnCTmnE9FHl
 IgnYM/DddqTPXu4nCuR5us059q7SRWsqCquTFIMu434ZnJVSoD+v6wNHKg8lZb/BpKOMv0Dg3od
 Q69xRKo8rCLpC5ckKNeCx6KwSM+nUqHEk2kurFVGsVx0CTi/dae7XEs8Z8VMiLdNhVT7KYfgp6N
 t/ClFvHogrLp0t7hZUTt1fHVbrXD5mSjOtVJ+q/eyKtiHCsTEfYml1QHuqTFjX5cH4Ui6cTCfQC
 zjfbzIoh+/6K3SWtiDMq8tIi8/ORG+uLnTLBQnvEfe62AsYUP20xQ0EERIQETkOFydnXxBpcC0K
 JXLNijiqCe001iC/q2yYCB6fpTJ2y/OWYNdupHVZp4adNQK6SEqw==
X-Received: by 2002:a17:90a:ec86:b0:390:b3c5:e2c9 with SMTP id
 98e67ed59e1d1-392846fd57fmr2663920a91.17.1786200566741; 
 Sat, 08 Aug 2026 07:49:26 -0700 (PDT)
Received: from lgs.. ([36.255.223.70]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3925fd95270sm6365730a91.5.2026.08.08.07.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 07:49:26 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 22:49:07 +0800
Message-ID: <20260808144907.2918746-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Aug 2026 16:23:30 +0000
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

xe_pm_runtime_init() calls pm_runtime_use_autosuspend(), but
xe_pm_runtime_fini() does not call the matching
pm_runtime_dont_use_autosuspend() during teardown.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to the runtime
PM teardown path.

This issue was found by manual code inspection.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 99562f691080..301789adaa21 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -518,6 +518,7 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return;
 
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_get_sync(dev);
 	pm_runtime_forbid(dev);
 }
-- 
2.43.0

