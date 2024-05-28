Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A88FC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 10:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05021898F5;
	Tue, 28 May 2024 10:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp9jcjnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3348898F5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716892176; x=1748428176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cB0ppp6B8wZr2Vyr5iajlqn8SfiWaMyKe2j/VjD8RF0=;
 b=Yp9jcjnR85pskuILN1NzpTrk4pMQH0DnfyzY3Wpg8xpA8HRuVsdc+x20
 USZlrAAM+VkSlchvi3RL21FAQW0+bhiafeIZKFbgfQoKruiwMWBVrg+XH
 NVsK98/bCNykw8in2kJ7awNkCCeJXnP7Yi/LVVBK7oixNA7OlFk4F3aik
 Eg3F+yLI6pUxMnlAJrnC19bM0XlB1MyhdaqrqwzHNmXrTGbwGgjA0PCze
 XCCGGxiQhMK/wBSfqmlY/jlBSKsWQUrvl7T0gQ3sALqFoDtjVVvanwwbB
 B2uOC/IOBZqdZt/lkx5JUhGJWPIpr+EDwuBIJ2briFvEF/hncEOMumA3O A==;
X-CSE-ConnectionGUID: qxtNm2ZGQE2dpHnBvfMTaw==
X-CSE-MsgGUID: 3NOEd29VRbCqkx/ds6nFmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17061957"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="17061957"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:29:35 -0700
X-CSE-ConnectionGUID: 8ucV7b/VTuyCcGQnzuAqYA==
X-CSE-MsgGUID: jJacFG/oR32EyHGohr++Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39559256"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:29:33 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe: Add engine name to the engine reset and cat-err log
Date: Tue, 28 May 2024 12:14:45 +0200
Message-ID: <20240528101445.27688-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add engine name to the engine reset and cat error log
which should be useful while debugging.

v2: Add logical mask and engine class(Matt)
    Use xe_gt_{info|dbg} (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 72aa2f91832c..e22bd6b09a74 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1681,6 +1681,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
@@ -1694,7 +1695,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
+	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
+		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	/* FIXME: Do error capture, most likely async */
 
@@ -1716,6 +1718,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
@@ -1729,7 +1732,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
+	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
+		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+
 	trace_xe_exec_queue_memory_cat_error(q);
 
 	/* Treat the same as engine reset */
-- 
2.42.0

