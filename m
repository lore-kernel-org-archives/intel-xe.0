Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA4310F9956
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 16:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22610E6A0;
	Wed,  8 Apr 2026 16:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8iwkSwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0704C10E6A0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775664333; x=1807200333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fsSVGxa2fX738L8SIjvb9P+EJFDqs+f7pk5btfexbx4=;
 b=M8iwkSwXaJzC9GhY/hio2WdMyIZz73XAygAInFtX0Au+1MR151tIv+Lz
 Y10vO6LIUBb+5MiYkg918Ojr2ptwPVR52ZrR3HxBAYlxnHklUgRyFE7sn
 lzCLHk0MBNuun/FyBovreUkuVHR2aBSzef4stqP+Ab6+Ot5F48ttIaZSL
 tSQTCZ78a57CuQIu2ncd5hfwP4M5m10KwPLTTI0/x0+aZcNAfCu78ViTP
 NnkFX5vGykpScksaaJGJt2dAJfUnb/U+KnS8KpK99fcPGHzt92AT/BwWa
 KEbT5u3gUVcImjllZEQvtJDpThf7SYPldXZwHjZLM2zrUo/3Zam8AEX/w g==;
X-CSE-ConnectionGUID: bY5+QPTTT1C46WLL1kkdFQ==
X-CSE-MsgGUID: bA8J1umjQFu7vxZnVWz7jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102107839"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="102107839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 09:05:32 -0700
X-CSE-ConnectionGUID: Png3eSkoRGaHO4oqeh++bQ==
X-CSE-MsgGUID: weqEBQlpTm+pTcCRmUbcuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232887812"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa004.jf.intel.com with ESMTP; 08 Apr 2026 09:05:28 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 2/3] drm/xe/tests: Fix pf_set_admin_mode() after
 sriov.pf.admin_only removal
Date: Wed,  8 Apr 2026 16:05:17 +0000
Message-ID: <20260408160514.2388689-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408160514.2388689-5-satyanarayana.k.v.p@intel.com>
References: <20260408160514.2388689-5-satyanarayana.k.v.p@intel.com>
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

Admin-only mode is now derived from xe_device_is_admin_only(), which
checks whether the device was registered under the admin-only DRM driver
instance or not.

Update the kunit test to have a stub function to mimic the functionality
of xe_device_is_admin_only().

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V9 -> V10:
- Moved kunit_activate_static_stub() to pf_set_admin_mode() (Michal).

V8 -> V9:
- New commit.
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 22 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.c                |  3 +++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index efa8963ec248..a235ec04d6b6 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -7,16 +7,34 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 
+#include "xe_device.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 
 #define TEST_MAX_VFS	63
 #define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
 
+static bool xe_device_is_admin_only_stub_enable(const struct xe_device *xe)
+{
+	return true;
+}
+
+static bool xe_device_is_admin_only_stub_disable(const struct xe_device *xe)
+{
+	return false;
+}
+
 static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 {
-	/* should match logic of xe_sriov_pf_admin_only() */
-	xe->sriov.pf.admin_only = enable;
+	if (enable)
+		kunit_activate_static_stub(kunit_get_current_test(),
+					   xe_device_is_admin_only,
+					   xe_device_is_admin_only_stub_enable);
+	else
+		kunit_activate_static_stub(kunit_get_current_test(),
+					   xe_device_is_admin_only,
+					   xe_device_is_admin_only_stub_disable);
+
 	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b0bbb079ca8e..f391a1987682 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -17,6 +17,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
+#include <kunit/static_stub.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "display/xe_display.h"
@@ -446,6 +447,8 @@ static struct drm_driver admin_only_driver = {
  */
 bool xe_device_is_admin_only(const struct xe_device *xe)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_device_is_admin_only, xe);
+
 #ifdef CONFIG_PCI_IOV
 	return xe->drm.driver == &admin_only_driver;
 #endif
-- 
2.43.0

