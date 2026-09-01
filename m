Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDB0C624D8
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 21:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73E210EF34;
	Tue,  1 Sep 2026 21:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRHw0vQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980CA10EF2F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788297133; x=1819833133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3ECJMvO92TOcykaLFTQN3sDiVR9JABcjKDv74+91AM=;
 b=gRHw0vQiVZU7aNsIzRFHYQFmHzNRJhuysXt9CHiCRWpuZdJlZCC9v2wI
 fcBBusWqM+o36FuxHWAn0j9JxW4KHm8iPG+fcUlb+uwyJGpclLp3889NO
 HuhVALbtPe/ALMoVH/jTLDWSMmtMl6wX9yKzI5XsyV/cvMTL4GN8jPC0F
 LKAKmRC5W/Vspp6NQRSw1DtPW5AIvuObcqAMliLBwAnvGey44fshZZSQu
 ty9NWMgtXUTFSjhJ1ZyjqCK3pUh0sDIX6PlsI17mUhs8Tclm8cfru7ejF
 4/XRVk2wy8tmXAfx2HwLtYZsh52hEcHhlWA3OVh0UB/wNJXBfvDz1RFf/ Q==;
X-CSE-ConnectionGUID: SUj8Yrk5TxGatfLrAgFLNg==
X-CSE-MsgGUID: cmajfa0WQUWDrNdF5bnEfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92562332"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92562332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
X-CSE-ConnectionGUID: rG8etYkxSqy2GCWCL1xgFA==
X-CSE-MsgGUID: LbovjLS2Svm7+3agAVaQrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="272988138"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 14:12:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v2 5/5] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
Date: Tue,  1 Sep 2026 14:12:10 -0700
Message-ID: <20260901211204.131972-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Convert any errors that can cause the CT to be declared as dead to
use the xe_log_err() helper. Errors that are escalated to the callers
are left for the caller to report with SIGID if needed.
While at it, update some of the error messages to make what went wrong
clearer.

v2: use different error codes for different errors, better messages (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 89 +++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dcd457f38b89..cf347f960166 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -30,6 +30,7 @@
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_guc_tlb_inval.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_page_reclaim.h"
 #include "xe_pm.h"
@@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 	return 0;
 
 err_out:
-	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
+	xe_log_err(gt, GUC, err, "Failed to enable CT\n");
 	CT_DEAD(ct, NULL, SETUP);
 
 	return err;
@@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 
-			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
-				  h2g->info.head, h2g->info.size);
+			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
+				   "CT: invalid head offset %u >= %u)\n",
+				   h2g->info.head, h2g->info.size);
 			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
 			return false;
 		}
@@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 	bad |= !ct->g2h_outstanding;
 
 	if (bad) {
-		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
-			  ct->ctbs.g2h.info.space, g2h_len,
-			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
-			  ct->ctbs.g2h.info.space + g2h_len,
-			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
-			  ct->g2h_outstanding);
+		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
+			   "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
+			   ct->ctbs.g2h.info.space, g2h_len,
+			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
+			   ct->ctbs.g2h.info.space + g2h_len,
+			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
+			   ct->g2h_outstanding);
 		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
 		return;
 	}
@@ -963,23 +966,26 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		desc_status = desc_read(xe, h2g, status);
 		if (desc_status) {
 			err = -EPROTO;
-			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
+			xe_log_err(gt, GUC, err,
+				   "CT write: non-zero status: %u\n", desc_status);
 			goto corrupted;
 		}
 
 		if (tail > h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 			err = -EPROTO;
-			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
-				  tail, h2g->info.size);
+			xe_log_err(gt, GUC, err,
+				   "CT write: tail out of range: %u vs %u\n",
+				   tail, h2g->info.size);
 			goto corrupted;
 		}
 
 		if (desc_head >= h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 			err = -EPIPE;
-			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
-				  desc_head, h2g->info.size);
+			xe_log_err(gt, GUC, err,
+				   "CT write: invalid head offset %u >= %u)\n",
+				   desc_head, h2g->info.size);
 			goto corrupted;
 		}
 	}
@@ -1224,7 +1230,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 
 broken:
-	xe_gt_err(gt, "No forward process on H2G, reset required\n");
+	xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
 	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
 
 	return -EDEADLK;
@@ -1562,11 +1568,12 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 	struct xe_gt *gt = ct_to_gt(ct);
 
 	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
-		xe_gt_err(gt, "GuC Crash dump notification\n");
+		xe_log_err(gt, GUC, -EHOSTDOWN, "GuC Crash dump notification\n");
 	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
-		xe_gt_err(gt, "GuC Exception notification\n");
+		xe_log_err(gt, GUC, -EHOSTDOWN, "GuC Exception notification\n");
 	else
-		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+		xe_log_err(gt, GUC, -EHOSTDOWN,
+			   "Unknown GuC crash notification: 0x%04X\n", action);
 
 	CT_DEAD(ct, NULL, CRASH);
 
@@ -1599,14 +1606,16 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 			err = -EBADE;
-			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
-				  fence,
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
+			xe_log_err(gt, GUC, err,
+				   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
+				   fence,
+				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
+				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
 		} else {
 			err = -EPROTO;
-			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
-				  type, fence);
+			xe_log_err(gt, GUC, err,
+				   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
+				    type, fence);
 		}
 
 		fast_req_report(ct, fence);
@@ -1683,8 +1692,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
-			  origin);
+		xe_log_err(gt, GUC, -EBADMSG, "Invalid G2H origin=%u, reset required\n", origin);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
 
 		return -EPROTO;
@@ -1702,8 +1710,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
-			  type);
+		xe_log_err(gt, GUC, -EOPNOTSUPP,
+			   "Unexpected G2H message type %u, reset required\n",
+			   type);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
 
 		ret = -EOPNOTSUPP;
@@ -1801,8 +1810,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
-			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
+		xe_log_err(gt, GUC, ret, "G2H action %#04x failed len %u msg %*ph\n",
+			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
 		CT_DEAD(ct, NULL, PROCESS_FAILED);
 	}
 
@@ -1852,7 +1861,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 		if (desc_status) {
 			err = -EIO;
-			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
+			xe_log_err(gt, GUC, err, "CT read: non-zero status: %u\n", desc_status);
 			goto corrupted;
 		}
 	}
@@ -1884,16 +1893,16 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		if (g2h->info.head > g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 			err = -ERANGE;
-			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
-				  g2h->info.head, g2h->info.size);
+			xe_log_err(gt, GUC, err, "CT read: head out of range: %u vs %u\n",
+				   g2h->info.head, g2h->info.size);
 			goto corrupted;
 		}
 
 		if (desc_tail >= g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 			err = -ERANGE;
-			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
-				  desc_tail, g2h->info.size);
+			xe_log_err(gt, GUC, err, "CT read: invalid tail offset %u >= %u)\n",
+				   desc_tail, g2h->info.size);
 			goto corrupted;
 		}
 	}
@@ -1913,8 +1922,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
 		err = -EBADMSG;
-		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			  avail, len);
+		xe_log_err(gt, GUC, err,
+			   "G2H channel broken on read, avail=%d, len=%d, reset required\n",
+			   avail, len);
 		goto corrupted;
 	}
 
@@ -1996,8 +2006,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
-			  action, ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed\n", action);
 		CT_DEAD(ct, NULL, FAST_G2H);
 	}
 }
@@ -2116,7 +2125,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
+			xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed, forcing GT reset\n");
 			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
-- 
2.55.0

