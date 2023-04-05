Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DDDC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 17:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D84210E22B;
	Wed,  5 Apr 2023 17:13:10 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA910E22B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680714789; x=1712250789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wQo5skaO1GNDEc7kddeq1PGNPRWSXCwBW/hHC7HYXJE=;
 b=IL8cqJPIGOpepacNI0/cYO7U7nzVsYexKQExfdMnyDOXpDvjKnUuBLC6
 siJzUQgogXCZe13bnwkcJPMzgEz14nTb5Ea5dcFyQ+zEpFjdN0YuW5GkV
 eFqjwUM5RfO7yrG0DXjwS+1kiwlEkV1lY1E12aePFJKNr1UtUKz+FW7TU
 vV1zCctnbsGkK/p7ugsL5MI5Ev064R9B4VmViDtbNygL5alNv6b6H7GYX
 tl0q9kmdHs5zHhMq9B/d9RkLYLGEZS/cn1NJrhM96JyV+ZpPjwQIhvPGC
 PnuKnz5AJJHLViYZd01Hja8wo4i30ROvcMiVllwFp+/VZkI3jED6PRp7s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344240803"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="344240803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 10:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717117511"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717117511"
Received: from dut731-pvc.fm.intel.com ([10.1.40.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 10:13:07 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 17:13:03 +0000
Message-Id: <20230405171303.525412-1-yu.bruce.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc unload
 issue
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, "Chang,
 Bruce" <yu.bruce.chang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

created xe_ttm_sys_mgr.h as suggested by Lucas
also fixed a compile warning found by Lucas

v2: fix a comment format issue

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c      |  1 +
 drivers/gpu/drm/xe/xe_device.h      |  1 -
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
 4 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4fb9aff27686..85caf81ae686 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -27,6 +27,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_ttm_sys_mgr.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d9d1b09a8e38..d277f8985f7b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 }
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
-int xe_ttm_sys_mgr_init(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index cf5f4f73d4dc..9c2f7d4936d8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -12,6 +12,7 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_ttm_sys_mgr.h"
 
 struct xe_ttm_sys_node {
 	struct ttm_buffer_object *tbo;
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
new file mode 100644
index 000000000000..2f27d9117b54
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _XE_TTM_SYS_MGR_H_
+#define _XE_TTM_SYS_MGR_H_
+
+struct xe_device;
+
+int xe_ttm_sys_mgr_init(struct xe_device *xe);
+
+#endif
-- 
2.25.1

