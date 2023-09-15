Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F7CD37AA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB52610E6A9;
	Fri, 15 Sep 2023 22:35:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF71F10E6A9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694817312; x=1726353312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AoFoX+dH3BVLmd2Lo51mWtZHOqEllAKGYICXWc7WOS0=;
 b=hIUMXLKdYiAFb3busYoncLFe5szLWg1G0XiDel54ljdZ2r59aPe8MIcj
 oR4NW+1ulzyEdKNxnQCNfXC7wsukAZS+gme9NekH3N99A78aOHBvVwzYG
 QUK/6aKoypgqqoY3B1G0W9OGVpo/XfFL0xIxVFW/Xn8/g0d0mC2WCbLym
 TbIKO3oRYXyINfOSGLkdnjIHRHNAg8GmaIF3Mw9wUBUKU4AXnFUXVBQ0m
 EZKLQ9+FN5t0m2884m7WMiHVvOfgjnRMKTBsNH53v7f6ucuEg9IZGDAF5
 opBRlrC9pPRspbxQVgF7g8iXniTFfnYK5fVgb5+Rb7CqSpiz2HIivOdbi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359603196"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="359603196"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745156194"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="745156194"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:12 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 15:34:55 -0700
Message-ID: <20230915223459.2964036-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe/huc: Extract version and binary
 offset from new HuC headers
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

The GSC-enabled HuC binary starts with a GSC header, which is followed
by the legacy-style CSS header and the binary itself. We can parse the
GSC headers to find the HuC version and the location of the binary to
be used for the DMA transfer.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/gsc_binary_headers.h |  74 ++++++++++
 drivers/gpu/drm/xe/xe_huc.c                 | 131 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_huc.h                 |   1 +
 drivers/gpu/drm/xe/xe_uc_fw.c               | 144 +++++++++++++-------
 drivers/gpu/drm/xe/xe_uc_fw.h               |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   5 +
 6 files changed, 304 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_binary_headers.h

diff --git a/drivers/gpu/drm/xe/abi/gsc_binary_headers.h b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
new file mode 100644
index 000000000000..666f2665b5b4
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _GSC_BINARY_HEADERS_H_
+#define _GSC_BINARY_HEADERS_H_
+
+#include <linux/types.h>
+
+struct gsc_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+} __packed;
+
+/* Code partition directory (CPD) structures */
+struct gsc_cpd_header_v2 {
+	u32 header_marker;
+#define GSC_CPD_HEADER_MARKER 0x44504324
+
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u32 partition_name;
+	u32 crc32;
+} __packed;
+
+struct gsc_cpd_entry {
+	u8 name[12];
+
+	/*
+	 * Bits 0-24: offset from the beginning of the code partition
+	 * Bit 25: huffman compressed
+	 * Bits 26-31: reserved
+	 */
+	u32 offset;
+#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
+#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
+
+	/*
+	 * Module/Item length, in bytes. For Huffman-compressed modules, this
+	 * refers to the uncompressed size. For software-compressed modules,
+	 * this refers to the compressed size.
+	 */
+	u32 length;
+
+	u8 reserved[4];
+} __packed;
+
+struct gsc_manifest_header {
+	u32 header_type; /* 0x4 for manifest type */
+	u32 header_length; /* in dwords */
+	u32 header_version;
+	u32 flags;
+	u32 vendor;
+	u32 date;
+	u32 size; /* In dwords, size of entire manifest (header + extensions) */
+	u32 header_id;
+	u32 internal_data;
+	struct gsc_version fw_version;
+	u32 security_version;
+	struct gsc_version meu_kit_version;
+	u32 meu_manifest_version;
+	u8 general_data[4];
+	u8 reserved3[56];
+	u32 modulus_size; /* in dwords */
+	u32 exponent_size; /* in dwords */
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 293403d16f25..ff86b7d8633e 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -5,12 +5,14 @@
 
 #include "xe_huc.h"
 
+#include "abi/gsc_binary_headers.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
@@ -33,6 +35,135 @@ huc_to_guc(struct xe_huc *huc)
 	return &container_of(huc, struct xe_uc, huc)->guc;
 }
 
+#define HUC_CSS_MODULE_TYPE 0x6
+static bool css_valid(const void *data, size_t size)
+{
+	const struct uc_css_header *css = data;
+
+	if (unlikely(size < sizeof(struct uc_css_header)))
+		return false;
+
+	if (css->module_type != HUC_CSS_MODULE_TYPE)
+		return false;
+
+	if (css->module_vendor != PCI_VENDOR_ID_INTEL)
+		return false;
+
+	return true;
+}
+
+static inline u32 entry_offset(const struct gsc_cpd_entry *entry)
+{
+	return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
+}
+
+int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void *data, size_t size)
+{
+	struct xe_huc *huc = container_of(huc_fw, struct xe_huc, fw);
+	struct xe_gt *gt = huc_to_gt(huc);
+	const struct gsc_cpd_header_v2 *header = data;
+	const struct gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	int i;
+
+	if (!huc_fw->has_gsc_headers) {
+		xe_gt_err(gt, "Invalid FW type for GSC header parsing!\n");
+		return -EINVAL;
+	}
+
+	if (size < sizeof(*header)) {
+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	/*
+	 * The GSC-enabled HuC binary starts with a directory header, followed
+	 * by a series of entries. Each entry is identified by a name and
+	 * points to a specific section of the binary containing the relevant
+	 * data. The entries we're interested in are:
+	 * - "HUCP.man": points to the GSC manifest header for the HuC, which
+	 *               contains the version info.
+	 * - "huc_fw": points to the legacy-style binary that can be used for
+	 *             load via the DMA. This entry only contains a valid CSS
+	 *             on binaries for platforms that support 2-step HuC load
+	 *             via dma and auth via GSC (like MTL).
+	 *
+	 * --------------------------------------------------
+	 * [  gsc_cpd_header_v2                             ]
+	 * --------------------------------------------------
+	 * [  gsc_cpd_entry[]                               ]
+	 * [      entry1                                    ]
+	 * [      ...                                       ]
+	 * [      entryX                                    ]
+	 * [          "HUCP.man"                            ]
+	 * [           ...                                  ]
+	 * [           offset  >----------------------------]------o
+	 * [      ...                                       ]      |
+	 * [      entryY                                    ]      |
+	 * [          "huc_fw"                              ]      |
+	 * [           ...                                  ]      |
+	 * [           offset  >----------------------------]----------o
+	 * --------------------------------------------------      |   |
+	 *                                                         |   |
+	 * --------------------------------------------------      |   |
+	 * [ gsc_manifest_header                            ]<-----o   |
+	 * [  ...                                           ]          |
+	 * [  gsc_version fw_version                        ]          |
+	 * [  ...                                           ]          |
+	 * --------------------------------------------------          |
+	 *                                                             |
+	 * --------------------------------------------------          |
+	 * [ data[]                                         ]<---------o
+	 * [  ...                                           ]
+	 * [  ...                                           ]
+	 * --------------------------------------------------
+	 */
+
+	if (header->header_marker != GSC_CPD_HEADER_MARKER) {
+		xe_gt_err(gt, "invalid marker for CPD header: 0x%08x!\n",
+			  header->header_marker);
+		return -EINVAL;
+	}
+
+	/* we only have binaries with header v2 and entry v1 for now */
+	if (header->header_version != 2 || header->entry_version != 1) {
+		xe_gt_err(gt, "invalid CPD header/entry version %u:%u!\n",
+			  header->header_version, header->entry_version);
+		return -EINVAL;
+	}
+
+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
+		xe_gt_err(gt, "invalid CPD header length %u!\n", header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
+	if (size < min_size) {
+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
+		return -ENODATA;
+	}
+
+	entry = data + header->header_length;
+
+	for (i = 0; i < header->num_of_entries; i++, entry++) {
+		if (strcmp(entry->name, "HUCP.man") == 0) {
+			const struct gsc_manifest_header *manifest = data + entry_offset(entry);
+
+			huc_fw->major_ver_found = manifest->fw_version.major;
+			huc_fw->minor_ver_found = manifest->fw_version.minor;
+		}
+
+		if (strcmp(entry->name, "huc_fw") == 0) {
+			u32 offset = entry_offset(entry);
+
+			if (offset < size && css_valid(data + offset, size - offset))
+				huc_fw->dma_start_offset = offset;
+		}
+	}
+
+	return 0;
+}
+
 int xe_huc_init(struct xe_huc *huc)
 {
 	struct xe_device *xe = huc_to_xe(huc);
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index 5802c43b6ce2..e151bcbe13c6 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 
+int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void *data, size_t size);
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
 int xe_huc_auth(struct xe_huc *huc);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 138960138872..f956457d0b11 100644
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
@@ -344,57 +345,21 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 	return -ENOEXEC;
 }
 
-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+static int __parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
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
@@ -403,9 +368,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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
@@ -417,12 +381,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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
@@ -433,6 +396,86 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
 					   css->sw_version);
 
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
+		guc_read_css_info(uc_fw, css);
+
+	return 0;
+}
+
+static int parse_css_header(struct xe_uc_fw *uc_fw, const struct firmware *fw)
+{
+	return __parse_css_header(uc_fw, fw->data, fw->size);
+}
+
+static int parse_gsc_header(struct xe_uc_fw *uc_fw, const struct firmware *fw)
+{
+	int err;
+
+	/* only supported for HuC from now */
+	if (uc_fw->type != XE_UC_FW_TYPE_HUC)
+		return -EINVAL;
+
+	err = xe_huc_parse_gsc_header(uc_fw, fw->data, fw->size);
+	if (err)
+		return err;
+
+	if (uc_fw->dma_start_offset) {
+		u32 delta = uc_fw->dma_start_offset;
+
+		err = __parse_css_header(uc_fw, fw->data + delta, fw->size - delta);
+		if (err)
+			return err;
+	}
+
+	return 0;
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
+	if (uc_fw->has_gsc_headers)
+		err = parse_gsc_header(uc_fw, fw);
+	else
+		err = parse_css_header(uc_fw, fw);
+	if (err)
+		goto fail;
+
 	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
 		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
@@ -441,9 +484,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
-		guc_read_css_info(uc_fw, css);
-
 	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
 				     ttm_bo_type_kernel,
 				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
@@ -496,7 +536,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	/* Set the source address for the uCode */
-	src_offset = uc_fw_ggtt_offset(uc_fw);
+	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->dma_start_offset;
 	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
 	xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index a519c77d4962..44aee1bdb133 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p);
 
 static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
 {
-	return sizeof(struct uc_css_header) + uc_fw->ucode_size;
+	return sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->dma_start_offset;
 }
 
 static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 444bff83cdbe..850224890f25 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -91,6 +91,9 @@ struct xe_uc_fw {
 	/** @bo: XE BO for uC firmware */
 	struct xe_bo *bo;
 
+	/** @has_gsc_headers: whether the FW starts with GSC headers instead of CSS */
+	bool has_gsc_headers;
+
 	/*
 	 * The firmware build process will generate a version header file with
 	 * major and minor version defined. The versions are built into CSS
@@ -113,6 +116,8 @@ struct xe_uc_fw {
 	u32 rsa_size;
 	/** @ucode_size: micro kernel size */
 	u32 ucode_size;
+	/** @dma_start_offset: offset within the blob at which the FW is located */
+	u32 dma_start_offset;
 
 	/** @private_data_size: size of private data found in uC css header */
 	u32 private_data_size;
-- 
2.41.0

