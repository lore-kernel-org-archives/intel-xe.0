Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8444FE9A03B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 04:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474E510E561;
	Wed, 18 Feb 2026 04:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPK0XYer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67910E546
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771389208; x=1802925208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jL383aqZPDBt9ciA/HSSZ1zZVhD7F4s5N4F+wJoBNVo=;
 b=LPK0XYerz9uD4struO2UYzX+W5f558BoenN/i17V5q6mrCPRsjHCfwrG
 rLRW2nIVzsmAXkRZJDDUUMbOGgPxMQL2cXPbvXPzkYRPSis5PtezYHrSF
 Czy+AJnmek+Xo9bWRar54IfB2/CaOQgv9EWzCCGFezHfdNIJvS5j87a42
 6M3j2+7ZGzz3j0eAxBmV2Cps/UI1FOfO+xd1QRWgixxFgPwyB5Zp4n4gk
 PtIkuEqAjgyM2Lv2uJrPceUOVgOArnzoxS1El1Dizsh2wboTyIZFgludd
 uUS7G3XpTtCgXPPncD2Znyk0eBqFdXr9Rg0xWczKeEreChk/mNijEFtSq g==;
X-CSE-ConnectionGUID: txcYZsdAR+aQ/ZnHFw2nlQ==
X-CSE-MsgGUID: 82d6nTAlR0KBTQu9x9rO2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76303542"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76303542"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:27 -0800
X-CSE-ConnectionGUID: L8u9R0LbSyi5h9ufbgdULQ==
X-CSE-MsgGUID: deBuHqizTGWujbc/Q+CDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237095378"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 2/3] drm/xe: Avoid unconditional VRAM reads in H2G path
Date: Tue, 17 Feb 2026 20:33:18 -0800
Message-Id: <20260218043319.809548-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218043319.809548-1-matthew.brost@intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

desc_read() issues an VRAM read which serializes the CPU and drains
posted writes on dGPU platforms. The H2G tracepoint evaluated its
arguments unconditionally, so even with tracing disabled the submission
path paid the full VRAM readf latency. Guard the tracepoint with
trace_xe_guc_ctb_h2g_enabled().

Adso move the descriptor status verification under CONFIG_DRM_XE_DEBUG.
This removes another unnecessary VRAM read in non-debug builfds.

This results in ~10× faster H2G submission and significantly reduces
lock contention across the driver.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ea07a27757d5..37842c93e0ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 full_len;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
-	u32 desc_status;
 
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
 	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
 
-	desc_status = desc_read(xe, h2g, status);
-	if (desc_status) {
-		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
-		goto corrupted;
-	}
-
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		u32 desc_tail = desc_read(xe, h2g, tail);
 		u32 desc_head = desc_read(xe, h2g, head);
+		u32 desc_status;
+
+		desc_status = desc_read(xe, h2g, status);
+		if (desc_status) {
+			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
+			goto corrupted;
+		}
 
 		if (tail != desc_tail) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
@@ -1023,8 +1023,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);
 
-	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
-			     desc_read(xe, h2g, head), h2g->info.tail);
+	/*
+	 * desc_read() performs an VRAM read which serializes the CPU and drains
+	 * posted writes on dGPU platforms. Tracepoints evaluate arguments even
+	 * when disabled, so guard the event to avoid adding µs-scale latency to
+	 * the fast H2G submission path when tracing is not active.
+	 */
+	if (trace_xe_guc_ctb_h2g_enabled())
+		trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
+				     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
 
-- 
2.34.1

