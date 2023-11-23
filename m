Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7C9C61D85
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 18:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7550810E177;
	Thu, 23 Nov 2023 18:06:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B9110E177
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700762774; x=1732298774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12HbFJaDkpYGQhDsGAaLRvfJqMKxrsC1nJED809nwaQ=;
 b=ZTWrnMbZRHcDCSk7RkSjCsMi0qAdxHII4YLSIasi7I3f1C6jOT1S9l0B
 WUVuFIS3GsSbPGV1Ac0fn+9ovQNKZQ4RKCgrMpvx8m4rcgs/9CbIYYjtF
 FGjrAMzMN7ftBclctCv6Id+WZCr4jV0HHNk2osN/APZ5oqnBF0wfiyTLw
 gdciCeeKFPxtfB5sVuaxb3Vef0I73EXzaem/8wd/5p+7ldTL5/tLqXgPE
 xFZiCsuXjftBKW5v8VcAshOIxmMjSlkeL+1kdKHHs+/uqvZKWZoA0cOck
 kqUZA/VFTLS03TPc7R9nJ0Py7l4KrDE0tCYTevhgUJ3/lyxQyAgzrP3tT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392081306"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="392081306"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 10:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885053746"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="885053746"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 10:06:13 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Nov 2023 10:06:05 -0800
Message-ID: <20231123180605.112597-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231123180605.112597-1-jose.souza@intel.com>
References: <20231123180605.112597-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Remove devcoredump during driver
 release
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This will remove devcoredump and its resources during driver release.
This fix the driver unload after a engine happend, without this
it would report that xe.ko is still in use.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++++
 drivers/gpu/drm/xe/xe_device.c      |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195beb..319cd42e21d4c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -9,6 +9,8 @@
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
+#include <drm/drm_managed.h>
+
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
@@ -193,4 +195,14 @@ void xe_devcoredump(struct xe_exec_queue *q)
 	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
+
+static void xe_driver_devcoredump_fini(struct drm_device *drm, void *arg)
+{
+	dev_coredump_put(drm->dev);
+}
+
+int xe_devcoredump_init(struct xe_device *xe)
+{
+	return drmm_add_action_or_reset(&xe->drm, xe_driver_devcoredump_fini, xe);
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 6ac218a5c1945..4ee8667e3a36c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -11,10 +11,16 @@ struct xe_exec_queue;
 
 #ifdef CONFIG_DEV_COREDUMP
 void xe_devcoredump(struct xe_exec_queue *q);
+int xe_devcoredump_init(struct xe_device *xe);
 #else
 static inline void xe_devcoredump(struct xe_exec_queue *q)
 {
 }
+
+static inline int xe_devcoredump_init(struct xe_device *xe)
+{
+	return 0;
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8be765adf702d..8de029fb6ecb8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -18,6 +18,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
+#include "xe_devcoredump.h"
 #include "xe_display.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -366,6 +367,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_devcoredump_init(xe);
+	if (err)
+		return err;
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
-- 
2.42.1

