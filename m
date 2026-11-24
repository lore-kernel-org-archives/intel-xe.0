Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC81606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjP8TAN7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D41A10E88C;
	Tue, 24 Nov 2026 13:26:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E85410E88C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795526793; x=1827062793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8QBniQgXQ7g1Yord6kBH+D+8ye0s0jmsvJyK+WX3u00=;
 b=LjP8TAN7NOqRBUivPXohexhEE4ZtdUNEhpoFUV9zkP8BPD8jmB6APmND
 ghTU+tTeZ37tS82nIezLIAkSz448aeQdl1x/SsxECLbwDK+hLML/4RfGG
 WbaI/woOKZT06JxpTClgwCR+sE00uWav6uEAEH74OcmRqMtA/9eIfGpMI
 PTWdKyxQ8i2LMqulO8tDHFxSHuD158wptKCPVSCbrz9KKRcLy2ywnIhmp
 RT+QI8SqLbaz+mqBNqzSM6APwDm7SrH2JhPuUFwAFoCHNwY8fHF9NRQw4
 muyYd2sEbUEZr+tUbZp6Bywdn4s24rpk6n5iQyJJyTPGg+kMZdenqgQiP A==;
X-CSE-ConnectionGUID: TxOgAiwLSKWcHFrqApj3ZA==
X-CSE-MsgGUID: aUgpqE87SXujmnVcAw9sZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4388681"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4388681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:12 -0800
X-CSE-ConnectionGUID: ekIudGWSQKOAleeA61xxDg==
X-CSE-MsgGUID: lRjq9l6NRa6YBvVb0ecpSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11347100"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:11 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 tilak.tirumalesh.tangudu@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH 1/2] drm/xe/xe3p_lpg: Implement Wa_14028597154
Date: Tue, 24 Nov 2026 18:36:59 +0530
Message-ID: <20261124130657.800225-5-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124130657.800225-4-varun.gupta@intel.com>
References: <20261124130657.800225-4-varun.gupta@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On graphics version 35.10, when multi-queue is enabled, CS can compute a
wrong address for the semaphore token it writes on a queue switch: the
intended GGTT address shifted right by 10 bits. Those writes land in the
low 4MB of GGTT, below the WOPCM-sized range the driver allocates from
and never maps, causing GGTT faults and CAT errors.

Since the tokens are also lost/overwritten by other aspects of the bug,
there is no need to preserve these writes, only to make them harmless.
Back the low-4MB PTEs reachable from [ggtt->start, ggtt->start +
ggtt->size) plus one trailing spill page with a dedicated device-managed
dummy page on native and PF, and restore these low-4MB PTEs on suspend,
FLR, and D3cold resume since they are not covered by pinned BO restore.
The existing GGTT scratch page is left untouched (it is not allocated on
multi-queue GTs), so stale translations in the allocatable range keep
faulting.

SR-IOV VF support is deferred to a follow-up once PF/VF ABI negotiation
is in place.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c       | 90 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ggtt.h       |  1 +
 drivers/gpu/drm/xe/xe_pm.c         |  3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 5 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eafc66d686e2..b02610d2cfe1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1510,6 +1510,9 @@ int xe_device_resume(struct xe_device *xe, bool flr)
 			return err;
 	}
 
+	for_each_tile(tile, xe, id)
+		xe_ggtt_resume(tile->mem.ggtt);
+
 	xe_i2c_pm_resume(xe, true);
 
 	xe_sysctrl_pm_resume(xe);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 86fc3d186fc8..eca9c085ddb9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -130,6 +130,8 @@ struct xe_ggtt {
 	unsigned int flags;
 	/** @scratch: Internal object allocation used as a scratch page */
 	struct xe_bo *scratch;
+	/** @low_4m_pte: PTE backing GGTT [4K, 4M), 0 if unused */
+	u64 low_4m_pte;
 	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
 	/**
@@ -250,13 +252,27 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 	return ggtt->size;
 }
 
-static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
+static void __xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+
+	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
+static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
+{
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
 	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
-	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
+	__xe_ggtt_set_pte(ggtt, addr, pte);
+}
+
+static void ggtt_set_low_4m_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
+{
+	xe_tile_assert(ggtt->tile, addr >= XE_PAGE_SIZE && addr < SZ_4M);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start);
+
+	__xe_ggtt_set_pte(ggtt, addr, pte);
 }
 
 static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
@@ -552,6 +568,71 @@ ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
 
+static void ggtt_restore_low_4m_locked(struct xe_ggtt *ggtt)
+{
+	u64 low_start = max_t(u64, ALIGN_DOWN(ggtt->start, SZ_4M) >> 10,
+			      XE_PAGE_SIZE);
+	u64 low_end = min_t(u64, (ALIGN(ggtt->start + ggtt->size, SZ_4M) >> 10) +
+			    XE_PAGE_SIZE, SZ_4M);
+	u64 addr;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!ggtt->low_4m_pte)
+		return;
+
+	for (addr = low_start; addr < low_end; addr += XE_PAGE_SIZE)
+		ggtt_set_low_4m_pte(ggtt, addr, ggtt->low_4m_pte);
+}
+
+/*
+ * Wa_14028597154: multi-queue CS may write semaphore tokens to (addr >> 10),
+ * i.e. into the low 4MB of GGTT, below the range we allocate from.
+ */
+static int ggtt_map_low_4m_wa(struct xe_ggtt *ggtt)
+{
+	struct xe_tile *tile = ggtt->tile;
+	struct xe_device *xe = tile_to_xe(tile);
+	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
+	struct xe_bo *bo;
+	u64 pte;
+
+	/*
+	 * TODO: SR-IOV VF support for Wa_14028597154 requires PF/VF ABI
+	 * negotiation so PF can assign the VF's low-4MB PTEs and VF can map
+	 * its own dummy page.
+	 */
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	if (!tile->primary_gt || !XE_GT_WA(tile->primary_gt, 14028597154) ||
+	    !xe_gt_has_multi_queue(tile->primary_gt))
+		return 0;
+
+	bo = xe_managed_bo_create_pin_map(xe, tile, XE_PAGE_SIZE, XE_BO_FLAG_SYSTEM);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	pte = xe_bo_addr(bo, 0, XE_PAGE_SIZE) |
+	      ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+
+	guard(mutex)(&ggtt->lock);
+	ggtt->low_4m_pte = pte;
+	ggtt_restore_low_4m_locked(ggtt);
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_resume - Restore GGTT entries not covered by pinned BO restore
+ * @ggtt: the &xe_ggtt to restore
+ */
+void xe_ggtt_resume(struct xe_ggtt *ggtt)
+{
+	guard(mutex)(&ggtt->lock);
+	ggtt_restore_low_4m_locked(ggtt);
+}
+
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
 	struct drm_mm_node *hole;
@@ -668,6 +749,11 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 			      xe_bo_size(ggtt->scratch));
 	}
 
+	err = ggtt_map_low_4m_wa(ggtt);
+	if (err)
+		goto err;
+
+	/* Also invalidates GGTT TLBs for the low 4MB entries above */
 	xe_ggtt_initial_clear(ggtt);
 
 	return devm_add_action_or_reset(xe->drm.dev, ggtt_fini, ggtt);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 59b2f0287019..78e68c2ca3ad 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -17,6 +17,7 @@ struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
+void xe_ggtt_resume(struct xe_ggtt *ggtt);
 
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f73f68bd449b..6a20a6648253 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -650,6 +650,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		err = xe_bo_restore_early(xe);
 		if (err)
 			goto out;
+
+		for_each_tile(tile, xe, id)
+			xe_ggtt_resume(tile->mem.ggtt);
 	}
 
 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 03b713f55dfb..6bae09c0b3ff 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -81,3 +81,4 @@
 14028709524	GRAPHICS_VERSION(3510)
 14028250015	GRAPHICS_VERSION(3510)
 16031259911	GRAPHICS_VERSION_RANGE(3510, 3511)
+14028597154	GRAPHICS_VERSION(3510), GRAPHICS_STEP(B0, FOREVER)
-- 
2.43.0

