Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D562CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F011341C;
	Wed, 10 Apr 2024 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKNvVR0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF60011341C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712768642; x=1744304642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKhi8HXj5WvtBYPvpUUJGX3ZfaaO7QL51+70dOiUMn0=;
 b=cKNvVR0Oq11UL5Eee6HvxWOTQSJNF4Qg41gtvyHU1/FuoaNwwsX2+XUk
 4uCnFdG3CnF0dfO7ZLbxNI+59RIJ3sCIzZJZ4o8DBrIKAXL1Q2H4iCYHf
 W7Uu6KGw07tP3rX5TuNtvogH/WT28SoYSiyCmukOLhxkJ6o3ltm9AmEL1
 75RmwJ/O3ybVw2xdSvkvg/S/RmugP5yXM+Px+P0yUqrngSfwOENC38NXK
 5vOSoqqtcxkqhAykuJ76US0Ubz1Ib/DVZBvpwlKBCgHXrijTweSfMCaf+
 FVJrixq2TqAMi3pqZgcXNEep6jA3f2WEtPzPo6NFIC/mnYfA2atO5XZPY w==;
X-CSE-ConnectionGUID: A9umSb04Ql+A8pwzoOEgnQ==
X-CSE-MsgGUID: 8fSJobnWTbm/+v+Z5u58Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18707630"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18707630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:02 -0700
X-CSE-ConnectionGUID: dcGKfVe8TeizrNKFc+1otQ==
X-CSE-MsgGUID: MrqMUILkQzOjlu8Y2cNwLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25401932"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/5] drm/xe/pf: Introduce mutex to protect VFs
 configurations
Date: Wed, 10 Apr 2024 19:03:34 +0200
Message-Id: <20240410170338.1199-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240410170338.1199-1-michal.wajdeczko@intel.com>
References: <20240410170338.1199-1-michal.wajdeczko@intel.com>
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

PF driver will maintain configurations and resources for every VF
and this data could span multiple tiles and/or GTs.  Prepare mutex
to protect data that we will add in upcoming patches.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf.c    | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h    |  6 ++++++
 drivers/gpu/drm/xe/xe_sriov_types.h |  4 ++++
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index d324f131e3da..1b40f5de9ef5 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -94,6 +94,13 @@ int xe_sriov_init(struct xe_device *xe)
 	if (!IS_SRIOV(xe))
 		return 0;
 
+	if (IS_SRIOV_PF(xe)) {
+		int err = xe_sriov_pf_init_early(xe);
+
+		if (err)
+			return err;
+	}
+
 	xe_assert(xe, !xe->sriov.wq);
 	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
 	if (!xe->sriov.wq)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 030c2b69ecc4..0f721ae17b26 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -3,6 +3,8 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_module.h"
@@ -70,6 +72,19 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
 	return true;
 }
 
+/**
+ * xe_sriov_pf_init_early - Initialize SR-IOV PF specific data.
+ * @xe: the &xe_device to initialize
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_init_early(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
+}
+
 /**
  * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
  * @xe: the &xe_device to print info from
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index ebef2e01838a..d1220e70e1c0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -13,12 +13,18 @@ struct xe_device;
 
 #ifdef CONFIG_PCI_IOV
 bool xe_sriov_pf_readiness(struct xe_device *xe);
+int xe_sriov_pf_init_early(struct xe_device *xe);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
 static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
 {
 	return false;
 }
+
+static inline int xe_sriov_pf_init_early(struct xe_device *xe)
+{
+	return 0;
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index fa583e8fa0c2..c7b7ad4af5c8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_TYPES_H_
 
 #include <linux/build_bug.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 
 /**
@@ -50,6 +51,9 @@ struct xe_device_pf {
 
 	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
 	u16 driver_max_vfs;
+
+	/** @master_lock: protects all VFs configurations across GTs */
+	struct mutex master_lock;
 };
 
 #endif
-- 
2.43.0

