Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD2CC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 17:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AC710E49B;
	Thu, 15 Aug 2024 17:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m79A1Xv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47E310E49B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723742781; x=1755278781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SNp3E+5xupIQ8fSQuBj/mQAouiT/H1fYxe0OrkIZm+o=;
 b=m79A1Xv25b/LXSK9qVuS7iAYqDOb3rzu2tTbf+IrZZ671lKRcxgyof7o
 e3EG96/ipcbzo39P4RQNfMc9IAud1YVyRx/eiMpRHCKl4q8Dw31qIQwm2
 oHWme8MAFp0g9D4kT+pp2M+cmXT6yjdSksMWQNYvIRjAU3U+esORYx6/I
 k6n+3f/iHR47AG6THRZeom98YY1o8z9b4tk+PgazNNEAdiQN3oZkOxz3B
 G6GwJ9G1x9x0SWK48kycLreWJrVoSvkRqqCK3JT4M8AVElpEK6hCf2G6h
 hEi9/wfQXLc3OQwwSuuyBJAXUTpCi4G0pknnHAQU/1VgtYdnvFPw9Pi91 A==;
X-CSE-ConnectionGUID: RxHyXnpRSFCeGWbFRInSLQ==
X-CSE-MsgGUID: e1oT4D8uTZ2lv7U8vB/cgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22183514"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22183514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:26:21 -0700
X-CSE-ConnectionGUID: QjL9vMthTdC8kjbK/Mezjw==
X-CSE-MsgGUID: 5Tj+HlOcT6q0w3tUWIWdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="82616551"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:26:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Date: Thu, 15 Aug 2024 10:26:03 -0700
Message-ID: <20240815172602.2729146-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

Although the query uapi is the official way to get at the GuC's hwconfig
table contents, it's still useful to have a quick debugfs interface to
dump the table in a human-readable format while debugging the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
 3 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5125d76ccfac..8f95d3a5949b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -19,6 +19,7 @@
 #include "xe_gt_sriov_vf_debugfs.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_topology.h"
+#include "xe_guc_hwconfig.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_guc_hwconfig_dump(&gt->uc.guc, p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
@@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
 	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
+	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index d9b570a154a2..025bad701556 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -6,6 +6,7 @@
 #include "xe_guc_hwconfig.h"
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
@@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
 	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
 			   guc->hwconfig.size);
 }
+
+void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
+{
+	size_t size = xe_guc_hwconfig_size(guc);
+	u32 *hwconfig;
+	u64 num_dw;
+	u32 extra_bytes;
+	int i = 0;
+
+	if (size == 0) {
+		drm_printf(p, "No hwconfig available\n");
+		return;
+	}
+
+	num_dw = div_u64_rem(size, sizeof(u32), &extra_bytes);
+
+	hwconfig = kzalloc(size, GFP_KERNEL);
+	if (!hwconfig) {
+		drm_printf(p, "Error: could not allocate hwconfig memory\n");
+		return;
+	}
+
+	xe_guc_hwconfig_copy(guc, hwconfig);
+
+	/* An entry requires at least three dwords for key, length, value */
+	while (i + 3 <= num_dw) {
+		u32 attribute = hwconfig[i++];
+		u32 len_dw = hwconfig[i++];
+
+		if (i + len_dw > num_dw) {
+			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain\n",
+				   attribute, len_dw, num_dw - i);
+			len_dw = num_dw - i;
+		}
+
+		/*
+		 * If it's a single dword (as most hwconfig attributes are),
+		 * then it's probably a number that makes sense to display
+		 * in decimal form.  In the rare cases where it's more than
+		 * one dword, just print it in hex form and let the user
+		 * figure out how to interpret it.
+		 */
+		if (len_dw == 1)
+			drm_printf(p, "[%2u] = %u\n", attribute, hwconfig[i]);
+		else
+			drm_printf(p, "[%2u] = { %*ph }\n", attribute,
+				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
+		i += len_dw;
+	}
+
+	if (i < num_dw || extra_bytes)
+		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
+			   (num_dw - i) * sizeof(u32) + extra_bytes);
+
+	kfree(hwconfig);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
index b5794d641900..7df315900e1c 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
@@ -8,10 +8,12 @@
 
 #include <linux/types.h>
 
+struct drm_printer;
 struct xe_guc;
 
 int xe_guc_hwconfig_init(struct xe_guc *guc);
 u32 xe_guc_hwconfig_size(struct xe_guc *guc);
 void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
+void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
 
 #endif
-- 
2.45.2

