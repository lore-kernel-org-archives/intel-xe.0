Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D09C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 20:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D1C112008;
	Wed, 27 Mar 2024 20:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0WyJuGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C781110000
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711572045; x=1743108045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xd/TUXMOnqvDEY0PfGQiC4hjaxffE7lFrR+uL314jM8=;
 b=N0WyJuGTjRzOJCC/feLI+fuH1Ru7pvNffh2xNi7VGzY7/eS2eNEzPRqV
 osVQKHvR1h74zZzhCgOgUBZKm5P0VU3NtsfPqrbvDQNeBAyFLPq3sZ4A2
 do2SyErMWECT22uUW10bI0XhGC89WrwHc9sPPrsno1SbbDydq4fyINwbY
 x3sKSRHtWkNDFtXAH3c1A5RX1y+loZRmhw7GvGaEbA9U0Ml4tylUDqGlv
 56oRwaYTU2wEZQ3krSdOjwNRlAEJnNtwUEmBP1+ZAfd4KLbYdCv+PZRr9
 1hEEZTtC78bQ6vPBbPeXwVVP4JPTLpL8IPculfmzL3/NvYQPNV/5fpddO w==;
X-CSE-ConnectionGUID: c68XxG7iQv2Z5hZ3dc+PTw==
X-CSE-MsgGUID: vTSgHaZ4S8usf3/iLOztxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="29182153"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="29182153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="21109767"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 27 Mar 2024 13:40:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 1/7] drm/xe/guc: Update GuC ADS size for error capture
Date: Wed, 27 Mar 2024 13:40:35 -0700
Message-Id: <20240327204041.178879-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327204041.178879-1-zhanjun.dong@intel.com>
References: <20240327204041.178879-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Update GuC ADS size allocation to include space for
the lists of error state capture register descriptors.

Then, populate GuC ADS with the lists of registers we want
GuC to report back to host on engine reset events. This list
should include global, engine-class and engine-instance
registers for every engine-class type on the current hardware.

Ensure we allocate a persistent store for the register lists
that are populated into ADS so that we don't need to allocate
memory during GT resets when GuC is reloaded and ADS population
happens again.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_guc.c              |   5 +
 drivers/gpu/drm/xe/xe_guc_ads.c          | 208 +++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |   2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 300 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |  20 ++
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h | 177 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h         |  20 ++
 drivers/gpu/drm/xe/xe_guc_types.h        |   2 +
 9 files changed, 724 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 705c0eaf6e71..ec5b8994bc8f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -93,6 +93,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 77be3bc2d7c0..0eac811a2a48 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -19,6 +19,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ads.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
@@ -309,6 +310,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = xe_guc_capture_init(guc);
+	if (ret)
+		goto out;
+
 	ret = xe_guc_ads_init(&guc->ads);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index df2bffb7e220..abc0866bf22c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -14,6 +14,8 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -117,6 +119,8 @@ struct __guc_ads_blob {
 #define info_map_read(xe_, map_, field_) \
 	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
 
+static int guc_capture_prep_lists(struct xe_guc_ads *ads);
+
 static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
@@ -133,8 +137,7 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 {
-	/* FIXME: Allocate a proper capture list */
-	return PAGE_ALIGN(PAGE_SIZE);
+	return PAGE_ALIGN(ads->capture_size);
 }
 
 static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
@@ -260,6 +263,34 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static size_t calculate_capture_worst_size(struct xe_guc_ads *ads)
+{
+	struct xe_guc *guc = ads_to_guc(ads);
+	size_t total_size, class_size, instance_size, global_size;
+	int i, j;
+
+	/* Early calcuate the capture size, to reserve capture size before guc init finished,
+	 * as engine mask is not ready, the calculate here is the worst case size
+	 */
+	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
+		for (j = 0; j < GUC_LAST_ENGINE_CLASS; j++) {
+			class_size = 0;
+			instance_size = 0;
+			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+						   j, &class_size);
+			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+						   j, &instance_size);
+			total_size += class_size + instance_size;
+		}
+		global_size = 0;
+		xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &global_size);
+		total_size += PAGE_ALIGN(global_size);
+	}
+
+	return total_size;
+}
+
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
 int xe_guc_ads_init(struct xe_guc_ads *ads)
@@ -270,6 +301,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	struct xe_bo *bo;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
+	ads->capture_size = calculate_capture_worst_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
@@ -302,9 +334,11 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 	xe_gt_assert(gt, ads->bo);
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
+	ads->capture_size = 0; /* Clear capture_size before run guc_capture_prep_lists */
+	ads->capture_size = guc_capture_prep_lists(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
-	xe_gt_assert(gt, ads->golden_lrc_size +
+	xe_gt_assert(gt, ads->golden_lrc_size + ads->capture_size +
 		     (ads->regset_size - prev_regset_size) <=
 		     MAX_GOLDEN_LRC_SIZE);
 
@@ -394,20 +428,172 @@ static void guc_mapping_table_init(struct xe_gt *gt,
 	}
 }
 
-static void guc_capture_list_init(struct xe_guc_ads *ads)
+static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
+				       u32 capture_class)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 mask;
+
+	switch (capture_class) {
+	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
+		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEO:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_BLITTER:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
+		break;
+
+	default:
+		mask = 0;
+	}
+
+	return mask;
+}
+
+static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 {
+	struct xe_guc *guc = ads_to_guc(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
+	struct iosys_map info_map;
+	bool ads_is_mapped;
+	size_t size = 0;
+	void *ptr;
 	int i, j;
-	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
 
-	/* FIXME: Populate a proper capture list */
+	ads_is_mapped = ads->capture_size != 0;
+	if (ads_is_mapped) {
+		capture_offset = guc_ads_capture_offset(ads);
+		ads_ggtt =  xe_bo_ggtt_addr(ads->bo);
+		info_map =  IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
+						  offsetof(struct __guc_ads_blob, system_info));
+	} else {
+		/* Bail with worst case size calculations */
+		total_size = calculate_capture_worst_size(ads);
+		return total_size;
+	}
+
+	/* first, set aside the first page for a capture_list with zero descriptors */
+	total_size = PAGE_SIZE;
+	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
+
+	null_ggtt = ads_ggtt + capture_offset;
+	capture_offset += PAGE_SIZE;
+
+	/* Populate capture list : at this point adps is already allocated and mapped to worst case
+	 * size
+	 */
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
-		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
-			ads_blob_write(ads, ads.capture_instance[i][j], addr);
-			ads_blob_write(ads, ads.capture_class[i][j], addr);
+		bool write_empty_list;
+
+		for (j = 0; j < GUC_LAST_ENGINE_CLASS; j++) {
+			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
+			/* null list if we dont have said engine or list */
+			if (!engine_mask) {
+				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
+				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
+				continue;
+			}
+			/********************************************************/
+			/*** engine exists: start with engine-class registers ***/
+			/********************************************************/
+			write_empty_list = true; /* starting assumption is an empty list */
+			size = 0;
+			if (!xe_guc_capture_getlistsize(guc, i,
+							GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+							j, &size)) {
+				if (total_size + size > ads->capture_size)
+					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+						  total_size + size, ads->capture_size);
+				else if (!xe_guc_capture_getlist(guc, i,
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+								 j, &ptr))
+					/* everything checked out, populate! */
+					write_empty_list = false;
+			}
+			if (!write_empty_list) {
+				ads_blob_write(ads, ads.capture_class[i][j],
+					       ads_ggtt + capture_offset);
+				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
+						 ptr, size);
+				total_size += size;
+				capture_offset += size;
+			} else {
+				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
+			}
+
+			/********************************************************/
+			/*** engine exists: next, engine-instance registers   ***/
+			/********************************************************/
+			write_empty_list = true; /* starting assumption is an empty list */
+			size = 0;
+			if (!xe_guc_capture_getlistsize(guc, i,
+							GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+							j, &size)) {
+				if (total_size + size > ads->capture_size)
+					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+						  total_size + size, ads->capture_size);
+				else if (!xe_guc_capture_getlist(guc, i,
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+								 j, &ptr))
+					/* everything checked out, populate! */
+					write_empty_list = false;
+			}
+
+			if (!write_empty_list) {
+				ads_blob_write(ads, ads.capture_instance[i][j],
+					       ads_ggtt + capture_offset);
+				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
+						 ptr, size);
+				total_size += size;
+				capture_offset += size;
+			} else {
+				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
+			}
 		}
 
-		ads_blob_write(ads, ads.capture_global[i], addr);
+		/********************************************************/
+		/*** global registers is last in our PF/VF loops      ***/
+		/********************************************************/
+		write_empty_list = true; /* starting assumption is an empty list */
+		size = 0;
+		if (!xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &size)) {
+			if (total_size + size > ads->capture_size)
+				xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+					  total_size + size, ads->capture_size);
+			else if (!xe_guc_capture_getlist(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0,
+							 &ptr))
+				write_empty_list = false; /* everything checked out, populate! */
+		}
+		if (!write_empty_list) {
+			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
+			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
+					 size);
+			total_size += size;
+			capture_offset += size;
+		} else {
+			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
+		}
 	}
+
+	if (ads->capture_size != PAGE_ALIGN(total_size))
+		xe_gt_info(gt, "ADS capture alloc size changed from %d to %d\n",
+			   ads->capture_size, PAGE_ALIGN(total_size));
+	return PAGE_ALIGN(total_size);
 }
 
 static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
@@ -596,7 +782,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_mmio_reg_state_init(ads);
 	guc_prep_golden_lrc_null(ads);
 	guc_mapping_table_init(gt, &info_map);
-	guc_capture_list_init(ads);
+	guc_capture_prep_lists(ads);
 	guc_doorbell_init(ads);
 
 	if (xe->info.has_usm) {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 4afe44bece4b..82cf569b0710 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -20,6 +20,8 @@ struct xe_guc_ads {
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
 	u32 regset_size;
+	/** @capture_size: size of register set passed to GuC for capture */
+	u32 capture_size;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
new file mode 100644
index 000000000000..bc6b682998e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "abi/guc_actions_abi.h"
+#include "regs/xe_regs.h"
+#include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue_types.h"
+#include "xe_hw_engine_types.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
+#include "xe_guc_ct.h"
+
+#include "xe_guc_log.h"
+#include "xe_gt_mcr.h"
+#include "xe_guc_submit.h"
+#include "xe_macros.h"
+#include "xe_map.h"
+
+static const char * const capture_list_type_names[] = {
+	"Global",
+	"Class",
+	"Instance",
+	"unknown",	/* Default name, if out of bound */
+};
+
+static const char * const capture_engine_class_names[] = {
+	"Render/Compute",
+	"Video",
+	"VideoEnhance",
+	"Blitter",
+	"GSC-Other",
+	"unknown",	/* Default name, if out of bound */
+};
+
+/* Get item from array by index.
+ * The last item is the default value, referenced for index out of bound condition.
+ */
+#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
+									 (index)])
+
+static const struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
+			 u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].list; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+static struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
+			     u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].extlist; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+static const struct __guc_mmio_reg_descr_group *
+guc_capture_get_device_reglist(struct xe_guc *guc)
+{
+	//FIXME: add register list
+	return NULL;
+}
+
+static int
+guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
+		      struct guc_mmio_reg *ptr, u16 num_entries)
+{
+	u32 i = 0, j = 0;
+	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
+	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
+	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+
+	if (!reglists)
+		return -ENODEV;
+
+	match = guc_capture_get_one_list(reglists, owner, type, classid);
+	if (!match)
+		return -ENODATA;
+
+	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
+		ptr[i].offset = match->list[i].reg.addr;
+		ptr[i].value = 0xDEADF00D;
+		ptr[i].flags = match->list[i].flags;
+		ptr[i].mask = match->list[i].mask;
+	}
+
+	matchext = guc_capture_get_one_ext_list(extlists, owner, type, classid);
+	if (matchext) {
+		for (i = match->num_regs, j = 0; i < num_entries &&
+		     i < (match->num_regs + matchext->num_regs) &&
+			j < matchext->num_regs; ++i, ++j) {
+			ptr[i].offset = matchext->extlist[j].reg.addr;
+			ptr[i].value = 0xDEADF00D;
+			ptr[i].flags = matchext->extlist[j].flags;
+			ptr[i].mask = matchext->extlist[j].mask;
+		}
+	}
+	if (i < num_entries)
+		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
+			  num_entries);
+
+	return 0;
+}
+
+static int
+guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
+{
+	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+	int num_regs;
+
+	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
+	if (!match)
+		return 0;
+
+	num_regs = match->num_regs;
+
+	matchext = guc_capture_get_one_ext_list(gc->extlists, owner, type, classid);
+	if (matchext)
+		num_regs += matchext->num_regs;
+
+	return num_regs;
+}
+
+static int
+guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
+			size_t *size, bool is_purpose_est)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
+	int num_regs;
+
+	if (!gc->reglists) {
+		xe_gt_warn(guc_to_gt(guc), "No capture reglist for this device\n");
+		return -ENODEV;
+	}
+
+	if (cache->is_valid) {
+		*size = cache->size;
+		return cache->status;
+	}
+
+	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
+	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
+		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
+			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: global!\n");
+		else
+			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: %s(%u):%s(%u)!\n",
+				   get_item_with_default(capture_list_type_names, type), type,
+				   get_item_with_default(capture_engine_class_names, classid),
+				   classid);
+		return -ENODEV;
+	}
+
+	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
+	/* intentional empty lists can exist depending on hw config */
+	if (!num_regs)
+		return -ENODATA;
+
+	if (size)
+		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
+				   (num_regs * sizeof(struct guc_mmio_reg)));
+
+	return 0;
+}
+
+int
+xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
+{
+	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
+}
+
+int
+xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
+	struct guc_debug_capture_list *listnode;
+	int ret, num_regs;
+	u8 *caplist, *tmp;
+	size_t size = 0;
+
+	if (!gc->reglists)
+		return -ENODEV;
+
+	if (cache->is_valid) {
+		*outptr = cache->ptr;
+		return cache->status;
+	}
+
+	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
+	if (ret) {
+		cache->is_valid = true;
+		cache->ptr = NULL;
+		cache->size = 0;
+		cache->status = ret;
+		return ret;
+	}
+
+	caplist = kzalloc(size, GFP_KERNEL);
+	if (!caplist) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");
+		return -ENOMEM;
+	}
+
+	/* populate capture list header */
+	tmp = caplist;
+	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
+	listnode = (struct guc_debug_capture_list *)tmp;
+	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
+
+	/* populate list of register descriptor */
+	tmp += sizeof(struct guc_debug_capture_list);
+	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
+
+	/* cache this list */
+	cache->is_valid = true;
+	cache->ptr = caplist;
+	cache->size = size;
+	cache->status = 0;
+
+	*outptr = caplist;
+
+	return 0;
+}
+
+int
+xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	int tmp = sizeof(u32) * 4;
+	void *null_header;
+
+	if (gc->ads_null_cache) {
+		*outptr = gc->ads_null_cache;
+		*size = tmp;
+		return 0;
+	}
+
+	null_header = kzalloc(tmp, GFP_KERNEL);
+	if (!null_header) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");
+		return -ENOMEM;
+	}
+
+	gc->ads_null_cache = null_header;
+	*outptr = null_header;
+	*size = tmp;
+
+	return 0;
+}
+
+int xe_guc_capture_init(struct xe_guc *guc)
+{
+	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
+	if (!guc->capture)
+		return -ENOMEM;
+
+	guc->capture->reglists = guc_capture_get_device_reglist(guc);
+
+	INIT_LIST_HEAD(&guc->capture->outlist);
+	INIT_LIST_HEAD(&guc->capture->cachelist);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
new file mode 100644
index 000000000000..a16dcbe87af0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2021 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_H
+#define _XE_GUC_CAPTURE_H
+
+#include <linux/types.h>
+#include "xe_exec_queue_types.h"
+
+struct xe_guc;
+
+void xe_guc_capture_process(struct xe_guc *guc);
+int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
+int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
+int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
+int xe_guc_capture_init(struct xe_guc *guc);
+
+#endif /* _XE_GUC_CAPTURE_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
new file mode 100644
index 000000000000..4bb94ac1ff48
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_FWIF_H
+#define _XE_GUC_CAPTURE_FWIF_H
+
+#include <linux/types.h>
+#include "regs/xe_reg_defs.h"
+#include "xe_guc_fwif.h"
+
+/*
+ * struct guc_debug_capture_list_header / struct guc_debug_capture_list
+ *
+ * As part of ADS registration, these header structures (followed by
+ * an array of 'struct guc_mmio_reg' entries) are used to register with
+ * GuC microkernel the list of registers we want it to dump out prior
+ * to a engine reset.
+ */
+struct guc_debug_capture_list_header {
+	u32 info;
+#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
+} __packed;
+
+struct guc_debug_capture_list {
+	struct guc_debug_capture_list_header header;
+	struct guc_mmio_reg regs[];
+} __packed;
+
+/*
+ * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
+ *
+ * xe_guc_capture module uses these structures to maintain static
+ * tables (per unique platform) that consists of lists of registers
+ * (offsets, names, flags,...) that are used at the ADS regisration
+ * time as well as during runtime processing and reporting of error-
+ * capture states generated by GuC just prior to engine reset events.
+ */
+struct __guc_mmio_reg_descr {
+	struct xe_reg reg;
+	u32 flags;
+	u32 mask;
+	const char *regname;
+};
+
+struct __guc_mmio_reg_descr_group {
+	const struct __guc_mmio_reg_descr *list;
+	u32 num_regs;
+	u32 owner; /* see enum guc_capture_owner */
+	u32 type; /* see enum guc_capture_type */
+	u32 engine; /* as per MAX_ENGINE_CLASS */
+	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
+};
+
+/*
+ * struct guc_state_capture_header_t / struct guc_state_capture_t /
+ * guc_state_capture_group_header_t / guc_state_capture_group_t
+ *
+ * Prior to resetting engines that have hung or faulted, GuC microkernel
+ * reports the engine error-state (register values that was read) by
+ * logging them into the shared GuC log buffer using these hierarchy
+ * of structures.
+ */
+struct guc_state_capture_header_t {
+	u32 owner;
+#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
+	u32 info;
+#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
+#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
+#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
+	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
+	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
+	u32 num_mmios;
+#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
+} __packed;
+
+struct guc_state_capture_t {
+	struct guc_state_capture_header_t header;
+	struct guc_mmio_reg mmio_entries[];
+} __packed;
+
+enum guc_capture_group_types {
+	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
+	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
+	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
+};
+
+struct guc_state_capture_group_header_t {
+	u32 owner;
+	u32 info;
+#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
+#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
+} __packed;
+
+/* this is the top level structure where an error-capture dump starts */
+struct guc_state_capture_group_t {
+	struct guc_state_capture_group_header_t grp_header;
+	struct guc_state_capture_t capture_entries[];
+} __packed;
+
+/*
+ * struct __guc_capture_ads_cache
+ *
+ * A structure to cache register lists that were populated and registered
+ * with GuC at startup during ADS registration. This allows much quicker
+ * GuC resets without re-parsing all the tables for the given gt.
+ */
+struct __guc_capture_ads_cache {
+	bool is_valid;
+	void *ptr;
+	size_t size;
+	int status;
+};
+
+/**
+ * struct xe_guc_state_capture
+ *
+ * Internal context of the xe_guc_capture module.
+ */
+struct xe_guc_state_capture {
+	/**
+	 * @reglists: static table of register lists used for error-capture state.
+	 */
+	const struct __guc_mmio_reg_descr_group *reglists;
+
+	/**
+	 * @extlists: allocated table of steered register lists used for error-capture state.
+	 *
+	 * NOTE: steered registers have multiple instances depending on the HW configuration
+	 * (slices or dual-sub-slices) and thus depends on HW fuses discovered at startup
+	 */
+	struct __guc_mmio_reg_descr_group *extlists;
+
+	/**
+	 * @ads_cache: cached register lists that is ADS format ready
+	 */
+	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
+						[GUC_CAPTURE_LIST_TYPE_MAX]
+						[GUC_MAX_ENGINE_CLASSES];
+
+	/**
+	 * @ads_null_cache: ADS null cache.
+	 */
+	void *ads_null_cache;
+
+	/**
+	 * @cachelist: Pool of pre-allocated nodes for error capture output
+	 *
+	 * We need this pool of pre-allocated nodes because we cannot
+	 * dynamically allocate new nodes when receiving the G2H notification
+	 * because the event handlers for all G2H event-processing is called
+	 * by the ct processing worker queue and when that queue is being
+	 * processed, there is no absoluate guarantee that we are not in the
+	 * midst of a GT reset operation (which doesn't allow allocations).
+	 */
+	struct list_head cachelist;
+#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
+#define PREALLOC_NODES_DEFAULT_NUMREGS 64
+
+	/**
+	 * @max_mmio_per_node: Max MMIO per node.
+	 */
+	int max_mmio_per_node;
+
+	/**
+	 * @outlist: Pool of pre-allocated nodes for error capture output
+	 *
+	 * A linked list of parsed GuC error-capture output data before
+	 * reporting with formatting via i915_gpu_coredump. Each node in this linked list shall
+	 * contain a single engine-capture including global, engine-class and
+	 * engine-instance register dumps as per guc_capture_parsed_output_node
+	 */
+	struct list_head outlist;
+};
+
+#endif /* _XE_GUC_CAPTURE_FWIF_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 5474025271e3..ffd3171de65d 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 
 #include "abi/guc_klvs_abi.h"
+#include "xe_hw_engine_types.h"
 
 #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
@@ -166,6 +167,8 @@ struct guc_mmio_reg {
 #define GUC_REGSET_MASKED		BIT(0)
 #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
 #define GUC_REGSET_RESTORE_ONLY		BIT(3)
+#define GUC_REGSET_STEERING_GROUP       GENMASK(15, 12)
+#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
 } __packed;
 
 /* GuC register sets */
@@ -194,6 +197,23 @@ enum {
 	GUC_CAPTURE_LIST_INDEX_MAX = 2,
 };
 
+/*Register-types of GuC capture register lists */
+enum guc_capture_type {
+	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
+	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+	GUC_CAPTURE_LIST_TYPE_MAX,
+};
+
+/* Class indecies for capture_class and capture_instance arrays */
+enum {
+	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
+	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
+	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
+	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
+	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
+};
+
 /* GuC Additional Data Struct */
 struct guc_ads {
 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 82bd93f7867d..6221a0035cad 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -58,6 +58,8 @@ struct xe_guc {
 	struct xe_guc_ads ads;
 	/** @ct: GuC ct */
 	struct xe_guc_ct ct;
+	/** @capture: the error-state-capture module's data and objects */
+	struct xe_guc_state_capture *capture;
 	/** @pc: GuC Power Conservation */
 	struct xe_guc_pc pc;
 	/** @dbm: GuC Doorbell Manager */
-- 
2.34.1

