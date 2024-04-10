Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDB1CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6810E7E8;
	Wed, 10 Apr 2024 17:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv3xYHiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7479411341E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712768644; x=1744304644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQbydMIQVquEclrPddDKimZApiv3Q5XpiHhsc2CzVrw=;
 b=Tv3xYHiAFR0C2pESDCpDc9HNZNQZ7mBg78wAokCVfJ1xGVTSFU9JhLK6
 g2/yGrOYLSMxn4jGKOFRZqxy7V+VNQn9Wx0XCaGbQm3ZVKZthPiVgbWfz
 8EKNyt5ySNBt8C3jfAlnVbMdwSY3ialjWvbmP0dXotdApyrFdOn44Tv7F
 kCK8QVLVp8L7a+O7Cm3yOw/wuLUFSgQGG8lypERWOf7YU91WjPmx/t7xX
 R0W+YVDLG8MotMjM27kzp8OCpywGAMK0djLYHPG7+9yH22uOHtDW4zLLc
 f2Q2SbTaaLJ3DOMqTw58lWyxrU2w/a8ylVnUqWzZE1I7WpFSXNRnV4KeP A==;
X-CSE-ConnectionGUID: Z4EnXJ0XSOm9Iiuff6GH7Q==
X-CSE-MsgGUID: 7wEG+K9kSYumrP7+/Pgr8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18707633"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18707633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:03 -0700
X-CSE-ConnectionGUID: SjAJNr6VTjuur9n36s5LDA==
X-CSE-MsgGUID: sa6q+zUvRjeEORE7wRtx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25401936"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/5] drm/xe/pf: Introduce helper functions for use by PF
Date: Wed, 10 Apr 2024 19:03:35 +0200
Message-Id: <20240410170338.1199-3-michal.wajdeczko@intel.com>
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

PF driver will maintain VF's configuration data mostly on the
GT level, but some internal data is located at the device level.

To allow easy access to that data from the GT level functions, and
to minimize code duplications, introduce set of helper functions
and macros for explicit use by the PF driver.

We will use these helpers in upcoming patches.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
--
v2: kernel-doc fix (CI.Hooks)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h | 35 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h    | 46 +++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
new file mode 100644
index 000000000000..0bf12d89ceb2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_HELPERS_H_
+#define _XE_GT_SRIOV_PF_HELPERS_H_
+
+#include "xe_gt_types.h"
+#include "xe_sriov_pf_helpers.h"
+
+/**
+ * xe_gt_sriov_pf_assert_vfid() - warn if &id is not a supported VF number when debugging.
+ * @gt: the PF &xe_gt to assert on
+ * @vfid: the VF number to assert
+ *
+ * Assert that &gt belongs to the Physical Function (PF) device and provided &vfid
+ * is within a range of supported VF numbers (up to maximum number of VFs that
+ * driver can support, including VF0 that represents the PF itself).
+ *
+ * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
+ */
+#define xe_gt_sriov_pf_assert_vfid(gt, vfid)	xe_sriov_pf_assert_vfid(gt_to_xe(gt), (vfid))
+
+static inline int xe_gt_sriov_pf_get_totalvfs(struct xe_gt *gt)
+{
+	return xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
+}
+
+static inline struct mutex *xe_gt_sriov_pf_master_mutex(struct xe_gt *gt)
+{
+	return xe_sriov_pf_master_mutex(gt_to_xe(gt));
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
new file mode 100644
index 000000000000..7d156ba82479
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_HELPERS_H_
+#define _XE_SRIOV_PF_HELPERS_H_
+
+#include "xe_assert.h"
+#include "xe_device_types.h"
+#include "xe_sriov.h"
+#include "xe_sriov_types.h"
+
+/**
+ * xe_sriov_pf_assert_vfid() - warn if &id is not a supported VF number when debugging.
+ * @xe: the PF &xe_device to assert on
+ * @vfid: the VF number to assert
+ *
+ * Assert that &xe represents the Physical Function (PF) device and provided &vfid
+ * is within a range of supported VF numbers (up to maximum number of VFs that
+ * driver can support, including VF0 that represents the PF itself).
+ *
+ * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
+ */
+#define xe_sriov_pf_assert_vfid(xe, vfid) \
+	xe_assert((xe), (vfid) <= xe_sriov_pf_get_totalvfs(xe))
+
+/**
+ * xe_sriov_pf_get_totalvfs() - Get maximum number of VFs that driver can support.
+ * @xe: the &xe_device to query (shall be PF)
+ *
+ * Return: Maximum number of VFs that this PF driver supports.
+ */
+static inline int xe_sriov_pf_get_totalvfs(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	return xe->sriov.pf.driver_max_vfs;
+}
+
+static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	return &xe->sriov.pf.master_lock;
+}
+
+#endif
-- 
2.43.0

