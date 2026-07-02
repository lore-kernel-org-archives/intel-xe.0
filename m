Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F65C44501
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 13:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC80210F375;
	Thu,  2 Jul 2026 13:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HfZ+62KK";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFA910F2F2
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:28:28 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-847852f9bdcso93949b3a.3
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Jul 2026 04:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782991708; x=1783596508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v0OaAWjYlIYRoMyv8XepLU2uh7OE86lEeTjyFLs3I9Q=;
 b=HfZ+62KKNtRauXSnnhc3eelWaW5dODV3M8GX2c0Cu2OwlR2t+hACKQ21rsc9dnabgU
 Pj0b7Pz8EUzrmhNB2ukDa8x7wxXwAok5x+2Z7bVTzngv5xSx/4n6WRvy7NFvQ4EnvJQu
 TzlCHErmuIWPsM11gk9zZ4W1S46bEnkTieSGxNOwLt6iGpiDEuXOS2Pwo1ap1rdMpoge
 7xIlH0CZNu2fvCpiWxorOL/9o/jEHas2Mrpl69vSqluAk0L7jkw5kGgJNBT7A4oogNwT
 ha9bbeQKxri2a4IShPaVpmLf/GwS90Ql9htPJW+EWInjprjhJUs0UvAirBS4GYRhWIXk
 aqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782991708; x=1783596508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v0OaAWjYlIYRoMyv8XepLU2uh7OE86lEeTjyFLs3I9Q=;
 b=SrmiApAl2srguOysBwhji4I1KqQz4m2EFKqNfIUBNz/tiOBdFO8rQHDUZ66xBp07OR
 z38Sk2zTQXO4iRyUi1CPwhiNip8OGInnreaxZzDCQHRxk2xwhvQ2hsB6zQrEXPZHrBfa
 9luyRW13VbQUiwD4ZryM0b0OFL06saFOSlFEI71fawWkMVN6jNySU1I89jsuHDEgkiKI
 RFRYT26uQjgqexVnO04EhRON5921dcDMsIfKdpaFFd6z1y4YVwiZvKxKgIid0fnKQnJU
 LJV7hOpdcfk3RnINGVPDUog3sHNsCW9V4eJFwkOK/Iu8+6Uo+CKAd2yeyx+VwRisZ41V
 EtQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xrAAjCxNSsJT6/E/q53XYkqCG+g7p1PSe0vd7L8zqVpE+ajf+yT6vmRinbwJYW4VcZTStuuP8Vw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFPNhvI6nXH2gXwIvbEYFwAvGJL07hLNtQ62dDRH4g1GWp1U72
 uOpDDgnRitPNnzxhjHZSgHx7vxCXa2ViI7KyjFGypkqDW6KQmCUA6MjqR4vOomvo2lWuxw==
X-Gm-Gg: AfdE7cm0AZ5qI4hl1GrzVm5dwBBuzTAeA8n9MC0kBZ5deyNHDunwgn63mnJnbpirZGk
 PlRZUCe/vqkocHnlTbTHegLlm0QpBgAf0Hle9MMGbwAAinQWnnAgiazPwjHSyf18CAlzmbGW6We
 d4KmhdILBnp0ECVbx/qgYNWy7pzgLv7L97NoJuamX/PIDAXu9qwI+Aekyh0Z2wmEcpWUV3tgjKh
 HURQPwPIKwXKefuW7Lrq7xCqjFg+tjGeiFxFUCr4CqwdfhniyMntcS+JSje3cbRH2I99BBVICcE
 Efs34xI/bbamsXNDh+63iunYFevtIWTXWHDArZcgKJFbUiDtymJUI2erTzBgWq7P10WKQjxUa0V
 9n0AXpqygliXQ4OSJGiJ1Hnekcj4ExRckdrYo3fBmictyU+lC6xu0HtifJ49nYoTA7T2sPOmb4n
 tBtHbWQVfYKSKXhTzLGCML/ez4AZ0Sc+LonElqpt1ANbQvFmK8L/UqZet86AY6nY/Y8VfprffUh
 8eC21Fsrnzv3IPDoyKAOBTU1NqTehBltLd0cLKKDmsmVHwPaOg0Oouyc/gUHlVjvxfgneGrNBmA
 kamUfL6+mUkILAhyRTqlqWGuvVeNNfW5ziwR6w==
X-Received: by 2002:a05:6a00:1786:b0:82f:99c5:868d with SMTP id
 d2e1a72fcca58-847c0878178mr3165665b3a.4.1782991707959; 
 Thu, 02 Jul 2026 04:28:27 -0700 (PDT)
Received: from midnightair ([2401:4900:1c94:62e8:bc10:77d0:2fda:415d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847cb76c0b9sm1244995b3a.21.2026.07.02.04.28.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Jul 2026 04:28:27 -0700 (PDT)
From: Anas Khan <anxkhn28@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <demarchi@kernel.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Anas Khan <anxkhn28@gmail.com>
Subject: [PATCH] drm/xe: remove duplicate <kunit/test-bug.h> include
Date: Thu,  2 Jul 2026 16:58:20 +0530
Message-ID: <20260702112820.34675-1-anxkhn28@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Jul 2026 13:06:08 +0000
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

xe_pci.c includes <kunit/test-bug.h> twice, separated only by the
<kunit/test.h> include. Drop the redundant second include; this is a
non-functional cleanup flagged by scripts/checkincludes.pl.

Fixes: 6cad22853cb8 ("drm/xe/kunit: Add stub to read_gmdid")
Signed-off-by: Anas Khan <anxkhn28@gmail.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 9240aff779da..c2c686aed1cb 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -9,7 +9,6 @@
 
 #include <kunit/test-bug.h>
 #include <kunit/test.h>
-#include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
 #define PLATFORM_CASE(platform__, graphics_step__)					\
-- 
2.54.0

