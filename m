Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F01C3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837C10EB2A;
	Thu, 27 Jun 2024 20:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvoKCj+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11EB10EB30
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719520668; x=1751056668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cb+8+ym8R++ZobfEoAck0RHB9VPDwh+4MKfyzS6kKmg=;
 b=NvoKCj+A0XF+EJIx6C6WR6ieFUK+hXojdrjb5SpyC8SGYPAPY5nj21DX
 h6jE6JEASXBH5NiyZFypXOiL1VdT5i7HNKj2KvlEp4UWjI7XaXLEau8Tl
 I2dZ265nCD7DFq6KIJ1QowHTKidkmuJNIayzsqWsnU/8wOuZCjLUufOg4
 h1pV3JtoH1iH7nP15U848bWfI45OfmHYzufbCngo8ztgMnZyjcP8tlEgN
 9TdZHk4jPazb81lqUpV7A9EstJHVDe7H5TVxvrNllsaRS3WATiR1qYCBS
 DKUDC1foMOyG6IxwWud62NBF2ztvKt7FTEocCp/rbOu2nclGNJWuee7Yl w==;
X-CSE-ConnectionGUID: t63ImWt9Tfa+9g/R/G6QIw==
X-CSE-MsgGUID: FG/QlLz3R3GMz9NRq0USDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27815520"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="27815520"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:37:48 -0700
X-CSE-ConnectionGUID: H9nz2Z11Th+0hs3FotRBwg==
X-CSE-MsgGUID: FxoJSILrQ/aSyksGkVZwag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44911213"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:37:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/mocs: Clarify difference between hw and sw sizes
Date: Thu, 27 Jun 2024 13:37:43 -0700
Message-ID: <20240627203741.2042752-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627203741.2042752-3-matthew.d.roper@intel.com>
References: <20240627203741.2042752-3-matthew.d.roper@intel.com>
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

It's not very obvious what the difference is between the 'size' and
'n_entries' fields of the MOCS structure.  Rename both fields slightly
and add some comments explaining that one is the documentation-defined
table size, while the other is the number of entries that can be
programmed into the hardware (and the documented table size can
potentially be smaller than the number of hardware entries).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c |  8 ++--
 drivers/gpu/drm/xe/xe_mocs.c       | 62 +++++++++++++++++-------------
 2 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 1b8617075b37..67c65e88c384 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -31,9 +31,9 @@ static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
 
 	kunit_info(test, "gt %d", gt->info.id);
 	kunit_info(test, "gt type %d", gt->info.type);
-	kunit_info(test, "table size %d", arg->table.size);
+	kunit_info(test, "table size %d", arg->table.table_size);
 	kunit_info(test, "table uc_index %d", arg->table.uc_index);
-	kunit_info(test, "table n_entries %d", arg->table.n_entries);
+	kunit_info(test, "table num_mocs_regs %d", arg->table.num_mocs_regs);
 
 	return flags;
 }
@@ -50,7 +50,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
-	for (i = 0; i < info->n_entries; i++) {
+	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
 			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
@@ -90,7 +90,7 @@ static void read_mocs_table(struct xe_gt *gt,
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
-	for (i = 0; i < info->n_entries; i++) {
+	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 110ef89cd640..7ff0ac5b799a 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -47,8 +47,16 @@ struct xe_mocs_ops {
 };
 
 struct xe_mocs_info {
-	unsigned int size;
-	unsigned int n_entries;
+	/*
+	 * Size of the spec's suggested MOCS programming table.  The list of
+	 * table entries from the spec can potentially be smaller than the
+	 * number of hardware registers used to program the MOCS table; in such
+	 * cases the registers for the remaining indices will be programmed to
+	 * match unused_entries_index.
+	 */
+	unsigned int table_size;
+	/* Number of MOCS entries supported by the hardware */
+	unsigned int num_mocs_regs;
 	const struct xe_mocs_entry *table;
 	const struct xe_mocs_ops *ops;
 	u8 uc_index;
@@ -266,7 +274,7 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
 
 	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
 
-	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
+	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
@@ -298,7 +306,7 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 		drm_printf(p, "Global mocs table configuration:\n");
 		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
 
-		for (i = 0; i < info->n_entries; i++) {
+		for (i = 0; i < info->num_mocs_regs; i++) {
 			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 			else
@@ -371,7 +379,7 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
 
 	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
 
-	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
+	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
@@ -416,7 +424,7 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
 
 	drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
 
-	for (i = 0, j = 0; i < (info->n_entries + 1) / 2; i++, j++) {
+	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
@@ -498,7 +506,7 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 	drm_printf(p, "Global mocs table configuration:\n");
 	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
 
-	for (i = 0; i < info->n_entries; i++) {
+	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
@@ -541,7 +549,7 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 	drm_printf(p, "Global mocs table configuration:\n");
 	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
 
-	for (i = 0; i < info->n_entries; i++) {
+	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
@@ -571,48 +579,48 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	case XE_LUNARLAKE:
 	case XE_BATTLEMAGE:
 		info->ops = &xe2_mocs_ops;
-		info->size = ARRAY_SIZE(xe2_mocs_table);
+		info->table_size = ARRAY_SIZE(xe2_mocs_table);
 		info->table = xe2_mocs_table;
-		info->n_entries = XE2_NUM_MOCS_ENTRIES;
+		info->num_mocs_regs = XE2_NUM_MOCS_ENTRIES;
 		info->uc_index = 3;
 		info->wb_index = 4;
 		info->unused_entries_index = 4;
 		break;
 	case XE_PVC:
 		info->ops = &pvc_mocs_ops;
-		info->size = ARRAY_SIZE(pvc_mocs_desc);
+		info->table_size = ARRAY_SIZE(pvc_mocs_desc);
 		info->table = pvc_mocs_desc;
-		info->n_entries = PVC_NUM_MOCS_ENTRIES;
+		info->num_mocs_regs = PVC_NUM_MOCS_ENTRIES;
 		info->uc_index = 1;
 		info->wb_index = 2;
 		info->unused_entries_index = 2;
 		break;
 	case XE_METEORLAKE:
 		info->ops = &mtl_mocs_ops;
-		info->size = ARRAY_SIZE(mtl_mocs_desc);
+		info->table_size = ARRAY_SIZE(mtl_mocs_desc);
 		info->table = mtl_mocs_desc;
-		info->n_entries = MTL_NUM_MOCS_ENTRIES;
+		info->num_mocs_regs = MTL_NUM_MOCS_ENTRIES;
 		info->uc_index = 9;
 		info->unused_entries_index = 1;
 		break;
 	case XE_DG2:
 		info->ops = &xehp_mocs_ops;
-		info->size = ARRAY_SIZE(dg2_mocs_desc);
+		info->table_size = ARRAY_SIZE(dg2_mocs_desc);
 		info->table = dg2_mocs_desc;
 		info->uc_index = 1;
 		/*
 		 * Last entry is RO on hardware, don't bother with what was
 		 * written when checking later
 		 */
-		info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;
+		info->num_mocs_regs = XELP_NUM_MOCS_ENTRIES - 1;
 		info->unused_entries_index = 3;
 		break;
 	case XE_DG1:
 		info->ops = &xelp_mocs_ops;
-		info->size = ARRAY_SIZE(dg1_mocs_desc);
+		info->table_size = ARRAY_SIZE(dg1_mocs_desc);
 		info->table = dg1_mocs_desc;
 		info->uc_index = 1;
-		info->n_entries = XELP_NUM_MOCS_ENTRIES;
+		info->num_mocs_regs = XELP_NUM_MOCS_ENTRIES;
 		info->unused_entries_index = 5;
 		break;
 	case XE_TIGERLAKE:
@@ -621,9 +629,9 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	case XE_ALDERLAKE_P:
 	case XE_ALDERLAKE_N:
 		info->ops = &xelp_mocs_ops;
-		info->size  = ARRAY_SIZE(gen12_mocs_desc);
+		info->table_size  = ARRAY_SIZE(gen12_mocs_desc);
 		info->table = gen12_mocs_desc;
-		info->n_entries = XELP_NUM_MOCS_ENTRIES;
+		info->num_mocs_regs = XELP_NUM_MOCS_ENTRIES;
 		info->uc_index = 3;
 		info->unused_entries_index = 2;
 		break;
@@ -643,7 +651,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	xe_assert(xe, info->unused_entries_index != 0);
 
 	xe_assert(xe, info->ops && info->ops->dump);
-	xe_assert(xe, info->size <= info->n_entries);
+	xe_assert(xe, info->table_size <= info->num_mocs_regs);
 
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) >= 20)
 		flags |= HAS_GLOBAL_MOCS;
@@ -660,7 +668,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 static u32 get_entry_control(const struct xe_mocs_info *info,
 			     unsigned int index)
 {
-	if (index < info->size && info->table[index].used)
+	if (index < info->table_size && info->table[index].used)
 		return info->table[index].control_value;
 	return info->table[info->unused_entries_index].control_value;
 }
@@ -671,9 +679,9 @@ static void __init_mocs_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 mocs;
 
-	mocs_dbg(gt, "mocs entries: %d\n", info->n_entries);
+	mocs_dbg(gt, "mocs entries: %d\n", info->num_mocs_regs);
 
-	for (i = 0; i < info->n_entries; i++) {
+	for (i = 0; i < info->num_mocs_regs; i++) {
 		mocs = get_entry_control(info, i);
 
 		mocs_dbg(gt, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
@@ -694,7 +702,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 static u16 get_entry_l3cc(const struct xe_mocs_info *info,
 			  unsigned int index)
 {
-	if (index < info->size && info->table[index].used)
+	if (index < info->table_size && info->table[index].used)
 		return info->table[index].l3cc_value;
 	return info->table[info->unused_entries_index].l3cc_value;
 }
@@ -710,9 +718,9 @@ static void init_l3cc_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 l3cc;
 
-	mocs_dbg(gt, "l3cc entries: %d\n", info->n_entries);
+	mocs_dbg(gt, "l3cc entries: %d\n", info->num_mocs_regs);
 
-	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
+	for (i = 0; i < (info->num_mocs_regs + 1) / 2; i++) {
 		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
 				    get_entry_l3cc(info, 2 * i + 1));
 
-- 
2.45.0

