Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0532C3ABC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 22:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFF010E5FF;
	Tue, 13 May 2025 22:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXk3y9HX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9A310E5FE
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 22:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176607; x=1778712607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BqkgSnf1Zw6ANavpJJt3DIVFPscczLT/5f5sWHH1leg=;
 b=gXk3y9HXG/aGDTYlKeg1Vvm4L8WGbE+bY4B1UFom2AluKYmqdOq64OR+
 5NRhh1GVqE5yEhjVRIXErU+F9VGoELcdyjgOwE22HrXfsZKBiftuFiXTD
 dokE0CWfSktWCeoBG4tvXpYM0wAdHj9dlw4JMXx+BSan2fqcaHzPsTk2g
 VdaJxtRCtzEcoF7h8oCkiVR+mgREQGUJWGm7m0w3aCOC/moUGIow9Oljm
 l6kjJcaw4YyOFjFZ160Og7qjnjZR5mmTE19WNbRa0iYKnmKbcUpi9Ttm9
 8IbMQrTBkRb0rXMr9WxHTvXLq4F8ldkJwmUK9dr36r4VfMfTgxU+Rum9P g==;
X-CSE-ConnectionGUID: ZhotfLVkSx6AaT8WJY5EbQ==
X-CSE-MsgGUID: UTRYxVBHQ8eHQYi9wDX3pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860521"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:50:06 -0700
X-CSE-ConnectionGUID: 07pPYNiGScScvDLGSBfFng==
X-CSE-MsgGUID: hFm2D3zzRxyTCMW3FeYjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142789437"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 15:50:05 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 6/7] drm/xe/vf: Rebase MEMIRQ structures for all contexts
 after migration
Date: Wed, 14 May 2025 00:49:51 +0200
Message-Id: <20250513224952.701343-7-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513224952.701343-1-tomasz.lis@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
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

All contexts require an update of state data, as the data includes
GGTT references to memirq-related buffers.

Default contexts need these references updated as well, because they
are not refreshed when a new context is created from them.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c      | 41 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h      |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++--
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 43e1c18e1769..5a7f0077ef31 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -898,6 +898,47 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	return data;
 }
 
+/**
+ * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
+ *   of given engine.
+ * @hwe: the &xe_hw_engine struct instance
+ */
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	u32 *regs;
+
+	if (!gt->default_lrc[hwe->class])
+		return;
+
+	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
+	set_memory_based_intr(regs, hwe);
+}
+
+/**
+ * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
+ *   for given LRC.
+ * @hwe: the &xe_hw_engine struct instance
+ * @lrc: the &xe_lrc struct instance
+ */
+void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct iosys_map map;
+	size_t regs_len;
+	u32 *regs;
+
+	map = __xe_lrc_regs_map(lrc);
+	regs_len = lrc_reg_size(gt_to_xe(gt));
+	regs = kzalloc(regs_len, GFP_ATOMIC);
+	if (!regs)
+		return;
+	xe_map_memcpy_from(gt_to_xe(gt), regs, &map, 0, regs_len);
+	set_memory_based_intr(regs, hwe);
+	xe_map_memcpy_to(gt_to_xe(gt), &map, 0, regs, regs_len);
+	kfree(regs);
+}
+
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
 	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7a99cfd0abe..3f0ae3affafe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
+void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 016faa29cddd..c08c44dbd383 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -225,12 +225,23 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		xe_default_lrc_update_memirq_regs_with_address(hwe);
+}
+
 static void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
 {
 	int i;
 
-	for (i = 0; i < eq->width; ++i)
+	for (i = 0; i < eq->width; ++i) {
+		xe_lrc_update_memirq_regs_with_address(eq->hwe, eq->lrc[i]);
 		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
+	}
 }
 
 static void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
@@ -249,8 +260,10 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 	struct xe_gt *gt;
 	unsigned int id;
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		xe_gt_default_lrcs_hwsp_rebase(gt);
 		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
+	}
 }
 
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
-- 
2.25.1

