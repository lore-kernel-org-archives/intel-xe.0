Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E35CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECE010E1CB;
	Thu, 28 Aug 2025 10:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbHmxFFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C17210E1CB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376859; x=1787912859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r3kc/AMWEHP/hpYIRg8LEeM5t4Z4ph93Mfwb4845sQM=;
 b=KbHmxFFTRGR2Pc/ZEI5weZ8Qix4nFECNpWCHs3jO8H9E30iWIPtrU4IW
 HEjwhwuixAhOgo7eij9GMQL+YlxHrYatDsgL37weHESHG124B6h4FwxPX
 DQqC+qAEfqvIUnMVpM9/0I57rTNwyameftXehhAQtFL3Dkj7x/cYiQJPw
 5PnyyYKywotXG0oX53n+Ss8rjtLPSUlkyporR7qmr8zXzqoe8xQS5vSsW
 Z0qXAXeqUEJrSoxCNQinG3DtXPN17rC731hgrZ1qdKDhtM7HgJn7eixup
 8SYSKQpyKyW1bslBNg6eoXjaH0Im5DZJc9PomD/40AfFIWFU95dvjf1BK w==;
X-CSE-ConnectionGUID: VF58Z5dkTk2YKiZ1hjwm9A==
X-CSE-MsgGUID: cwDfRpUpQGyRmYsoqxZpBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58351953"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58351953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:27:39 -0700
X-CSE-ConnectionGUID: 37i8DfPeTNua6gkggpN9Hg==
X-CSE-MsgGUID: YEH1KG/YQzKvtWWJCX9FkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174249152"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 28 Aug 2025 03:27:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: [PATCH v3] drm/xe/guc: Add devm release action to safely tear down CT
Date: Thu, 28 Aug 2025 16:14:32 +0530
Message-ID: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
flag, the driver initiates TLB invalidation requests via the CTB mechanism
while releasing the BO. However a premature release of the CTB BO can lead
to system crashes, as observed in:

Oops: Oops: 0000 [#1] SMP NOPTI
RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
Call Trace:
 guc_ct_send_locked+0x8b/0x670 [xe]
 xe_guc_ct_send_locked+0x19/0x60 [xe]
 send_tlb_invalidation+0xb4/0x460 [xe]
 xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
 ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
 ggtt_node_remove+0x110/0x140 [xe]
 xe_ggtt_node_remove+0x40/0xa0 [xe]
 xe_ggtt_remove_bo+0x87/0x250 [xe]

Introduce a devm-managed release action during xe_guc_ct_init() and
xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
resource deallocation, preventing the use-after-free scenario.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Summers Stuart <stuart.summers@intel.com>

---
Reviewed-by: Matthew Brost <matthew.brost@intel.com> (with #rev1)

V2 -> V3:
- Fixed review comments (Michal).

V1 -> V2:
- Fixed review comments (Michal & Matt B).
---
 drivers/gpu/drm/xe/xe_guc.c    | 12 +++++-----
 drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
 3 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 37d06c51180c..ed0da4ebd928 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -706,14 +706,8 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 		return ret;
 
 	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
-	if (ret)
-		return ret;
-
-	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
-	if (ret)
-		return ret;
 
-	return 0;
+	return ret;
 }
 
 static int vf_guc_init_noalloc(struct xe_guc *guc)
@@ -847,6 +841,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	ret = xe_guc_submit_init(guc, ~0);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 848065a25c44..0b88cfb05e7b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
 static void g2h_worker_func(struct work_struct *w);
 static void safe_mode_worker_func(struct work_struct *w);
 static void ct_exit_safe_mode(struct xe_guc_ct *ct);
+static void guc_ct_change_state(struct xe_guc_ct *ct,
+				enum xe_guc_ct_state state);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
@@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
 
+static void guc_action_disable_ct(void *arg)
+{
+	struct xe_guc_ct *ct = arg;
+
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
+
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -268,10 +277,39 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 		return PTR_ERR(bo);
 
 	ct->bo = bo;
-	return 0;
+
+	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
 
+/**
+ * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
+ * @ct: the &xe_guc_ct.
+ *
+ * Allocate a new BO in VRAM and free the previous BO that was allocated
+ * in system memory (SMEM).
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+
+int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
+	struct xe_tile *tile = gt_to_tile(gt);
+	int ret;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
+	if (ret)
+		return ret;
+
+	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
+	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
+}
+
 #define desc_read(xe_, guc_ctb__, field_)			\
 	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
 			struct guc_ct_buffer_desc, field_)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..16d82c0e6cde 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 
 long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
 
+int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
+
 #endif
-- 
2.43.0

