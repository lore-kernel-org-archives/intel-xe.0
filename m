Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1854C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B1810E774;
	Wed, 25 Jun 2025 15:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VTEj5F+Y";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926C10E770
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FQQqiKKJs2qGQaciLXkJQPKzkd2uG4xmZj7Wyg9uUrA=; b=VTEj5F+YXEmwTZQ8JoNQ0w9r9N
 nX5CO5I2QDwswQrF+c5zc5yVEjzt+w7A7ZD5p09rjsFbGYUlImUMCc1bPzLmBPohU5qhKT4dB3euo
 kPhDI4r2H89ZhwGk8Swo6l0gDxI/nbidb71aTi6nLhYced5j/ClkT+7lnDfPe7SJC0Tv00VuuX+Qz
 bWDQ3Kc8/rTy4JVtmrbCHNUlxbXtmzYlauMyEDmZnd14tN9SLnXm8uLpAa+JQ2wqTWjPJ16JocGqA
 vSZffta0KOkY5t1aDr1An3YXrO+bdq6mgcU1IYcEqxPxzthpZGOOMWua+/dr9QjijKmnYQq+FTMoU
 e9Fo26lw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uUSAy-008aNq-LS; Wed, 25 Jun 2025 17:36:40 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 7/7] drm/xe/xelp: Add Wa_18022495364
Date: Wed, 25 Jun 2025 16:36:32 +0100
Message-ID: <20250625153632.21220-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
References: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
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

Add Wa_18022495364 as a context workaround batch buffer workaround.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_lrc.c              | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7ade41e2b7b3..f4c3e1187a00 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -111,6 +111,9 @@
 #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
 #define   CS_PRIORITY_MEM_READ			REG_BIT(7)
 
+#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
+#define   INSTRUCTION_STATE_CACHE_INVALIDATE	REG_BIT(6)
+
 #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f86a09ed6848..5fee3e53925d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1033,6 +1033,26 @@ xelp_emit_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	return cmd - batch;
 }
 
+static ssize_t
+xelp_invalidate_state_cache(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+			    u32 *batch, size_t max_len)
+{
+	u32 *cmd = batch;
+
+	if (!XE_WA(lrc->gt, 18022495364) ||
+	    hwe->class != XE_ENGINE_CLASS_RENDER)
+		return 0;
+
+	if (xe_gt_WARN_ON(lrc->gt, max_len < 3))
+		return -ENOSPC;
+
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+	*cmd++ = CS_DEBUG_MODE1(0).addr;
+	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
+
+	return cmd - batch;
+}
+
 struct wa_bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
@@ -1105,6 +1125,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct wa_bo_setup funcs[] = {
 		{ .setup = xelp_emit_timestamp_wa },
+		{ .setup = xelp_invalidate_state_cache },
 		{ .setup = wa_bb_setup_utilization },
 	};
 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 51967489c564..f60b277f92a5 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1,5 +1,6 @@
 1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
 16010904313	GRAPHICS_VERSION_RANGE(1200, 1210)
+18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
 14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
 		PLATFORM(DG2)
-- 
2.48.0

