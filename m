Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54CAC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 17:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D6D10EFA7;
	Fri, 21 Jun 2024 17:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKAzaoDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FBD10EFA7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718990734; x=1750526734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HxrLamxUMOuonAl3X5BZIzuzyltt6Sqq+2QATr3cupU=;
 b=BKAzaoDsKo/fn3SBmzm10OAIxuG94T9EhV0KMlL6UD6McUhKO0KDNVuC
 AiCcGIE8x/YitZRHgCODezTG7tVko6aavLnrYLSslZOAJXJkJ6Xhv4OsG
 Drw2rJIdd5VIQxywnqS9avGLokW6mGm8q01XrYf3O2lhB2SrhGD92PJgk
 RBm37ivbOXHgzPxHGzQ/hkOvROxZtZW432y7dH5aTmuxZaL1vLb5t+bD5
 vP5NzbReP6FdiXUV40rMuxkwiTZWQ8FVZEn+zKUcIGc6adoRpv6qxvhk6
 gv20Nmqy1T/JFoVyHRiBo9iyz/M3xnazJ8D6lEPvjLtLEYPJIl6hGvIIx A==;
X-CSE-ConnectionGUID: EGWJ4fafTfuhxKEGfDgYgA==
X-CSE-MsgGUID: jpWEM4nmSA6zOg+U+5NufQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26722404"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="26722404"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:25:33 -0700
X-CSE-ConnectionGUID: jBhjr4xBSIWZ6+0bouSldw==
X-CSE-MsgGUID: PumXXm6iTPizxHpJDenz/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42617527"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:25:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/huc: Use GT oriented error messages in xe_huc.c
Date: Fri, 21 Jun 2024 19:25:22 +0200
Message-Id: <20240621172522.1037-1-michal.wajdeczko@intel.com>
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

If applicable, we prefer GT oriented dmesg messages. Update all
HuC related messages and use more user friendly error codes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index c88761fe31c9..bec4366e5513 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -18,6 +18,7 @@
 #include "xe_force_wake.h"
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -107,7 +108,7 @@ int xe_huc_init(struct xe_huc *huc)
 	return 0;
 
 out:
-	drm_err(&xe->drm, "HuC init failed with %d", ret);
+	xe_gt_err(gt, "HuC: initialization failed: %pe\n", ERR_PTR(ret));
 	return ret;
 }
 
@@ -195,14 +196,14 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
 	} while (--retry && err == -EBUSY);
 
 	if (err) {
-		drm_err(&xe->drm, "failed to submit GSC request to auth: %d\n", err);
+		xe_gt_err(gt, "HuC: failed to submit GSC request to auth: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
 	err = xe_gsc_read_out_header(xe, &pkt->vmap, PXP43_HUC_AUTH_INOUT_SIZE,
 				     sizeof(struct pxp43_huc_auth_out), &rd_offset);
 	if (err) {
-		drm_err(&xe->drm, "HuC: invalid GSC reply for auth (err=%d)\n", err);
+		xe_gt_err(gt, "HuC: invalid GSC reply for auth: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
@@ -213,7 +214,7 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
 	 */
 	out_status = huc_auth_msg_rd(xe, &pkt->vmap, rd_offset, header.status);
 	if (out_status != PXP_STATUS_SUCCESS && out_status != PXP_STATUS_OP_NOT_PERMITTED) {
-		drm_err(&xe->drm, "auth failed with GSC error = 0x%x\n", out_status);
+		xe_gt_err(gt, "HuC: authentication failed with GSC error = %#x\n", out_status);
 		return -EIO;
 	}
 
@@ -242,7 +243,6 @@ bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
 
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 {
-	struct xe_device *xe = huc_to_xe(huc);
 	struct xe_gt *gt = huc_to_gt(huc);
 	struct xe_guc *guc = huc_to_guc(huc);
 	int ret;
@@ -272,26 +272,26 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 		return -EINVAL;
 	}
 	if (ret) {
-		drm_err(&xe->drm, "Failed to trigger HuC auth via %s: %d\n",
-			huc_auth_modes[type].name, ret);
+		xe_gt_err(gt, "HuC: failed to trigger auth via %s: %pe\n",
+			  huc_auth_modes[type].name, ERR_PTR(ret));
 		goto fail;
 	}
 
 	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
 			     huc_auth_modes[type].val, 100000, NULL, false);
 	if (ret) {
-		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
+		xe_gt_err(gt, "HuC: firmware not verified: %pe\n", ERR_PTR(ret));
 		goto fail;
 	}
 
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
-	drm_dbg(&xe->drm, "HuC authenticated via %s\n", huc_auth_modes[type].name);
+	xe_gt_dbg(gt, "HuC: authenticated via %s\n", huc_auth_modes[type].name);
 
 	return 0;
 
 fail:
-	drm_err(&xe->drm, "HuC: Auth via %s failed: %d\n",
-		huc_auth_modes[type].name, ret);
+	xe_gt_err(gt, "HuC: authentication via %s failed: %pe\n",
+		  huc_auth_modes[type].name, ERR_PTR(ret));
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
 
 	return ret;
-- 
2.43.0

