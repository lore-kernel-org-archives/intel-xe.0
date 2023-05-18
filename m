Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBC3C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 20:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65ED10E550;
	Thu, 18 May 2023 20:15:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBE210E550
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 20:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684440926; x=1715976926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qd5Ej+mqmqd6U5DGS0D/zkiWCpsgI5cscm2Yd9jg1yc=;
 b=HYs2K8jl5j29udXf85CrpALginYWn2jSRsGxxuG+au9B7Lb2Re615FMs
 BsQ7KL8HGmw/XCdGVQb3BlU9LEKtn02+mwbVwiyGk3mZuIbxekY1wNE2P
 kypvfav9hN561tPfM1kL5v6id1j3YWd+1/akr+wgcnVstiH/pu19mRPNs
 d/0Nsb44HCkLldR2cau2h0SOuFPsfDJtfv+fcte8bZrysvPzswI6YKNQH
 QI/ocMU0rR0fKso/kWwp3dQqkD51rFnQhPh34mvPP6/eOBY0t/pxFktdG
 NTdmH8lpRq2n+c+LXpFgICFiIxjru9yK4+Al8QsXQxK+Xjs1hHjHX6qLp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="380395941"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="380395941"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 13:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876562873"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="876562873"
Received: from rdcurry-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.38.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 13:15:23 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 17:15:00 -0300
Message-Id: <20230518201500.420190-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fail xe_device_create() if wq allocation
 fails
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

Let's make sure we give the driver a valid workqueue.

While at it, also make sure to call destroy_workqueue() only if the
workqueue is a valid one. That is necessary because xe_device_destroy()
is indirectly called as part of the cleanup process of a failed
xe_device_create().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f7f6a6a97757..775a2940c916 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/xe_drm.h>
 
 #include "regs/xe_regs.h"
@@ -161,7 +162,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	destroy_workqueue(xe->ordered_wq);
+	if (xe->ordered_wq)
+		destroy_workqueue(xe->ordered_wq);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -207,6 +210,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
+	if (!xe->ordered_wq) {
+		drm_err(&xe->drm, "Failed to allocate xe-ordered-wq\n");
+		err = -ENOMEM;
+		goto err_put;
+	}
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
-- 
2.40.1

