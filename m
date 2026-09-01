Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36AFC61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFE410EF30;
	Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTtuzvKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AA410EF2F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788297133; x=1819833133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fe91FZwEvkxtzR77QT1JcIngqgb8mJz3uz5ypNvA9p4=;
 b=HTtuzvKiKEvHg5OkRlhHFtCiv8L0RDwj/19QOZdz/3QFTwsvABOlkMk7
 Kby4pi8fwXbopX6gXBBZBu/yxh+iXknyJbY4j1jXYehKdVvqs1lBEBJOr
 oqS41H9rUL8tdsKkreF7sk1PE6DTz8DONPFpBDLnfEOHf+14eRrlpbk4G
 CSJVpK8I/0H//vNab4dCyb9trLWeBOeijybjfd+Ekctnh+vf5Y0KT/S3k
 krmXjNI86pp2Bsiv/5uduu6+fmzp08j1Wsp5WJ0JjxSrWiQ7icY1aD0jn
 NENlGLR+V4iuT2/sHXtXD+cz8B/ZDs33qLlTE1GbBvIXV+vbsCE2qoYAm g==;
X-CSE-ConnectionGUID: WPIQ7kdAQKS/jEGPsSF0mw==
X-CSE-MsgGUID: 27tWrrLZRci7LGgGlP8+WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92562330"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92562330"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
X-CSE-ConnectionGUID: N1EP8VuDRL2m6fBy/7n3gA==
X-CSE-MsgGUID: FNLeOXjZSaSPtjeUTjpEbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="272988132"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v2 3/5] drm/xe/uc: Report DMA failure using SIGID
Date: Tue,  1 Sep 2026 14:12:08 -0700
Message-ID: <20260901211204.131972-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
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
index e29878b255ba..df47bb8fc676 100644
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
+			 uc_fw->type == XE_UC_FW_TYPE_HUC);
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

