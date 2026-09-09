Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCF4C79FB9
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58E710F120;
	Wed,  9 Sep 2026 12:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apcAaNDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D5C10F12B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957722; x=1820493722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kk7SdUrNSWhhMDPjTejS/LFJWSJNplUHXCatLSkbjqk=;
 b=apcAaNDk6dJhj1l3HB8Lhw4KLoSie0KRSimV1Us3iNyeVGyaDL1CY84w
 ENQCw91cKSl+9+WAbPVFNjnrK+2NOSxVpJCUWvtMS8vh5Rw61BgcXYZ/D
 ALTHy3QVH1FFSSAHKzaQQ+iYCv+uyWqZs6Aqj/hqF2Ef6vX1lNgpMYxRX
 oIGO03FxADoMGo6B1g6SnxS6C0rnHAR3Aeg+0khR3M6QPG2E2sO6MiDnq
 HIpCzFgL6GVOUX2L3NX7fMmAPYyec8CERpSwbjMGS3OG0mUc1DBZ8rHxd
 pRFNrJNia9Ytb0fqXxTh82L76E2vfOx/Ay72CZdPIXldupikcQGnTHAMM g==;
X-CSE-ConnectionGUID: V+7JVnOdTieg4aElq18kTw==
X-CSE-MsgGUID: VZ9liCySSzC+NHOUiCowHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715520"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:02 -0700
X-CSE-ConnectionGUID: 9BUlY/nvRJSmHTFxbjs8yg==
X-CSE-MsgGUID: lLheYZSfR1KrCfTr3a6iVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246585"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 08/21] drm/xe: Implement xe_access_counter_queue_work
Date: Wed,  9 Sep 2026 18:15:02 +0530
Message-ID: <20260909124457.1610890-31-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Implement the worker function to dequeue access counter notifications
one-at-a-time and forward them to xe_access_counter_service(). Re-queue
the worker to the tail of pf_wq if more events remain, so page-fault
work items sharing the same workqueue can run between access counter
events rather than being starved by a long processing loop.

Add xe_usm_queue_peek() helper to check for pending entries without
consuming them.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 30 +++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index 6920e52cf154..f54b4bd6cb2b 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -11,6 +11,7 @@
 #include "xe_access_counter.h"
 #include "xe_access_counter_types.h"
 #include "xe_device.h"
+#include "xe_gt_printk.h"
 #include "xe_usm_queue.h"
 
 /**
@@ -28,9 +29,36 @@
  * xe_access_counter.c implements the consumer layer.
  */
 
-static void xe_access_counter_queue_work_func(struct work_struct *w)
+static int xe_access_counter_service(struct xe_access_counter *ac)
 {
 	/* TODO: Implement */
+	return 0;
+}
+
+static void xe_access_counter_queue_work_func(struct work_struct *w)
+{
+	struct xe_ac_worker *acw = container_of(w, struct xe_ac_worker, work);
+	struct xe_device *xe = acw->xe;
+	struct xe_usm_queue *ac_queue = &xe->usm.ac_queue;
+	struct xe_access_counter ac = {};
+
+	if (!xe_usm_queue_pop(ac_queue, &ac))
+		return;
+
+	if (ac.gt) {	/* Skip if access counter was squashed during reset */
+		int err = xe_access_counter_service(&ac);
+
+		if (err)
+			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
+				  ERR_PTR(err));
+	}
+
+	/*
+	 * Service at most one event per invocation so page-fault work items
+	 * sharing pf_wq can jump the queue between access counter events.
+	 */
+	if (xe_usm_queue_peek(ac_queue))
+		queue_work(xe->usm.pagefault_wq, w);
 }
 
 static void xe_access_counter_queue_init(struct xe_device *xe,
-- 
2.43.0

