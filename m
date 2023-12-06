Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1737CC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 20:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0A610E7A4;
	Wed,  6 Dec 2023 20:50:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B0710E7A4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701895843; x=1733431843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3UJJhUBW7ibq5xVHAIhfyu8dS8HrpyWbD+Xr8SUUzc=;
 b=bn++5BCpqELeL3AYByWw+0FeNprkm0FeZwOiz3d0zAC2Kt6DeHfSH+bz
 H4yo0NUx1u83n+brsESN6KcUQrYlQq7BG4xwCszFl0Gbyxcf7q9FTNHOD
 mG7SfrQbivKVgCTz7VEDA1OKszkmYZstJFm+DjCxdi9BurpOQWkv7elKF
 VXaakaq5Sgo6+s7rS6YFHghS6tTqU/xHfLRu3IF5sg4SSlCImfgLmjZ3O
 uPpyfbOGN3Um1DVu0wVZxW7l6asWX4Bz/ANBIW5sAxoqukTEEx2If+nlb
 xNZwWVMeQaXenfugHtqsObB5ZF0oiyU7j6NRXMZ6WLIjkjKNmcE5H/O/h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425274650"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425274650"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805768416"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805768416"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:50:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 12:50:37 -0800
Message-ID: <20231206205034.1105637-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206205034.1105637-4-matthew.d.roper@intel.com>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Add IP version and stepping to
 GT list query
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For modern platforms (MTL and later), both kernel and userspace drivers
are expected to apply GT programming and workarounds based on the IP
version and stepping self-reported by the GT hardware via the the GMD_ID
registers.  Since userspace drivers can't access these registers
directly, pass along the version and stepping information via the GT
list query.  Note that the new query fields will remain 0's when running
on pre-GMD_ID platforms.  Userspace is expected to continue using PCI
devid / revid on those older platforms.

Although the hardware also has a GMD_ID register for display
version/stepping, that value is intentionally *not* included anywhere in
the Xe uapi.  Display userspace should be using platform-agnostic APIs
and auto-detecting platform capabilities rather than matching specific
IP versions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  8 ++++++++
 include/uapi/drm/xe_drm.h     | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 56d61bf596b2..c3e5163d40da 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -12,6 +12,7 @@
 #include <drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -388,6 +389,13 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 				BIT(gt_to_tile(gt)->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
+
+		gt_list->gt_list[id].ip_ver_major =
+			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
+		gt_list->gt_list[id].ip_ver_minor =
+			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
+		gt_list->gt_list[id].ip_ver_revid =
+			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..d84622f54e4b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -397,8 +397,16 @@ struct drm_xe_gt {
 	 * memory and memory living in a different tile.
 	 */
 	__u64 far_mem_regions;
+	/** @ip_ver_major: Graphics/media IP major version on GMD_ID platforms */
+	__u16 ip_ver_major;
+	/** @ip_ver_major: Graphics/media IP minor version on GMD_ID platforms */
+	__u16 ip_ver_minor;
+	/** @ip_ver_major: Graphics/media IP revision ID on GMD_ID platforms */
+	__u16 ip_ver_revid;
+	/** @pad2: MBZ */
+	__u16 pad2;
 	/** @reserved: Reserved */
-	__u64 reserved[8];
+	__u64 reserved[7];
 };
 
 /**
-- 
2.43.0

