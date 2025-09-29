Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54D4CCA472
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898C10E3A3;
	Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMUHWMIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F3A10E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114553; x=1790650553;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5UP401ZzVVf1vrQG13tQ/x289lbSVKlw/oKu+fWhUCw=;
 b=LMUHWMIPRkvv8wZlV6InIcxi70JD8mI5b4ufmjL8389m7jowfJ2QK2Mf
 NvQYVCLxJTCek8paWu0RphTTnPxlp3V6J2o/65I6E82oZXhMLvb/qEZX6
 4hHdAAEVzmtnxztXn9EKcdDCTqbsVFqYldsYVvJ7g2XJViBeULl8Y+/Q4
 KOZ++4PG+S6Xe9iebjEpQQosGZ4OwaCUdk8u/++pFVj1yWA1Z56kavMZR
 L1ORl0Om//8y20uVtmgQZrNzfuHXvPhCJRjtx7SXwSMDiqad7Mbeo5PwE
 Fj/rq5ElyW/djYlhLLEALKYBV7StmQo6jLTddiJE6jSH1M5vKwjkIA+m+ A==;
X-CSE-ConnectionGUID: rLTVY6cSRJigcR9C2w4veg==
X-CSE-MsgGUID: bvValyCEQ8C1pVN6mBKQxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398548"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:52 -0700
X-CSE-ConnectionGUID: r4W16NKuR3Oa6HqQKD6+sw==
X-CSE-MsgGUID: upo6C/jKQRGGIC23ZovsMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529282"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 32/36] drm/xe: Use PPGTT addresses for TLB invalidation to
 avoid GGTT fixups
Date: Sun, 28 Sep 2025 19:55:38 -0700
Message-Id: <20250929025542.1486303-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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

From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

The migrate VM builds the CCS metadata save/restore batch buffer (BB) in
advance and retains it so the GuC can submit it directly when saving a
VM’s state.

When a VM migrates between VFs, the GGTT base can change. Any GGTT-based
addresses embedded in the BB would then have to be parsed and patched.

Use PPGTT addresses in the BB (including for TLB invalidation) so the BB
remains GGTT-agnostic and requires no address fixups during migration.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1d667fa36cf3..ad03afb5145f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -980,15 +980,27 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
 	return migrate->q->lrc[0];
 }
 
-static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
-				 u32 flags)
+static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
 {
-	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
+	/*
+	 * The migrate VM is self-referential so it can modify its own PTEs (see
+	 * pte_update_size() or emit_pte() functions). We reserve NUM_KERNEL_PDE
+	 * entries for kernel operations (copies, clears, CCS migrate), and
+	 * suballocate the rest to user operations (binds/unbinds). With
+	 * NUM_KERNEL_PDE = 15, NUM_KERNEL_PDE - 1 is already used for PTE updates,
+	 * so assign NUM_KERNEL_PDE - 2 for TLB invalidation.
+	 */
+	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
+}
+
+static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
+{
+	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
+
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
 		  MI_FLUSH_IMM_DW | flags;
-	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
-		  MI_FLUSH_DW_USE_GTT;
-	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
+	dw[i++] = lower_32_bits(addr);
+	dw[i++] = upper_32_bits(addr);
 	dw[i++] = MI_NOOP;
 	dw[i++] = MI_NOOP;
 
@@ -1101,11 +1113,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
-		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
+		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
 		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
 						  src_L0_ofs, dst_is_pltt,
 						  src_L0, ccs_ofs, true);
-		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
+		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
 
 		size -= src_L0;
 	}
-- 
2.34.1

