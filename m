Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B22CCD18A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599EA10E689;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENwftvns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86A610E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842316; x=1791378316;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5UP401ZzVVf1vrQG13tQ/x289lbSVKlw/oKu+fWhUCw=;
 b=ENwftvnsOeGoYrlc8gi8ypIGoZ6ThIv1wmW+SCjEcwxdOAtnVukK88jC
 zYkdqAzrDp7BhBrsSvIup0RX+U4w26JMmd05xr8V5dHiRahy6vaxSprPE
 4iEQpry5RrSYqcafbLoizTxLxBdZD4DX+M05Q4YTtfCfRxJgeWQikT5Pi
 ESK6p8+JVjzJld96Ecq7ayC75NXOa9uzAMtbuQ0Yj8Zo/6jdhu5pmHkQ5
 rHcjIvLFhbZoRDVYor9cAOql1mNpfBR5/Ko8sT1MgdsbbMWpnCfzJaImc
 Kyf+pRauq+wiieSyj1XSKgAVn//luY57T7d/FPXgnxZjC3SJ6EsEMQuH6 A==;
X-CSE-ConnectionGUID: uu+/5UV2S7O8t/EiootnSw==
X-CSE-MsgGUID: 5AJMq03/SHm2wd4WuVYByw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639850"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:16 -0700
X-CSE-ConnectionGUID: WzcfnGuGQpO374nZKO/lDg==
X-CSE-MsgGUID: vUyZfGl7QfGu5jisY5Piww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576964"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 29/33] drm/xe: Use PPGTT addresses for TLB invalidation to
 avoid GGTT fixups
Date: Tue,  7 Oct 2025 06:05:01 -0700
Message-Id: <20251007130505.2694829-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

