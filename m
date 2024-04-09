Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B92CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BD9112EF7;
	Tue,  9 Apr 2024 20:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsQ7Dg5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F88112A8F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712692937; x=1744228937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9th3zcxHkOFYKgqfwBhxafNw916wP0TsbaIUcqTYDjc=;
 b=WsQ7Dg5cHOf+coKwfT461BfFOdQkZLry1c2d9Adp4/Pi8lynrzR7t2w0
 GIzfS6mZggmiK5dzG5goyJpm/2zl/F/lfYgVuRXGD78sLUQY+dpQXVVaR
 BpmWYv+CSCHVwGNSBFErmeBkZw34U3fns3Km94dA9tuyfajyXVeVr1vIF
 PArHbpJ6v7S0x/foHUbLPeeLJNROG+kIXd2yUELSHIKK6IfBdlsLhWbNn
 TSgWi7JIMmp1iePJyiWnqNHMWRZLFGoz3PwcTO8eeImfSChzYvKqovSEo
 9VjIwXH5vzK/CL2Oa/0RdcROld9N9CbVLRsPqeWLQ1r1rol3FvnS8Fxol A==;
X-CSE-ConnectionGUID: 1oNCHDo0THaHjlk7tm94mQ==
X-CSE-MsgGUID: GdAReDvkQOCoQEFAf4uA3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="10996850"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="10996850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:02:17 -0700
X-CSE-ConnectionGUID: pal8vJweQ9CdDP6WaAQoOg==
X-CSE-MsgGUID: 1iBq4LdKSviFKwsOebRdgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24824248"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:02:16 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Remove devcoredump during driver release
Date: Tue,  9 Apr 2024 13:02:06 -0700
Message-ID: <20240409200206.108452-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409200206.108452-1-jose.souza@intel.com>
References: <20240409200206.108452-1-jose.souza@intel.com>
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
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++++
 drivers/gpu/drm/xe/xe_device.c      |  4 ++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 283ca7518aff2..3d7980232be1c 100644
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
@@ -235,5 +237,14 @@ void xe_devcoredump(struct xe_sched_job *job)
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
index df8671f0b5eb2..e2fa65ce09322 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -11,10 +11,16 @@ struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
 void xe_devcoredump(struct xe_sched_job *job);
+int xe_devcoredump_init(struct xe_device *xe);
 #else
 static inline void xe_devcoredump(struct xe_sched_job *job)
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
index 9083f5e02dd9e..ce27d0d1bdb34 100644
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
@@ -513,6 +514,9 @@ int xe_device_probe(struct xe_device *xe)
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

