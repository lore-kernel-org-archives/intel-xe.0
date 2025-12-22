Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7E3E69165
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 20:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1810E249;
	Mon, 22 Dec 2025 20:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C81ybY/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5D610E249
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766434799; x=1797970799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Nj/XeKSIVja4L3c1YYQX9/HSP8glvoBcq8cwks1P+Q=;
 b=C81ybY/0e+19SecYQqQmHiNsov7aVvFbOaFWZL3GWZbCFYO9CGn9uaRL
 ez9ls7srlBbhvOUFyNii54BiVpZbDPdgwAHAmJ8OPKtEcWz8wnNRQQr/Z
 3Y0KrTgjdGIkVG+VuPjfO94WkFTILOJB7KZLQ+9qrIE4wLVCBD1TTgicb
 8wi+pLgzx0ib9QhKxN5nvjY0y3hev+EO+eY58BJD0vgW2HOHGxMBCxtAZ
 LG2ZdhljZRgTX2xxSD4C/VJTkfr/7iJG++mJ86dcIyjqY53+fZBp2Mat8
 EwjX+e2EAIyhWhV/MfuPRpd7ksMASIFU2jr3EqvY6RQV5OyXSsqpy8Bnn g==;
X-CSE-ConnectionGUID: AgsNoonRQPu/2PkUAuWr0Q==
X-CSE-MsgGUID: cEuidHuiS8CBlisSPc4fcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68335793"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="68335793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 12:19:58 -0800
X-CSE-ConnectionGUID: htGK7iGMR/KorFyPaO46/g==
X-CSE-MsgGUID: d0ZMYPhuRz2U1bfuul/Kxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="200100905"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 12:19:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v3 1/2] drm/xe/guc: READ/WRITE_ONCE g2h_fence->done
Date: Mon, 22 Dec 2025 20:19:59 +0000
Message-ID: <20251222201957.63245-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222201957.63245-4-jonathan.cavitt@intel.com>
References: <20251222201957.63245-4-jonathan.cavitt@intel.com>
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

Use READ_ONCE and WRITE_ONCE when operating on g2h_fence->done
to prevent the compiler from ignoring important modifications
to its value.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c3df9b3f1b4d..f2148a8bf208 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
 {
 	g2h_fence->cancel = true;
 	g2h_fence->fail = true;
-	g2h_fence->done = true;
+
+	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
+	WRITE_ONCE(g2h_fence->done, true);
 }
 
 static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
@@ -1294,10 +1296,13 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return ret;
 	}
 
-	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
+	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
+	 * and g2h_fence_cancel.
+	 */
+	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
-		if (g2h_fence.done) {
+		if (READ_ONCE(g2h_fence.done)) {
 			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
 				   g2h_fence.seqno, action[0]);
 			ret = 1;
@@ -1498,7 +1503,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
-	g2h_fence->done = true;
+	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
+	WRITE_ONCE(g2h_fence->done, true);
 	smp_mb();
 
 	wake_up_all(&ct->g2h_fence_wq);
-- 
2.43.0

