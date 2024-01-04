Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADBDC47079
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F193010E54F;
	Thu,  4 Jan 2024 22:20:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECC510E548
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406842; x=1735942842;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kW5ujO2D+2h9CO9oeFEAFZeCdaeUr3Y5CuGhNAi/xOY=;
 b=dqcG+5kDe2r7xiewLPaB9Fiwv+clCt0+94E1l68ePNHqCbRxwLXVbtdh
 UPNOOInw/NwLu1eAAG6Os5nD1G4BpP6tvhoDLuK05J9UxNi+aztkBABzD
 XihhOeAlYTg14EJ2MbiHiHPMS7BobWfadUaeZcu3P/5VNF7/9KjCFdW6s
 Ec1PPb+zEyVxRazofWUqAP/HGwq62H9/Pv1QaSHnSbYm+EhQgAarGrY8n
 +c89koJPIRqLaQFToAUy1QmBEZb4Ud1bfuBE/BjAi96MJoYDovC2d8BgF
 drjdVnoIRXiploM/cRNkWZKnpP/uZRP2y5L5n5wQ7LiledsvycQ69icqd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546844"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546844"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022789"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022789"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 01/10] drm/xe: Allocate dedicated workqueue for SR-IOV
 workers
Date: Thu,  4 Jan 2024 23:20:22 +0100
Message-Id: <20240104222031.277-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We plan to use several workers where we might be running long
operations. Allocate dedicated workqueue to avoid undesired
interaction with non-virtualized workers.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: drop future comment (Piotr)
---
 drivers/gpu/drm/xe/xe_device.c       |  4 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov.c        | 32 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h        |  1 +
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86867d42d532..004e65544e8d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -438,6 +438,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_pat_init_early(xe);
 
+	err = xe_sriov_init(xe);
+	if (err)
+		return err;
+
 	xe->info.mem_region_mask = 1;
 	err = xe_display_init_nommio(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e6..163d889d407b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -321,6 +321,8 @@ struct xe_device {
 	struct {
 		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
 		enum xe_sriov_mode __mode;
+		/** @sriov.wq: workqueue used by the virtualization workers */
+		struct workqueue_struct *wq;
 	} sriov;
 
 	/** @clients: drm clients info */
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 42a0e0c917a0..f295d91886b1 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "xe_assert.h"
 #include "xe_sriov.h"
 
@@ -53,3 +55,33 @@ void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
 		drm_info(&xe->drm, "Running in %s mode\n",
 			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 }
+
+static void fini_sriov(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	destroy_workqueue(xe->sriov.wq);
+	xe->sriov.wq = NULL;
+}
+
+/**
+ * xe_sriov_init - Initialize SR-IOV specific data.
+ * @xe: the &xe_device to initialize
+ *
+ * In this function we create dedicated workqueue that will be used
+ * by the SR-IOV specific workers.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_init(struct xe_device *xe)
+{
+	if (!IS_SRIOV(xe))
+		return 0;
+
+	xe_assert(xe, !xe->sriov.wq);
+	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
+	if (!xe->sriov.wq)
+		return -ENOMEM;
+
+	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 5af73a3172b0..1545552162c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -13,6 +13,7 @@
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
 
 void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
+int xe_sriov_init(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
 {
-- 
2.25.1

