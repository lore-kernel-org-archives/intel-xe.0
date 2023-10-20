Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925BCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 05:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E8A10E07B;
	Fri, 20 Oct 2023 05:10:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D9E10E07B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697778637; x=1729314637;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/aiiVv+wl4jAmlAOeoXv/sDfa89znT/3qSAgkz0MCWI=;
 b=IF+5gbpbpUPI0K7O+JQSG4pt8sITYbZY2D2g+D/ZE+erApOsgt3n/jT1
 bZ64G8jep+EJYPKcVDlS3RM1S+ZqGdgrksttk1yq0vXAgdunp4bNvNM7H
 IUT2awpYEpOMffx6f+ZOSQ9VEO88iOWvzq5RdJSbjmRS5iIfdxiqkfsoe
 sfbZu+M6sEmN8FMbAQo4OnO/GNn3oX9GzKYWvDO+BIoEJwyD87YGa4G+t
 G5KB3VyyPbUYGQQyxUMHP/DlLZGIzFpSxAFMLb0kj7mmPSxx0dK6noNzU
 ns0079HRkQK80gNVukGuWeNGmLizAEQYdheGGlpI5osvSWwHGneUc1uJu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366664272"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="366664272"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 22:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733842659"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="733842659"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 22:10:34 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 janga.rahul.kumar@intel.com
Date: Fri, 20 Oct 2023 10:36:48 +0530
Message-Id: <20231020050648.2043564-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t] tests/xe/xe_access_counter: Negative
 access counter test
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added a negative test related to access counter.
It tries to test GRANULARITY access counter parameter.
It should return -EINVAL parameter for invalid values.

v2: Added subtest description.

v3: Added min value -1 to check for min granularity range.(Rahul)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_access_counter.c | 81 +++++++++++++++++++++++++++++++++
 tests/meson.build               |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 tests/intel/xe_access_counter.c

diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
new file mode 100644
index 000000000..7e41abaa8
--- /dev/null
+++ b/tests/intel/xe_access_counter.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for access counter functionality
+ * Category: Software building block
+ * Run type: FULL
+ * Sub-category: access counter
+ * Functionality: access counter
+ * Test category: functionality test
+ * SUBTEST: invalid-param
+ * Description: Giving invalid granularity size parameter and checks for invalid error.
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define SZ_64M  3
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		uint16_t devid;
+
+		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		igt_require(xe_supports_faults(fd));
+		igt_require(IS_PONTEVECCHIO(devid));
+	}
+
+	igt_subtest("invalid-param") {
+		struct drm_xe_engine_class_instance instance = {
+			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
+		 };
+
+		int ret;
+		const int expected = -EINVAL;
+
+		struct drm_xe_ext_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY,
+			.value = SZ_64M + 1,
+		};
+
+		struct drm_xe_exec_queue_create create = {
+			.extensions = to_user_pointer(&ext),
+			.vm_id = xe_vm_create(fd, 0, 0),
+			.width = 1,
+			.num_placements = 1,
+			.instances = to_user_pointer(&instance),
+		};
+
+		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
+			ret = -errno;
+			errno = 0;
+		}
+
+		igt_assert_eq(ret, expected);
+		ext.value = -1;
+
+		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
+			ret = -errno;
+			errno = 0;
+		}
+
+		igt_assert_eq(ret, expected);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 5afcd8cbb..de91b4418 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -272,6 +272,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_access_counter',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.25.1

