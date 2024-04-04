Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C599CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E7510E47C;
	Thu,  4 Apr 2024 15:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GB13BGtw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811E910E8BD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712245981; x=1743781981;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HfmWepWjhaXBDoh5HmubYpb2RBqu4Cb5U6fWqiOn3xQ=;
 b=GB13BGtwMuB+N5jhX9iz9D8qIEVCTtm0LBIQ2T+Ssa7iuA6Z71ejShgl
 5VF36GbkgF2IRbIzmR68zd7LOpyPLa53+x6KfOKvpd8a6VPOj01WduPvj
 SVHnLYneEYFBUhiXh7AxWbCEjc3ZSfiizvwSKIL7LFfSy7FAL86wjU4/l
 HcnsbyMwOB2Ann5Ww71rCXxM/VgS+iyBtiI/TgM6sEucw343vdId0aQ4s
 thLLqfRjiyHz3GDCVcRkcax1pgOT9101DvJqyXXTp7nRROPCokMY9SiO/
 ks8AYKEvaMobinbyk/4TK5mJOMUtq3C85fScwDZihKxwalER/ZX3M08nb g==;
X-CSE-ConnectionGUID: Ybm6vxkCRRWjNSu0Wd7agA==
X-CSE-MsgGUID: 3y5AjkGMQWuerQs9CjzQeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11313700"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11313700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:52:53 -0700
X-CSE-ConnectionGUID: wALOq47tQ0mRa20fCIFnQg==
X-CSE-MsgGUID: 4uGQtujMTKaOg/Tt5JLcFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23592354"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:52:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/2] drm/xe/guc: Prefer GT oriented logs for GuC messages
Date: Thu,  4 Apr 2024 17:50:45 +0200
Message-Id: <20240404155046.627-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

A platform can have more than one GuC, so we should use GT-oriented
logs to correctly identify the source of the message.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 79 +++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 77be3bc2d7c0..afb083c7cbfa 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -18,6 +18,7 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
@@ -181,7 +182,7 @@ static u32 guc_ctl_devid(struct xe_guc *guc)
 
 static void guc_init_params(struct xe_guc *guc)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	u32 *params = guc->params;
 	int i;
 
@@ -196,12 +197,12 @@ static void guc_init_params(struct xe_guc *guc)
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
 	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+		xe_gt_dbg(gt, "GuC param[%2d] = 0x%08x\n", i, params[i]);
 }
 
 static void guc_init_params_post_hwconfig(struct xe_guc *guc)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	u32 *params = guc->params;
 	int i;
 
@@ -216,7 +217,7 @@ static void guc_init_params_post_hwconfig(struct xe_guc *guc)
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
 	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+		xe_gt_dbg(gt, "GuC param[%2d] = 0x%08x\n", i, params[i]);
 }
 
 /*
@@ -321,7 +322,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
+	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
 	if (ret)
 		goto out;
 
@@ -334,7 +335,7 @@ int xe_guc_init(struct xe_guc *guc)
 	return 0;
 
 out:
-	drm_err(&xe->drm, "GuC init failed with %d", ret);
+	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
 	return ret;
 }
 
@@ -371,7 +372,6 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 
 int xe_guc_reset(struct xe_guc *guc)
 {
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 guc_status, gdrst;
 	int ret;
@@ -382,16 +382,14 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
-		drm_err(&xe->drm, "GuC reset timed out, GDRST=0x%8x\n",
-			gdrst);
+		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
 		goto err_out;
 	}
 
 	guc_status = xe_mmio_read32(gt, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
-		drm_err(&xe->drm,
-			"GuC status: 0x%x, MIA core expected to be in reset\n",
-			guc_status);
+		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
+			  guc_status);
 		ret = -EIO;
 		goto err_out;
 	}
@@ -454,7 +452,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 
 static int guc_wait_ucode(struct xe_guc *guc)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	u32 status;
 	int ret;
 
@@ -475,35 +473,32 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	 * 200ms. Even at slowest clock, this should be sufficient. And
 	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
+	ret = xe_mmio_wait32(gt, GUC_STATUS, GS_UKERNEL_MASK,
 			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
 			     200000, &status, false);
 
 	if (ret) {
-		struct drm_device *drm = &xe->drm;
-
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			 REG_FIELD_GET(GS_MIA_MASK, status),
-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
+		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
+			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			   REG_FIELD_GET(GS_MIA_MASK, status),
+			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
+			xe_gt_info(gt, "GuC firmware signature verification failed\n");
 			ret = -ENOEXEC;
 		}
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
 		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
-				 xe_mmio_read32(guc_to_gt(guc),
-						SOFT_SCRATCH(13)));
+			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
+				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
 	} else {
-		drm_dbg(&xe->drm, "GuC successfully loaded");
+		xe_gt_dbg(gt, "GuC successfully loaded\n");
 	}
 
 	return ret;
@@ -603,12 +598,10 @@ static void guc_handle_mmio_msg(struct xe_guc *guc)
 	xe_mmio_write32(gt, SOFT_SCRATCH(15), 0);
 
 	if (msg & XE_GUC_RECV_MSG_CRASH_DUMP_POSTED)
-		drm_err(&guc_to_xe(guc)->drm,
-			"Received early GuC crash dump notification!\n");
+		xe_gt_err(gt, "Received early GuC crash dump notification!\n");
 
 	if (msg & XE_GUC_RECV_MSG_EXCEPTION)
-		drm_err(&guc_to_xe(guc)->drm,
-			"Received early GuC exception notification!\n");
+		xe_gt_err(gt, "Received early GuC exception notification!\n");
 }
 
 static void guc_enable_irq(struct xe_guc *guc)
@@ -659,15 +652,15 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 
 int xe_guc_suspend(struct xe_guc *guc)
 {
-	int ret;
+	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[] = {
 		XE_GUC_ACTION_CLIENT_SOFT_RESET,
 	};
+	int ret;
 
 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
 	if (ret) {
-		drm_err(&guc_to_xe(guc)->drm,
-			"GuC suspend: CLIENT_SOFT_RESET fail: %d!\n", ret);
+		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 
@@ -742,8 +735,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     50000, &reply, false);
 	if (ret) {
 timeout:
-		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
-			request[0], reply);
+		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
+			  request[0], reply);
 		return ret;
 	}
 
@@ -781,8 +774,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	    GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
 
-		drm_dbg(&xe->drm, "mmio request %#x: retrying, reason %#x\n",
-			request[0], reason);
+		xe_gt_dbg(gt, "GuC mmio request %#x: retrying, reason %#x\n",
+			  request[0], reason);
 		goto retry;
 	}
 
@@ -791,16 +784,16 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
-			request[0], error, hint);
+		xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
+			  request[0], error, hint);
 		return -ENXIO;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
-			request[0], header);
+		xe_gt_err(gt, "GuC mmio request %#x: unexpected reply %#x\n",
+			  request[0], header);
 		return -EPROTO;
 	}
 
-- 
2.43.0

