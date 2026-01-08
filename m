Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B234CCF6ABC
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 10:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795B010E6F0;
	Thu,  8 Jan 2026 10:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="izwa6vMj";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A0210E6ED
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767867019;
 bh=2OmqwpENC7btNWy0ONzyom7s7JX9KcI4EA6ekpJ8Hho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=izwa6vMj003MQV2zxprRZ6aWnVlckg8G/tqFG1fGz3phYSjrH+/sezP7xWeA4y0sL
 9r2Iiu/bbtWlMRXirZCOx3Iz9alhiGBQeXm0HLeTUS5aNiwPlLhHdE1tm7IXeoCWW2
 6KRt9/9apYZxQSLYY3qA2s56KrWBVmz+3w2S4sn8qoL2o25DwkzaTyzM0Fv7B+Qzy1
 Y5DcMeqXXmQ2NM1kKBYYgybPLP9WTVbscicf3gRTvM40k+MZi0Xp1PXwaYA6fESUe3
 ALAnl5Wog4I5LXpQlfG02zSJekaCi8FAv24hZGm7WwicvavDX9JZAxilyfyMfZMedN
 9GvwqyWKBXdQg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v2 1/7] drm/xe: Start using ggtt->start in preparation of
 balloon removal
Date: Thu,  8 Jan 2026 11:10:16 +0100
Message-ID: <20260108101014.579906-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108101014.579906-9-dev@lankhorst.se>
References: <20260108101014.579906-9-dev@lankhorst.se>
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

Instead of having ggtt->size point to the end of ggtt, have ggtt->size
be the actual size of the GGTT, and introduce ggtt->start to point to
the beginning of GGTT.

This will allow a massive cleanup of GGTT in case of SRIOV-VF.

Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 82 +++++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h                |  2 +
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  4 +-
 5 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e0..acddbedcf17cb 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -67,7 +67,7 @@ static int guc_buf_test_init(struct kunit *test)
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
-					   DUT_GGTT_START + DUT_GGTT_SIZE));
+					   DUT_GGTT_SIZE));
 
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 48ab8b43fcd01..6be89363f591f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -137,10 +137,32 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 	}
 }
 
+/**
+ * xe_ggtt_start - Get starting offset of GGTT.
+ * @ggtt: &xe_ggtt
+ *
+ * Returns: Starting offset for this &xe_ggtt.
+ */
+u64 xe_ggtt_start(struct xe_ggtt *ggtt)
+{
+	return ggtt->start;
+}
+
+/**
+ * xe_ggtt_size - Get size of GGTT.
+ * @ggtt: &xe_ggtt
+ *
+ * Returns: Total usable size of this &xe_ggtt.
+ */
+u64 xe_ggtt_size(struct xe_ggtt *ggtt)
+{
+	return ggtt->size;
+}
+
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -256,16 +278,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
-	drm_mm_init(&ggtt->mm, reserved,
-		    ggtt->size - reserved);
+	ggtt->start = start;
+	ggtt->size = size;
+	drm_mm_init(&ggtt->mm, start, size);
 }
 
-int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	ggtt->size = size;
-	__xe_ggtt_init_early(ggtt, reserved);
+	__xe_ggtt_init_early(ggtt, start, size);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -293,26 +315,32 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
+	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
 	int err;
 
-	if (IS_SRIOV_VF(xe) || GRAPHICS_VERx100(xe) >= 1250)
-		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-	else
-		gsm_size = probe_gsm_size(pdev);
-
-	if (gsm_size == 0) {
-		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
-		return -ENOMEM;
+	if (!IS_SRIOV_VF(xe)) {
+		if (GRAPHICS_VERx100(xe) >= 1250)
+			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+		else
+			gsm_size = probe_gsm_size(pdev);
+		if (gsm_size == 0) {
+			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+			return -ENOMEM;
+		}
+		ggtt_start = wopcm;
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
+	} else {
+		/* GGTT is expected to be 4GiB */
+		ggtt_start = wopcm;
+		ggtt_size = SZ_4G - ggtt_start;
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
-	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
-
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt->size > GUC_GGTT_TOP)
-		ggtt->size = GUC_GGTT_TOP;
+	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
+		ggtt_size = GUC_GGTT_TOP - ggtt_start;
 
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
@@ -326,7 +354,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
+	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -563,11 +591,9 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
 static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	struct xe_tile *tile = ggtt->tile;
-	struct xe_device *xe = tile_to_xe(tile);
-	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
 
-	xe_tile_assert(tile, start >= wopcm);
-	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
+	xe_tile_assert(tile, start >= ggtt->start);
+	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
 }
 
 /**
@@ -890,14 +916,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
-	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
 	u64 hole_start, hole_end, hole_size;
 	u64 max_hole = 0;
 
 	mutex_lock(&ggtt->lock);
-
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
+		hole_start = max(hole_start, ggtt->start);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -1069,15 +1093,13 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
-	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
 	u64 hole_start, hole_end, hole_size;
 	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
-
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
+		hole_start = max(hole_start, ggtt->start);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 93fea4b6079ce..df7196ec4696e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,6 +23,8 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
 				       u64 start, u64 size);
 void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
 void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
+u64 xe_ggtt_start(struct xe_ggtt *ggtt);
+u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index dacd796f81844..d773cf284c032 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -22,7 +22,9 @@ struct xe_gt;
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @size: Total size of this GGTT */
+	/** @start: Start offset of GGTT */
+	u64 start;
+	/** @size: Total usable size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 5a870914b102c..bed6580d8d090 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -393,8 +393,8 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
 	if (vfid == PFID) {
-		u64 ggtt_start = xe_wopcm_size(gt_to_xe(gt));
-		u64 ggtt_size = gt_to_tile(gt)->mem.ggtt->size - ggtt_start;
+		u64 ggtt_start = xe_ggtt_start(gt_to_tile(gt)->mem.ggtt);
+		u64 ggtt_size = xe_ggtt_size(gt_to_tile(gt)->mem.ggtt);
 
 		/* plain PF config data will never include a real GGTT region */
 		xe_gt_assert(gt, !encode_config_ggtt(cfg + num_dwords, config, true));
-- 
2.51.0

