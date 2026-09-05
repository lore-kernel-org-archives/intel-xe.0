Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A9DC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6610E142;
	Tue,  8 Sep 2026 18:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FDRlW/+u";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403D410E226
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 14:25:41 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2d942c7cc2fso15400495ad.3
 for <intel-xe@lists.freedesktop.org>; Sat, 05 Sep 2026 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788618341; x=1789223141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=irtRdSHYVWU6V1hRtF1N7wOshHHRxGrEgOQHGUw+S0o=;
 b=FDRlW/+u8lA29qN+drgG/atl6HWHIti7aQ2oJyBe+njHdxFkAYNPh5RNFgJpJz4+Z9
 NNJmS3P+L968NrvMmZAJul2fGt4BSBMe7yUYTOSKEwkB7qiBQHO4QW2GsnP0jizogf5c
 cWKZFAngbX9qi7LHog3hOJj5AOm3WuPUCPAN6ZV41RZkf07Mg/cYbqR1tUNZln7CF3MB
 mWDqFRIE6W1SpXotPHSNVUGXJ7Yn2Nokl0RgBu2/mYA/MTmCMG1oHZlYHHMkIcs20Jxx
 vJr236vG76Cr2JeO3WnSR4aifyOMLudWYgrGjTRAgUEP4qtoBjnKf70Y8woEk7kbaXct
 Z5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788618341; x=1789223141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=irtRdSHYVWU6V1hRtF1N7wOshHHRxGrEgOQHGUw+S0o=;
 b=r6uw30oX2p6zUg4PtnJkfwoKqm7uqrH812bYBV/q737G6aEiSif+p4vdKTdppe/6QB
 1n3KRY6bjwCfm1Gh8xZprAx7zByYsyZst/lhNa/4tWlMVtjpOOHRpJWxy2wEE2yptxJ9
 HzcedFcEhZGpFfWmenzt4m06v5760rHguvNKaDz1VYtIgiUx8nTnxCa76O1s6CCkxES6
 dForXgO9Zxdl8+XkUAdKXW+xQjiWnfrccSeIbBZ2Tk4S4EmOsVBT3n+jpWVP5ptG4oXa
 Jpr8tIWVsyGw+wFOaEVXxBd4qdDUtMe4JIDefSKMFAO4tglqLBZswm1uUubcmwZKqdXK
 /w/w==
X-Gm-Message-State: AFuF++kFbTxWYYuTHz9CoQTKMY2Y4lUZLZYSM/nIzkQaWd5FSC9QVZyC
 8/E+ebDcpZw8HahzseLg3TaebFtN7KwytePBQ1CWCFaTeZtesDLmopgOQMoXAyGakff9oA==
X-Gm-Gg: AYBFou0wLgdxsDUZFUHXcFh/JXrgxzuygH2d82Mkdy3dKGnZj3do3/PWu6RyseorQ3d
 yPxu0GkS1SjkDaZ73brHYENgtBPfkhzU4LZFxOzWKbRwmeiFSJOPMOkgrFyIyoob853qTSjan9s
 nQe9yZEGCpA5wJtEeWzQ50myryBOZe+rJ8/aI1Q+Ysu7ln8rlBdiiZmXNsyOlt6d2x2YXNhieZA
 aMX4mTG4DIhxiVf79hGkUK3RQIoFaRz7+uCLzTXFBlc9MqftniUimxdGv9Lkt1rDf4EIuXKj8B8
 gZXkWzwVLd7Gs2s4j9W5Ewgm5obr0+cU0IKIK+wCT5bPRWGCk6v6ivUDcVaWLwL531+V+d1pR01
 DowA0MP5muPd3xkLHqua8+L1n+xfWU5VaFLcfR+hXijbtTmYnPrP3y0LzEqVe+5MdMtJzXYXEzW
 QQdpHDL92hg+Y9+4RglP6oHJ8u66r/MD8agl/9ui/6SbSB/2pV/oGJe+EJj8I1c3wPidtOOdizH
 L7egIq9YRe6GqiGaMxi5p/kwh7Ki+R0fRRW8YvNgJwFO/uM7UUS
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id
 98e67ed59e1d1-39b2612eaa4mr17477270a91.10.1788618340676; 
 Sat, 05 Sep 2026 07:25:40 -0700 (PDT)
Received: from XiaomiLaptop (n112119120034.netvigator.com. [112.119.120.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b260fdf9asm10501790a91.9.2026.09.05.07.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 07:25:40 -0700 (PDT)
From: Andrew Zhou <zhoulol888@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrew Zhou <zhoulol888@gmail.com>
Subject: [PATCH] drm/xe/display: Remove invalid initial plane PTE check for
 iGPU
Date: Sat,  5 Sep 2026 22:25:00 +0800
Message-ID: <20260905142500.17666-1-zhoulol888@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:11 +0000
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

Pantherlake intergrated graphics can have the XE_GGTT_PTEDM bit set
in the BIOS-initialised framebuffer PTE. The new validation rejects
this and fails to create the initial frambuffer, resulting in static.

Remove the too-strict validation.

Signed-off-by: Andrew Zhou <zhoulol888@gmail.com>
Tested-by: Andrew Zhou <zhoulol888@gmail.com>
Tested-on: Intel Core Ultra X7 358H, integrated graphics, B0 stepping
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b7303..8c95dc4e6 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -85,7 +85,6 @@ initial_plane_bo(struct xe_device *xe,
 			    &phys_base);
 	} else {
 		struct ttm_resource_manager *stolen;
-		u64 pte;
 
 		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 		if (!stolen) {
@@ -93,13 +92,6 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
-		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
-
-		if (is_pte_local(pte) != need_pte_local(xe)) {
-			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
-			return NULL;
-		}
-
 		phys_base = base;
 		flags |= XE_BO_FLAG_STOLEN;
 
-- 
2.55.0

