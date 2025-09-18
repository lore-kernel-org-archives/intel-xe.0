Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC93FCAC5A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AE410E664;
	Thu, 18 Sep 2025 07:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcjjUrfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B495410E32E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758179589; x=1789715589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M73Js5En3rgDdFhjAsQXOVKAWSno5IJpXCNL2AtAMuk=;
 b=fcjjUrfzOYB0a5wTmFHu9j/fBhZLt6wUG0j1RCCphGLgeXIilrL+zYAh
 uzr/FGOTqsAzPyH03qPyHJ9LhV48cHO/Z0LRnh/QxUHgKv/dSUT5w48PI
 M2Ycsvmg7muPCzOusJrvbP2YUMJHa9WgMHVNz1M41+AAGcvcOPhEi1x3Y
 w7AOkvjwdfXDHRg2yWPSRhY9/DrZvOSqzlp5/2Tv5ww0Lzebr6UL18at2
 hE2UtKT4+6B+Dwp5dak5oSDW/wcmNFDPjX7+378ewSF1maIGAUDfBelGM
 XGS5sj64eBF9rpCeNRLglcpKU+ZU2Ts/v3V+cBod4jcES3RbadYxp+Erg w==;
X-CSE-ConnectionGUID: qmjBrp8xQI6jShhP+11ElA==
X-CSE-MsgGUID: A8KbQvF2RgWFVg7UUAeqQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60648747"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60648747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:13:08 -0700
X-CSE-ConnectionGUID: 9TVeS7V9Q2q91JlHTWNjgA==
X-CSE-MsgGUID: hFBFLANzQD6N13lC+Yh2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175856927"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 00:13:05 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/4] drm/xe: Use PPGTT addresses for TLB invalidation to avoid
 GGTT fixups
Date: Thu, 18 Sep 2025 13:00:04 +0530
Message-ID: <20250918073002.15242-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6fad5d469629..d375ebc9323d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -971,15 +971,27 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
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
 
@@ -1092,11 +1104,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
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
2.51.0

