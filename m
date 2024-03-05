Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA87C5478C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5DF112711;
	Tue,  5 Mar 2024 05:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8eWcT2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8D71126C3
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709616810; x=1741152810;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aAz+uv+1jjvxLzx3O1xQEDbLCCzQ72/hV0fIs9O/ELM=;
 b=A8eWcT2P7+Tz2b/WnWdgb2o6/cYWsggVX0HtKvrCXBH/UG/42IkP9qZY
 4Y6qCxOAzQqGtSkjV4zXmF8QSrBH4V0HFfMEaZwXj3wHU8/tqHmb5Xr+z
 v77KC1PgalrCxeSRS7l8tsQI7u2kC632PPPs4hSQQKprl6egp92oPjsWI
 xt+LLvUgKE3Kfw8cJt4XsZPx0BNTS/BEzttFQt2oLQ5zoYgR59edSJKpL
 Z1RGZPMfwh96xtJ7IC2msSCsVyIYiqB0jGItwEqzr7o3sX4k1Wwb+YcfW
 lw6bDlkfheNFXMqY685+0bHsypnbFv3Cbq4eT8Ztl3gi0emMDFOCtgCZT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21601471"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21601471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9660203"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:12 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/16] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Date: Mon,  4 Mar 2024 21:32:46 -0800
Message-ID: <20240305053300.2406240-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
References: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c |  5 +++++
 drivers/gpu/drm/xe/xe_perf.c   | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   |  4 ++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..42085a4b56be 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
+#include "xe_perf.h"
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
@@ -66,6 +67,10 @@ static const struct init_funcs init_funcs[] = {
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
index a130076b59aa..37538e98dcc0 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -4,9 +4,13 @@
  */
 
 #include <linux/errno.h>
+#include <linux/sysctl.h>
 
 #include "xe_perf.h"
 
+u32 xe_perf_stream_paranoid = true;
+static struct ctl_table_header *sysctl_header;
+
 int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_xe_perf_param *arg = data;
@@ -19,3 +23,27 @@ int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
+int xe_perf_sysctl_register(void)
+{
+	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
+	return 0;
+}
+
+void xe_perf_sysctl_unregister(void)
+{
+	unregister_sysctl_table(sysctl_header);
+}
diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
index 254cc7cf49fe..1ff0a07ebab3 100644
--- a/drivers/gpu/drm/xe/xe_perf.h
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -11,6 +11,10 @@
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

