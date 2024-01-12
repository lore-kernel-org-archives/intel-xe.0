Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A284C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A56D10EB47;
	Fri, 12 Jan 2024 15:27:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA410EB44
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073231; x=1736609231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQ7OGYyvTxHBShXuf3xlcd5Xvn6NmXHbAL3k7Pk/Eh8=;
 b=cJHHFg1FPCE46YrtmxJDLqZE1D1yh7HIXXGcOenkkqi4uPP1k+E6pk3U
 KhO/8BZ1cVAoe/4m4djKNjnicQdH5bAGQrpg3ttyIlI1cX8KiEwTmGPzo
 cRt0LWAW117ONbn0eEMETus3NZRmyzupk1SJ2Bzaztq51MgbrJ6BiiHbM
 mPzBtofcSGhcVh6r4xRvOSjy+QtWH+oXDB7vsgm+JeegrDYbAfpe4SMSZ
 tuuaJfOHp05lYepGKIHQhCjOZo6OF/9amJkVpW5EWlQG86I2RYo+hrFt0
 YXReuuJekeiO+ljquNGjuVqnPO7ISVOzF3JV0xKIZmlNLOXM8wjg2YLdo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566393"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003198"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003198"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:08 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/8] drm/xe/vf: Don't support MCR registers if VF
Date: Fri, 12 Jan 2024 16:26:49 +0100
Message-Id: <20240112152649.849-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

VF drivers can't operate on MCR registers.  Make sure that driver
is not trying to read nor write using any of MCR register.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8d..4e088a273535 100644
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
2.25.1

