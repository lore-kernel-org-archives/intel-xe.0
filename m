Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4166EBFD2D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8098A8922E;
	Mon, 13 Apr 2026 09:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7xqTTaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3BA10E3BD
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 09:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776074209; x=1807610209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1j3oZDcrUeHaDPnAhUzqpjXHwHDBEwqvcqatmnIbsRg=;
 b=J7xqTTazpUax6GAClYL2KXSVuSX/G36K+d8myk9rdpMX5aljM5Q2oAcW
 wY4izvwmPYvcjTVcvZUE7nhWCfgjln08FPM3ZmtstCR9c+ZxX/7P3rwhd
 1ncwk/F12LcxjoIHPUaBbbYha5yJPYGfTOD3Mmvs53MdCtww2MZliXhJv
 IEiWwH81k5gPk1U3ygoi0H+qxFI4ITFO2eq4x54ARJTKfmSUhUgsaplan
 R4xOioLL3Z9JeJwdWx6TGllQ5Xs+gnUWq+v+0/O2XjFz7Rot8cwEzRmjD
 7ooG64w0z2zs1REVYpgM/tkwXAIE8eESa0KQrgVtxdsHVsJugMrEu/Dg/ g==;
X-CSE-ConnectionGUID: TUmyD375T3GurvkAw8Q5Pw==
X-CSE-MsgGUID: rAp6YnwhT1CcxgtFO9UH6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80866284"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80866284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:56:49 -0700
X-CSE-ConnectionGUID: yPacxPHKSWuhnG+7eriRug==
X-CSE-MsgGUID: nQak2YfPSq6BcyHs1+QI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234726560"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa005.jf.intel.com with ESMTP; 13 Apr 2026 02:56:48 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v12] drm/xe/pf: Derive admin-only PF mode from xe_device state
Date: Mon, 13 Apr 2026 09:56:38 +0000
Message-ID: <20260413095637.2871287-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409154423.2499340-6-satyanarayana.k.v.p@intel.com>
References: <20260409154423.2499340-6-satyanarayana.k.v.p@intel.com>
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
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V11 -> V12:
- Fixed nits.

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
index efa8963ec248..e6eaa94d4d30 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -13,11 +13,28 @@
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
+	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_device_is_admin_only(xe));
 }
 
 static void pf_set_usable_vram(struct xe_device *xe, u64 usable)
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

