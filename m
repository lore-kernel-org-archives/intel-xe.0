Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E92F31E43
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 15:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D007F10E82A;
	Thu,  9 Apr 2026 15:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czdy0OD8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929A10E82A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775749480; x=1807285480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/NlCmxjxfJsgBUodjlq1rDNZgWfY+Ub3E3P8veW9pe0=;
 b=czdy0OD8loerqcLkkl2NHudmuZkK2xlQXQERiAPmrqyd9GEfvRICVWBh
 OeKoG8S8a83jaPihKjYgn0JI53W+O/ePO/rce6xePFO0lTsWl3Svl1j4L
 pnimPsUKEcSkezjdw+bFezJtaqgx6WI5cEjxoGQYhJWSeGE7ycg9NSFdf
 FHfGZUSimp1pARIl0MM5cD1LFa7zda/VzsFZpUsamUjESVT5d7c0flZxP
 EupAoqt7ckEMG3ZiFm4drRyU0q603zjLCxVZuNOcEaTY1eW27tC1TP4FU
 4poL2whnT2CsexhQThOObXpWPn9YElvkL+JO1hNaJtdV/0Lgq5NujkBqv w==;
X-CSE-ConnectionGUID: cUNFSoMaTi62P+OgbTucwQ==
X-CSE-MsgGUID: BVpWNCIBT8yldbC4QAZOZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99385967"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="99385967"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 08:44:38 -0700
X-CSE-ConnectionGUID: mPWIXXGaT+qpkOnCOe3QjQ==
X-CSE-MsgGUID: EssnHvIhR7i7JSQycrSdNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="224048835"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2026 08:44:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v11 2/2] drm/xe/pf: Derive admin-only PF mode from xe_device
 state
Date: Thu,  9 Apr 2026 15:44:26 +0000
Message-ID: <20260409154423.2499340-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409154423.2499340-4-satyanarayana.k.v.p@intel.com>
References: <20260409154423.2499340-4-satyanarayana.k.v.p@intel.com>
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

Stop tracking admin-only PF mode in a separate `xe->sriov.pf.admin_only`
field and use `xe_device_is_admin_only(xe)` as the single source of
admin mode.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V10 -> V11:
- Squashed kunit commit into the current one.
- Cleandup pf_set_admin_mode() as per review comments (Michal).

V9 -> V10:
- None.

V8 -> V9:
- New commit.
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 21 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.c                |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  6 ------
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  3 ++-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  3 ---
 5 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index efa8963ec248..524b9f5d2624 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -7,16 +7,33 @@
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
+	typeof(xe_device_is_admin_only) *stub = enable ?
+		xe_device_is_admin_only_stub_enable :
+		xe_device_is_admin_only_stub_disable;
+
+	kunit_activate_static_stub(kunit_get_current_test(),
+				   xe_device_is_admin_only,
+				   *stub);
+
 	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ceddda10f78f..4b45b617a039 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -17,6 +17,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap_util.h>
 #include <drm/drm_print.h>
+#include <kunit/static_stub.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "display/xe_display.h"
@@ -445,6 +446,7 @@ static struct drm_driver admin_only_driver = {
  */
 bool xe_device_is_admin_only(const struct xe_device *xe)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_device_is_admin_only, xe);
 	return xe->drm.driver == &admin_only_driver;
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 47a6e0fd66e0..33bd754d138f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -20,11 +20,6 @@
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
-static bool wanted_admin_only(struct xe_device *xe)
-{
-	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
-}
-
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
 	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
@@ -79,7 +74,6 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
 
 	pf_reduce_totalvfs(xe, newlimit);
 
-	xe->sriov.pf.admin_only = wanted_admin_only(xe);
 	xe->sriov.pf.device_total_vfs = totalvfs;
 	xe->sriov.pf.driver_max_vfs = newlimit;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 0fcc6cec4afc..19f6f8331c8d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_HELPERS_H_
 
 #include "xe_assert.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_sriov.h"
 #include "xe_sriov_types.h"
@@ -57,7 +58,7 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
 static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
-	return xe->sriov.pf.admin_only;
+	return xe_device_is_admin_only(xe);
 }
 
 static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 080cf10512f4..b0253e1ae5da 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -36,9 +36,6 @@ struct xe_sriov_metadata {
  * @XE_SRIOV_MODE_PF mode.
  */
 struct xe_device_pf {
-	/** @admin_only: PF functionality focused on VFs management only. */
-	bool admin_only;
-
 	/** @device_total_vfs: Maximum number of VFs supported by the device. */
 	u16 device_total_vfs;
 
-- 
2.43.0

