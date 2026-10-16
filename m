Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA40CCA46D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34477112619;
	Fri, 16 Oct 2026 07:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3B711261D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135135; x=1823671135;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p/mGcePOWVNnPDSC0v491MbH5S7C1YcMGEa5abTPu+k=;
 b=lweZppnrRdIKb00B+6gGp4XEiLKBysfXMYXvuREu4vXZzmOW1c6CHLXX
 /5AK2O7CcQ2Jz4OtsDWyEFOdOp31xjZ8m4Mpfdh0Z0AZxm3tAVs8HoKq/
 rGWZdFzId+2eZl7174KX8AgEmpztth75VBKst/H2En17ljYvKz7no4sLv
 dO0bdopSfdpMf8UoEBINuU2sCNJ4JwngEFZupDA5GRDcL1AjKNA+CJ1aa
 D16yNJpDndazIKwsA06T8W9mUX03ZuYTQDm22NABNUaL66whVI3gf/BOr
 x/uHtHlxq2v4Lh1oWd1W5iestuHS1Gg1bM4Er6OrQF20hfeiViTZ/kStz A==;
X-CSE-ConnectionGUID: HPNinZDYTveed1adqvDjbQ==
X-CSE-MsgGUID: CuPlH3cnRDWNo1u3uIa0qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813646"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813646"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:49 -0700
X-CSE-ConnectionGUID: dPpem4h1S4G7YmRHg6oF1g==
X-CSE-MsgGUID: lX7BMOqxQCG6vfSNWv4tOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787268"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:48 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 08/18] drm/xe/ggtt: Skip GGTT updates on a wedged device
Date: Fri, 16 Oct 2026 12:48:18 +0530
Message-ID: <20261016071832.222574-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

ggtt_node_remove() checks whether the GGTT is online, but does not
check whether the device is wedged. It can still clear entries and
request invalidation after wedge isolation.

Keep GGTT hardware cleanup inside drm_dev_enter()/drm_dev_exit() and
check the wedge state there. Isolation can then drain cleanup admitted
before the wedge. Node removal and drm_mm bookkeeping still run when
hardware access is skipped.

Keep the existing GGTT cleanup behaviour during PCI error recovery.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 63e8bf193605..25880e896778 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
@@ -472,13 +473,13 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-static void ggtt_node_remove(struct xe_ggtt_node *node)
+static void __ggtt_node_remove(struct xe_ggtt_node *node, bool clear_hw)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
 	bool bound;
 
 	mutex_lock(&ggtt->lock);
-	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
+	bound = clear_hw && (ggtt->flags & XE_GGTT_FLAGS_ONLINE);
 	if (bound)
 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
@@ -493,6 +494,27 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 	ggtt_node_fini(node);
 }
 
+static void ggtt_node_remove(struct xe_ggtt_node *node)
+{
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+	int idx;
+
+	/*
+	 * GGTT updates write page table entries through the BAR and request a
+	 * TLB invalidation. Skip them after unplug, where the BAR is gone.
+	 * Keep them during PCI error recovery so a recovered device does not
+	 * inherit stale GGTT entries.
+	 */
+	if (!drm_dev_enter(&xe->drm, &idx)) {
+		__ggtt_node_remove(node, false);
+		return;
+	}
+
+	__ggtt_node_remove(node, !xe_device_wedged(xe));
+
+	drm_dev_exit(idx);
+}
+
 static void ggtt_node_remove_work_func(struct work_struct *work)
 {
 	struct xe_ggtt_node *node = container_of(work, typeof(*node),
-- 
2.43.0

