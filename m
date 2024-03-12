Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0724CC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 21:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7F910E704;
	Tue, 12 Mar 2024 21:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvML6b5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A05710F206
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 21:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710277950; x=1741813950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yfPZm9jsD8mmt+PH35vFSLaVvMWU4nowRZWMI5zJaLw=;
 b=dvML6b5vBbzwmNP+OVY93QBDd9BfU12TLfaTGwZxG18a1Rpx8CQ4CmhD
 q7eR9ER2MaJ//3V7tUIAh5pyFFJ1hYNset7gbGa54ZzuOzQxarSoeog/k
 F5Y1kNPqUgUEon2uFezpuV2yjgbnHJgcy5lL2dUAJTVS6hCHQRyxPNRUi
 zPLef8g6P5SQKyWfOCsGgNoNM29xE3hN5V7k0dQ78FQyLcQoBZVE5yiKO
 UlL4As5uTDb3OJae6TZJ9EsKZimhbSyIMOiIKnTlev8vL2iTbm7vDOxho
 peWzzesbnmFpRHCFpjbFaDWhhO4ZUVBh64Z91W2/9VTY4WODDTIupbwp+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5143315"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5143315"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11572048"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:12:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 1/1] drm/xe/uapi: Add IP version and stepping to GT list query
Date: Tue, 12 Mar 2024 14:12:25 -0700
Message-ID: <20240312211229.2871288-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240312211229.2871288-3-matthew.d.roper@intel.com>
References: <20240312211229.2871288-3-matthew.d.roper@intel.com>
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

For modern platforms (MTL and later), both kernel and userspace drivers
are expected to apply GT programming and workarounds based on the IP
version and stepping self-reported by the GT hardware via the GMD_ID
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

v2:
 - s/revid/rev/  (Lucas)
 - Fix kerneldoc copy/paste mistakes

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  8 ++++++++
 include/uapi/drm/xe_drm.h     | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a6a20a6dd360..e80321b34918 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -12,6 +12,7 @@
 #include <drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -401,6 +402,13 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 				BIT(gt_to_tile(gt)->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
+
+		gt_list->gt_list[id].ip_ver_major =
+			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
+		gt_list->gt_list[id].ip_ver_minor =
+			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
+		gt_list->gt_list[id].ip_ver_rev =
+			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2fc19177d2b0..808ad1c308ec 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -459,8 +459,16 @@ struct drm_xe_gt {
 	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 far_mem_regions;
+	/** @ip_ver_major: Graphics/media IP major version on GMD_ID platforms */
+	__u16 ip_ver_major;
+	/** @ip_ver_minor: Graphics/media IP minor version on GMD_ID platforms */
+	__u16 ip_ver_minor;
+	/** @ip_ver_rev: Graphics/media IP revision version on GMD_ID platforms */
+	__u16 ip_ver_rev;
+	/** @pad2: MBZ */
+	__u16 pad2;
 	/** @reserved: Reserved */
-	__u64 reserved[8];
+	__u64 reserved[7];
 };
 
 /**
-- 
2.43.0

