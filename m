Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F150C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFA010E163;
	Tue,  7 May 2024 22:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4V+6uKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF67A10E197
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121780; x=1746657780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V8S1AQcsovAsObX6ljEZUWZbFOL4EOwsFl0L+sn3M1g=;
 b=g4V+6uKjkHG1SPBdOfVfZKNf5MjomM3VOJu9gOe3GcpviC5y6rn4ADwy
 xoDGLNehjU2f3DhqUpYs5HQh0NaEEcLwpplnSWJ2NYkJrNow7xcB3whqU
 AvcTo2C+QYLyzdAQu7iRIIBRdMBE5XtzvQOBX55rp2cDYDc+MagyZ8ER8
 2n+gvfcmgQhY6HKa7dh8DaY2wu6xOFWia0Er2/hZckFmLr8Q7PIr6zC0m
 yKMPN/6/9lJZRw1HR9zLEKbLge1tbhGWTSqs2CSPedYtslZYcyzw1pXg7
 W6sFm72l7RY6zoHiTpx48PL+FkKGe525NbJ8U0PKpKsn5mbG5ysFDKcIQ g==;
X-CSE-ConnectionGUID: uGmtUVIqSeaTZ2LeRenXzw==
X-CSE-MsgGUID: kPUSR6qKRaGznLEgXpMB9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108373"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
X-CSE-ConnectionGUID: kVtXLVkBTXSPPjkFZ3yvGw==
X-CSE-MsgGUID: yjThein0RRObpTwotlp2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33156992"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, stuart.summers@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 3/4] drm/xe: Dump Indirect Ring State registers
Date: Tue,  7 May 2024 15:42:52 -0700
Message-ID: <20240507224255.5059-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
References: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
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

Dump INDIRECT_RING_STATE and RING_START_UDW registers.

v2: Add bspec reference

Bspec: 67137, 67138
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  4 ++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 260a44f46f7e..263ffc7bc2ef 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -55,6 +55,8 @@
 #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
 #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
 
+#define RING_START_UDW(base)			XE_REG((base) + 0x48)
+
 #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
 #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
 #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
@@ -110,6 +112,8 @@
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
 
+#define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ec69803152a2..45f582a7caaa 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -908,6 +908,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
 	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
 	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
+	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
+		snapshot->reg.indirect_ring_state =
+			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
+		snapshot->reg.ring_start_udw =
+			hw_engine_mmio_read32(hwe, RING_START_UDW(0));
+	}
+
 	snapshot->reg.ring_head =
 		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
 	snapshot->reg.ring_tail =
@@ -997,6 +1004,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
 		   snapshot->reg.ring_execlist_sq_contents);
 	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
+	drm_printf(p, "\tRING_START_UDW: 0x%08x\n",
+		   snapshot->reg.ring_start_udw);
 	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
 	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
 	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
@@ -1010,6 +1019,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
 	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
 	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
+		   snapshot->reg.indirect_ring_state);
 	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
 	xe_hw_engine_snapshot_instdone_print(snapshot, p);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 9f9755e31b9f..5f4b67acba99 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -189,6 +189,8 @@ struct xe_hw_engine_snapshot {
 		u32 ring_hws_pga;
 		/** @reg.ring_start: RING_START */
 		u32 ring_start;
+		/** @reg.ring_start_udw: RING_START_UDW */
+		u32 ring_start_udw;
 		/** @reg.ring_head: RING_HEAD */
 		u32 ring_head;
 		/** @reg.ring_tail: RING_TAIL */
@@ -207,6 +209,8 @@ struct xe_hw_engine_snapshot {
 		u32 ring_emr;
 		/** @reg.ring_eir: RING_EIR */
 		u32 ring_eir;
+		/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
+		u32 indirect_ring_state;
 		/** @reg.ipehr: IPEHR */
 		u32 ipehr;
 		/** @reg.rcu_mode: RCU_MODE */
-- 
2.43.0

