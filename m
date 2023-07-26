Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7844C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 23:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C031D10E4CC;
	Wed, 26 Jul 2023 23:21:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945FD10E4CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 23:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690413712; x=1721949712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OmWQeQZRAqQBlZH0lSFS75nJgEnOnuD++sC67Eh8kR4=;
 b=GD+/DoBtluKUROoxnWq4klS3qyfsKqos9cmKYfoDp3oG0bVc7dB5syub
 EIrrUMJ8legASxFA4nljV0jhdZvYw1MsR7DfxFt+Bq4Jc3/kySndCWBmL
 Lo08DcgY0tyj7cm1wjFHhQgx9gZmh9NWosXKdHU3GnYrUk+/BxO1klQ8f
 WKx6zMsgrZI6EIv1//uNyM/Y/5L0OAOx3Fgm7MbJMcb4Q1uoPPLTN8tOH
 6JWjUxEZfBShV6tDdOT/ctmJs5bPXFu3PGLt8HE6+9x/z2QN3uDayVety
 H1r9AccM4HpMPnnu4KUTiL3tFWi0A9SpyQXjuQXRzHGfiuI7GRWshCMWd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367031378"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="367031378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 16:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726715234"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="726715234"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 16:21:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 04:56:50 +0530
Message-Id: <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for gt
 reset
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To trigger gt reset failure:
 echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
 echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      |  8 +++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 047341d5689a..1fd016e6f7a0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
@@ -20,6 +21,10 @@
 #include "xe_vm.h"
 #endif
 
+#ifdef CONFIG_FAULT_INJECTION
+DECLARE_FAULT_ATTR(gt_reset_failure);
+#endif
+
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
 	return to_xe_device(node->minor->dev);
@@ -135,4 +140,9 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
+
+#ifdef CONFIG_FAULT_INJECTION
+	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+#endif
+
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5e70e486b27c..691e3baf97c9 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -525,6 +525,11 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_info(gt, "reset started\n");
 
+	if (xe_fault_inject_gt_reset()) {
+		err = -ECANCELED;
+		goto err_fail;
+	}
+
 	xe_gt_sanitize(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
@@ -563,6 +568,7 @@ static int gt_reset(struct xe_gt *gt)
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
+err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	/* Notify userspace about gt reset failure */
@@ -584,7 +590,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
 	xe_gt_info(gt, "trying reset\n");
 
 	/* Don't do a reset while one is already in flight */
-	if (xe_uc_reset_prepare(&gt->uc))
+	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
 		return;
 
 	xe_gt_info(gt, "reset queued\n");
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 7298653a73de..caded203a8a0 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -7,6 +7,7 @@
 #define _XE_GT_H_
 
 #include <drm/drm_util.h>
+#include <linux/fault-inject.h>
 
 #include "xe_device_types.h"
 #include "xe_hw_engine.h"
@@ -16,6 +17,19 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
+#ifdef CONFIG_FAULT_INJECTION
+extern struct fault_attr gt_reset_failure;
+static inline bool xe_fault_inject_gt_reset(void)
+{
+	return should_fail(&gt_reset_failure, 1);
+}
+#else
+static inline bool xe_fault_inject_gt_reset(void)
+{
+	return false;
+}
+#endif
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
-- 
2.25.1

