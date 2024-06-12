Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A88C27C79
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084E310E201;
	Wed, 12 Jun 2024 02:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAs8MndM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6999D10E201
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718157938; x=1749693938;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y0yMIqCE8nSlj+Bade+JpQLhF4Z5cRpm4ntP+NzpIfc=;
 b=AAs8MndMiwI7rXfyoswDB0ZSGhPqDCxs9Dm5UUDqtWjpeuF1dAm/lCqP
 7ZfmctL122We3elB9tCAICdM/SroIuJHmDrGsIrflvH8YI+Q6UUuDkn8t
 8fi7vL07X3pJ2eQl2TOfpoTYGDgFnSWgUMVcqSvwKdaeB3MyTQ48bMMwR
 b070hpFIIiZTKJSjpyHs4/DB1jzL8cgRGOvSEoBJ4rwN6O8deYjDss1mM
 cFJA7//sZGVy/0jxahpXKg9fCYnE464jw5YJHImWFKeGHgpzOW/9tcWf5
 YZ56qZlyOzDXZS5kvpmEn/QfukfTydS/Svtj79AL4k1U9si1r/1f3tgXd Q==;
X-CSE-ConnectionGUID: 5SUpS7VHRDONp/zPgw7gXA==
X-CSE-MsgGUID: NViCqGBJTbexxOHLzhjYwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15028651"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="15028651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:37 -0700
X-CSE-ConnectionGUID: CJ3FfRRvR7ylMZcutmaBug==
X-CSE-MsgGUID: 215cmEgOQ+uMOc38F7ZjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="39738451"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/17] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Date: Tue, 11 Jun 2024 19:05:16 -0700
Message-ID: <20240612020531.2680081-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
References: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
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

Normally only superuser/root can access perf counter data. However,
superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
users to also access perf data. perf_stream_paranoid is introduced at the
perf layer to allow different perf stream types to share this access
mechanism.

v2: Add kernel doc for non-static functions (Michal)

Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c |  5 +++++
 drivers/gpu/drm/xe/xe_perf.c   | 40 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   |  6 +++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 3edeb30d5ccb..893858a2eea0 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
+#include "xe_perf.h"
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
@@ -78,6 +79,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_register_pci_driver,
 		.exit = xe_unregister_pci_driver,
 	},
+	{
+		.init = xe_perf_sysctl_register,
+		.exit = xe_perf_sysctl_unregister,
+	},
 };
 
 static int __init xe_init(void)
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index 2963174ecd0e..f619cf50b453 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -4,11 +4,15 @@
  */
 
 #include <linux/errno.h>
+#include <linux/sysctl.h>
 
 #include <drm/xe_drm.h>
 
 #include "xe_perf.h"
 
+u32 xe_perf_stream_paranoid = true;
+static struct ctl_table_header *sysctl_header;
+
 /**
  * xe_perf_ioctl - The top level perf layer ioctl
  * @dev: @drm_device
@@ -32,3 +36,39 @@ int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		return -EINVAL;
 	}
 }
+
+static struct ctl_table perf_ctl_table[] = {
+	{
+	 .procname = "perf_stream_paranoid",
+	 .data = &xe_perf_stream_paranoid,
+	 .maxlen = sizeof(xe_perf_stream_paranoid),
+	 .mode = 0644,
+	 .proc_handler = proc_dointvec_minmax,
+	 .extra1 = SYSCTL_ZERO,
+	 .extra2 = SYSCTL_ONE,
+	 },
+	{}
+};
+
+/**
+ * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
+ *
+ * Normally only superuser/root can access perf counter data. However,
+ * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
+ * users to also access perf data.
+ *
+ * Return: always returns 0
+ */
+int xe_perf_sysctl_register(void)
+{
+	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
+	return 0;
+}
+
+/**
+ * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
+ */
+void xe_perf_sysctl_unregister(void)
+{
+	unregister_sysctl_table(sysctl_header);
+}
diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
index e7e258eaf0a9..53a8377a1bb1 100644
--- a/drivers/gpu/drm/xe/xe_perf.h
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -6,9 +6,15 @@
 #ifndef _XE_PERF_H_
 #define _XE_PERF_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 struct drm_file;
 
+extern u32 xe_perf_stream_paranoid;
+
 int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_perf_sysctl_register(void);
+void xe_perf_sysctl_unregister(void);
 
 #endif
-- 
2.41.0

