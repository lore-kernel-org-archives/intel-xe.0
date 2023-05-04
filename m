Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58FFC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 14:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A480B10E461;
	Thu,  4 May 2023 14:12:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DB610E169
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683209557; x=1714745557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vYa1HnzTcmaMsgMUIGFhq5LMN2DtKMwhJBeeX7vzDe4=;
 b=ODCDsF3ukaT6Sd6ws2qVXVvvTCkQTG+bm15rLEoPgbLsDEb5r/sHJ3u1
 WX+3YZD9OcQq9VraIijORmP2iuP/9kKm9pQlMzKpnr50uwsgPgRA1maac
 YAKCRA0elivaiuoAvArC1fdSGq47Fg+zYNXxUrXFrbJ+DzEHFfmeoiel2
 FUn6Ko/i39z2+8DUQQc4EN1S2EwDtdP0RqmoHE9Sh1igJS2h76HcWrGon
 w0JfcKoUDMgqCypC35fLKAaBr1ZPGU259jXAD9nZWM6TQb7fWuYfVU9nS
 wef7HL81rOz/8v3TTe93Wj69WhTJPBlCmPD7wFbqth+sF1njCEdLIt5ui A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377009006"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="377009006"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 07:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786559637"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="786559637"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 07:12:35 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 07:12:27 -0700
Message-Id: <20230504141227.29785-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504141227.29785-1-jose.souza@intel.com>
References: <20230504141227.29785-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/2] drm/xe: Set default MOCS value for copy
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

This was mainly copied from i915 source code.

v2:
- move to xe_hw_engine.c
- remove BLIT_CCTL auxiliary macros
- removed MASKED_REG

v3:
- rebased

v4:
- process workaround in hwe->reg_lrc

BSpec: 45807
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

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
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index d497f0289c372..a7d5d81335f47 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -277,6 +277,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	const u8 mocs_read_idx = gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
 			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
+	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
+			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
 	const struct xe_rtp_entry engine_was[] = {
 		/*
 		 * RING_CMD_CCTL specifies the default MOCS entry that will be
@@ -297,8 +299,26 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		},
 		{}
 	};
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
 
 	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
+	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
 }
 
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
-- 
2.40.1

