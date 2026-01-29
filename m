Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DBED73E80
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 18:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A812B10E33B;
	Thu, 29 Jan 2026 18:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJLRwPeq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB510E33B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 18:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769711161; x=1801247161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9hCFkbAG+9af6D6DZIxT4Dmb0v8zgsz/I+na3Pwoc+k=;
 b=ZJLRwPeqyWMubQ1IN2hYj5lXeds+h1vQZJLg61FMP53QelUJxIJfnSU0
 69nzntavOXuWvl0oaoQa4//47VoqE43rennsREM7w2fvPbzdwIz7Kab9i
 aOQ14HqlYWvoi7bcXV2M02HyssT/sht0oecBXrq9Y9gEASsq5GutBKvmZ
 bV36bBv/v2XaEufBwFS7bWKPAH380Mk8Qc17HJZgg+sj+FIIjgjGvQ/Kv
 XZwxTyhUPzYWcOeVELRIvHkAhWKuCXHouum5LqvPa5O5hlGCY+095SgTc
 DBhYA0FsrzJZzHbI6O+/WXS4rX8PL0o6rIL0sUO2NmJfiBdeeWMneL8aw w==;
X-CSE-ConnectionGUID: jh3NCPf4SnmRBm//I2G06Q==
X-CSE-MsgGUID: WtloLYN8QE2RoRO/QVj9vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58541237"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="58541237"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:26:00 -0800
X-CSE-ConnectionGUID: EfnWUczbT5WgxnOHPPcRbQ==
X-CSE-MsgGUID: /0anbxLMQQ+7Q3vdGF0YGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208445627"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:26:00 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 George D Sworo <george.d.sworo@intel.com>
Subject: [PATCH v2] drm/xe/guc: Fix CFI violation in debugfs access.
Date: Thu, 29 Jan 2026 10:25:48 -0800
Message-ID: <20260129182547.32899-2-daniele.ceraolospurio@intel.com>
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

xe_guc_print_info is void-returning, but the function pointer it is
assigned to expects an int-returning function, leading to the following
CFI error:

[  206.873690] CFI failure at guc_debugfs_show+0xa1/0xf0 [xe]
(target: xe_guc_print_info+0x0/0x370 [xe]; expected type: 0xbe3bc66a)

Fix this by updating xe_guc_print_info to return an integer.

Fixes: e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: George D Sworo <george.d.sworo@intel.com>
---
v2: make xe_guc_print_info return int instead of using a local func
---
 drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
 drivers/gpu/drm/xe/xe_guc.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d2d3aa7a859a..8d7d20819eea 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1662,7 +1662,7 @@ void xe_guc_runtime_resume(struct xe_guc *guc)
 	xe_guc_submit_unpause(guc);
 }
 
-void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
+int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 status;
@@ -1673,7 +1673,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (!fw_ref.domains)
-			return;
+			return -EIO;
 
 		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
 
@@ -1699,6 +1699,8 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	drm_puts(p, "\n");
 	xe_guc_submit_print(guc, p);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index a169f231cbd8..66e7edc70ed9 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -53,7 +53,7 @@ int xe_guc_self_cfg32(struct xe_guc *guc, u16 key, u32 val);
 int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val);
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir);
 void xe_guc_sanitize(struct xe_guc *guc);
-void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
+int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
 int xe_guc_reset_prepare(struct xe_guc *guc);
 void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
-- 
2.43.0

