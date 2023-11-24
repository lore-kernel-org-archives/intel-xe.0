Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A6AC61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 14:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04AD10E7FA;
	Fri, 24 Nov 2023 14:04:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421B10E0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700834639; x=1732370639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QfspvCl+rYvkpZDsFBC0Bhi7nDrdJCi9J8wgLULSor4=;
 b=DhVwHvMCxpxcAl/bohGD4ZITtAgdc01EMdqFJ08FXYHvhPq6gtXx/Ux2
 OY41jxIqIJfJQ3K8eMN73S+sFxMvNwGAoRrnf3uBkEebp40Xht9BSiwyx
 3bTv96QM8NeC7Z0/xAFzlsfWVf2u3ur112BDFZ/LGaj9jlyT+KfLcjHTy
 3AS5UzqWLJp1NpoaPgkDiYzclNU1AEukT9JwZkSxSL8NlQeiVD5QYIX6k
 uk+f3ZivCzHXd1ykoKT/1gEY5TjESCKzs8ME7Ay/p3HgEe18NqE2JMH8N
 Rbw2WStpCuDE8drirJa2WGR+3YpfWNJOM937SynA08ItK1BUWwjrYT1aV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391302263"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391302263"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 06:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="760968473"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="760968473"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 06:03:57 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 19:43:11 +0530
Message-Id: <20231124141311.3894165-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
References: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 3/3] drm/xe: Move device sysfs init out of
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
index 6c8a9f9d69c9..5f115e496707 100644
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
@@ -450,6 +451,8 @@ int xe_device_probe(struct xe_device *xe)
 
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

