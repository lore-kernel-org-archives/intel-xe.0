Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5B4C25B4F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC793112C04;
	Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGuiR/oW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E260112BFD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392950; x=1745928950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yBe62V+Qjiw8383W0bZaPkiJNNcvEEF5neLE5/kwQiI=;
 b=dGuiR/oWlNl3xqDLMMZNcZHomTyNKYIoc+ePhczoycLP0phhekrFWhp5
 LTsmyKgOlBoaiLAFFReIufuvrx0NDDwUPqEvZJ08cHm58JX1rbaydpTNF
 HDZ4FpO6PYzviQs8EubL84hevpqFL1DUwhTobYkKLQxrSEMiVCjzimwOD
 W7+CrK5QlmC7f6F6M6wqmI0RAXW72SuZtQ77iqGhNqf8CbGcpyb8K+aD3
 gkVZQFkNbKBeUl0u01zoIY1GlVih+Bz6gIvnT0HBGdJkvu9KbvDV5A7oI
 Um5+j+ANLXX7d7Z0cmR8QCqe9C+UNvmKyNR2zxb4SRlePoYVU5BCYOafx A==;
X-CSE-ConnectionGUID: M8yOIT1ERI+vIRZyxlq2lA==
X-CSE-MsgGUID: 7qg7zMRDSKOWASBOSZwoyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878380"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878380"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:50 -0700
X-CSE-ConnectionGUID: X1P3p8rLTb+T+oNTvzpBZA==
X-CSE-MsgGUID: J82kBz8fQRKOvnB6HxIEVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303383"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/8] drm/xe/ggtt: use drm_dev_enter to mark device section
Date: Mon, 29 Apr 2024 13:14:39 +0100
Message-ID: <20240429121436.33013-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
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

Device can be hotunplugged before we start destroying gem objects. In
such a case don't touch the GGTT entries, trigger any invalidations or
mess around with rpm.  This should already be taken care of when
removing the device, we just need to take care of dealing with the
software state, like removing the mm node.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0d541f55b4fc..7c05d3f7e1a4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -8,6 +8,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/i915_drm.h>
 
@@ -433,18 +434,27 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
-
-	mutex_lock(&ggtt->lock);
-	xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int idx;
+
+	if (drm_dev_enter(&xe->drm, &idx)) {
+		xe_pm_runtime_get_noresume(xe);
+		mutex_lock(&ggtt->lock);
+		xe_ggtt_clear(ggtt, node->start, node->size);
+		drm_mm_remove_node(node);
+		node->size = 0;
+		mutex_unlock(&ggtt->lock);
+
+		if (invalidate)
+			xe_ggtt_invalidate(ggtt);
+		xe_pm_runtime_put(xe);
+		drm_dev_exit(idx);
+	} else {
+		mutex_lock(&ggtt->lock);
+		drm_mm_remove_node(node);
+		node->size = 0;
+		mutex_unlock(&ggtt->lock);
+	}
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
-- 
2.44.0

