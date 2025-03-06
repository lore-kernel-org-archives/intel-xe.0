Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA800C28B22
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 00:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEB010E87F;
	Thu,  6 Mar 2025 00:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjXKKb+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD0010E102
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 00:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741222676; x=1772758676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6piTWnD5J4t0SNPn21cG37eZU3KZWBXpLSxJI5SVx4M=;
 b=WjXKKb+iSgQ93SVeAHFouyNmB0UaIkkSamiuM4dVZI2jCKGVA0QFBGpk
 dSixZWjt/wbmrV1JFJyxRFt5F0Ge/nYtBkqUnuu4NMheBVkMQozsWsZBO
 yLW4mEsbI+SJPdPNEsyZAx0tGpXOAwYCPR3PJPsh5TcLqGA9ZUuls7O8u
 OAezEjuzno95EGNebZTxjvE8eHT8DCTErMb8/mCj3S353VjXo07jT+hmO
 4uii5j4VD/xx6ARQqZocXaTv92DcQYuNDnbtb02rZGJyTv1a30r33hBOZ
 Hrfn1bEcycT0lcElJzVUggatNl9WHBhFVEheNBLnsTryj1//nrITcg6Wp A==;
X-CSE-ConnectionGUID: uDi4hFssQteATzBosRbT9Q==
X-CSE-MsgGUID: 9Uo10/koQGWw7nDpNHDSuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41465289"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41465289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:56 -0800
X-CSE-ConnectionGUID: CupSXatsQc6ShcNZVlJ2jA==
X-CSE-MsgGUID: 7so8h8btTQmyP0Y1Gktlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="123444025"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 16:57:56 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/3] drm/xe/guc: move KLV helpers to common file
Date: Wed,  5 Mar 2025 16:57:43 -0800
Message-ID: <20250306005745.3520231-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
References: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
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

The GuC uses the same format for all its KLVs, so having the functions
to set them in a common file will allow us to re-use it for different
types of KLVs and not just the WAs in ADS.
The functions have also been reworked to avoid duplication and moved to
using dword aligned offsets and sizes to match other functions in the same
file.

The next patch will make use of these functions for a new H2G command.

v2: further rework code to have a single generic emission function, rename
helpers (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c         | 89 ++++++-------------------
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 45 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h | 19 ++++++
 3 files changed, 84 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e7c9e095a19f..ec507d25ec72 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -22,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_klv_helpers.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -283,56 +284,6 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
-static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
-				      enum xe_guc_klv_ids klv_id,
-				      u32 value,
-				      u32 *offset, u32 *remain)
-{
-	u32 size;
-	u32 klv_entry[] = {
-		/* 16:16 key/length */
-		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
-		FIELD_PREP(GUC_KLV_0_LEN, 1),
-		value,
-		/* 1 dword data */
-	};
-
-	size = sizeof(klv_entry);
-
-	if (*remain < size) {
-		drm_warn(&ads_to_xe(ads)->drm,
-			 "w/a klv buffer too small to add klv id %d\n", klv_id);
-	} else {
-		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-				 klv_entry, size);
-		*offset += size;
-		*remain -= size;
-	}
-}
-
-static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
-				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
-{
-	u32 klv_entry[] = {
-		/* 16:16 key/length */
-		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
-		FIELD_PREP(GUC_KLV_0_LEN, 0),
-		/* 0 dwords data */
-	};
-	u32 size;
-
-	size = sizeof(klv_entry);
-
-	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
-		       "w/a klv buffer too small to add klv id %d\n", klv_id))
-		return;
-
-	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
-			 klv_entry, size);
-	*offset += size;
-	*remain -= size;
-}
-
 static void guc_waklv_init(struct xe_guc_ads *ads)
 {
 	struct xe_gt *gt = ads_to_gt(ads);
@@ -343,22 +294,22 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	remain = guc_ads_waklv_size(ads);
 
 	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
-					&offset, &remain);
+		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
+				       GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+				       &offset, &remain);
 	if (XE_WA(gt, 18024947630))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
-					&offset, &remain);
+		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
+				       GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
+				       &offset, &remain);
 	if (XE_WA(gt, 16022287689))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
-					&offset, &remain);
+		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
+				       GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
+				       &offset, &remain);
 
 	if (XE_WA(gt, 14022866841))
-		guc_waklv_enable_simple(ads,
-					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
-					&offset, &remain);
+		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
+				       GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
+				       &offset, &remain);
 
 	/*
 	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
@@ -366,15 +317,15 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	 * future, so GuC depends on KMD to send it the correct value.
 	 */
 	if (XE_WA(gt, 13011645652))
-		guc_waklv_enable_one_word(ads,
-					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
-					  0xC40,
-					  &offset, &remain);
+		xe_guc_klv_emit_one_word(ads_to_guc(ads), ads_to_map(ads),
+					 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
+					 0xC40,
+					 &offset, &remain);
 
 	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
-		guc_waklv_enable_simple(ads,
-					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
-					&offset, &remain);
+		xe_guc_klv_emit_nodata(ads_to_guc(ads), ads_to_map(ads),
+				       GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
+				       &offset, &remain);
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 146a6eda9e06..74379c359d45 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -7,8 +7,11 @@
 #include <drm/drm_print.h>
 
 #include "abi/guc_klvs_abi.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_klv_thresholds_set.h"
+#include "xe_map.h"
 
 #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
@@ -146,3 +149,45 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
 
 	return num_dwords ? -ENODATA : num_klvs;
 }
+
+static void __klv_emit(struct xe_device *xe, struct iosys_map *map,
+		       u32 *data, u32 size, u32 *offset, u32 *remain)
+{
+	xe_map_memcpy_to(xe, map, *offset, data, size);
+	*offset += size;
+	*remain -= size;
+}
+
+/**
+ * xe_guc_klv_emit - Emits a KLV to an iosys mapped buffer
+ * @guc: the guc structure
+ * @map: the iosys_map to write to
+ * @key: the KLV to enable
+ * @data: pointer to the data for the KLV (can be NULL)
+ * @data_size: size of the data for the KLV (MBZ if data is NULL)
+ * @offset: pointer to a variable holding the offset to write to
+ * @remain: pointer to a variable holding the available writing space
+ *
+ * The function checks if there is enough space to emit the KLV and if so
+ * writes it to memory. After the write, the offset and remain variables
+ * are respectively increased and decreased of the written size to be ready for
+ * the next emission.
+ */
+void xe_guc_klv_emit(struct xe_guc *guc, struct iosys_map *map, u16 key,
+		     void *data, u32 data_size, u32 *offset, u32 *remain)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	u32 klv_entry = PREP_GUC_KLV(key, data_size / sizeof(u32));
+
+	/* GuC expects an array of u32s */
+	xe_assert(guc_to_xe(guc), !(data_size % sizeof(u32)));
+
+	if (xe_gt_WARN(guc_to_gt(guc), *remain < (sizeof(klv_entry) + data_size),
+		       "KLV buffer too small to add klv id 0x%04x\n", key))
+		return;
+
+	__klv_emit(xe, map, &klv_entry, sizeof(klv_entry), offset, remain);
+
+	if (data_size)
+		__klv_emit(xe, map, data, data_size, offset, remain);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index c676d21c173b..72b33e5019de 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -10,6 +10,8 @@
 #include <linux/types.h>
 
 struct drm_printer;
+struct iosys_map;
+struct xe_guc;
 
 const char *xe_guc_klv_key_to_string(u16 key);
 
@@ -61,4 +63,21 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
 #define PREP_GUC_KLV_TAG(TAG) \
 	PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
 
+void xe_guc_klv_emit(struct xe_guc *guc, struct iosys_map *map, u16 key,
+		     void *data, u32 data_size, u32 *offset, u32 *remain);
+
+static inline void
+xe_guc_klv_emit_nodata(struct xe_guc *guc, struct iosys_map *map,
+		       u16 key, u32 *offset, u32 *remain)
+{
+	return xe_guc_klv_emit(guc, map, key, NULL, 0, offset, remain);
+}
+
+static inline void
+xe_guc_klv_emit_one_word(struct xe_guc *guc, struct iosys_map *map,
+			 u16 key, u32 value, u32 *offset, u32 *remain)
+{
+	return xe_guc_klv_emit(guc, map, key, &value, sizeof(u32), offset, remain);
+}
+
 #endif
-- 
2.43.0

