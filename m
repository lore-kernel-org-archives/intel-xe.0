Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BD4C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 13:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B1E10E75A;
	Wed,  8 Nov 2023 13:45:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE4F10E758
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451147; x=1730987147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pNOlZXUa3Cxaw3anRzcpZ6zpbNlC4dxjhfnUFVhA7Qs=;
 b=G5jYls8bkzoaNoXcnqhk6dtug295QN0TsTORo1pR+qczlAdmD4WsrMMR
 B56ETX68IFbteOFO1hlJQql5lBrPtcuz3O/GSPhmbFqQVqERtIsGaUZzL
 FF3r0HxZCXdekVtQm+3Xfr3bSPwbEdh2fpuFuZ3UpxpZSjuNNcb/Nifvg
 JcQznHc/oUjGCBckH8FZdzXWQ9Q4aA/Sb+gnPVM0MU9cDyIUbcXOu0/3O
 zcVqQ4Y4vVWOLGoJI1OkDhHEqMm/bI7TYSVn94HzqOO0lSfebEUroMYVr
 lGK/Re4kaqCMcsGAxBzEYJNksGNrf6bIYCX6iIAwOofLEMXNrPCn7+abW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2711242"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="2711242"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:45:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936513475"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="936513475"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2023 05:45:24 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Nov 2023 19:24:18 +0530
Message-Id: <20231108135418.3049168-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Move device sysfs init out of
 xe_pm_init
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

Device sysfs needs to happen right after device probe.
Currently it is under xe_pm_init() which does not look
correct now as we add more sysfs entries which are not
specific to PM.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_pm.c     | 5 +----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 266e0d5d7159..8b6845e29bdc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -18,6 +18,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
+#include "xe_device_sysfs.h"
 #include "xe_display.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -452,6 +453,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
+	xe_device_sysfs_init(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e31a91cf311c..32009da9bfeb 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -13,7 +13,6 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
-#include "xe_device_sysfs.h"
 #include "xe_display.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -175,10 +174,8 @@ void xe_pm_init(struct xe_device *xe)
 
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
 
-	if (xe->d3cold.capable) {
-		xe_device_sysfs_init(xe);
+	if (xe->d3cold.capable)
 		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
-	}
 
 	xe_pm_runtime_init(xe);
 }
-- 
2.25.1

