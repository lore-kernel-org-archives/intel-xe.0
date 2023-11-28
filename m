Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2A4C46CA0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D71C10E568;
	Tue, 28 Nov 2023 15:04:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F23810E563
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701183858; x=1732719858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhrPp1JWy2lJGVD3NfY5HLvP8BzAM3rOYF8Mu2fu+oA=;
 b=E3c32UDb/kVdTzyF3pXUTxoc0TLWe37VQHdIgbxfbUuGKvJnGAKBdiMU
 gF8dZgJafvZE58tR2njkTCa332eKkqpdI91NKjH54fwZDHqx2Z6cyOwjY
 TYSngIZ7nvV5wj1g5SBGtx0bLwXDfTe9ALWcMWTiVLF1apFt0Wl5rW+pF
 bNR6busEiozqXJoeHI7dS+5yRcjxsDrR9OT6XDtw4gp/X/8mYPyUTc6NY
 qZGMLckL+okCjVcVzEVSiPv3OZqIjVYz31P1oD7o2Q+xiVTD6kdr1mTQD
 tN1yxUSmgdy2IWW34n33WIBT9GGRcbqD/UhSitZkkBBuhCoAmrXVRb1RQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395757873"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="395757873"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892096598"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892096598"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga004.jf.intel.com with ESMTP; 28 Nov 2023 07:04:15 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 20:43:33 +0530
Message-Id: <20231128151333.4068550-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 3/3] drm/xe: Move device sysfs init out of
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
index b54635d512d6..c8b592acb5b2 100644
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
@@ -463,6 +464,8 @@ int xe_device_probe(struct xe_device *xe)
 
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

