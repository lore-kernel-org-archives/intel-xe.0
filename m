Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36CBCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E61B10E45F;
	Mon,  6 Oct 2025 20:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYLms3NZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F086010E45F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759781786; x=1791317786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bw/tuNIz6ouKTdCliI5QBzUmwXwDyuJ2UE05HELoc6o=;
 b=dYLms3NZc54ZmVOTJn9Ntwb4aJsWVRhOGKA2Ur8fjx+6acH/nrPq2b/7
 Dl4aY3QqvfqGJn1Wz5WMD9gfxfZ0sHJQchAo+wmyzKQJbyFW8Bo90vhsB
 R9OGTK3UuVrL4gB3UOzQ0s+wBtfhUTWglnuTlQ81gRwL+fJ2Qy5MK0S5S
 +dNj/7Gmw9c67XSFhFtC7wWUcavwjxBodMvDjJ6lJ07ZOLv4S7vBLMGOD
 eaKu1cTeicpTYM8XO03wTKj14UdJo7SgRxUCc1ZvZB2kVoa1g4X4tAkPy
 L4pHdJa2mysWMNeNKwYFbYoQ05MGggALj7TWm9WSrIDGepLhPjNY69srS g==;
X-CSE-ConnectionGUID: NqH1CdpcRraVd28BJSdmlQ==
X-CSE-MsgGUID: 6MIZBpcNRT2bRa2Oznw3Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61998397"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61998397"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:16:25 -0700
X-CSE-ConnectionGUID: xx3WuaMJROeJFCMUw3nPnA==
X-CSE-MsgGUID: nO4NlbslTxS4a18OkfLpGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185245459"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2025 13:16:25 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix copyright and function naming in
 xe_ttm_sys_mgr
Date: Mon,  6 Oct 2025 20:13:25 +0000
Message-ID: <20251006201339.2603160-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006201339.2603160-5-shuicheng.lin@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
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

- Correct Red Hat copyright year from "2002" to "2022".
- Rename ttm_sys_mgr_fini() to xe_ttm_sys_mgr_fini() to avoid
  confusion with generic TTM helpers.

No functional changes intended.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index d38b91872da3..3e404eb8d098 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2021-2022 Intel Corporation
- * Copyright (C) 2021-2002 Red Hat
+ * Copyright (C) 2021-2022 Red Hat
  */
 
 #include "xe_ttm_sys_mgr.h"
@@ -85,7 +85,7 @@ static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
 	.debug = xe_ttm_sys_mgr_debug
 };
 
-static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
+static void xe_ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = (struct xe_device *)arg;
 	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
@@ -116,5 +116,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
-	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
+	return drmm_add_action_or_reset(&xe->drm, xe_ttm_sys_mgr_fini, xe);
 }
-- 
2.49.0

