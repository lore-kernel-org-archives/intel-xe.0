Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B04C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83910E20A;
	Tue, 25 Aug 2026 17:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvbTYQnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350510E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787678915; x=1819214915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FgTAZ0gNoWbnOCavSCXIWdtf2ETWMBCkgXPo9IPP75g=;
 b=YvbTYQnF3LDD8NSRhKDrkIboWdBo4hJvGmSKzQElR3b5lrupuvK99D0E
 vYnKsSoC3eJFVtfNC/k9V0UrIlxWtxS+ShixQ7979TBbNABsOO5d6citP
 V4Goer1tshBhayWH3uda+M1lMj6A0qrKTWrPkd0tbeEHQQGRREhAtQ8xS
 cCM5WJDT0ooiBOD72zd8muZLsiyurxyXWgZXREgYgBqDDimKX9eOrSXlb
 m+RRD32bEVA/mViLVTAwxUASFLku/jKE1QZC2EEvLiHb7Q6vTw8/utax6
 OABHOi5088W2ajY2aisO8sQBCMoRbGe8imacRNqKAkpdaxj+PzIIlHiar A==;
X-CSE-ConnectionGUID: z5o30OBPTFy/XSE17eZMvQ==
X-CSE-MsgGUID: gErDUUixS/WykpAHov8MXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88013251"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88013251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:28:34 -0700
X-CSE-ConnectionGUID: ZxureV8LQYChaaU92uzG4w==
X-CSE-MsgGUID: rxwNN1mZREa8or2ne0n7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272583462"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:28:31 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v1] drm/xe/sysctrl: Read mailbox phase bit from hardware
Date: Tue, 25 Aug 2026 10:28:28 -0700
Message-ID: <20260825172827.3801591-2-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

The mailbox PHASE bit in SYSCTRL_MB_CTRL is toggled per-message and
was tracked in software as sc->phase_bit, reset to 0 on error paths.
If the cached value ever drifts from what the hardware last saw, all
following messages carry the wrong phase and get silently misread by
firmware.

Drop the cache and read PHASE directly from SYSCTRL_MB_CTRL before
each frame instead, removing xe_sysctrl_mailbox_init() and its call
sites along with it.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl.c         |  7 +------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 22 ++++------------------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  1 -
 drivers/gpu/drm/xe/xe_sysctrl_types.h   |  3 ---
 4 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 1db20be8158b..62ccc9be71b4 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -85,7 +85,6 @@ int xe_sysctrl_init(struct xe_device *xe)
 		return ret;
 
 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
-	xe_sysctrl_mailbox_init(sc);
 	INIT_WORK(&sc->work, xe_sysctrl_work);
 
 	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
@@ -114,12 +113,10 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
  * @xe: xe device instance
  *
  * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
- * Restores SoC remapper configuration and reinitializes mailbox interface.
+ * Restores SoC remapper configuration.
  */
 void xe_sysctrl_pm_resume(struct xe_device *xe)
 {
-	struct xe_sysctrl *sc = &xe->sc;
-
 	if (!xe->info.has_soc_remapper_sysctrl)
 		return;
 
@@ -127,6 +124,4 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 		return;
 
 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
-
-	xe_sysctrl_mailbox_init(sc);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index e13eebaac1d0..72baf1aa4b3a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -145,6 +145,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	struct xe_device *xe = sc_to_xe(sc);
 	u32 ctrl_reg, total_frames, frame;
 	size_t bytes_sent, frame_size;
+	bool phase;
 
 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
 
@@ -153,7 +154,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 		return -EBUSY;
 	}
 
-	sc->phase_bit ^= 1;
+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
+	phase = !(ctrl_reg & SYSCTRL_FRAME_PHASE);
 	bytes_sent = 0;
 
 	for (frame = 0; frame < total_frames; frame++) {
@@ -161,7 +163,6 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 
 		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
 			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
-			sc->phase_bit = 0;
 			return -EIO;
 		}
 
@@ -169,13 +170,12 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
 			   REG_FIELD_PREP(SYSCTRL_FRAME_TOTAL_MASK, total_frames - 1) |
 			   SYSCTRL_MB_CTRL_CMD |
-			   (sc->phase_bit ? SYSCTRL_FRAME_PHASE : 0);
+			   (phase ? SYSCTRL_FRAME_PHASE : 0);
 
 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
 
 		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
 			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
-			sc->phase_bit = 0;
 			return -ETIMEDOUT;
 		}
 
@@ -321,20 +321,6 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
 	command->data_out_len = response_len;
 }
 
-/**
- * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
- * @sc: System controller structure
- *
- * Initialize system controller mailbox interface for communication.
- */
-void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
-{
-	u32 ctrl_reg;
-
-	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
-	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
-}
-
 /**
  * xe_sysctrl_send_command() - Send mailbox command to System Controller
  * @sc: System Controller instance
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index fb434cc165b2..f0d5e3d7f5e3 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -26,7 +26,6 @@ struct xe_sysctrl_mailbox_command;
 void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
 			       void *request, size_t request_len, void *response,
 			       size_t response_len);
-void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
 			    size_t *rdata_len);
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 66ba24f43017..98c2f473f7c6 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -26,9 +26,6 @@ struct xe_sysctrl {
 	/** @cmd_lock: Mutex protecting mailbox command operations */
 	struct mutex cmd_lock;
 
-	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
-	bool phase_bit;
-
 	/** @work: Pending events worker */
 	struct work_struct work;
 
-- 
2.43.0

