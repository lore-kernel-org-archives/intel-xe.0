Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E41CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE6910E60E;
	Mon, 12 Oct 2026 23:29:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61610E60E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791847768; x=1823383768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zm84BpFAhpeWar4A2ovxOT8fuz5rni8qOpJll83XMo0=;
 b=DONLDY6oRz2AAuJQHDplnVdTloDERETS5uLmBZqhWZ15Pm+Idd53U1Hq
 t8oV7tyhamUQYEpgB+bvqCM4+7vsDhw5giYbuEifAas7xf4xoAIM5VZv2
 L9PLnezUAT45ZHHFFVHpzxlpxSrCLygHGz0XwkWbxONl6aMYGUi+jcGBE
 3sfR/P+h2UUv9lhwDhRK8cJHwwDxEViJ5XqOEcKl6PvoijJIW3KEbgVQL
 mO109E9rJ1CjZbAadFE3XSM+GzzhxwHG0tvpwd5Er1H2ZhM7VC8gvXE0e
 gy0gQ0pb9MgMdO7lhZ0sosgqrgXFPkNugAc9M+9NuYIzl6z0BaM02q+H6 w==;
X-CSE-ConnectionGUID: Xt5Id/Y5SrqCBkeWbLEcDQ==
X-CSE-MsgGUID: AKfz0mEKTPW1b/83m8R1EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="450717"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="450717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:17 -0700
X-CSE-ConnectionGUID: pHYnIfDkRdm/w58CyVFzaw==
X-CSE-MsgGUID: jXqf1tMpR1ajsRBs9BmwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1337856"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, aravind.iddamsetty@intel.com,
 mallesh.koujalagi@intel.com, alan.previn.teres.alexis@intel.com,
 julia.filipchuk@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v7 7/7] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
Date: Mon, 12 Oct 2026 16:29:15 -0700
Message-ID: <20261012232907.83649-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
v2: Use variable err for EPIPE in ct_corrupted
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 85 ++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3e23a4396b39..d9999d362dbb 100644
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
@@ -100,10 +101,12 @@
  *
  * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail out of
  *   range, or a declared message length larger than the data actually available.
- * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is not the
- *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences aren't
- *   tracked, so there is no caller to report to and the failure is escalated to a
- *   reset instead.
+ * ``-EBADMSG``: the G2H origin field is not the GuC.
+ * ``-EINVAL``: a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences
+ *   aren't tracked, so there is no caller to report to and the failure is
+ *   escalated to a reset instead.
+ * ``-EPROTO``: a FAST_REQUEST H2G got a reply that is neither a rejection nor
+ *   a valid response type.
  * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
  *
  * Reported but not returned
@@ -761,7 +764,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 	return 0;
 
 err_out:
-	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
+	xe_log_err(gt, GUC, err, "CT: Failed to enable\n");
 	CT_DEAD(ct, NULL, SETUP);
 
 	return err;
@@ -885,8 +888,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
 
-			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
-				  h2g->info.head, h2g->info.size);
+			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
+				   "CT: invalid head offset %u >= %u)\n",
+				   h2g->info.head, h2g->info.size);
 			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
 			return false;
 		}
@@ -955,12 +959,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 	bad |= !ct->g2h_outstanding;
 
 	if (bad) {
-		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
-			  ct->ctbs.g2h.info.space, g2h_len,
-			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
-			  ct->ctbs.g2h.info.space + g2h_len,
-			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
-			  ct->g2h_outstanding);
+		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
+			   "CT: Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
+			   ct->ctbs.g2h.info.space, g2h_len,
+			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
+			   ct->ctbs.g2h.info.space + g2h_len,
+			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
+			   ct->g2h_outstanding);
 		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
 		return;
 	}
@@ -1023,15 +1028,16 @@ static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
 {
 	struct va_format vaf;
 	va_list va_args;
+	int err = -EPIPE;
 
 	va_start(va_args, msg);
 	vaf.fmt = msg;
 	vaf.va  = &va_args;
-	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
+	xe_log_err(ct_to_gt(ct), GUC, err, "CT: %pV", &vaf);
 	va_end(va_args);
 
 	process_ct_dead(ct, ctb, reason_code);
-	return -EPIPE;
+	return err;
 }
 
 #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
@@ -1313,7 +1319,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 
 broken:
-	xe_gt_err(gt, "No forward progress on H2G\n");
+	xe_log_err(gt, GUC, -EDEADLK, "CT: No forward progress on H2G\n");
 	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
 
 	return -EDEADLK;
@@ -1665,14 +1671,14 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static void guc_handle_crash_dump_msg(struct xe_guc_ct *ct)
 {
-	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
+	xe_log_err(ct_to_gt(ct), GUC, -EHOSTDOWN, "Crash dump notification\n");
 	CT_DEAD(ct, NULL, CRASH);
 	kick_reset(ct);
 }
 
 static void guc_handle_exception_msg(struct xe_guc_ct *ct)
 {
-	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
+	xe_log_err(ct_to_gt(ct), GUC, -EHOSTDOWN, "Exception notification\n");
 	CT_DEAD(ct, NULL, CRASH);
 	kick_reset(ct);
 }
@@ -1697,14 +1703,21 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	 * failure to trigger a reset.
 	 */
 	if (fence & CT_SEQNO_UNTRACKED) {
-		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
-			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
-				  fence,
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
-				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
-		else
-			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
-				  type, fence);
+		int err;
+
+		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
+			err = -EINVAL;
+			xe_log_err(gt, GUC, err,
+				   "CT: FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
+				   fence,
+				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
+				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
+		} else {
+			err = -EPROTO;
+			xe_log_err(gt, GUC, err,
+				   "CT: unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
+				    type, fence);
+		}
 
 		fast_req_report(ct, fence);
 
@@ -1714,7 +1727,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
-		return -EPROTO;
+		return err;
 	}
 
 	/* don't erase as we still expect a final response with the same fence */
@@ -1780,10 +1793,12 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-		xe_gt_err(gt, "Invalid G2H origin=%u\n", origin);
+		int err = -EBADMSG;
+
+		xe_log_err(gt, GUC, err, "CT: Invalid G2H origin=%u\n", origin);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
 
-		return -EPROTO;
+		return err;
 	}
 
 	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
@@ -1798,7 +1813,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-		xe_gt_err(gt, "Unexpected G2H message type=%u\n", type);
+		xe_log_err(gt, GUC, -EOPNOTSUPP, "CT: Unexpected G2H message type %u\n", type);
 		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
 
 		ret = -EOPNOTSUPP;
@@ -1898,8 +1913,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
-			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
+		xe_log_err(gt, GUC, ret, "CT: G2H action %#04x failed len %u msg %*ph\n",
+			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
 		CT_DEAD(ct, NULL, PROCESS_FAILED);
 	}
 
@@ -2082,8 +2097,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
-			  action, ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "CT: G2H action 0x%04x failed\n", action);
 		CT_DEAD(ct, NULL, FAST_G2H);
 	}
 }
@@ -2202,8 +2216,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
-				  ERR_PTR(ret));
+			xe_log_err(ct_to_gt(ct), GUC, ret, "CT: dequeue failed, forcing GT reset\n");
 			CT_DEAD(ct, NULL, G2H_RECV);
 			kick_reset(ct);
 		}
-- 
2.55.0

