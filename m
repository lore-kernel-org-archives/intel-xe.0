Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4356C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1597D10E16D;
	Mon, 20 Nov 2023 21:28:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F97810E183
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515680; x=1732051680;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RJqirvX5ssfNS4aLJ3as6iHLBf5a1Oh+e4uhzmpcYTU=;
 b=WuVpqvRS9g46S0OaaK/OIdxS/4/QLNrK6bhzrgWY5si9VTmY38mRd2FJ
 1Rnv8grdaLXxJgsi3hroylQRK6wMRHGGqHvrC8vYEWvE/m1TJbIQEEa5x
 gkyXO6TusS8FUPueenFK1oCBlyebX/FIMFaFDpBUchMCz+Cw3+RzCL3vg
 cizhGb+xLdSWpYmGRZmfU0QaNqCfVaspTBmj57EoAYFtAY2Bm7GI1ZUzM
 qu47Gf8bfi9+ksVgonAkBqIhhrUzpw7K8Z+EISV4wSlmUZIjMGlOrTZbM
 uxH6ZJ+CEiHKAv5YIHsdXLZEtElsN9l2tRjOLmSsm84GpxiC1utoadD1D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13256875"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13256875"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883984469"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883984469"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:27:54 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 13:27:32 -0800
Message-ID: <20231120212741.2634679-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
References: <20231120212741.2634679-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 03/10] drm/xe/gsc: Introduce GSC FW
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

Add the basic definitions and init function. Same as HuC, GSC is only
supported on the media GT on MTL and newer platforms.
Note that the GSC requires submission resources which can't be allocated
during init (because we don't have the hwconfig yet), so it can't be
marked as loadable at the end of the init function. The allocation of
those resources will come in the patch that makes use of them to load
the FW.

v2: better comment, move num FWs define inside the enum (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Makefile         |  1 +
 drivers/gpu/drm/xe/xe_gsc.c         | 52 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h         | 13 ++++++++
 drivers/gpu/drm/xe/xe_gsc_types.h   | 19 +++++++++++
 drivers/gpu/drm/xe/xe_uc.c          |  9 +++--
 drivers/gpu/drm/xe/xe_uc_fw.c       | 23 ++++++++++---
 drivers/gpu/drm/xe/xe_uc_fw.h       |  5 ++-
 drivers/gpu/drm/xe/xe_uc_fw_types.h |  5 +--
 drivers/gpu/drm/xe/xe_uc_types.h    |  3 ++
 9 files changed, 121 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cff9337aa8c4..e366366e8f38 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,6 +58,7 @@ xe-y += xe_bb.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gpu_scheduler.o \
+	xe_gsc.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
new file mode 100644
index 000000000000..216f36cee0f7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gsc.h"
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_uc_fw.h"
+
+static struct xe_gt *
+gsc_to_gt(struct xe_gsc *gsc)
+{
+	return container_of(gsc, struct xe_gt, uc.gsc);
+}
+
+int xe_gsc_init(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	int ret;
+
+	gsc->fw.type = XE_UC_FW_TYPE_GSC;
+
+	/* The GSC uC is only available on the media GT */
+	if (tile->media_gt && (gt != tile->media_gt)) {
+		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
+		return 0;
+	}
+
+	/*
+	 * Some platforms can have GuC but not GSC. That would cause
+	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
+	 * all firmware loading. So check for GSC being enabled before
+	 * propagating the failure back up. That way the higher level will keep
+	 * going and load GuC as appropriate.
+	 */
+	ret = xe_uc_fw_init(&gsc->fw);
+	if (!xe_uc_fw_is_enabled(&gsc->fw))
+		return 0;
+	else if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	xe_gt_err(gt, "GSC init failed with %d", ret);
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
new file mode 100644
index 000000000000..baa7f21f4204
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GSC_H_
+#define _XE_GSC_H_
+
+#include "xe_gsc_types.h"
+
+int xe_gsc_init(struct xe_gsc *gsc);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
new file mode 100644
index 000000000000..135f156e3736
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GSC_TYPES_H_
+#define _XE_GSC_TYPES_H_
+
+#include "xe_uc_fw_types.h"
+
+/**
+ * struct xe_gsc - GSC
+ */
+struct xe_gsc {
+	/** @fw: Generic uC firmware management */
+	struct xe_uc_fw fw;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 784f53c5f282..b67154c78dff 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -6,6 +6,7 @@
 #include "xe_uc.h"
 
 #include "xe_device.h"
+#include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
@@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
 	int ret;
 
 	/*
-	 * We call the GuC/HuC init functions even if GuC submission is off to
-	 * correctly move our tracking of the FW state to "disabled".
+	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
+	 * to correctly move our tracking of the FW state to "disabled".
 	 */
 
 	ret = xe_guc_init(&uc->guc);
@@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+	ret = xe_gsc_init(&uc->gsc);
+	if (ret)
+		goto err;
+
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9205a3ecff78..16217aacdbfb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -158,11 +158,18 @@ XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 static struct xe_gt *
 __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
 {
-	if (type == XE_UC_FW_TYPE_GUC)
-		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
+	XE_WARN_ON(type >= XE_UC_FW_NUM_TYPES);
 
-	XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
-	return container_of(uc_fw, struct xe_gt, uc.huc.fw);
+	switch (type) {
+	case XE_UC_FW_TYPE_GUC:
+		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
+	case XE_UC_FW_TYPE_HUC:
+		return container_of(uc_fw, struct xe_gt, uc.huc.fw);
+	case XE_UC_FW_TYPE_GSC:
+		return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
+	default:
+		return NULL;
+	}
 }
 
 static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
@@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	u32 count;
 	int i;
 
+	/*
+	 * GSC FW support is still not fully in place, so we're not defining
+	 * the FW blob yet because we don't want the driver to attempt to load
+	 * it until we're ready for it.
+	 */
+	if (uc_fw->type == XE_UC_FW_TYPE_GSC)
+		return;
+
 	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
 	entries = blobs_all[uc_fw->type].entries;
 	count = blobs_all[uc_fw->type].count;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 1d1a0c156cdf..7feafe1695f9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -96,8 +96,11 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
 		return "GuC";
 	case XE_UC_FW_TYPE_HUC:
 		return "HuC";
+	case XE_UC_FW_TYPE_GSC:
+		return "GSC";
+	default:
+		return "uC";
 	}
-	return "uC";
 }
 
 static inline enum xe_uc_fw_status
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 46c801d8e954..fc1de0cc9324 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -55,9 +55,10 @@ enum xe_uc_fw_status {
 
 enum xe_uc_fw_type {
 	XE_UC_FW_TYPE_GUC = 0,
-	XE_UC_FW_TYPE_HUC
+	XE_UC_FW_TYPE_HUC,
+	XE_UC_FW_TYPE_GSC,
+	XE_UC_FW_NUM_TYPES
 };
-#define XE_UC_FW_NUM_TYPES 2
 
 /**
  * struct xe_uc_fw_version - Version for XE micro controller firmware
diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
index 49bef6498b85..9924e4484866 100644
--- a/drivers/gpu/drm/xe/xe_uc_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_UC_TYPES_H_
 #define _XE_UC_TYPES_H_
 
+#include "xe_gsc_types.h"
 #include "xe_guc_types.h"
 #include "xe_huc_types.h"
 #include "xe_wopcm_types.h"
@@ -18,6 +19,8 @@ struct xe_uc {
 	struct xe_guc guc;
 	/** @huc: HuC */
 	struct xe_huc huc;
+	/** @gsc: Graphics Security Controller */
+	struct xe_gsc gsc;
 	/** @wopcm: WOPCM */
 	struct xe_wopcm wopcm;
 };
-- 
2.41.0

