Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205ECAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 01:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C915610E03E;
	Tue, 30 Sep 2025 01:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC4Bcoxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179AF10E03E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 01:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759197571; x=1790733571;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VgPtqIaS0m4fdsdsM8pF/Zcoh0+I+s8cl83sjRj1B/Y=;
 b=cC4BcoxxQGrOVf0yl5QT2Xe+ln/9jNfpGlGIzeZjSoBAfKAj1dwZGvUh
 +3Zq+B0N0Z+WK32OagPJIlJcKc9TLll6mgVlRLfiglbS5Nzye9ooO2FIl
 BkDzshe5mcZS2M2T2rkCu692Q/TT43IrxJVRzAWNG7RpCtXWL5EaX0CRj
 6bbNihbNejrdk3/bU/OmhekoabPG2fBd6XKl9S7gHnrkqlL4U0Eec87+d
 d5KOwE4zswksqcbsC7Kbuw35mppKuU/GQNv99gSKEXdOgeo+Dgzsyxrlo
 +u/auZQnA4OAeP/xWhlCKBlKtCe92HPgMMrgifjQi+EsMNdaVYTJHLaZl A==;
X-CSE-ConnectionGUID: QT7lGOXgTlSel9qWflndDQ==
X-CSE-MsgGUID: zH011q3SRN6SfgPb/jqdag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61490012"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61490012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 18:59:28 -0700
X-CSE-ConnectionGUID: orfkQU6ORC2anFyLTAfGHw==
X-CSE-MsgGUID: ls/HZE0yS16oNP5ymiMwlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178189018"
Received: from nvishwa1-desk1.sc.intel.com ([172.25.29.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 18:59:28 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/doc: Add documentation for Execution Queues
Date: Mon, 29 Sep 2025 18:59:02 -0700
Message-ID: <20250930015901.411468-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add documentation for Xe Execution Queues and add xe_exec_queue.rst
file.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/xe/index.rst         |  1 +
 Documentation/gpu/xe/xe_exec_queue.rst | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c     | 11 +++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_exec_queue.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 88b22fad880e..bc432c95d1a3 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -14,6 +14,7 @@ DG2, etc is provided to prototype the driver.
    xe_mm
    xe_map
    xe_migrate
+   xe_exec_queue
    xe_cs
    xe_pm
    xe_gt_freq
diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
new file mode 100644
index 000000000000..6877a154d771
--- /dev/null
+++ b/Documentation/gpu/xe/xe_exec_queue.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+================
+Execution Queue
+================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
+   :doc: Execution Queue
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 37b2b93b73d6..60e8b575db2c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -28,6 +28,17 @@
 #include "xe_vm.h"
 #include "xe_pxp.h"
 
+/**
+ * DOC: Execution Queue
+ *
+ * An Execution queue is an interface for the HW context of execution.
+ * The user creates an execution queue, submits the GPU jobs through those
+ * queues and in the end destroys them.
+ *
+ * Execution queues can also be created by XeKMD itself for driver internal
+ * operations like object migration etc.
+ */
+
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
 	XE_EXEC_QUEUE_TIMESLICE = 1,
-- 
2.43.0

