Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC1C25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3FA10EA5B;
	Fri, 27 Oct 2023 22:30:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03C210EA5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445786; x=1729981786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5ruAfp0TvVpKcqUZWa70tf83FbWIANOKl+hMz29ngQ=;
 b=NLACKGylq3lAV+n1D54/vZee1bmI+yoxGOls8+WrNy11frcKvWBZxcP1
 6S+oODURcIDqRLqPYvgzq8xTkTKuAropWz6cMGHPiAzORk0b//1BKXXvg
 uSPq/ubu2OR91Sg5e0ri1//BoQuVTehSeLy5D78++xCDxl3Gzg663q5wr
 2U+TDeaI09jtJoy3TactKRvoJq9WYL+Ffuas87H70r/JusA0eT6AJLT8B
 LtNp52XizzOH6PgcNGxP2S7IGl0ncogvGzcHdDC0xcnCCOMdxx5coZaOn
 XQO33i1HuUmUMw8/kj7W2JTbLoozOi3/mGFU7L0YpvWEYz7q/GNF2aY9M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397789"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360381"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360381"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:24 -0700
Message-ID: <20231027222928.1981633-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/12] drm/xe/gsc: Query GSC compatibility version
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

The version is obtained via a dedicated MKHI GSC command.
The compatibility version is what we want to match against for the GSC,
so we need to call the FW version checker after obtaining the version.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/xe/abi/gsc_mkhi_commands_abi.h    | 39 +++++++++
 drivers/gpu/drm/xe/xe_gsc.c                   | 81 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c                 | 18 +++--
 drivers/gpu/drm/xe/xe_uc_fw.h                 |  1 +
 4 files changed, 133 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h

diff --git a/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
new file mode 100644
index 000000000000..ad4d041873ab
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _ABI_GSC_MKHI_COMMANDS_ABI_H
+#define _ABI_GSC_MKHI_COMMANDS_ABI_H
+
+#include <linux/types.h>
+
+/* Heci client ID for MKHI commands */
+#define HECI_MEADDRESS_MKHI 7
+
+/* Generic MKHI header */
+struct gsc_mkhi_header {
+	u8  group_id;
+	u8  command;
+	u8  reserved;
+	u8  result;
+} __packed;
+
+/* GFX_SRV commands */
+#define MKHI_GROUP_ID_GFX_SRV 0x30
+
+#define MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION (0x42)
+
+struct gsc_get_compatibility_version_in {
+	struct gsc_mkhi_header header;
+} __packed;
+
+struct gsc_get_compatibility_version_out {
+	struct gsc_mkhi_header header;
+	u16 proj_major;
+	u16 compat_major;
+	u16 compat_minor;
+	u16 reserved[5];
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index edf74780322a..63323a53f77f 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -7,10 +7,12 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/gsc_mkhi_commands_abi.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_gsc_submit.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_map.h"
@@ -89,6 +91,77 @@ static int emit_gsc_upload(struct xe_gsc *gsc)
 	return 0;
 }
 
+#define query_msg_wr(xe_, map_, offset_, field_, val_) \
+	xe_map_wr_field(xe_, map_, offset_, struct gsc_get_compatibility_version_in, field_, val_)
+#define query_msg_rd(xe_, map_, offset_, field_) \
+	xe_map_rd_field(xe_, map_, offset_, struct gsc_get_compatibility_version_out, field_)
+
+static u32 emit_version_query_msg(struct xe_device *xe, struct iosys_map *map, u32 wr_offset)
+{
+	xe_map_memset(xe, map, wr_offset, 0, sizeof(struct gsc_get_compatibility_version_in));
+
+	query_msg_wr(xe, map, wr_offset, header.group_id, MKHI_GROUP_ID_GFX_SRV);
+	query_msg_wr(xe, map, wr_offset, header.command, MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION);
+
+	return wr_offset + sizeof(struct gsc_get_compatibility_version_in);
+}
+
+#define GSC_VER_PKT_SZ SZ_4K /* 4K each for input and output */
+static int query_compatibility_version(struct xe_gsc *gsc)
+{
+	struct xe_uc_fw_version *compatibility = &gsc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *bo;
+	u32 wr_offset;
+	u32 rd_offset;
+	u64 ggtt_offset;
+	int err;
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
+			  ttm_bo_type_kernel,
+			  XE_BO_CREATE_SYSTEM_BIT |
+			  XE_BO_CREATE_GGTT_BIT);;
+	if (IS_ERR(bo)) {
+		xe_gt_err(gt, "failed to allocate bo for GSC version query\n");
+		return err;
+	}
+
+	ggtt_offset = xe_bo_ggtt_addr(bo);
+
+	wr_offset = xe_gsc_emit_header(xe, &bo->vmap, 0, HECI_MEADDRESS_MKHI, 0,
+				       sizeof(struct gsc_get_compatibility_version_in));
+	wr_offset = emit_version_query_msg(xe, &bo->vmap, wr_offset);
+
+	err = xe_gsc_pkt_submit_kernel(gsc, ggtt_offset, wr_offset,
+				       ggtt_offset + GSC_VER_PKT_SZ,
+				       GSC_VER_PKT_SZ);
+	if (err) {
+		xe_gt_err(gt,
+			  "failed to submit GSC request for compatibility version: %d\n",
+			  err);
+		goto out_bo;
+	}
+
+	err = xe_gsc_read_out_header(xe, &bo->vmap, GSC_VER_PKT_SZ,
+				     sizeof(struct gsc_get_compatibility_version_out),
+				     &rd_offset);
+	if (err) {
+		xe_gt_err(gt, "HuC: invalid GSC reply for version query (err=%d)\n", err);
+		return err;
+	}
+
+	compatibility->major = query_msg_rd(xe, &bo->vmap, rd_offset, compat_major);
+	compatibility->minor = query_msg_rd(xe, &bo->vmap, rd_offset, compat_minor);
+
+	xe_gt_info(gt, "found GSC cv%u.%u\n", compatibility->major, compatibility->minor);
+
+out_bo:
+	xe_bo_unpin_map_no_vm(bo);
+	return err;
+}
+
 static int gsc_fw_is_loaded(struct xe_gt *gt)
 {
 	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
@@ -147,6 +220,14 @@ static int gsc_upload(struct xe_gsc *gsc)
 		return err;
 	}
 
+	err = query_compatibility_version(gsc);
+	if (err)
+		return err;
+
+	err = xe_uc_fw_check_version_requirements(&gsc->fw);
+	if (err)
+		return err;
+
 	xe_gt_dbg(gt, "GSC FW async load completed\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index bb38a76eb4a6..f57476f57de9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -224,8 +224,11 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 			uc_fw->versions.wanted.minor = entries[i].minor;
 			uc_fw->full_ver_required = entries[i].full_ver_required;
 
-			/* compatibility version checking coming soon */
-			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
+			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
+				uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
+			else
+				uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
+
 			break;
 		}
 	}
@@ -321,7 +324,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	uc_fw->private_data_size = css->private_data_size;
 }
 
-static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
+int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
@@ -678,9 +681,12 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 			    "Using %s firmware from %s",
 			    xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
 
-	err = uc_fw_check_version_requirements(uc_fw);
-	if (err)
-		goto fail;
+	/* for GSC FW we want the compatibility version, which we query after load */
+	if (uc_fw->type != XE_UC_FW_TYPE_GSC) {
+		err = xe_uc_fw_check_version_requirements(uc_fw);
+		if (err)
+			goto fail;
+	}
 
 	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
 				     ttm_bo_type_kernel,
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index d4682b0276e2..d0d17f61a4ce 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -17,6 +17,7 @@ struct drm_printer;
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
 size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
+int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);
 void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p);
 
 static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
-- 
2.41.0

