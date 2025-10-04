Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4020CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 00:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D6C10E04A;
	Sat,  4 Oct 2025 00:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiyJX1GC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923C310E04A
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 00:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759536403; x=1791072403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gBDpyVyCoUZhRexmH2/P5lIaz9VbAgdZ4hBW7wH7hgs=;
 b=MiyJX1GC+ygQpHqhQ1lG4wIHucIYh2jQ12vKyfxKYVSzAsNTeBlwBSHP
 ll5kX3flRo8oYidm8duI1T58/YofZAIUwiROU60NN7dyW4DE4K5nOrYSD
 5chAurDpcToL6Viz7IkdSOqHP07rWpEuLLqWZz3iDNxnvJ/JniyntmjSj
 WNYziIS8IJpRf0dYzdXmL46nT1Tno6W+NinLn7xcHJPP5yuZJarR/eWKP
 pTkSqqSERGJe9mOJYxvBdgc9edfb9og5ZkB5xXNTD/xTfK8r8ihn3tjtb
 C+dVzM6lQEVkFUDfta0lyruN8TuCsoJh00SkPYMSloDhYPbEa1vQgFd/K w==;
X-CSE-ConnectionGUID: rNUoGiByTNOSf1uveBHN0A==
X-CSE-MsgGUID: 9JRRXvudTUeZN5JLaB7I9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72495698"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="72495698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 17:06:43 -0700
X-CSE-ConnectionGUID: 5e9ASUFLT7eoXrGRUKHlRQ==
X-CSE-MsgGUID: 0KPG++lRQICpWUn4aCY0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="184686121"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2025 17:06:42 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Fix copyright and function naming in xe_ttm_vram_mgr
Date: Sat,  4 Oct 2025 00:03:31 +0000
Message-ID: <20251004000425.2489291-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

- Correct copyright year from "2002" to "2022".
- Rename ttm_vram_mgr_fini() to xe_ttm_vram_mgr_fini() to avoid
  confusion with generic TTM helpers.

No functional changes intended.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9175b4a2214b..9f70802fce92 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2021-2022 Intel Corporation
- * Copyright (C) 2021-2002 Red Hat
+ * Copyright (C) 2021-2022 Red Hat
  */
 
 #include <drm/drm_managed.h>
@@ -284,7 +284,7 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
-static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
+static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_ttm_vram_mgr *mgr = arg;
@@ -335,7 +335,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
 	ttm_resource_manager_set_used(&mgr->manager, true);
 
-	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
+	return drmm_add_action_or_reset(&xe->drm, xe_ttm_vram_mgr_fini, mgr);
 }
 
 /**
-- 
2.49.0

