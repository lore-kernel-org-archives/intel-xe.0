Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC214606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vn6DLuGl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85870112AD7;
	Fri, 27 Nov 2026 13:10:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B894A112AD7
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795785046; x=1827321046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EI1im89pV59uz7gB/oxP7kE8qpXJPAGdATjF0fCqUjc=;
 b=Vn6DLuGla8y58oWD/81dbBezo+S7wpbOVZc+CL3pBcGwbtUivm6ciIfI
 9H0xSaTXMLpSQ51+3ewRwXeNuFVKyhPX/6HlWKt0o3acGpsujNmGFeEDS
 SPUf+EFMgMqNny1ejcAREvZJGgz2arzrSvuvzxGmzGCx9H77vuRwxli0l
 rPdTKrdL48EX5sWD8/ADze9nbjAi51jltrtppMYo8fytk43t/MMZDaZrt
 NS3sVGQhIj/SPL+Pmrr9Nw3Ft18lO5S54mJAkuXLRKJuMOU+yRmGrOdHA
 C6GzLvujD+7ki1kIHOvLQw/7JUF3ja+CAN77IVI9aHno8jS2HbwQxOoKK g==;
X-CSE-ConnectionGUID: Rzq/iwWdTcucyLQX1c96/A==
X-CSE-MsgGUID: 0NtVtyH2R+OfDGsuGgfJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4763439"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4763439"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:10:46 -0800
X-CSE-ConnectionGUID: /EsBLowmQbKJ86xapbJEpg==
X-CSE-MsgGUID: iiyB4jX4TGu1KWiwAx9bIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12396054"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa007.jf.intel.com with ESMTP; 27 Nov 2026 05:10:44 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/multi_queue: Expose CGP address to debug tools via
 PPHWSP
Date: Fri, 27 Nov 2026 18:38:18 +0530
Message-ID: <20261127130818.1382215-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

The Context Group Page (CGP) has the queues of a multi queue group and
their LRCAs. Store its address in the PPHWSP of the group's primary
queue, so debug tools can find it.

The address is written before the group is registered with GuC and
rewritten after a VF migration GGTT rebase.

v2:
- Use decimal PPHWSP offset, u32 address with xe_map_write32() and assert
  a single LRC in the rebase path (Niranjana)
- Move the DOC note after the CGP GuC interface description (Niranjana)

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 +++
 drivers/gpu/drm/xe/xe_lrc.c        | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ddd9e38aa80b..b1a8ef66ea47 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1926,6 +1926,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 
 		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(lrc);
+		if (xe_exec_queue_is_multi_queue_primary(q)) {
+			struct xe_bo *cgp_bo = q->multi_queue.group->cgp_bo;
+
+			/* Multi queue group primary always has a single LRC */
+			xe_assert(gt_to_xe(q->gt), !i);
+			xe_lrc_set_cgp_gfxaddress(lrc, xe_bo_ggtt_addr(cgp_bo));
+		}
 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
 		xe_lrc_put(lrc);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f84848e00eaf..3b8c0e84d632 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -778,6 +778,8 @@ struct guc_ctxt_registration_info {
  * The primary queue (Q0) represents the multi queue group context in GuC and
  * submission on any queue of the group must be through Q0 GuC interface only.
  *
+ * The CGP address is also stored in the PPHWSP of Q0, for use by debug tools.
+ *
  * As it is not required to register secondary queues with GuC, the secondary queue
  * context ids in the CGP are populated with Q0 context id.
  */
@@ -1051,6 +1053,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 
 		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
 		info.cgp_hi = 0;
+		xe_lrc_set_cgp_gfxaddress(lrc, info.cgp_lo);
 	}
 
 	if (xe_exec_queue_is_parallel(q)) {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 54d50b1b28eb..329e0ac571c2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -705,6 +705,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
 #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
+#define LRC_CGP_GFXADDRESS_PPHWSP_OFFSET 1472
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 #define LRC_ULLS_PPHWSP_OFFSET 2048	/* Mutually exclusive with parallel */
 
@@ -764,6 +765,11 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
+static inline u32 __xe_lrc_cgp_gfxaddress_offset(struct xe_lrc *lrc)
+{
+	return xe_lrc_pphwsp_offset(lrc) + LRC_CGP_GFXADDRESS_PPHWSP_OFFSET;
+}
+
 static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
 {
 	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
@@ -843,6 +849,7 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
 DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
 DECL_MAP_ADDR_HELPERS(ulls, lrc->bo)
+DECL_MAP_ADDR_HELPERS(cgp_gfxaddress, lrc->bo)
 DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
 DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
 DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
@@ -949,6 +956,20 @@ u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
 }
 
+/**
+ * xe_lrc_set_cgp_gfxaddress() - Store the CGP GGTT address in PPHWSP
+ * @lrc: LRC of the multi queue group primary
+ * @cgp_ggtt_addr: GGTT address of the Context Group Page
+ */
+void xe_lrc_set_cgp_gfxaddress(struct xe_lrc *lrc, u32 cgp_ggtt_addr)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map = __xe_lrc_cgp_gfxaddress_map(lrc);
+
+	xe_assert(xe, IS_ALIGNED(cgp_ggtt_addr, SZ_4K));
+	xe_map_write32(xe, &map, cgp_ggtt_addr);
+}
+
 u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc)
 {
 	if (!xe_lrc_has_indirect_ring_state(lrc))
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 840f303db97e..6338ca244b4c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -124,6 +124,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
 
 u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
+void xe_lrc_set_cgp_gfxaddress(struct xe_lrc *lrc, u32 cgp_ggtt_addr);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
 void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
-- 
2.46.0

