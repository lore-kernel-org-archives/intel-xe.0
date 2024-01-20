Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F95C48260
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77310EAD7;
	Sat, 20 Jan 2024 02:00:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4F10EAD7
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716031; x=1737252031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cu2p4ql2wQMqhck4ispRxukv1F+kFDCcwD1Sy8OvVOw=;
 b=IAXJHa63rC+O3TBXy53PUuAvXJmMOrVrP4t3xT227AIJLJqY/S82S5DM
 G9HvVF+OhyNkpyjg9bBf4LVfPtVjyxx9Jq03SkAL2Qag5r79AzYjKPnLd
 4RaeST5KdlzBN8w2fdiA9Ptd4Hy8SjaXa8XJIHQBxtEewUxNr8bFR9SwT
 tGAlZbOczq1H/jvfHYoIn/E3Icf4eXjJy5D0PaBfR9dTg+GwUgGn517mO
 ukT0UsKzhIH3Zy44FMgx8UT9mlw6a4QLxhYH7NUMWK1V++PE0J8wEtbjv
 E53xCam72GmMhoGXD73qqNQwQZbPufGjZSzPCe2M8ABfQs2Zry5YUh0IM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472937"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472937"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125693"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125693"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/16] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Date: Fri, 19 Jan 2024 18:00:12 -0800
Message-ID: <20240120020026.1261201-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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
index 110b698646565..42085a4b56be2 100644
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
index a130076b59aa2..37538e98dcc04 100644
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
index 254cc7cf49fef..1ff0a07ebab30 100644
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

