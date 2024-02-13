Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD74EC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA8810E807;
	Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaiEDQRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9F10E7D3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839059; x=1739375059;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kC3doCOt6eTY0hscjRuSI4Fz8l1Sda7/3YM5RTwjZsA=;
 b=XaiEDQRd7Rd8rmaAplcpWaf+xYvb7JRawk4SsupQaadE/Eg3Gcw445e8
 9s6YYNX95R1SklpevirIKOZ0gagY20HtwRoUrjjysV0FERZDYz0VK0gNb
 0CcXD7JLGYY/wtidO9Kn+wlDTI53XaGsl6JuJ8/wBk4s0fOTxgcXhH7Zj
 EZeODg1tfqj+Ypf/XEs20vus7SpZ4oTWTrscX9meOMaugkZYRBRRkQVQf
 bOai3NoXHKflpvrdHklb9Q4OTwgfdrBXdnIfMnq0zj0S+w8tKjaJ1Y6oW
 d7y2deID9mCfylCOLgEZKb1193rmr+jjpmDgTOm9YG+qGwhyJeQTQc1Rz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262927"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564513"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:19 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 8/8] drm/xe/vf: Don't support MCR registers if VF
Date: Tue, 13 Feb 2024 16:43:55 +0100
Message-Id: <20240213154355.1221-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

VF drivers can't operate on MCR registers.  Make sure that driver
is not trying to read nor write using any of MCR register.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 8546cd3cc50d..a7ab9ba645f9 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -10,6 +10,7 @@
 #include "xe_gt_topology.h"
 #include "xe_gt_types.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
@@ -38,6 +39,8 @@
  * ``init_steering_*()`` functions is to apply the platform-specific rules for
  * each MCR register type to identify a steering target that will select a
  * non-terminated instance.
+ *
+ * MCR registers are not available on Virtual Function (VF).
  */
 
 #define STEER_SEMAPHORE		XE_REG(0xFD0)
@@ -352,6 +355,9 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
 	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	spin_lock_init(&gt->mcr_lock);
 
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
@@ -405,6 +411,9 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	if (xe->info.platform == XE_DG2) {
 		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
 			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
@@ -588,6 +597,8 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
 	u32 val;
 	bool steer;
 
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
+
 	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg_mcr,
 						     &group, &instance);
 
@@ -619,6 +630,8 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
 {
 	u32 val;
 
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
+
 	mcr_lock(gt);
 	val = rw_with_mcr_steering(gt, reg_mcr, MCR_OP_READ, group, instance, 0);
 	mcr_unlock(gt);
@@ -640,6 +653,8 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
 void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 			     u32 value, int group, int instance)
 {
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
+
 	mcr_lock(gt);
 	rw_with_mcr_steering(gt, reg_mcr, MCR_OP_WRITE, group, instance, value);
 	mcr_unlock(gt);
@@ -658,6 +673,8 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
 {
 	struct xe_reg reg = to_xe_reg(reg_mcr);
 
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
+
 	/*
 	 * Synchronize with any unicast operations.  Once we have exclusive
 	 * access, the MULTICAST bit should already be set, so there's no need
-- 
2.43.0

