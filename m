Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F5AC7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4138C10ED2D;
	Thu,  6 Apr 2023 20:48:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D27810E368
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680814100; x=1712350100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mHeOCVILZjDpUKbAay+kYSXHBuwma9RI9YGiiZYkoN8=;
 b=RTFmvnnQKhBNGpnAwYO8vpFZefu+CBybOGzx7bseDl2UMvxsetTbCPnM
 osRTj5Z7e35c1CU3hyNGDcbmv1hdmywafGqv3lxPuZPJfeaJvnQeglhIj
 5oIG/4k3bk7hHrvm4gi28KwunMTUPdgL+DgVlNJC4FKCInd7awCBh3jVG
 GBAIgk9avusFOSSwdL2gTg+h/UGr0/sbawP1v/bjTfuxWKWDNa9ynVUSe
 4r6lxcnjyksjyCtuqUqVfRp7SC9NfOnssHbRU5Vdf32g0JQz4lKcvQZkS
 slSb0WOuVHT7pcdxi5ylgZNrIYXZa3uVzC5wJTMl0AmaF53fOE4eMssFf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370674525"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="370674525"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861534185"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="861534185"
Received: from dut731-pvc.fm.intel.com ([10.1.40.73])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:48:19 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 20:47:45 +0000
Message-Id: <20230406204745.272945-1-yu.bruce.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: fix pvc unload issue
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

fixed include file orders
added last empty line
fixed copyright year

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c      | 2 +-
 drivers/gpu/drm/xe/xe_device.h      | 1 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 ++-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 85caf81ae686..45d6e5ff47fd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -27,8 +27,8 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
-#include "xe_ttm_sys_mgr.h"
 #include "xe_ttm_stolen_mgr.h"
+#include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d277f8985f7b..cbae480a2092 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -116,4 +116,5 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 }
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9c2f7d4936d8..5b0674bbb8ed 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -4,6 +4,8 @@
  * Copyright (C) 2021-2002 Red Hat
  */
 
+#include "xe_ttm_sys_mgr.h"
+
 #include <drm/drm_managed.h>
 
 #include <drm/ttm/ttm_placement.h>
@@ -12,7 +14,6 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
-#include "xe_ttm_sys_mgr.h"
 
 struct xe_ttm_sys_node {
 	struct ttm_buffer_object *tbo;
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
index 2f27d9117b54..e8f5cd395b28 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2023 Intel Corporation
  */
 
 #ifndef _XE_TTM_SYS_MGR_H_
-- 
2.25.1

