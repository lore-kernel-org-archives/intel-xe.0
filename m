Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB4FC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86B710E566;
	Thu, 18 May 2023 21:57:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259B10E137
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684447047; x=1715983047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/q/G483kk1uzEAvyAY6BAzV344aGeVxNYjqFw7f6fI=;
 b=Rckvr2EyYqZ957aN+DmWRGQkxFukSsX+5UMG9Sr7gP02O7QE+t6u/3cM
 hMm+X6czCVxQMxJKheZ9w0S9bdcMju6mvmkMcvmkFrG5tH8xNApEE1xnR
 ZRn8XiSr9rohviQNc4R8SmG4CrC1bEbCf0bljTt11VcD6CgT+YYgSrvi0
 9xF4Rv9P2muaX3G1lbGXgQCYApAPVD1VOJAgV5s5lwlHV7EMLPvgDrthl
 V0zog5g8mYZWP/kvzhPos4XrReQ+3adohQ03npC7tY8IM4q/wM7ZjdtQ2
 ohBZSiFLU+amhaziAWF05cM+o1i4iWzcMOwjC0vhqhVh5hn3rB4vqHnw9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349720247"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="349720247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876595999"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="876595999"
Received: from rdcurry-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.38.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:57:26 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 18:56:51 -0300
Message-Id: <20230518215651.502159-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518215651.502159-1-gustavo.sousa@intel.com>
References: <20230518215651.502159-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Fail xe_device_create() if wq
 allocation fails
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
index 4614bb791fb0..dd4a4a6e0b94 100644
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
 
@@ -211,6 +214,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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

