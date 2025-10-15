Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C42CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB7B10E3CA;
	Wed, 15 Oct 2025 09:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izJ/FCTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C51710E3AB
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760519578; x=1792055578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDx1Zj+ugH/DjIw/WRZimce4UhGs67XqwvTe0DyawRo=;
 b=izJ/FCTfvAZM8ZEjCooCdP6nXIeu08/8doCCVzXW32t8HPDY63EEv8sW
 mGtCzy8I3BJmioJqJYcvMXHYFsKLWDENjqQpIHjO53vFLQIffla3ULjeR
 xOwfxR6BGHrzOqeHvwTxtrLrswXq0YS9Eb6rbLpTmTC4z/CFH3gORQyAX
 /DUElf1z0XjDK7rdgOU8xtuOCCElMq+3wr5d9CrBN8PFzXqsa6KqLycq3
 JQtIGtWXpUdnkfHYOyopVCH6s4bMb0LneMPsq2gIfPoNquh1RbBT3ymEG
 ukGTbozr9EkaKM5r8i2MBkq6NF5K5V9IEYa54v6G0Qyb4NqB8NmYWBB+b g==;
X-CSE-ConnectionGUID: X+ZnvT/tScSBuvmgpFJQKw==
X-CSE-MsgGUID: EZgIxmYeQL+jfMNoo0lYAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66515813"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66515813"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:58 -0700
X-CSE-ConnectionGUID: 9Dod4bKBRoGWvyv/pHKHDw==
X-CSE-MsgGUID: puYbbynFSvWj45W031T7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="213065729"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/4] drm/xe/pf: Automatically provision VFs only in auto-mode
Date: Wed, 15 Oct 2025 11:12:07 +0200
Message-ID: <20251015091211.592-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015091211.592-1-michal.wajdeczko@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
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

We shouldn't attempt to auto-provision VFs once we allow other
provisioning methods. Make the code aware of the new condition.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 16 +++++++++-
 .../gpu/drm/xe/xe_sriov_pf_provision_types.h  | 32 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  4 +++
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index c24803312231..de7d925a110d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -9,6 +9,14 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
+#include "xe_sriov_pf_provision_types.h"
+
+static bool pf_auto_provisioning_mode(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return xe->sriov.pf.provision.mode == XE_SRIOV_PROVISIONING_MODE_AUTO;
+}
 
 static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
 {
@@ -30,7 +38,7 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 
 	for_each_gt(gt, xe, id) {
 		if (!pf_needs_provisioning(gt, num_vfs))
-			continue;
+			return -EUCLEAN;
 		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
 		result = result ?: err;
 	}
@@ -62,6 +70,9 @@ int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (!pf_auto_provisioning_mode(xe))
+		return 0;
+
 	return pf_provision_vfs(xe, num_vfs);
 }
 
@@ -78,6 +89,9 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (!pf_auto_provisioning_mode(xe))
+		return 0;
+
 	pf_unprovision_vfs(xe, num_vfs);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
new file mode 100644
index 000000000000..f72bc5db3a60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_PROVISION_TYPES_H_
+#define _XE_SRIOV_PF_PROVISION_TYPES_H_
+
+#include <linux/build_bug.h>
+
+/**
+ * enum xe_sriov_provisioning_mode - SR-IOV provisioning mode.
+ *
+ * @XE_SRIOV_PROVISIONING_MODE_AUTO: VFs are provisioned during VFs enabling.
+ *                                   Any allocated resources to the VFs will be
+ *                                   automatically released when disabling VFs.
+ *                                   This is a default mode.
+ */
+enum xe_sriov_provisioning_mode {
+	XE_SRIOV_PROVISIONING_MODE_AUTO,
+};
+static_assert(XE_SRIOV_PROVISIONING_MODE_AUTO == 0);
+
+/**
+ * struct xe_sriov_pf_provision - Data used by the PF provisioning.
+ */
+struct xe_sriov_pf_provision {
+	/** @mode: selected provisioning mode. */
+	enum xe_sriov_provisioning_mode mode;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 956a88f9f213..c753cd59aed2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
 /**
@@ -35,6 +36,9 @@ struct xe_device_pf {
 	/** @master_lock: protects all VFs configurations across GTs */
 	struct mutex master_lock;
 
+	/** @provision: device level provisioning data. */
+	struct xe_sriov_pf_provision provision;
+
 	/** @service: device level service data. */
 	struct xe_sriov_pf_service service;
 
-- 
2.47.1

