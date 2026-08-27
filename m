Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3DFC61DBE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 00:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E6310EB71;
	Thu, 27 Aug 2026 00:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnQFvi3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAE510EB71
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787790496; x=1819326496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YqBvxZn6RtigwGRwpGyRIi6pBvQ7cp2UX6B5N+b5D5o=;
 b=jnQFvi3fWISxPik4cgS3Kgez3yWFAzTO2x5zbe2iahxDyzT9sXm3ZIUW
 mRYv++CK3O4DvTnWT7nXZOTH1ZPbQn3keQywsH8AIm4Q7IODuJdysu79v
 aMPZPkMiaf3/n1T1+y1GzCdgTeJv/uwUW2QFcBTWhgdVFiV195paofjhh
 BB5p0KtkP43olXi3FJZbs9yd6vRElOKDvHalwDqVZwh8TziKTD2LTlgqe
 uh8e5cfJszEJM4ip+zwvo21ncLbQS532VVawb+RfoUWpVtRiiV/TLfCMq
 17RnY5RmNtkdYme5M9zW4AWokzio3iA5X8jtDlJhthWO2Ofr1hxPmkDE6 w==;
X-CSE-ConnectionGUID: teO541yETs2QoeHPh6P4dA==
X-CSE-MsgGUID: CADq4FSGRK+YGTC/KE3L2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98620378"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="98620378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:28:16 -0700
X-CSE-ConnectionGUID: +wTa/3VTQVWY+IdYY/t/LQ==
X-CSE-MsgGUID: TAv6aSvtTZefZGZObMkLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265126131"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 17:28:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Report errors that cause a CT shutdown using
 SIGID
Date: Thu, 27 Aug 2026 00:28:01 +0000
Message-ID: <20260827002801.837731-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
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

Convert any errors that can cause the CT to be declared as dead to
use the xe_log_err() helper. Errors that are escalated to the callers
are left for the caller to report with SIGID if needed.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 91 +++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..4efaf2d24c3e 100644
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
+			xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
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
+		xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
+			   "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
+			   ct->ctbs.g2h.info.space, g2h_len,
+			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
+			   ct->ctbs.g2h.info.space + g2h_len,
+			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
+			   ct->g2h_outstanding);
 		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
 		return;
 	}
@@ -961,21 +964,24 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 		desc_status = desc_read(xe, h2g, status);
 		if (desc_status) {
-			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
+			xe_log_err(gt, GUC, -EPROTO,
+				   "CT write: non-zero status: %u\n", desc_status);
 			goto corrupted;
 		}
 
 		if (tail > h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
-				  tail, h2g->info.size);
+			xe_log_err(gt, GUC, -EPROTO,
+				   "CT write: tail out of range: %u vs %u\n",
+				   tail, h2g->info.size);
 			goto corrupted;
 		}
 
 		if (desc_head >= h2g->info.size) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
-				  desc_head, h2g->info.size);
+			xe_log_err(gt, GUC, -EPROTO,
+				   "CT write: invalid head offset %u >= %u)\n",
+				   desc_head, h2g->info.size);
 			goto corrupted;
 		}
 	}
@@ -1220,7 +1226,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 
 broken:
-	xe_gt_err(gt, "No forward process on H2G, reset required\n");
+	xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
 	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
 
 	return -EDEADLK;
@@ -1558,11 +1564,11 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 	struct xe_gt *gt = ct_to_gt(ct);
 
 	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
-		xe_gt_err(gt, "GuC Crash dump notification\n");
+		xe_log_err(gt, GUC, -EPROTO, "GuC Crash dump notification\n");
 	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
-		xe_gt_err(gt, "GuC Exception notification\n");
+		xe_log_err(gt, GUC, -EPROTO, "GuC Exception notification\n");
 	else
-		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
+		xe_log_err(gt, GUC, -EPROTO, "Unknown GuC crash notification: 0x%04X\n", action);
 
 	CT_DEAD(ct, NULL, CRASH);
 
@@ -1592,13 +1598,15 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	 */
 	if (fence & CT_SEQNO_UNTRACKED) {
 		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
-			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
-				  fence,
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
+			xe_log_err(gt, GUC, -EPROTO,
+				   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
+				   fence,
+				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
+				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
 		else
-			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
-				  type, fence);
+			xe_log_err(gt, GUC, -EPROTO,
+				   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
+				    type, fence);
 
 		fast_req_report(ct, fence);
 
@@ -1674,8 +1682,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
-			  origin);
+		xe_log_err(gt, GUC, -EPROTO,
+			   "G2H channel broken on read, origin=%u, reset required\n",
+			   origin);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
 
 		return -EPROTO;
@@ -1693,8 +1702,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
-			  type);
+		xe_log_err(gt, GUC, -EOPNOTSUPP,
+			   "G2H channel broken on read, type=%u, reset required\n",
+			   type);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
 
 		ret = -EOPNOTSUPP;
@@ -1792,8 +1802,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
-			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
+		xe_log_err(gt, GUC, ret, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
+			   action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
 		CT_DEAD(ct, NULL, PROCESS_FAILED);
 	}
 
@@ -1840,7 +1850,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		}
 
 		if (desc_status) {
-			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
+			xe_log_err(gt, GUC, -EIO, "CT read: non-zero status: %u\n", desc_status);
 			goto corrupted;
 		}
 	}
@@ -1871,15 +1881,15 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 		if (g2h->info.head > g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
-				  g2h->info.head, g2h->info.size);
+			xe_log_err(gt, GUC, -EIO, "CT read: head out of range: %u vs %u\n",
+				   g2h->info.head, g2h->info.size);
 			goto corrupted;
 		}
 
 		if (desc_tail >= g2h->info.size) {
 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
-			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
-				  desc_tail, g2h->info.size);
+			xe_log_err(gt, GUC, -EIO, "CT read: invalid tail offset %u >= %u)\n",
+				   desc_tail, g2h->info.size);
 			goto corrupted;
 		}
 	}
@@ -1898,8 +1908,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
-		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			  avail, len);
+		xe_log_err(gt, GUC, -EIO,
+			   "G2H channel broken on read, avail=%d, len=%d, reset required\n",
+			   avail, len);
 		goto corrupted;
 	}
 
@@ -1981,8 +1992,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
-			  action, ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed (%pe)\n",
+			   action, ERR_PTR(ret));
 		CT_DEAD(ct, NULL, FAST_G2H);
 	}
 }
@@ -2080,7 +2091,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
+			xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed: %d\n", ret);
 			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
-- 
2.53.0

