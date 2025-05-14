Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39F3C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646D10E63C;
	Wed, 14 May 2025 13:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZM9fuGWj";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9DE10E637
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fH7w0Dzkr/K9zwLNzBLOPzXchWaVeoq1yOZpW9zYIGk=; b=ZM9fuGWjX19OnPNWIbw09vXgpF
 UEqJBbEoFzb7J1gBcXsJJUt/tJyzgm8KJbD4Up0FwjK0kKcBcMofyOOxfp3u/RL+AC51i8Y5ykLVE
 IJ1uXfmDlpLA2WkFQpbnIfx9VqVsflZ1uyPzCDo135Hd4oL7II4JlqZbtwOxxPZiUGFK3fuS4b9X5
 hzpBG5WSvTn7/jcyR25G3NHBsjaFz8jKGNUWzMJYwqHKhqXQPpnbD/iAADpPcz2TC+AEGALVu0JUs
 8mXB1wwIc7jvRq6298y6SA4xQ8P9vhHPpJpC6TR9TSZbdB9JJbkkIgplzCt2xaQH3DmCMng8IVCDj
 ZisqkxjA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFCEf-008AZC-1M; Wed, 14 May 2025 15:39:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 03/19] drm/xe/xelp: Add Wa_1607983814
Date: Wed, 14 May 2025 14:38:45 +0100
Message-ID: <20250514133904.12131-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
References: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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

Add Wa_1607983814 as a context indirect workaround.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_lrc.c              | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index d1d2592e010d..94d778d5425d 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -112,6 +112,9 @@
 #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
 #define   CS_PRIORITY_MEM_READ			REG_BIT(7)
 
+#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
+#define   INSTRUCTION_STATE_CACHE_INVALIDATE	REG_BIT(6)
+
 #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6022068ce6b6..d729d79ae802 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1028,6 +1028,15 @@ xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
 	return cmd;
 }
 
+static u32 *xelp_invalidate_state_cache(u32 *cmd)
+{
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+	*cmd++ = CS_DEBUG_MODE1(0).addr;
+	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
+
+	return cmd;
+}
+
 static u32 *
 xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			    u32 *cmd)
@@ -1037,6 +1046,9 @@ xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
 	cmd = xelp_emit_restore_scratch(lrc, cmd);
 
+	if (XE_WA(lrc->gt, 1607983814))
+		cmd = xelp_invalidate_state_cache(cmd);
+
 	return cmd;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..a32f5ee9e917 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1,4 +1,5 @@
 1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
+18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
 14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
 		PLATFORM(DG2)
-- 
2.48.0

