Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491BCF589DA
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 14:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21710F152;
	Thu, 23 Apr 2026 14:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U4k35qDi";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A5E10F150
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 14:12:29 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-82fbf5d4dc2so3435919b3a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776953548; x=1777558348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NjbAyysGPp/X4qI5XhFFweZW1szoSZOJj3nGI17MhaM=;
 b=U4k35qDi/USBLz6XhJnnYOl+xJfublVxgEYejkArJQh0J0sps7Jksue3x0Or+INJJz
 SzuzMFFrMz57quK9gPYQ54OJvWcaXZ06WZO0s9vh3xb2iAYLPN8un/Rh/r6EGT7hCL2M
 +TREj0ukE+RlsSjBq1xVwurgCw/DPGzDhX7OQ3Yea9UCXwJDjF06nDLE66XHC5faT6Bz
 Th8VTquNpyR8Qo8+XuYGniL3wTWNfdBD0RDJ+EmA7MqHgsL2Z4eBgdeqFyQVW8KYC1N/
 svgiEM0XMR9BrI4vCBbYLdCAd5KD2BkkwCMF3VDwjnjN7HkfodAx5MhocdKg6wP2rsW0
 5Qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776953548; x=1777558348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjbAyysGPp/X4qI5XhFFweZW1szoSZOJj3nGI17MhaM=;
 b=mkl+IRciEIImXteKQdGcIJ24m+Lpy0ZBLj4Qu70hT5sxpPwNurwtQJvTXOcW5Oy9fc
 mu+J0oTtk2bfadt8XwLRoeXory76xLOy/hVax1laS2l75TOgWV1JoqBqhDL12YZrRPkx
 HPgqBWYs6c9XgNtQ1rcK4++ALerHL+nZ/1aVG9UmbypSKSU7Zgj7PdatLPdKfPh2xTDk
 FTnArxQs0i+eR5MgP1a+/7SKJOf3xrMeQTUizttdvJomKgNWoNzx44BQSQn4jYlS2DTH
 pQ/M0hp4tHXzUV9+3wLneJdR9M+VHE7g4SJDEV1U4vVsMjh2gah7wOtHc2HogXZiJL0N
 LzOA==
X-Gm-Message-State: AOJu0YyfX4VdOzjXf8oYuBwcQt5KjVjQaBWcUpZRcvxcvrFZh4KZV4B0
 PL0Pe6XMCiKmoQDYmv/dKC1U/+sLXgyiy7jgyiXIAU/hazq2FBk1D/2o15XoGJM1
X-Gm-Gg: AeBDievLAXwiu+V0CNo+EKt6IjV4bdCG0teCBEDBLueBfIqcAOedVeboMqrOpF0y7YU
 lNFkdFrej0PHdnytPFgti5Jrkwe1YxPG7k8mAljoprqrcWQtCulfapnuTqtAbDNGzAXNKG0l7az
 q1mNLCBftAURz1Ipvf2Um6b9jined5hwjr06K+RJmjwRAHHyVF724Pj/93fpaTHIby6gZ0dDuhv
 SKRp5Kxffd3LDCUnUpLx01aOgMoLAj4GAhmnIgzA7fFjlfyvm4va5Ioiijzv5uGSOQrK0Ouhh+l
 VH4zlIdnLSY4qDYTUAL9fwzZAzMwH4rx8OMPcD0IFUIf1WrnayuiIFG167sX3+5PyCW2O7ryrpn
 gNMdQh/HYbrj01H+s2x1dvwS4VV8ARphnD6PlO8sLdpz8mY/48PZIp5RCd2BTUAukICzm2S8T+H
 tZyY1jmbdZBjBWDDnpg2nKbbkZEuZ/NHbbdTNpisLNAr7FYcsZEQ3dYyWm0ONXmKsvEJ8JV7xZ
X-Received: by 2002:a05:6a00:3cc7:b0:82f:5051:f024 with SMTP id
 d2e1a72fcca58-82f8c8ca07fmr30722640b3a.27.1776953547884; 
 Thu, 23 Apr 2026 07:12:27 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8ec0092bsm22254963b3a.50.2026.04.23.07.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 07:12:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/i915/display: enable ccs modifiers on dg2
Date: Thu, 23 Apr 2026 17:11:48 +0300
Message-ID: <20260423141148.3145665-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Since Xe driver aux ccs enablement dg2 ccs modifiers have been
disabled on both Xe and i915 drivers. Here allow dg2 to use
ccs again for framebuffers.

Fixes: 6a99e91a6ca8fec5882450128fb128265f86b32a ("drm/i915/display: Detect AuxCCS support via display parent interface")
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d31819758f3d..a4bd4f8e18b2 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -750,9 +750,8 @@ static bool has_auxccs(struct drm_device *drm)
 {
 	struct drm_i915_private *i915 = to_i915(drm);
 
-	return IS_GRAPHICS_VER(i915, 9, 12) ||
-	       IS_ALDERLAKE_P(i915) ||
-	       IS_METEORLAKE(i915);
+	return IS_GRAPHICS_VER(i915, 9, 12) &&
+		!HAS_FLAT_CCS(i915);
 }
 
 static bool has_fenced_regions(struct drm_device *drm)
-- 
2.43.0

