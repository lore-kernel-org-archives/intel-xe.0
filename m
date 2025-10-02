Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F44ACAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 04:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19CF10E16B;
	Thu,  2 Oct 2025 04:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fxaznuov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B5A10E16B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759379477; x=1790915477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SrwQCH/wflhObKRAZrykbrKFI53a7tHrusazNGMWkm0=;
 b=Fxaznuovwjt8OGrRg/p/FiOzuaOtJQAGc5kVqg3yAeHcXb+my1Uo11c2
 Ma33aWA5zN6Z0j7QFBOb6aSCBJG2CTDjepe+jzPgkPnvwfvtJ6vE+nzk6
 RoMde4DQshYltpgbFWT5FcU6LofQ+cOejBlTHpt6qvtT7uc/IbLNd+jgG
 pbVKWD+m8Zmw4/Mejo6BeBv5yIuOp5deqTzZ0odGOt8oklQiSoJtqpUxr
 gU1VO/weArGTfkGhQEjg1GIW19lVrwBciG2jrT7VL8ai6OXX+SrvIIkBu
 J0QFjZvFYZfy2Pxe2+0BqORjxHV4o7IZYu56Xr+MFZk5X3pr2MIWsQG/2 A==;
X-CSE-ConnectionGUID: 0VKQuf0lTRC7jv+TAk6/cQ==
X-CSE-MsgGUID: wtBMZgiMS4iY2F0n1fbl9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79313615"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="79313615"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 21:31:16 -0700
X-CSE-ConnectionGUID: LvS2zbvATrSVLIc8tI3fkw==
X-CSE-MsgGUID: LDDIKHvRS9GjxTkEa/DRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="184245702"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 21:31:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2] drm/xe/doc: Add documentation for Execution Queues
Date: Wed,  1 Oct 2025 21:31:09 -0700
Message-ID: <20251002043108.449716-2-niranjana.vishwanathapura@intel.com>
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

v2: Add info about how Execution queue interfaces
    with other components in the driver (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 Documentation/gpu/xe/index.rst         |  1 +
 Documentation/gpu/xe/xe_exec_queue.rst | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c     | 24 ++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
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
index 37b2b93b73d6..c2fc88f2176a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -28,6 +28,30 @@
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
+ *
+ * An execution queue is associated with a specified HW engine or a group of
+ * engines (belonging to the same tile and engine class) and any GPU job
+ * submitted on the queue will be run on one of these engines.
+ *
+ * An execution queue is tied to an address space (VM). It holds a reference
+ * of the associated VM and the underlying Logical Ring Context/s (LRC/s)
+ * until the queue is destroyed.
+ *
+ * The execution queue sits on top of the submission backend. It opaquely
+ * handles the GuC and Execlist backends whichever the platform uses, and
+ * the ring operations the different engine classes support.
+ *
+ */
+
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
 	XE_EXEC_QUEUE_TIMESLICE = 1,
-- 
2.43.0

