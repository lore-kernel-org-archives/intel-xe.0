Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E207CCD19F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7010E8A5;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaQP4a9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E476A10E88C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5UP401ZzVVf1vrQG13tQ/x289lbSVKlw/oKu+fWhUCw=;
 b=jaQP4a9SkFSo6OXAn5rnqGem9n7PqlUxLyGBAfKa8bk1dCsHycQ03fRu
 BnHIdwMg3iUbNs5cNIMUKHXxoduI8Y22WIpnoK3JdWtA45mgkfcqopg7f
 3ysXlfX1VwbR6Yg4xjL22dsly6CGbcYD4bUW2EbiFOX9oeD+16NrwtI8F
 4OQs0ciAgNjtnF1HMoNAD83N909q7cCQwORrUkAnSVow2uswiTMYTlscG
 SA9u3+/awu0M2iDbn2xwmN/sO5v0CG3ohTBs+LPKwDR/tk1Yc/VD9LPEE
 FJc+n4L1AI32GZRVRW5C3vUAeYbvACU3Or8UYSQtQpDhQ3GfC/xjp9wpG w==;
X-CSE-ConnectionGUID: B5jCEIJmRQqy7sdFRKmgZw==
X-CSE-MsgGUID: Q2ETqCwBQzaVc/vhFzA0Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067540"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067540"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: uv92uv4ZQrmpMSFff2UUXw==
X-CSE-MsgGUID: V0S5viRJTFuTTA3TM4va3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593748"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 30/34] drm/xe: Use PPGTT addresses for TLB invalidation to
 avoid GGTT fixups
Date: Wed,  8 Oct 2025 11:04:56 -0700
Message-Id: <20251008180500.3261209-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

