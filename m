Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B72DC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 17:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430261122D6;
	Mon,  6 May 2024 17:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrVll/CU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7540B10FEFC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715015483; x=1746551483;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gluAESULl2UJ4do1ZuozqC4Zk7N+m11ksAv675IAiow=;
 b=MrVll/CUAaQ3hU1SZ5maxKtH9yA/2w0vCEMRSNH/7ZdXitsJCyr0tfC2
 mbQMa/CjWz3Q8P9MpqyvbgUTsLnt/SraWUTlwNYPLLZKuDmWLbrqzi/e1
 c5g6WaCW7hOlg+95ztmv+aRPH7YtoMlYx3BAqLvnSbUbb0lV3PAM1vq0b
 5d6hIkHRy4LVgicX+CfmXGgEiXuoBAy6NLmkUiVrazD7Av7xDvL44T2Ug
 VwDqiENdHYeVpyDHxjbuYxJcQhyvoWeEI99CFhTeXE3j14nD78pY9rTqK
 b1MZ4P5w0rYUOBSLI42gi1iUwAshRZaXipIDDcLB0J2n/HII5AHDy0zfc A==;
X-CSE-ConnectionGUID: YkrPVmdsTACHaDcbN74Nzg==
X-CSE-MsgGUID: lGxfHJfYSMqo92Z6J1Xlrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21325504"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="21325504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:11:21 -0700
X-CSE-ConnectionGUID: q8eovk1BQNGFuUf3s3a6Kg==
X-CSE-MsgGUID: X8bTONUlQ2yXmCl8ucl7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28116389"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:11:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/xe: Dump Indirect Ring State registers
Date: Mon,  6 May 2024 10:11:04 -0700
Message-ID: <20240506171111.16280-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
References: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
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

