Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E68C2D0CE
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCCB10E52B;
	Mon, 17 Jun 2024 22:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNBOOwMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03EE10E51F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663820; x=1750199820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y0yMIqCE8nSlj+Bade+JpQLhF4Z5cRpm4ntP+NzpIfc=;
 b=eNBOOwMZZ8NFY8hGWbJHed/0uw/Zoo+6fPRzmA4ACVeW2k0COgYBNnEg
 Zl08UejlJRi+LFTqIctyD/aNr2wjVH0Ag8gGWENGDZLjEQvOANaMwPqUd
 L2vqQ4C03XhI+yHJXqIf6n99kdzJg9hnstwvVYmrW5pcY/xBvl9nXD721
 TvG7j1U9P82VKX/u5NcIId6J3amu7PMkPS4m6vlTtFX05hIYFlYMHoXXU
 NhYTMaGUFQ6xTrzIxQpCce/PTC3P+Y9lGN4KCbfniXBPBrv1e4hgIXWDX
 e8G1DhTiPC74noSkgSjS1WsCyZmE33okeJoS6dDNXlu/4pJ8NMV1FFcoD Q==;
X-CSE-ConnectionGUID: cJdtfwxDRn2+mYDzv9KCkQ==
X-CSE-MsgGUID: 3eLK2CXeQJKW0mk+MowG2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18428970"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="18428970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
X-CSE-ConnectionGUID: CutxQZIPQBifixo7w1enEA==
X-CSE-MsgGUID: Wo9SIgHBRs6q3iMOxiohZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="72090770"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/17] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Date: Mon, 17 Jun 2024 15:36:36 -0700
Message-ID: <20240617223651.3220399-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

