Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E446C74A5B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 21:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BB310E00B;
	Thu, 23 Mar 2023 21:13:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ADA10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 21:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679606013; x=1711142013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Xkw7FS3BF/caw4yYaqlIuWFwsN52gQ53zkLvpwJV1Q=;
 b=NeU2tncx4PmAuoqOQVULKwrcTeqk1ZrSyp5iYmdR0dCU+pY9Cvu2xHUH
 kfjbBb58KxadrOcYZHQVnjiKN9VAfuzVKwgk2clAI6GXJCugCJRbe1VIQ
 HsBf9XXzeYZGBykrsTF8ae9AW06ZJQtINFUTB4cEGY3badKcr41WqPi1Y
 /YL0kMqGP5A0aKOhq9Ek5cQzLd4DDYz2mHu43xs9KWgLwhG8/i6r+FNx4
 A3+5099MeaKBu8BxAVPqplljKRVGWK/XwaRlYMlc+17E7/5JWnQbhlOk4
 r0mzMbZuFdT9NlOYg68NHHyDPiP+ylqC3oM50y03OUp6Ku2+5jfuDyokZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367367355"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="367367355"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 14:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="632600852"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="632600852"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 14:13:31 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 14:13:22 -0700
Message-Id: <20230323211322.114402-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add max engine priority to xe query
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

Intel Vulkan driver needs to know what is the maximum priority to fill
a device info struct for applications.

Right now we getting this information by creating a engine and setting
priorities from min to high to know what is the maximum priority for
running process but this leads to info messages to be printed to
dmesg:

xe 0000:03:00.0: [drm] Ioctl argument check failed at drivers/gpu/drm/xe/xe_engine.c:178: value == DRM_SCHED_PRIORITY_HIGH && !capable(CAP_SYS_NICE)

It does not cause any harm but when executing a test suite like
crucible it causes thousands of those messages to be printed.

So here adding one more property to drm_xe_query_config to fetch the
max engine priority.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 10 ++++++++--
 drivers/gpu/drm/xe/xe_engine.h |  1 +
 drivers/gpu/drm/xe/xe_query.c  |  3 +++
 include/uapi/drm/xe_drm.h      |  3 ++-
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index a4fc5afdf6883..37209b13bcd6b 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -169,14 +169,20 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
 	return e;
 }
 
+enum drm_sched_priority
+xe_engine_device_get_max_priority(struct xe_device *xe)
+{
+	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
+			               DRM_SCHED_PRIORITY_NORMAL;
+}
+
 static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
 			       u64 value, bool create)
 {
 	if (XE_IOCTL_ERR(xe, value > DRM_SCHED_PRIORITY_HIGH))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, value == DRM_SCHED_PRIORITY_HIGH &&
-			 !capable(CAP_SYS_NICE)))
+	if (XE_IOCTL_ERR(xe, value > xe_engine_device_get_max_priority(xe)))
 		return -EPERM;
 
 	return e->ops->set_priority(e, value);
diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
index 1cf7f23c4afd6..a49cf2ab405eb 100644
--- a/drivers/gpu/drm/xe/xe_engine.h
+++ b/drivers/gpu/drm/xe/xe_engine.h
@@ -54,5 +54,6 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file);
 int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file);
+enum drm_sched_priority xe_engine_device_get_max_priority(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0f70945176f60..dd64ff0d2a575 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -12,6 +12,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_engine.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
@@ -194,6 +195,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.tile_count;
 	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
+	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
+		xe_engine_device_get_max_priority(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
 		kfree(config);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 661d7929210c5..b0b80aae3ee88 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -184,7 +184,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
+#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
 	__u64 info[];
 };
 
-- 
2.40.0

