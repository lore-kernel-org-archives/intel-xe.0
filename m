Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9D3CAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 16:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4316310EA50;
	Fri, 19 Sep 2025 16:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSnCurTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431A110EA50
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758297883; x=1789833883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4F/KHO0LxqITovKMAJ9ViMKfFozfYrebN113nYyUqM=;
 b=CSnCurTyhZX4n3WxnYMtkfs4DiNbVYZmMUMUc3Lxqvxl0so5FaQ/2j22
 ohwj/DJ5duxA1kD60XUH2trtMhr/Ue3EVgUPNlR/mVin7KEZPO1wGjOJe
 kcpJj2cE7YW8cAAkkwER2kk8QOf0vAblQnrSg57JF5AqD1OdnwsDG+bI8
 8QV2udgJWeeTyKYt5NjlTCVkd180AI5859l/YyWrz0EdLUWcKQiCfjje2
 lfTxOySN3UnIGyHRSxckb4uTd2G8Fe6xCyskmJ0LmR+VBca8y+2v9A4+F
 Jvcf1tF3cffHNXljeEg+mZfd3OnKbNm9tRIwye7hkRVrFxFRJiJNdGOr5 g==;
X-CSE-ConnectionGUID: b03K1YG/QY6kEd6mZtXF9Q==
X-CSE-MsgGUID: xriv+A3RR/eXk8Hbd8/U5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="48224699"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="48224699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:04:43 -0700
X-CSE-ConnectionGUID: gdakuUeVTJWD6yDpukvI8w==
X-CSE-MsgGUID: TPFOATVPRq6anDnJN+MOHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="179890108"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:04:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe/debugfs: Make ggtt file per-tile
Date: Fri, 19 Sep 2025 18:04:29 +0200
Message-ID: <20250919160430.573-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919160430.573-1-michal.wajdeczko@intel.com>
References: <20250919160430.573-1-michal.wajdeczko@intel.com>
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

Due to initial lack of per-tile debugfs directories, the ggtt file
attribute was created as per-GT file. Fix that since now we have
proper per-tile directories.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 -------------
 drivers/gpu/drm/xe/xe_tile_debugfs.c |  7 +++++++
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f253e2df4907..e4eba91cb83d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -12,7 +12,6 @@
 
 #include "xe_device.h"
 #include "xe_force_wake.h"
-#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_idle.h"
@@ -142,17 +141,6 @@ static int steering(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static int ggtt(struct xe_gt *gt, struct drm_printer *p)
-{
-	int ret;
-
-	xe_pm_runtime_get(gt_to_xe(gt));
-	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return ret;
-}
-
 static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_hw_engine *hwe;
@@ -279,7 +267,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
  */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
-	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
 	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index 5523874cba7b..a3f437d38f86 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/debugfs.h>
 #include <drm/drm_debugfs.h>
 
+#include "xe_ggtt.h"
 #include "xe_pm.h"
 #include "xe_sa.h"
 #include "xe_tile_debugfs.h"
@@ -90,6 +91,11 @@ static int tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
 	return ret;
 }
 
+static int ggtt(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_ggtt_dump(tile->mem.ggtt, p);
+}
+
 static int sa_info(struct xe_tile *tile, struct drm_printer *p)
 {
 	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
@@ -100,6 +106,7 @@ static int sa_info(struct xe_tile *tile, struct drm_printer *p)
 
 /* only for debugfs files which can be safely used on the VF */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
+	{ "ggtt", .show = tile_debugfs_show_with_rpm, .data = ggtt },
 	{ "sa_info", .show = tile_debugfs_show_with_rpm, .data = sa_info },
 };
 
-- 
2.47.1

