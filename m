Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52B3EF4ED1
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 11:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A734D10E237;
	Mon,  6 Apr 2026 11:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwfIaMMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E4110E231
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775475931; x=1807011931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j8aYZ8YgVsIieVqNwquBtL9lxroCvcvkSl0dpXeKHFc=;
 b=CwfIaMMxzyFhzwENZSJEz28ETvPEQuDvC8yEzrKTaGF4YxHmuUm3weR2
 k9KShvS2wEzrZcv0NwDX6oOFa5NsV9luv0BHNHAL8ryskKATnqV02dbMW
 WfAPT3Kc0iNy29b9dkFIqQ4NuiduqYfyEXXfPwN03bVpbpTts6j1pv7K0
 t1mvingmrQtdsUIi18KGpjGUG754esT86fXp2OMkYEmDK2TvW6jYY2Sdh
 PePr98QOVBWBT51vpIIZA75vTNInNGOfkXX2KXGcTUK3OdVNAnlhshtns
 W2LJ/XxpZy3ZxTjFdQQFHxiChRtIMuGOWePNrQSUXMgKr94YKXsX9E+25 w==;
X-CSE-ConnectionGUID: 0adAOKqYS++6gcQBZvY1pw==
X-CSE-MsgGUID: ykY+Y1wPT+OArxIFLiPmIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87047425"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="87047425"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 04:45:30 -0700
X-CSE-ConnectionGUID: H1NAFAXzS+mjUXUbvHrATQ==
X-CSE-MsgGUID: Z7H5AKDoQS2Vx/+7bi8dOg==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2026 04:45:29 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 3/3] drm/xe/tests: Fix pf_set_admin_mode() after
 sriov.pf.admin_only removal
Date: Mon,  6 Apr 2026 11:45:19 +0000
Message-ID: <20260406114515.1043145-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406114515.1043145-5-satyanarayana.k.v.p@intel.com>
References: <20260406114515.1043145-5-satyanarayana.k.v.p@intel.com>
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
V8 -> V9:
- New commit.
---
 .../drm/xe/tests/xe_gt_sriov_pf_config_kunit.c    | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_device.c                    |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index efa8963ec248..7b3c5733cede 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -7,16 +7,23 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 
+#include "xe_device.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 
 #define TEST_MAX_VFS	63
 #define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
 
+static bool sriov_pf_admin_only;
+
+static bool xe_device_is_admin_only_stub(const struct xe_device *xe)
+{
+	return sriov_pf_admin_only;
+}
+
 static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 {
-	/* should match logic of xe_sriov_pf_admin_only() */
-	xe->sriov.pf.admin_only = enable;
+	sriov_pf_admin_only = enable;
 	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
 }
 
@@ -82,6 +89,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
 	KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);
 
+	sriov_pf_admin_only = false;
+	kunit_activate_static_stub(test, xe_device_is_admin_only,
+				   xe_device_is_admin_only_stub);
+
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b70fa3af6d15..d2981e7c0d91 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -17,6 +17,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
+#include <kunit/static_stub.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "display/xe_display.h"
@@ -444,6 +445,7 @@ static struct drm_driver admin_only_driver = {
  */
 bool xe_device_is_admin_only(const struct xe_device *xe)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_device_is_admin_only, xe);
 	return xe->drm.driver == &admin_only_driver;
 }
 
-- 
2.43.0

