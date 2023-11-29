Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16320C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB7F10E5E4;
	Wed, 29 Nov 2023 01:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994510E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220651; x=1732756651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=anTfKzJlnAqatSoOGpWkVleHRdHDIxXkRO94l6gRrf0=;
 b=dE194xGlzpu7CZfL+wf2f3yCKtiZPHwVGgR49SDDxC2uwEClrb04zd3o
 DJRnOxCqG028ju1XcdLjmOEX9rLIAjAKORHCI6yZFrqgRVHRq9/2VbnKc
 30barCZ7bK0eWqM5A8Rd3wyTEhNWXxDLvKHVU7SHi351KUmzplqf8qdeN
 T7v0yAKymBITiWaFNr0AfpydNZo/giMwsGUwI7/EDzsIYaLfQTT9+k9H5
 aDGQ/VKxok8ZL4IM0z7wewYBHgeagER1i3VKM5bADfp3ZEmSAaRE7z2ZV
 Aony2tywK4npD3j+f+PpK7DMyvle0OZEq0aYQ4Z+W7c2YBQdI38+WsaYM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6329499"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6329499"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100322354"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1100322354"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:30 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:17:19 -0800
Message-ID: <20231129011721.2793482-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
References: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/huc: HuC authentication via GSC
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

HuC authentication via GSC is performed by submitting the appropriate
PXP packet to the GSC FW. This packet can trigger a "pending" reply from
the FW, so we need to handle that and resubmit. Note that the auth via
GSC can only be performed if the HuC has already been authenticated by
the GuC.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  59 ++++++++
 drivers/gpu/drm/xe/xe_gsc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_huc.c                   | 141 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_huc.h                   |   1 +
 drivers/gpu/drm/xe/xe_huc_types.h             |   5 +
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +
 drivers/gpu/drm/xe/xe_uc_fw_types.h           |   3 +
 7 files changed, 218 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h

diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
new file mode 100644
index 000000000000..57520809e48d
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
+#define _ABI_GSC_PXP_COMMANDS_ABI_H
+
+#include <linux/types.h>
+
+/* Heci client ID for PXP commands */
+#define HECI_MEADDRESS_PXP 17
+
+#define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
+
+/*
+ * there are a lot of status codes for PXP, but we only define the cross-API
+ * common ones that we actually can handle in the kernel driver. Other failure
+ * codes should be printed to error msg for debug.
+ */
+enum pxp_status {
+	PXP_STATUS_SUCCESS = 0x0,
+	PXP_STATUS_ERROR_API_VERSION = 0x1002,
+	PXP_STATUS_NOT_READY = 0x100e,
+	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
+	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
+	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
+};
+
+/* Common PXP FW message header */
+struct pxp_cmd_header {
+	u32 api_version;
+	u32 command_id;
+	union {
+		u32 status; /* out */
+		u32 stream_id; /* in */
+#define PXP_CMDHDR_EXTDATA_SESSION_VALID GENMASK(0, 0)
+#define PXP_CMDHDR_EXTDATA_APP_TYPE GENMASK(1, 1)
+#define PXP_CMDHDR_EXTDATA_SESSION_ID GENMASK(17, 2)
+	};
+	/* Length of the message (excluding the header) */
+	u32 buffer_len;
+} __packed;
+
+#define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
+
+/* PXP-Input-Packet: HUC Auth-only */
+struct pxp43_new_huc_auth_in {
+	struct pxp_cmd_header header;
+	u64 huc_base_address;
+	u32 huc_size;
+} __packed;
+
+/* PXP-Output-Packet: HUC Load and Authentication or Auth-only */
+struct pxp43_huc_auth_out {
+	struct pxp_cmd_header header;
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 020b7b4c6ffc..4aad6a8c9dde 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -16,6 +16,7 @@
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_sched_job.h"
@@ -257,11 +258,18 @@ static void gsc_work(struct work_struct *work)
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
 	ret = gsc_upload(gsc);
-	if (ret && ret != -EEXIST)
+	if (ret && ret != -EEXIST) {
 		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	else
-		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+		goto out;
+	}
 
+	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+
+	/* HuC auth failure is not fatal */
+	if (xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GUC))
+		xe_huc_auth(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC);
+
+out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_device_mem_access_put(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 9845165a819c..3c7e1c10d5fa 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -5,14 +5,19 @@
 
 #include "xe_huc.h"
 
+#include <drm/drm_managed.h>
+
+#include "abi/gsc_pxp_commands_abi.h"
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
+#include "xe_gsc_submit.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
+#include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
@@ -34,6 +39,42 @@ huc_to_guc(struct xe_huc *huc)
 	return &container_of(huc, struct xe_uc, huc)->guc;
 }
 
+static void free_gsc_pkt(struct drm_device *drm, void *arg)
+{
+	struct xe_huc *huc = arg;
+
+	xe_bo_unpin_map_no_vm(huc->gsc_pkt);
+	huc->gsc_pkt = NULL;
+}
+
+#define PXP43_HUC_AUTH_INOUT_SIZE SZ_4K
+static int huc_alloc_gsc_pkt(struct xe_huc *huc)
+{
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *bo;
+	int err;
+
+	/* we use a single object for both input and output */
+	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
+				  PXP43_HUC_AUTH_INOUT_SIZE * 2,
+				  ttm_bo_type_kernel,
+				  XE_BO_CREATE_SYSTEM_BIT |
+				  XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	huc->gsc_pkt = bo;
+
+	err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
+	if (err) {
+		free_gsc_pkt(&xe->drm, huc);
+		return err;
+	}
+
+	return 0;
+}
+
 int xe_huc_init(struct xe_huc *huc)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
@@ -56,6 +97,12 @@ int xe_huc_init(struct xe_huc *huc)
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return 0;
 
+	if (huc->fw.has_gsc_headers) {
+		ret = huc_alloc_gsc_pkt(huc);
+		if (ret)
+			goto out;
+	}
+
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
 
 	return 0;
@@ -72,6 +119,89 @@ int xe_huc_upload(struct xe_huc *huc)
 	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
 }
 
+#define huc_auth_msg_wr(xe_, map_, offset_, field_, val_) \
+	xe_map_wr_field(xe_, map_, offset_, struct pxp43_new_huc_auth_in, field_, val_)
+#define huc_auth_msg_rd(xe_, map_, offset_, field_) \
+	xe_map_rd_field(xe_, map_, offset_, struct pxp43_huc_auth_out, field_)
+
+static u32 huc_emit_pxp_auth_msg(struct xe_device *xe, struct iosys_map *map,
+				 u32 wr_offset, u32 huc_offset, u32 huc_size)
+{
+	xe_map_memset(xe, map, wr_offset, 0, sizeof(struct pxp43_new_huc_auth_in));
+
+	huc_auth_msg_wr(xe, map, wr_offset, header.api_version, PXP_APIVER(4, 3));
+	huc_auth_msg_wr(xe, map, wr_offset, header.command_id, PXP43_CMDID_NEW_HUC_AUTH);
+	huc_auth_msg_wr(xe, map, wr_offset, header.status, 0);
+	huc_auth_msg_wr(xe, map, wr_offset, header.buffer_len,
+			sizeof(struct pxp43_new_huc_auth_in) - sizeof(struct pxp_cmd_header));
+	huc_auth_msg_wr(xe, map, wr_offset, huc_base_address, huc_offset);
+	huc_auth_msg_wr(xe, map, wr_offset, huc_size, huc_size);
+
+	return wr_offset + sizeof(struct pxp43_new_huc_auth_in);
+}
+
+static int huc_auth_via_gsccs(struct xe_huc *huc)
+{
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *pkt = huc->gsc_pkt;
+	u32 wr_offset;
+	u32 rd_offset;
+	u64 ggtt_offset;
+	u32 out_status;
+	int retry = 5;
+	int err = 0;
+
+	if (!pkt)
+		return -ENODEV;
+
+	ggtt_offset = xe_bo_ggtt_addr(pkt);
+
+	wr_offset = xe_gsc_emit_header(xe, &pkt->vmap, 0, HECI_MEADDRESS_PXP, 0,
+				       sizeof(struct pxp43_new_huc_auth_in));
+	wr_offset = huc_emit_pxp_auth_msg(xe, &pkt->vmap, wr_offset,
+					 xe_bo_ggtt_addr(huc->fw.bo),
+					 huc->fw.bo->size);
+	do {
+		err = xe_gsc_pkt_submit_kernel(&gt->uc.gsc, ggtt_offset, wr_offset,
+					       ggtt_offset + PXP43_HUC_AUTH_INOUT_SIZE,
+					       PXP43_HUC_AUTH_INOUT_SIZE);
+		if (err)
+			break;
+
+		if (xe_gsc_check_and_update_pending(xe, &pkt->vmap, 0, &pkt->vmap,
+						    PXP43_HUC_AUTH_INOUT_SIZE)) {
+			err = -EBUSY;
+			msleep(50);
+		}
+	} while (--retry && err == -EBUSY);
+
+	if (err) {
+		drm_err(&xe->drm, "failed to submit GSC request to auth: %d\n", err);
+		return err;
+	}
+
+	err = xe_gsc_read_out_header(xe, &pkt->vmap, PXP43_HUC_AUTH_INOUT_SIZE,
+				     sizeof(struct pxp43_huc_auth_out), &rd_offset);
+	if (err) {
+		drm_err(&xe->drm, "HuC: invalid GSC reply for auth (err=%d)\n", err);
+		return err;
+	}
+
+	/*
+	 * The GSC will return PXP_STATUS_OP_NOT_PERMITTED if the HuC is already
+	 * authenticated. If the same error is ever returned with HuC not loaded
+	 * we'll still catch it when we check the authentication bit later.
+	 */
+	out_status = huc_auth_msg_rd(xe, &pkt->vmap, rd_offset, header.status);
+	if (out_status != PXP_STATUS_SUCCESS && out_status != PXP_STATUS_OP_NOT_PERMITTED) {
+		drm_err(&xe->drm, "auth failed with GSC error = 0x%x\n", out_status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static const struct {
 	const char *name;
 	struct xe_reg reg;
@@ -85,8 +215,10 @@ static const struct {
 				  HECI1_FWSTS5_HUC_AUTH_DONE },
 };
 
-static bool huc_is_authenticated(struct xe_gt *gt, enum xe_huc_auth_types type)
+bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
 {
+	struct xe_gt *gt = huc_to_gt(huc);
+
 	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
 }
 
@@ -100,10 +232,8 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return 0;
 
-	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
-
 	/* On newer platforms the HuC survives reset, so no need to re-auth */
-	if (huc_is_authenticated(gt, type)) {
+	if (xe_huc_is_authenticated(huc, type)) {
 		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
 		return 0;
 	}
@@ -116,6 +246,9 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 		ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
 				      xe_uc_fw_rsa_offset(&huc->fw));
 		break;
+	case XE_HUC_AUTH_VIA_GSC:
+		ret = huc_auth_via_gsccs(huc);
+		break;
 	default:
 		XE_WARN_ON(type);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index b8c387f14b8e..532017230287 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -19,6 +19,7 @@ enum xe_huc_auth_types {
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
+bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
 void xe_huc_sanitize(struct xe_huc *huc);
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/xe/xe_huc_types.h b/drivers/gpu/drm/xe/xe_huc_types.h
index cae6d19097df..cfbaa5e0dfca 100644
--- a/drivers/gpu/drm/xe/xe_huc_types.h
+++ b/drivers/gpu/drm/xe/xe_huc_types.h
@@ -8,12 +8,17 @@
 
 #include "xe_uc_fw_types.h"
 
+struct xe_bo;
+
 /**
  * struct xe_huc - HuC
  */
 struct xe_huc {
 	/** @fw: Generic uC firmware management */
 	struct xe_uc_fw fw;
+
+	/** @gsc_pkt: bo to store the packet for auth via GSC */
+	struct xe_bo *gsc_pkt;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2fcec528a1d1..eb1e6a883f13 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -529,6 +529,8 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
 		uc_fw->css_offset = offset;
 	}
 
+	uc_fw->has_gsc_headers = true;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index fc1de0cc9324..ee914a5d8523 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -112,6 +112,9 @@ struct xe_uc_fw {
 	/** @bo: XE BO for uC firmware */
 	struct xe_bo *bo;
 
+	/** @has_gsc_headers: whether the FW image starts with GSC headers */
+	bool has_gsc_headers;
+
 	/*
 	 * The firmware build process will generate a version header file with
 	 * major and minor version defined. The versions are built into CSS
-- 
2.41.0

