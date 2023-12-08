Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF57EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 00:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537D10E23A;
	Fri,  8 Dec 2023 00:22:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4656010E1A7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 00:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701994950; x=1733530950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEzhpscDfGQ/XV6BHHmVgzItnW60xVq/IG7ErqMn4Rc=;
 b=Kcvz7d9KrMxClX8FVnx/cl/giLbpT17aI8m/0HrAoufzVEYKHr0j2zIE
 24nNHlTfA6MDB3Wmia/btrSw1A6tgqA4IdIGtApvuaE7sZWe6vMCl6w+y
 pcmJs0wR8O8J9wSrfT+0zxGWAH6ybBgkmE3O4Y5jDWVyMdGUdeQX7PYx1
 pHPMFWu0JE3I7DmZtBe13LyRaMGvr4XWWvGIpIL6hkog7Mke60TufxLRh
 26Ub/LftnHegVuoy5QUjQbDaFoMXVh6kDwFn/Y56UWMKaU8QG++wWVbTh
 IcXiNs3/DEogKARjj53CliufmfhqFQqZVMsIJ+vvd1zc+4ye4A8pMUO0P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1214059"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1214059"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 16:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019156280"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="1019156280"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 16:22:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe/uapi: Add IP version and stepping to GT list
 query
Date: Thu,  7 Dec 2023 16:22:21 -0800
Message-ID: <20231208002218.1287673-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208002218.1287673-4-matthew.d.roper@intel.com>
References: <20231208002218.1287673-4-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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
index 56d61bf596b2..a8df9ab577e8 100644
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
+		gt_list->gt_list[id].ip_ver_rev =
+			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
 	}
 
 	if (copy_to_user(query_ptr, gt_list, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..aff73c908d8d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -397,8 +397,16 @@ struct drm_xe_gt {
 	 * memory and memory living in a different tile.
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

