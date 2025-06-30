Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC69EC83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 12:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CB010E431;
	Mon, 30 Jun 2025 12:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="s8Lvdrm0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8D10E431
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 12:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kLurOXLGwX3TbxXChuoER0DhX6ZBWec/iloOkESeLkk=; b=s8Lvdrm059BQ9m7/1EBwKWCraA
 jPs/kxIOasVAOPs+xgoIA8xtPcz/JxKwCv9X7XbKnJr0bhh2NfkrPF0y04bSvS2MvTbuxurBaesUk
 jshRgs25SvmO8oSjJSgrLXDQsIg1mjmxRAvyPIEYkACJtvOY7E0w0D9ymVBdJpUTtweJfgFCoSvpH
 7cZC+gjnFeL7zeEfNPcuLobKJ0cWBoAIpsQXiZ/IiB9iOOmUHUzjaJ1j1FNkILS40bh0NeVcV8oia
 ocMEOkB8NgcYySXC9uCY6s2+4OvxXAcbNLWqMU6L9kjaiPI8ZYpqffSiMIAFOEafPOUj/EhUBrXNa
 3m0viZGA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uWDXC-00ATAe-E7; Mon, 30 Jun 2025 14:22:54 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v7 8/8] drm/xe/xelp: Add Wa_18022495364
Date: Mon, 30 Jun 2025 13:22:44 +0100
Message-ID: <20250630122244.7949-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
References: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
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
index aee86486a0c9..3d49377e59f5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1034,6 +1034,26 @@ setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *batch,
 	return cmd - batch;
 }
 
+static ssize_t
+setup_invalidate_state_cache_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+				u32 *batch, size_t max_len)
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
@@ -1106,6 +1126,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct wa_bo_setup funcs[] = {
 		{ .setup = setup_timestamp_wa },
+		{ .setup = setup_invalidate_state_cache_wa },
 		{ .setup = setup_utilization_wa },
 	};
 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index bf798f3b8f93..8ee1c71499fc 100644
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

