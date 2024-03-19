Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3310AC54E68
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 18:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD81910E8B5;
	Tue, 19 Mar 2024 18:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I25JJ+iH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078B110E8B5
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710873718; x=1742409718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=13RIb4/G0ArZGyIf22YPVdNw9hC5vSkwtN3ujk4teIU=;
 b=I25JJ+iH/9Eww4c2PdARdn8tfDjshEVopImzbrZ5OnTsXnnucokvRzZn
 gOqrWSEBMyK/yXK2BQE/X4Z7KfJD9pVP/LPQNgHJI88uNMTCokTuEEvQ3
 sJIz/Sy3buaGCmXmqm0r+367HvtUkEHkoSi+0mda5SRweOvoQmlDRmbe/
 fGgdAfgNmTAvKNBwD1Jw7eVfcB+Dpi3XsSJ84Op9vKqz7HEVUSsPHIFro
 QcKROOwQNgoTI+0/SynyrcvdijpftHm/m4IXUrPDJ1omCYMnTLZf2Wdmi
 4QGpTazWvRGsvIPh2j7Sh10J/2NnJsscg0TARD8e9qEwrk4IBhS0HYtPX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6374046"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="6374046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 11:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14299819"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 11:41:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	stuart.summers@intel.com
Subject: [PATCH] drm/xe: Separate out sched/deregister_done handling
Date: Tue, 19 Mar 2024 11:41:53 -0700
Message-ID: <20240319184153.16667-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Abstract out the core part of sched_done and deregister_done handlers
to separate functions to decouple them from any protocol error handling
part and make them more readable.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 64 +++++++++++++++++-------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 82c955a2a15c..4a2b8e6b81b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1574,28 +1574,8 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
 }
 
-int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
 {
-	struct xe_device *xe = guc_to_xe(guc);
-	struct xe_exec_queue *q;
-	u32 guc_id = msg[0];
-
-	if (unlikely(len < 2)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
-		return -EPROTO;
-	}
-
-	q = g2h_exec_queue_lookup(guc, guc_id);
-	if (unlikely(!q))
-		return -EPROTO;
-
-	if (unlikely(!exec_queue_pending_enable(q) &&
-		     !exec_queue_pending_disable(q))) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
-		return -EPROTO;
-	}
-
 	trace_xe_exec_queue_scheduling_done(q);
 
 	if (exec_queue_pending_enable(q)) {
@@ -1615,17 +1595,15 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 			deregister_exec_queue(guc, q);
 		}
 	}
-
-	return 0;
 }
 
-int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
-	if (unlikely(len < 1)) {
+	if (unlikely(len < 2)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
 		return -EPROTO;
 	}
@@ -1634,13 +1612,20 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
-	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
+	if (unlikely(!exec_queue_pending_enable(q) &&
+		     !exec_queue_pending_disable(q))) {
 		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
 			atomic_read(&q->guc->state));
 		return -EPROTO;
 	}
 
+	handle_sched_done(guc, q);
+
+	return 0;
+}
+
+static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
+{
 	trace_xe_exec_queue_deregister_done(q);
 
 	clear_exec_queue_registered(q);
@@ -1649,6 +1634,31 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_fini(guc, q);
+}
+
+int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_exec_queue *q;
+	u32 guc_id = msg[0];
+
+	if (unlikely(len < 1)) {
+		drm_err(&xe->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
+	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
+		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
+			atomic_read(&q->guc->state));
+		return -EPROTO;
+	}
+
+	handle_deregister_done(guc, q);
 
 	return 0;
 }
-- 
2.43.0

