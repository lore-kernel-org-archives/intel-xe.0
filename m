Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FE606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 00:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mucy0eRZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784410E8E2;
	Tue, 20 Oct 2026 00:19:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7575A10E8E2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 00:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792455561; x=1823991561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2AofIDs+oPLmo1WDdPShqWpyVbjCn6LgSirR4RoEaMc=;
 b=Mucy0eRZBbBPpS5DJC1WOTcaNkmu5Ce6o+KysMgryy/yZGRn0OCN2kNR
 yd/W8+90NVkOKi7GvwW7+r+et9PV460DuodM0J6UZxam/r6yVsTze9Buc
 jKGjZFh+4uZEchARN6rdbuGMGjfB6wi37zu8JdUZXdRjJXMDaAXmuVFtS
 bB/1W7+adO6sqPjyR9x0bm1AUHWqWDGQXfQEo9zWTzL5DHgIx69SzHtRo
 37Q6g+YMQ6Uzv9/86mYIMqOysLoOfWeOs0HLGFIlE8RauaOS05pvcKAYx
 X949grrm53RgKmsJ6Vbz0mXFGl97ghbjXS8cjBFcYrgMvUkNnKJ8aGFjE w==;
X-CSE-ConnectionGUID: 0RZuRfNoQaq9sHP9+Ta47A==
X-CSE-MsgGUID: pMX5O76VQ5yGjkRp4H/OkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1253608"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1253608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 17:19:20 -0700
X-CSE-ConnectionGUID: V7i6svuARE+m7Gow0ZSniA==
X-CSE-MsgGUID: qTNEau3EQ9CFiicA2Xv0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3133321"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2026 17:19:20 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2] drm/xe/cri: Set downstream access to L3 class 3 and
 write-back
Date: Mon, 19 Oct 2026 17:15:13 -0700
Message-ID: <20261020001513.1528267-1-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fei Yang <fei.yang@intel.com>

Program DWNSTRM_ACCESS_MODE (0x144154) with 0xcc on graphics
version 3511. Compared with 0x3c, this selects L3 class of service
3 instead of 0 and write-back rather than uncached L3 policy.
The L4 caching policy and coherency mode remain unchanged.

v2:
- Create a dedicated MERT workaround section/table instead of placing
  this workaround in gt_was. MERT registers are device-level registers
  accessed through root-tile MMIO, outside GT forcewake and GT
  save/restore bookkeeping.
- Add an RTP helper for full-register device MMIO writes and apply the
  MERT table during probe and after pcode is ready on system or D3cold
  resume. Match Xe3p_XPC explicitly and skip devices without
  MERT and SR-IOV VFs.

BSpec: 73603
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_device.c         |  4 +++
 drivers/gpu/drm/xe/xe_pm.c             |  8 ++++++
 drivers/gpu/drm/xe/xe_rtp.c            | 39 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h            |  2 ++
 drivers/gpu/drm/xe/xe_wa.c             | 23 +++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h             |  1 +
 7 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index 99e5a26da6572..1e6ce818fcee9 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -8,6 +8,8 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS	XE_REG(0x144154)
+
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
 #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c48..27cff3137a7fe 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -953,6 +953,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_wa_apply_mert_workarounds(xe);
+	if (err)
+		return err;
+
 	/*
 	 * Allow allocations only now to ensure xe_display_init_early()
 	 * is the first to allocate, always.
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index daa7ba2df317a..ba863df3fbf59 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -251,6 +251,10 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_wa_apply_mert_workarounds(xe);
+	if (err)
+		return err;
+
 	xe_display_pm_resume_early(xe);
 
 	/*
@@ -705,6 +709,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		err = xe_wa_apply_mert_workarounds(xe);
+		if (err)
+			goto out;
+
 		xe_display_pm_resume_early(xe);
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 6a8d6ea68f25d..539d06eaba6fc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
+#include "xe_mmio.h"
 #include "xe_reg_sr.h"
 #include "xe_sriov.h"
 
@@ -413,6 +414,44 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
 
+/**
+ * xe_rtp_apply_device_mmio_writes - Apply full-register device MMIO writes
+ * @xe: Device to apply the actions to
+ * @table: RTP action table containing only full-register writes
+ *
+ * Device registers are accessed via the root tile without GT forcewake or
+ * GT save/restore bookkeeping.
+ *
+ * Return: 0 on success or -EINVAL for an unsupported action.
+ */
+int xe_rtp_apply_device_mmio_writes(struct xe_device *xe,
+				    const struct xe_rtp_table_sr *table)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	for (size_t i = 0; i < table->n_entries; i++) {
+		const struct xe_rtp_entry_sr *entry = &table->entries[i];
+
+		if (!rule_matches(xe, NULL, NULL, entry->rules, entry->n_rules))
+			continue;
+
+		for (size_t j = 0; j < entry->n_actions; j++) {
+			const struct xe_rtp_action *action = &entry->actions[j];
+
+			if (drm_WARN_ON(&xe->drm, action->clr_bits != ~0u ||
+					action->reg.mcr || action->reg.masked ||
+					action->flags || action->use_func))
+				return -EINVAL;
+
+			xe_mmio_write32(mmio, action->reg, action->set_bits);
+		}
+
+		drm_dbg(&xe->drm, "Applied device workaround %s\n", entry->name);
+	}
+
+	return 0;
+}
+
 bool xe_rtp_match_always(const struct xe_device *xe,
 			 const struct xe_gt *gt,
 			 const struct xe_hw_engine *hwe)
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 0032f68ea1873..7f45bb8552244 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -514,6 +514,8 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 
 void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 		    const struct xe_rtp_table *table);
+int xe_rtp_apply_device_mmio_writes(struct xe_device *xe,
+				    const struct xe_rtp_table_sr *table);
 
 /* Match functions to be used with XE_RTP_MATCH_FUNC */
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c94fe7753f9a9..18f953ffbc1cf 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -16,7 +16,9 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_mert_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt_types.h"
@@ -823,6 +825,13 @@ VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was = {
 };
 EXPORT_SYMBOL_IF_KUNIT(device_oob_was);
 
+static const struct xe_rtp_table_sr mert_was = XE_RTP_TABLE_SR(
+	{ XE_RTP_NAME("14028586678"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3511)),
+	  XE_RTP_ACTIONS(WR(DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS, 0xcc))
+	},
+);
+
 __diag_pop();
 
 /**
@@ -1032,3 +1041,17 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
 	if (XE_DEVICE_WA(tile->xe, 22010954014))
 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
+
+/**
+ * xe_wa_apply_mert_workarounds - Apply root-tile MERT workarounds
+ * @xe: Xe device
+ *
+ * Called during probe and after pcode is ready on system or D3cold resume.
+ */
+int xe_wa_apply_mert_workarounds(struct xe_device *xe)
+{
+	if (!xe_device_has_mert(xe) || IS_SRIOV_VF(xe))
+		return 0;
+
+	return xe_rtp_apply_device_mmio_writes(xe, &mert_was);
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index f4da2b2713963..28516812cb2bf 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -22,6 +22,7 @@ void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
+int xe_wa_apply_mert_workarounds(struct xe_device *xe);
 void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
 int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 
-- 
2.43.0

