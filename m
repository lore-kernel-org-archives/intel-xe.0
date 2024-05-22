Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2322C25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665110E242;
	Wed, 22 May 2024 10:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsnTNs9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295C10F49C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373327; x=1747909327;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0zwPauFKtJUsviWBWTXrXatbbV42FoC3G8IuN6GAqt4=;
 b=YsnTNs9fFDPqX5IMocdyizViRYiZNzFfJsMZKCIBB1nAPb6xDCdCecob
 QRCxe5gFB+rBHP/3A1Nfkr+owkDUXepJ/0w9cckajujpHWXrDaUIzpkCN
 Xj+ImocuqZhzN2pW3P0pj10CuX2M/pakot6lccWqGggQw9k4KfmdG08y9
 xNOtfvyQihsd3efyItx5f3XujxsNqWIXtXoIovG/i19Qpr2I1VtOpsiX0
 oXds0hQrJcQFavwHiEhHM42D2i7nE/a2kOM4VfY3bbVMh8OmelZLJqAC8
 UZNYLkj1Z8229u/v7S4fe0EaDWAJM4O2Ph1two90r57xGgFHfUL8QZJAg Q==;
X-CSE-ConnectionGUID: WvLAr6m1TxmywqhuBgb5HQ==
X-CSE-MsgGUID: 20F1Q6KXTZO0z7x6p32tKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562682"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562682"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:06 -0700
X-CSE-ConnectionGUID: SPo7+4WhQDa9lU85wCZ+Rg==
X-CSE-MsgGUID: iep//5YDQmKQtC7aIPAb4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195232"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 03/18] drm/xe/ggtt: use drm_dev_enter to mark device section
Date: Wed, 22 May 2024 11:21:46 +0100
Message-ID: <20240522102143.128069-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

v2: (Andrzej)
  - Avoid some duplication by tracking the bound status and checking
    that instead.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0d541f55b4fc..17e5066763db 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -8,6 +8,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/i915_drm.h>
 
@@ -433,18 +434,29 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
-	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+	if (bound)
+		xe_pm_runtime_get_noresume(xe);
 
 	mutex_lock(&ggtt->lock);
-	xe_ggtt_clear(ggtt, node->start, node->size);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->start, node->size);
 	drm_mm_remove_node(node);
 	node->size = 0;
 	mutex_unlock(&ggtt->lock);
 
+	if (!bound)
+		return;
+
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
-- 
2.45.1

