Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3DBCD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 19:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BF910E46A;
	Tue,  9 Jun 2026 19:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmLXW9Kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F64C10E46A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781035039; x=1812571039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ox185Y3rQ17ed8VHrzA+pFhAnz55Sy8WNGoKZkyHVE=;
 b=AmLXW9KnGOrB98oDgGz1QNb8Bx+zP67HXz5Lq6/W0hNZ5KMTvdQtVipL
 goblw6SlGygmJ7WjncdUdbZThl9zKpVTQP5vNq7ohtJ80OQpEo8H3CWc7
 v4fspUfty14J4MN9H9/qH4zuQgGLyCEe9fNX1jaa+NYtqCkXQOAxBGCC2
 EVjUZDR1d0t3USQ7jvDl/g5TvXxhWmwrc7lWZA0J3jF9aDiyMM+nCqBjN
 K2O2gcJg7ZXCnSEOjyXhVSrgjboSqBYrO+TM+bdR3Cq2fuGcWezxZarU+
 sChCF6NrEtyybhdXeIH3nQTCbUbG+0PmONy/xIruTVLdmuMKeDD7+0IfS Q==;
X-CSE-ConnectionGUID: 9o3A+pTnTtaAJIcdrmmOcA==
X-CSE-MsgGUID: qac0pKbnQZSvUMpkb1FI8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93200178"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="93200178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 12:57:18 -0700
X-CSE-ConnectionGUID: wqmXNlThSNqxtR5mXkd1Mg==
X-CSE-MsgGUID: CVoOAvq3RlScizsBB94AQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="239618134"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 12:57:15 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/debugfs: Expose per-engine idle status
Date: Wed, 10 Jun 2026 01:21:50 +0530
Message-ID: <20260609195149.616010-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a GT debugfs entry that iterates over engines and reports
whether each engine is active or idle. This can help debug C6
issues by identifying engines that may be preventing the GT
from going idle.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 31 +++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f45306308cd6..d404467146d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -10,6 +10,8 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "regs/xe_engine_regs.h"
+
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -115,8 +117,10 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_hw_engine_id id;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		drm_printf(p, "ERROR: Could not acquire forcewake\n");
 		return -ETIMEDOUT;
+	}
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
@@ -124,6 +128,30 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static bool hw_engine_is_active(struct xe_hw_engine *hwe)
+{
+	u32 head = xe_hw_engine_mmio_read32(hwe, RING_HEAD(0));
+	u32 tail = xe_hw_engine_mmio_read32(hwe, RING_TAIL(0));
+
+	return (head & HEAD_ADDR) != (tail & TAIL_ADDR);
+}
+
+static int hw_engine_status(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+		return -ETIMEDOUT;
+
+	for_each_hw_engine(hwe, gt, id)
+		drm_printf(p, "%s: %s\n", hwe->name,
+			   hw_engine_is_active(hwe) ? "active" : "idle");
+
+	return 0;
+}
+
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_gt_mcr_steering_dump(gt, p);
@@ -240,6 +268,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
+	{ "hw_engine_status", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engine_status },
 	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
 	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
 	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
-- 
2.43.0

