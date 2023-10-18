Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A51CDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 22:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7093510E461;
	Wed, 18 Oct 2023 22:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6C10E460
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 22:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697669836; x=1729205836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LT512XFi7EgXh9b4xfaM5HNWgJqXV8PTkxaRQKKcLbQ=;
 b=WfyDKgFhijSwInyYGxNk1OfAnkqCnoorJV1tyR9vobVgkZX5RB61/izj
 lchmXsXPE8QnwfP9hbvTc7Z20I8zFhT7/umgdh0GTtCpMmUke11QoJV0X
 /6/D+PRxzdRz3dw0v7FDLWZufN5tbyI+VI+5Pr9WCbBg0Lznx4llB/LBf
 SlPiz04Y+atCpSpSFTr5FWIOgfgV0sEHMBoYVcB1KMhn8qsJsXn+6Gm1E
 hUmpCAx/y9jAERkS+73Q62St2n+SU5OEYhbnPFS+pobwo1jutyQXgZUY8
 B5AeEq5J4CwNm4/BLFvEHTRwYo/uYpXSV2vuQEcJg+hV1MJUsZ2D/2R9l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="450353323"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="450353323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822613252"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822613252"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 15:57:15 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 15:57:03 -0700
Message-ID: <20231018225707.1685294-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/5] drm/xe/uc: Prepare for parsing of
 different header types
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GSC binaries and newer HuC ones use GSC-style headers instead of the
CSS. In preparation for adding support for such parsing, split out the
current parsing code to its own function, to make it cleaner to add the
new paths. The existing doc section has also been renamed to narrow it
to CSS-based binaries.

v2: new patch in series, split out from next patch for easier reviewing

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c        | 117 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_uc_fw_abi.h    |   7 +-
 3 files changed, 72 insertions(+), 54 deletions(-)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index c01246ae99f5..f1ac6f608930 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -8,7 +8,7 @@ Firmware Layout
 ===============
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
-   :doc: Firmware Layout
+   :doc: CSS-based Firmware Layout
 
 Write Once Protected Content Memory (WOPCM) Layout
 ==================================================
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index edaa195fa25f..7345f0409cf9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -13,6 +13,7 @@
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -344,57 +345,22 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 	return -ENOEXEC;
 }
 
-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+/* Refer to the "CSS-based Firmware Layout" documentation entry for details */
+static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct device *dev = xe->drm.dev;
-	const struct firmware *fw = NULL;
 	struct uc_css_header *css;
-	struct xe_bo *obj;
 	size_t size;
-	int err;
-
-	/*
-	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
-	 * before we're looked at the HW caps to see if we have uc support
-	 */
-	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
-	xe_assert(xe, !uc_fw->status);
-	xe_assert(xe, !uc_fw->path);
-
-	uc_fw_auto_select(xe, uc_fw);
-	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
-			       XE_UC_FIRMWARE_SELECTED :
-			       XE_UC_FIRMWARE_NOT_SUPPORTED);
-
-	if (!xe_uc_fw_is_supported(uc_fw))
-		return 0;
-
-	uc_fw_override(uc_fw);
-
-	/* an empty path means the firmware is disabled */
-	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
-		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
-		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
-		return 0;
-	}
-
-	err = request_firmware(&fw, uc_fw->path, dev);
-	if (err)
-		goto fail;
 
 	/* Check the size of the blob before examining buffer contents */
-	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
+	if (unlikely(fw_size < sizeof(struct uc_css_header))) {
 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-			 fw->size, sizeof(struct uc_css_header));
-		err = -ENODATA;
-		goto fail;
+			 fw_size, sizeof(struct uc_css_header));
+		return -ENODATA;
 	}
 
-	css = (struct uc_css_header *)fw->data;
+	css = (struct uc_css_header *)fw_data;
 
 	/* Check integrity of size values inside CSS header */
 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
@@ -403,9 +369,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		drm_warn(&xe->drm,
 			 "%s firmware %s: unexpected header size: %zu != %zu\n",
 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-			 fw->size, sizeof(struct uc_css_header));
-		err = -EPROTO;
-		goto fail;
+			 fw_size, sizeof(struct uc_css_header));
+		return -EPROTO;
 	}
 
 	/* uCode size must calculated from other sizes */
@@ -417,12 +382,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	/* At least, it should have header, uCode and RSA. Size of all three. */
 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
 		uc_fw->rsa_size;
-	if (unlikely(fw->size < size)) {
+	if (unlikely(fw_size < size)) {
 		drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < %zu\n",
 			 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-			 fw->size, size);
-		err = -ENOEXEC;
-		goto fail;
+			 fw_size, size);
+		return -ENOEXEC;
 	}
 
 	/* Get version numbers from the CSS header */
@@ -433,6 +397,60 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
 					   css->sw_version);
 
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
+		guc_read_css_info(uc_fw, css);
+
+	return 0;
+}
+
+static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
+{
+	return parse_css_header(uc_fw, fw->data, fw->size);
+}
+
+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+{
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct device *dev = xe->drm.dev;
+	const struct firmware *fw = NULL;
+	struct xe_bo *obj;
+	int err;
+
+	/*
+	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
+	 * before we're looked at the HW caps to see if we have uc support
+	 */
+	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
+	xe_assert(xe, !uc_fw->status);
+	xe_assert(xe, !uc_fw->path);
+
+	uc_fw_auto_select(xe, uc_fw);
+	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
+			       XE_UC_FIRMWARE_SELECTED :
+			       XE_UC_FIRMWARE_NOT_SUPPORTED);
+
+	if (!xe_uc_fw_is_supported(uc_fw))
+		return 0;
+
+	uc_fw_override(uc_fw);
+
+	/* an empty path means the firmware is disabled */
+	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
+		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
+		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
+		return 0;
+	}
+
+	err = request_firmware(&fw, uc_fw->path, dev);
+	if (err)
+		goto fail;
+
+	err = parse_headers(uc_fw, fw);
+	if (err)
+		goto fail;
+
 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
 		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
@@ -441,9 +459,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
-		guc_read_css_info(uc_fw, css);
-
 	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
 				     ttm_bo_type_kernel,
 				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 89e994ed4e00..edae7bb3cd72 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -10,9 +10,12 @@
 #include <linux/types.h>
 
 /**
- * DOC: Firmware Layout
+ * DOC: CSS-based Firmware Layout
  *
- * The GuC/HuC firmware layout looks like this::
+ * The CSS-based firmware structure is used for GuC releases on all platforms
+ * and for HuC releases up to DG1. Starting from DG2/MTL the HuC uses the GSC
+ * layout instead.
+ * The CSS firmware layout looks like this::
  *
  *      +======================================================================+
  *      |  Firmware blob                                                       |
-- 
2.41.0

