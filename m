Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF78C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 17:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B6810E509;
	Thu,  4 May 2023 17:16:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9B610E4F3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683220582; x=1714756582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dSb8+2iRWdT4RU1hF0I8nTTmQi9OcWAcwYrS+56S99g=;
 b=HooZe1qCGHrwSkmQpUEamQXPbdvuQnnOGCWGxWPVg7z8m2nQ4dKV1hzh
 Xykqg3K+fLmMcH9RHMAPlwg7FBTRkdQY5eEgpGxf7xQVcTLdoV5sTpY5q
 gJOUjMUnwfEHpuaXNM7o9QMTOPoE3rHAff35wiEtWvvnXZdAf514HTkSc
 NETvjnFLWhxY/mXmpJiB2FBvY+IyVpK2k5TqXdZgUISGk+zniezuA+AOG
 bmtrwGU0tpeng89fpzVenqQUdeMHbr5EsGNnP9fTnQCnJPdn75DyjzUp2
 0VG2vB6L3tf09ulhtDzSnsTr+jf8gUoyxgxsFG0OJvPASr3WhptRacdDs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="351118145"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="351118145"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 10:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="697149254"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="697149254"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 10:11:20 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 10:11:15 -0700
Message-Id: <20230504171115.89838-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504171115.89838-1-jose.souza@intel.com>
References: <20230504171115.89838-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

copy cs instructions that dont have a explict MOCS field will use this
default MOCS value.

v2:
- move to xe_hw_engine.c
- remove BLIT_CCTL auxiliary macros
- removed MASKED_REG

v3:
- rebased

v4:
- process workaround in hwe->reg_lrc

v5:
- add a new function and call it from xe_gt_record_default_lrcs()
because hwe->reg_lrc is initialized later

BSpec: 45807
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v4
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 +++++
 drivers/gpu/drm/xe/xe_gt.c               |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h        |  1 +
 4 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 717d560626cec..79873bf64e8dd 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -58,6 +58,12 @@
 
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
+
+/* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
+#define BLIT_CCTL(base)				XE_REG((base) + 0x204)
+#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
+#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
+
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 603bb3ae3e370..3afca3dd9657d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -225,6 +225,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
 		xe_wa_process_lrc(hwe);
+		xe_hw_engine_setup_default_lrc_state(hwe);
 		xe_tuning_process_lrc(hwe);
 
 		default_lrc = drmm_kzalloc(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index d497f0289c372..ce9975df1c98b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -268,6 +268,35 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
 }
 
+void
+xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	const u8 mocs_write_idx = gt->mocs.uc_index;
+	const u8 mocs_read_idx = gt->mocs.uc_index;
+	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
+			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
+	const struct xe_rtp_entry lrc_was[] = {
+		/*
+		 * Some blitter commands do not have a field for MOCS, those
+		 * commands will use MOCS index pointed by BLIT_CCTL.
+		 * BLIT_CCTL registers are needed to be programmed to un-cached.
+		 */
+		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+			       ENGINE_CLASS(COPY)),
+		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
+				 BLIT_CCTL_DST_MOCS_MASK |
+				 BLIT_CCTL_SRC_MOCS_MASK,
+				 blit_cctl_val,
+				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
+		{}
+	};
+
+	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
+}
+
 static void
 hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index ceab653972568..013efcd6d8c5b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -17,6 +17,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
-- 
2.40.1

