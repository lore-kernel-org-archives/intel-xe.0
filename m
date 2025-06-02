Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CA5C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C5710E512;
	Mon,  2 Jun 2025 11:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HxYQE1Oq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E3210E4FA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uPa6sCfReRE7ziQ9ElLhrCT7P8gGpaDD7WpkYlsGgGI=; b=HxYQE1Oq3/mGo6Zqcj4A/YJRfJ
 plv8I3qr53RuWez30TZbIw4EebJ2mR8ocNwIBxoDKGonf7MaFu9Hb6BCtJN4QRCGSpXTHgIsY/fjN
 HRAbWRixPOV8pZmWGYEXt3DVrCXgq99s1OVk6NAUYYmUm43kxiY2e6z0eCdINjyPnAZA6LIY7l8hU
 OZuPN4QUs/YV5184ihO85Cfz2blPamfUamJsFJ2TinLjxotvd9Zcat2IrZ7C8DSinpdM2moSosz2q
 7kOOzn+/LMMkrPfhbZeAc7X7jdKVVKgRpuGQ3uzrMlanhrpvFhHOiP1fTEK0JQsfAML2wBqNr6dE0
 BWjlZjwA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM3DF-00GFr5-VT; Mon, 02 Jun 2025 13:20:18 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 6/6] drm/xe/xelp: Add Wa_18022495364
Date: Mon,  2 Jun 2025 12:19:56 +0100
Message-ID: <20250602111956.14854-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/xe_lrc.c              | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 3 files changed, 28 insertions(+)

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
index d24d6a7fc5df..1003779fba53 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1024,6 +1024,26 @@ xelp_emit_timestamp_wa(struct xe_lrc *lrc,
 	return offset + num_dw;
 }
 
+static unsigned int
+xelp_invalidate_state_cache(struct xe_lrc *lrc,
+			    struct iosys_map *map,
+			    unsigned int offset)
+{
+	unsigned int num_dw;
+	u32 batch[3];
+	u32 *cmd = batch;
+
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+	*cmd++ = CS_DEBUG_MODE1(0).addr;
+	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
+
+	num_dw = cmd - batch;
+	xe_map_memcpy_to(lrc_to_xe(lrc), map, 0, batch, num_dw * sizeof(u32));
+	iosys_map_incr(map, num_dw * sizeof(u32));
+
+	return offset + num_dw;
+}
+
 static void xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	struct iosys_map map = lrc->bb_per_ctx_bo->vmap;
@@ -1035,6 +1055,10 @@ static void xe_lrc_setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	     hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
 		offset = xelp_emit_timestamp_wa(lrc, &map, offset);
 
+	if (XE_WA(lrc->gt, 18022495364) &&
+	    hwe->class == XE_ENGINE_CLASS_RENDER)
+		offset = xelp_invalidate_state_cache(lrc, &map, offset);
+
 	offset = xe_lrc_setup_utilization(lrc, &map, offset);
 
 	xe_map_write32(lrc_to_xe(lrc), &map, MI_BATCH_BUFFER_END);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9abc4b09ac38..c526f5226267 100644
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

