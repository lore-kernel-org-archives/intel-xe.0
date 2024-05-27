Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C6C25B7D
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 01:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6510E213;
	Mon, 27 May 2024 01:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHV2OzHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742410E227
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 01:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716774218; x=1748310218;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NDnEhtSrFj17c6DemYfUFVm0DPZMfA4TiBAcIwcsbxA=;
 b=JHV2OzHrr2B2/8ScqRNAjxwIIi+ziZM6O0hfBytYQir7jjwzsfBOM9tz
 ZMJcw0cHb/3Wg3fuyzRX0x18sn6nFStDZd4NBRlA0zTupqT5IaBrRTxcs
 SyiOSgEcuIxsbFNjVvs5txm5TSHBPClwrhGmr4dBfFXu7AbbZG+YqGw5s
 pumJtX1kz6ESW0PulWQGnxshJogpjuVt1CF/D9BkZqeGMt+Kg/OA095sU
 +xFXnNETOIObJgUaXcr0p+E5HiBywt4gNu+rXuomT7DQE/UERyONy2H9V
 8etOr844KJv5utGD+WJt7OlW/tm4qldZPz3//M2OfUXKzIl7t6ffZwlkR A==;
X-CSE-ConnectionGUID: rqTkqPZ8QXG0vXbCQFBOjw==
X-CSE-MsgGUID: eaoDQKH+T7eIBYXeNrWUJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="11707462"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="11707462"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:43:37 -0700
X-CSE-ConnectionGUID: tZF6eAsHRHu2rzn569sYZw==
X-CSE-MsgGUID: MYbsS0PjQiCSRnnF0JrnFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="65821703"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:43:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/17] drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Date: Sun, 26 May 2024 18:43:18 -0700
Message-ID: <20240527014333.603914-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240527014333.603914-1-ashutosh.dixit@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
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

