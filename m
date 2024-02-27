Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7008C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 21:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599C910E4EF;
	Tue, 27 Feb 2024 21:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNWniD1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47BC10E4B4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709067621; x=1740603621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIkMM1NMy91FDgmfFFaJ0HxHDsRelsqEiKUcFIg+iw8=;
 b=FNWniD1zrr9PoKOCcGiMrAj2+KWZxw26DhT1sCDcBpk1XLKobm7brJhV
 3+AryNna8+FNQaKdowZN+ucUXMUPk9ldGBt127k7WLu+0uMi7TPOzVTEM
 ZZUeZY8+V8LHBl+x94LbvW7aqCrzWx/MKYa6K9LV1dIRbMZWINU5Mr4zY
 PuMlJs1svdmB7waivjv8BwTlIqSS55WC3Jb0x1UXink0zXcge3Pd6Xrbt
 fu2AAE8UWrrI3qnUSn/dD/ew+EWfKMQzZ7OefaPeKA9ipSroQ8yFKEIZq
 4/13L78axYeqJmZGYlnteq0I4JRE7N3eHIzuDowEWhzsqdKiFPvlBVD9U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14858451"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14858451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7150425"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 13:00:19 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 3/4] drm/xe: Remove devcoredump during driver release
Date: Tue, 27 Feb 2024 13:00:07 -0800
Message-ID: <20240227210008.182904-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227210008.182904-1-jose.souza@intel.com>
References: <20240227210008.182904-1-jose.souza@intel.com>
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

This will remove devcoredump from file system and free its resources
during driver unload.

This fix the driver unload after gpu hang happened, otherwise this
it would report that Xe KMD is still in use and it would leave the
kernel in a state that Xe KMD can't be unload without a reboot.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump.h |  5 +++++
 drivers/gpu/drm/xe/xe_device.c      |  4 ++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68d3d623a05bf..3fef81396fe8a 100644
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
@@ -231,5 +233,14 @@ void xe_devcoredump(struct xe_sched_job *job)
 	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
-#endif
 
+static void xe_driver_devcoredump_fini(struct drm_device *drm, void *arg)
+{
+	dev_coredump_put(drm->dev);
+}
+
+int xe_devcoredump_init(struct xe_device *xe)
+{
+	return drmm_add_action_or_reset(&xe->drm, xe_driver_devcoredump_fini, xe);
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index df8671f0b5eb2..9eba67f37234f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -11,10 +11,15 @@ struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
 void xe_devcoredump(struct xe_sched_job *job);
+int xe_devcoredump_init(struct xe_device *xe);
 #else
 static inline void xe_devcoredump(struct xe_sched_job *job)
 {
 }
+static inline int xe_devcoredump_init(struct xe_device *xe)
+{
+	return 0;
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495a..22be76537c7da 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -20,6 +20,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
+#include "xe_devcoredump.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
@@ -502,6 +503,9 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_devcoredump_init(xe);
+	if (err)
+		return err;
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
-- 
2.44.0

