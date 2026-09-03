Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AFAC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F5810F57B;
	Thu,  3 Sep 2026 23:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5GBUcyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F6210ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788478808; x=1820014808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eg2ZlG2uaKMZVSAwPW4ol+eAQ3ER7xPvMb8UpHTyUfQ=;
 b=U5GBUcyGd1Z2Sq4L53nMF01sHzt9NAXcUzR2Cs6Xounz8bSF4ZrN06qw
 2R3QaKFgefTW6tJdq6XQ4BuF0dXFjYjKs0R2I0hzo9fgf6TnXNG4hJOcl
 hedleZuHQM8Zy+unFoWRm/pvb8T3zD1EKnQ4mrXZseituh3+/BzQK8dsg
 EgtGIEy8fzRG+YezE5QJwqxr0VZ1uyMKcVhViTQI9g2jAIAvxpx+emdtG
 d8MXyyMi4WcsBDA3Rj9GM8FSzXbNKyHe74kvw4ROJKORGfT2YtCEWayIz
 zBJuxyrZYgZIENzLnp63gI/C3BP4BM6eh5FEZmmnzahyzL0gOUbeIRJvc w==;
X-CSE-ConnectionGUID: UhcwMheRTs6Qgn1KJGy6EA==
X-CSE-MsgGUID: 5IrIHQINRIOngvgW+ghODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91489315"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91489315"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:06 -0700
X-CSE-ConnectionGUID: TIY1NiSFSym4j5Vwv68+gw==
X-CSE-MsgGUID: n/rGe2K6Tr6EigE9GDcRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299735232"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:40:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v3 3/5] drm/xe/uc: Report DMA failure using SIGID
Date: Thu,  3 Sep 2026 16:40:02 -0700
Message-ID: <20260903233958.475162-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Convert the uC DMA failure error to use the xe_log_err() helper.

v2: add assert and simplify if/else

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..ada39c1266a8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -914,8 +915,12 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	int err;
 
+	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC ||
+		     uc_fw->type == XE_UC_FW_TYPE_HUC);
+
 	/* make sure the status was cleared the last time we reset the uc */
 	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
 
@@ -931,9 +936,11 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	return 0;
 
 fail:
-	drm_err(&xe->drm, "Failed to load %s firmware %s (%d)\n",
-		xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-		err);
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
+		xe_log_err(gt, GUC, err, "Failed to load firmware %s\n", uc_fw->path);
+	else
+		xe_log_err(gt, HUC, err, "Failed to load firmware %s\n", uc_fw->path);
+
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOAD_FAIL);
 	return err;
 }
-- 
2.55.0

