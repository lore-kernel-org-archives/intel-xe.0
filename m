Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC5FC001B0
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 09:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF510E1F2;
	Mon,  3 Jul 2023 09:13:22 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA86A10E0CB
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688375600; x=1719911600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GXw4vkgEm+TsvW1mRanldIVpku0wYGeNRsFqfcqVCq8=;
 b=Lrc/yNz0Er0TXO6V2NCHLl8qhaRN6XA6YzZO4sdTix9iHTY63Sn5otRs
 Jhiq9K7kGkVKbroSe+Gm5cas5Mjp2F1z3iQuJqHIslJlSOibajFpFbIqu
 tdShRCZzJQ6DjEcPJGqqkO5b/aYkvN0+d7obMrWwFcVbZDRJj645WaItk
 oS1bihpvBmDLvdt0JzEiddcbGmdOyxYOoo8/x9nPW5tsDryF24TBstS8q
 EJa+ZnYKZmWc7Ma8JAltAcf9IWZ/UALFwLDT7Q32f1SOHWclVUioJ0kAg
 qDMrkbXvnFjJsDDpFiYkMsZ0mWj0Scfl7C2VcB74ET8+dFgqCO7odrL7s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361692028"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="361692028"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 02:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="892489238"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="892489238"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 03 Jul 2023 02:13:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Jul 2023 14:49:33 +0530
Message-Id: <20230703091933.3832500-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
References: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: make GT sysfs init return void
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

As we dont use return from xe_gt_sysfs_init, we
should make it return void to make it proper return
type.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 10 ++++------
 drivers/gpu/drm/xe/xe_gt_sysfs.h |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 2c47059bef42..4ecbd972e6a1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(gt->sysfs);
 }
 
-int xe_gt_sysfs_init(struct xe_gt *gt)
+void xe_gt_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct kobj_gt *kg;
@@ -37,7 +37,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
 
 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
 	if (!kg)
-		return -ENOMEM;
+		return;
 
 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
 	kg->gt = gt;
@@ -45,14 +45,12 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
 	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
 	if (err) {
 		kobject_put(&kg->base);
-		return err;
+		return;
 	}
 
 	gt->sysfs = &kg->base;
 
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_sysfs_fini, gt);
 	if (err)
-		return err;
-
-	return 0;
+		return;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
index ecbfcc5c7d42..e3ec278ca0be 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
@@ -8,7 +8,7 @@
 
 #include "xe_gt_sysfs_types.h"
 
-int xe_gt_sysfs_init(struct xe_gt *gt);
+void xe_gt_sysfs_init(struct xe_gt *gt);
 
 static inline struct xe_gt *
 kobj_to_gt(struct kobject *kobj)
-- 
2.25.1

