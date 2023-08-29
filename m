Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3E7C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 16:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D977510E454;
	Tue, 29 Aug 2023 16:33:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664DD10E448
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326810; x=1724862810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=taBovNS+h46F6EdLRB92NQmIYDcByxodMXjXbBoPqIM=;
 b=WLK+WzvFgVkeuqJN+pRpPc69afvAgrhH7YLCqYPRwYymC+6tttl+J2Dh
 7xq3PJvVukYBsX9lXX1uciBHRCZ56t2jPqF33Fzsn0YoUYJRUcBdNYoZl
 cQwpZXlUg+eEFuF1+vst1Mid4Ge/VmrCXZxDGlYbghw+PF7E3BP3VEIum
 yIKeHoA+S3EQiM0Vzjdq6AdFc4FdL0CtyYiJhK/MsPDJ012vA/XU/P9hv
 G3VB5Myxn8Z+UkWeiH4AO70HuFy8k1kHf+FB+IkIjZsSra5IOdPaYKmwu
 7ufLQv67eoPH4b3QXc2xB/anmmAoOJ2rWKGkShqDFRCtCgq3xBlkFAZR2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379186220"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="379186220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804189310"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804189310"
Received: from gtmcgeac-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.125])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 17:28:45 +0100
Message-ID: <20230829162840.73444-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829162840.73444-7-matthew.auld@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 4/5] drm/xe/pat: annotate pat_index with coherency
 mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Future uapi needs to give userspace the ability to select the pat_index
for a given vm_bind. However we need to be able to extract the coherency
mode from the provided pat_index to ensure it matches the coherency mode
set at object creation. There are various security reasons for why this
matters.  However the pat_index itself is very platform specific, so
seems reasonable to annotate each platform definition of the pat table.
On some older platforms there is no explicit coherency mode, so we just
pick whatever makes sense.

Bspec: 45101, 44235 #xe
Bspec: 70552, 71582, 59400 #xe2
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 drivers/gpu/drm/xe/xe_pat.c          | 67 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pat.h          |  6 +++
 3 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 06235da647bb..53520ae30b33 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -238,7 +238,7 @@ struct xe_device {
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
 
-		const u32 *pat_table;
+		const struct xe_pat_table_entry *pat_table;
 		int pat_table_n_entries;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index f19f5d8dcd94..9e72c1b4b41f 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -4,6 +4,8 @@
  */
 
 
+#include <drm/xe_drm.h>
+
 #include "regs/xe_reg_defs.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -33,34 +35,34 @@
 #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
 #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
 
-static const u32 tgl_pat_table[] = {
-	[0] = TGL_PAT_WB,
-	[1] = TGL_PAT_WC,
-	[2] = TGL_PAT_WT,
-	[3] = TGL_PAT_UC,
-	[4] = TGL_PAT_WB,
-	[5] = TGL_PAT_WB,
-	[6] = TGL_PAT_WB,
-	[7] = TGL_PAT_WB,
+static const struct xe_pat_table_entry tgl_pat_table[] = {
+	[0] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
+	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
+	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
+	[3] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
+	[4] = { TGL_PAT_WB }, /* zero coh_mode to indicate invalid from userspace */
+	[5] = { TGL_PAT_WB },
+	[6] = { TGL_PAT_WB },
+	[7] = { TGL_PAT_WB },
 };
 
-static const u32 pvc_pat_table[] = {
-	[0] = TGL_PAT_UC,
-	[1] = TGL_PAT_WC,
-	[2] = TGL_PAT_WT,
-	[3] = TGL_PAT_WB,
-	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
-	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
-	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
-	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
+static const struct xe_pat_table_entry pvc_pat_table[] = {
+	[0] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
+	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
+	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
+	[3] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
+	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
+	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
+	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
+	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
 };
 
-static const u32 mtl_pat_table[] = {
-	[0] = MTL_PAT_0_WB,
-	[1] = MTL_PAT_1_WT,
-	[2] = MTL_PAT_3_UC,
-	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
-	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
+static const struct xe_pat_table_entry mtl_pat_table[] = {
+	[0] = { MTL_PAT_0_WB, XE_GEM_COHERENCY_NONE },
+	[1] = { MTL_PAT_1_WT, XE_GEM_COHERENCY_NONE },
+	[2] = { MTL_PAT_3_UC, XE_GEM_COHERENCY_NONE },
+	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COHERENCY_1WAY },
+	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COHERENCY_2WAY },
 };
 
 static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
@@ -82,27 +84,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
 	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
 };
 
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index)
+{
+	WARN_ON(pat_index >= xe->info.pat_table_n_entries);
+	return xe->info.pat_table[pat_index].coh_mode;
+}
+
 unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
 {
 	WARN_ON(cache >= XE_CACHE_LAST);
 	return (xe->pat_table).pte_pat_table[cache];
 }
 
-static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
+static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			int n_entries)
 {
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
 
-		xe_mmio_write32(gt, reg, table[i]);
+		xe_mmio_write32(gt, reg, table[i].value);
 	}
 }
 
-static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
+static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
+			    int n_entries)
 {
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
 
-		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
+		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
 	}
 }
 
@@ -115,6 +125,7 @@ int xe_pat_fill_info(struct xe_device *xe)
 		xe->info.pat_table = pvc_pat_table;
 		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
+		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
 		xe->info.pat_table = tgl_pat_table;
 		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 9ab059758ad1..e2fabde2c730 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -28,9 +28,15 @@
 struct xe_gt;
 struct xe_device;
 
+struct xe_pat_table_entry {
+	u32 value;
+	u16 coh_mode;
+};
+
 int xe_pat_fill_info(struct xe_device *xe);
 void xe_pat_init(struct xe_gt *gt);
 void xe_pte_pat_init(struct xe_device *xe);
 unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
+u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index);
 
 #endif
-- 
2.41.0

