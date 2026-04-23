Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9FEF99368
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C45D10F05A;
	Thu, 23 Apr 2026 10:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AtSNm1v+";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5055D10F05A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:18:05 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-35d99bae2ebso5875173a91.3
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776939484; x=1777544284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1o3ElOju5pjDyhDdioo0CocHms/enCtj84MgsqZq/hk=;
 b=AtSNm1v+qgObPrFyEudNt0I64BFuEauKpYXfjbXkvwJ4q/+dn/CsNHRXT59AbUP5nc
 ATN9MJdvuJ0d7Zlp6X5I4R8tP7E77/zXr38OPoFLQia0Q/gIICj8tXljXVWg+XCmsILM
 /f5RJqFU+PNpz3yos8Pm1/HLe3gGBWod9yUzgmLCGqEgbBHN/ce92+Lf1vlpotUghXcs
 kDysP+rOLSVZSkPuIZHex5c4zXZHSsFdbVhdVRqXh/wpjhtaq0iTdQdWXjLvyo4D1xmO
 rtjC2qhTEW8YDu3qrTcUs1uKEZ9kZiIOnJOVI9KHlNB1s95SpPgkhvnUMIUdDW6sf943
 7VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776939484; x=1777544284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1o3ElOju5pjDyhDdioo0CocHms/enCtj84MgsqZq/hk=;
 b=BvxSEHjUQ7l/wbYbGbTQH0XHzxCo/47hp9m0n2IEPIwvVJopGcSKdIqtriiuapkOdl
 vwfARWM6iavWjluo0y49ABkpd6wCjG8cZYoEfFPvD5e4P4Q2hUbYXyxdMRGznXZLKdE1
 XeFmY2DZ4NWelanRZWyWYfLRCwvHKRkyHaXJOhC96IpLGTo9BYafq2ZyAoztFKgfopOh
 BG1Vg6B580jtnw0YUw19+Wp4iE0OhvDENmI4w5JQ/WIbJPpnou4TZtqVgpPYR3a8AuU9
 6toIGS3gbSrAH1ZhiNn16F/10PL7nHfHDrbFrdbFmWPsKoa8gsOzvpUcDwsekiIf041K
 bTwg==
X-Gm-Message-State: AOJu0YzL/hMEvJN966yRwHmTdDt80wccLgzD4bXM85Mx5oTD9q0+emM8
 xEjLZO6jQIJb4f7kwtFsvyBCNlTEIl6Bz4MttHkGqFCXSisjesI4nMuyWdYSk2J2
X-Gm-Gg: AeBDieumq3vsQA1W6aZy5TD4dUocSrMolF0CHT+8vRxLDkOYE1twAcU1nVY9cQ1ObBA
 Gzb1/3CxuX7HhZg8qVEE0RJKAYZCUjcN2vi3NC3cr61F17KJo1z5GJVtfM9rYSDJfVCGDu6t563
 +Dg6VvWOfSUD/LN4m9hZ4FAoc93ZijyT2Vdy3vu3sFohCB0wea2GNWtP5ldJPoD9lO/z5MMDk1y
 AFBhlyohImqcqqg6mIvmQvynw3MkVNzImizcJdMT0vYm0+d+bxMLk+8IrcovRKlzh9cZvgy4Idi
 TbodWUMy5OWnK/b3rpXnn2shgtns8UcAYSQimZFuYTdSpphwNAOO/UEGTAiX6ZMqPotv0l/VeOA
 V7dESPnzCBNcqesm4YWGwPcegRdleCCBGRizcVnQv/zdbdxW7Zs7LJPqeNcDGIqHZdkjhrlX5Yq
 cFw+DEDjBo9vbDUyhfJZsthmt4Ad7KUCGPkjQS2aWVW42OqjpB5c19m1hdSswAroKxBTXzbqot
X-Received: by 2002:a17:90b:2888:b0:35e:58d3:329f with SMTP id
 98e67ed59e1d1-36140468b1emr29417118a91.13.1776939484248; 
 Thu, 23 Apr 2026 03:18:04 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3613fbd470fsm7301277a91.12.2026.04.23.03.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 03:18:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/i915/display: enable ccs modifiers on dg2
Date: Thu, 23 Apr 2026 13:17:39 +0300
Message-ID: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
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

Fixes: 6a99e91 ("drm/i915/display: Detect AuxCCS support via display parent interface")
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d31819758f3d..7a73461d398a 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -54,9 +54,11 @@
 #include "display/intel_bw.h"
 #include "display/intel_cdclk.h"
 #include "display/intel_crtc.h"
+#include "display/intel_display_core.h"
 #include "display/intel_display_device.h"
 #include "display/intel_display_driver.h"
 #include "display/intel_display_power.h"
+#include "display/intel_display_types.h"
 #include "display/intel_dmc.h"
 #include "display/intel_dp.h"
 #include "display/intel_dpt.h"
@@ -749,8 +751,9 @@ static void fence_priority_display(struct dma_fence *fence)
 static bool has_auxccs(struct drm_device *drm)
 {
 	struct drm_i915_private *i915 = to_i915(drm);
+	struct intel_display *display = i915->display;
 
-	return IS_GRAPHICS_VER(i915, 9, 12) ||
+	return IS_DISPLAY_VER(display, 9, 12) ||
 	       IS_ALDERLAKE_P(i915) ||
 	       IS_METEORLAKE(i915);
 }
-- 
2.43.0

