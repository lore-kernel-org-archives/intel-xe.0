Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64BEC982D7
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928DD10E7A0;
	Thu, 17 Sep 2026 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFrlzWu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DB210E51E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789689573; x=1821225573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PciEdkeqd/5kKev26DQEmVrUMuzdSN99tnqWKI3DNw4=;
 b=aFrlzWu9v9K8ZG3f1B4IkCfJuC4jkZIRoZjL+DgJo39lMAyIkAD7AA5h
 l2jP6mp2CaPCM7O6KdGbQag+tzuP1q2wGvrGbJhBVwvA8NxjaMaAXnDN6
 gMKtcs0UhT+V9PChZAyD3eMq/nM08d3yyjRBvMqwfva818/9uNZ1J3OkM
 5Bsaw9LfThpvkpdinHERjLXIsHgJ8SCv+qIczbagrodAV2ugcboXQ3m1O
 yNfna0fF/HhsEoYyrd2WOik4NnhTOmXOROm7K1r5KtD/AyTU8ux1DS1E1
 RTYjIGjX3rC9+ovsibFFlNMFu0W4/fIkSfwczx878gbVUqENfHvBBULTy A==;
X-CSE-ConnectionGUID: b0PiQy5bQcyWGMcjzswRag==
X-CSE-MsgGUID: fNA+ZU13RqO6iNRFAznXUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77727914"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77727914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:32 -0700
X-CSE-ConnectionGUID: Ovs4X2O1SoKWXatI/QJF2Q==
X-CSE-MsgGUID: Io/B/c1IS+u8fRaP/W4cRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270788218"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v4 5/7] drm/xe/uc: Report DMA failure using SIGID
Date: Thu, 17 Sep 2026 16:59:29 -0700
Message-ID: <20260917235923.1521112-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: add assert and simplify if/else
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

