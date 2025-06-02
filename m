Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0746CC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD2510E50F;
	Mon,  2 Jun 2025 11:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qeH8cF0D";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF6810E4F6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jdquqN/qcXWiigBYrkDaCzVzlSD/sQ01ld9ctowva+M=; b=qeH8cF0D+pRUpwk+vSf9+C9TLP
 ViGdoGFOpkswPEyRUDDjdJqDWCVsZ8+kocqR12AN+5AZNsJFcl1Qmn9GR+EnPNPsmiuh/9x5GyLjf
 8NhVZ4UXn/uvDNOz4B8AGZF14xTCE/PTMw43TEOI/uuOvClskaxDdCB+jRTn+vgFu/AOGaUx5wkug
 DjcxJ/bvQKz8XGEDHGcZw8l3bY6T4l1KMobUiZZLZb8GhAP67D6CgptUWG7CWKSDPnrCOc4i5lWw4
 dau/ihf4TyHTVXzHqm163NXWB68fps1ZuTTOgvdosPKJEc6KQ2hlN6ETSvDGkFayDY5uoskq7sa+u
 2wlX2SFw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM3DD-00GFqj-1i; Mon, 02 Jun 2025 13:20:15 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/6] drm/xe: Use iosys_map helpers for WA BB emission
Date: Mon,  2 Jun 2025 12:19:52 +0100
Message-ID: <20250602111956.14854-3-tvrtko.ursulin@igalia.com>
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

To properly support discrete GPUs on all platforms it is required to use
the iosys_map helpers.

To fix we emit the WA BB into an on stack buffer and copy it over using
xe_map_memcpy_to().

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e81ee6c98a8a..ca7ffc7bbdc8 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -943,9 +943,10 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define CONTEXT_ACTIVE 1ULL
 static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 {
-	u32 *cmd;
-
-	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	struct xe_device *xe = lrc_to_xe(lrc);
+	unsigned int num_dw;
+	u32 batch[13];
+	u32 *cmd = batch;
 
 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
 	*cmd++ = ENGINE_ID(0).addr;
@@ -957,7 +958,7 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 	*cmd++ = 0;
 	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
 
-	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
+	if (xe->info.has_64bit_timestamp) {
 		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
 		*cmd++ = 0;
@@ -966,9 +967,12 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 
 	*cmd++ = MI_BATCH_BUFFER_END;
 
+	num_dw = cmd - batch;
+	xe_map_memcpy_to(xe, &lrc->bb_per_ctx_bo->vmap, 0, batch,
+			 num_dw * sizeof(u32));
+
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
-
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
-- 
2.48.0

