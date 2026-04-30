Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565CFCCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F91810F2E3;
	Thu, 30 Apr 2026 10:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z39tDtBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060D910F2E3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546321; x=1809082321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LI1rwyG82LA3Dd3u5mott9FnjiZVzF/sM1EElg1LwAk=;
 b=Z39tDtBr00Uad/uKyW7eyltJOmWbx45L4x31H0gr0oXMtJgvNbT6ghiq
 +R+My7htnHyRRpG+WkJOR7lIRME+EyzmApSQCSsmnVUgNDdrvtFcOfmqf
 qIQFP4A8lYymOnj36sIwy4lqRkk4+e8YXzoghKc5Uof9D4RIh6DKnRylZ
 zdYM9a5MYZCZvK/ky3n46ujFDHWXwktVjTh7b4Oj60EK18qG7ZVRnds1I
 Ebrm9FIEPbi0bbOq1FGCbV3WQs2BIgVJDWXikwoIM0B8T/5x9JRg8ieZ8
 Dc1IEgIQwlaCAKzdmEvTEBeT54ggl30XfnebgxH/x2/SUis+t7tzSxOej A==;
X-CSE-ConnectionGUID: wZF57oZFTgaMWXU84tiIew==
X-CSE-MsgGUID: Q9TXjimqTSmBOGuy7YLz6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585876"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585876"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:01 -0700
X-CSE-ConnectionGUID: 6NvpJIVQQTehXFUw23rvWw==
X-CSE-MsgGUID: I37G5JGlR1+/sqeldaQkIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518466"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:51:56 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 02/24] drm/xe/eudebug: Add documentation
Date: Thu, 30 Apr 2026 13:50:58 +0300
Message-ID: <20260430105121.712843-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

Add a core documentation for connection setup and events.
Followup patches can then incrementally add their workings.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/index.rst      |  1 +
 Documentation/gpu/xe/xe_eudebug.rst | 45 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.c     | 41 ++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_eudebug.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 874ffcb6da3a..3055b3ede093 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_eudebug
diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
new file mode 100644
index 000000000000..ff7fbc403ebb
--- /dev/null
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+===================================
+Xe EU Debug (eudebug)
+===================================
+
+Overview
+========
+
+The EU Debug (eudebug) subsystem provides an interface for debugging
+Execution Unit (EU) workloads on Intel Xe GPUs, independently from
+CPU process debugging. This enables tools like GDB (via gdbserver-intelgt)
+to debug GPU compute workloads through the Level-Zero Debug API.
+In practice, this means that SYCL/DPC++ workloads submitted by the
+compute-runtime can be debugged interactively at this time.
+
+
+Connection Establishment
+========================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_eudebug.c
+   :doc: Connection Establishment
+
+Events
+======
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_eudebug.c
+   :doc: Events
+
+
+Base Event Header
+-----------------
+
+The debugger receives events by reading from the eudebug file descriptor
+using an read_event ioctl. Every event has :c:type:`drm_xe_eudebug_event`
+as a header
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event
+
+Resource Event Types
+--------------------
+
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+   :identifiers: drm_xe_eudebug_event_vm
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 02ecdbca46ff..f1d17f03054e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -18,6 +18,25 @@
 #include "xe_macros.h"
 #include "xe_vm.h"
 
+/**
+ * DOC: Connection Establishment
+ *
+ * To debug a target DRM client, the debugger must first establish
+ * a connection using :c:type:`drm_xe_eudebug_connect`.
+ *
+ */
+
+/**
+ * DOC: Events
+ *
+ * Resource creation/destruction and hardware state changes are
+ * delivered as events for debugger.
+ *
+ * To read an event, ioctl DRM_XE_EUDEBUG_IOCTL_READ_EVENT command
+ * can be issued with prefilled :c:type:`drm_xe_eudebug_event` as argument.
+ *
+ */
+
 /*
  * If there is no detected event read by userspace, during this period, assume
  * userspace problem and disconnect debugger to allow forward progress.
@@ -813,6 +832,17 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 	return ret;
 }
 
+/**
+ * xe_eudebug_ioctl - Issue a command to eudebug interface
+ *
+ * @file : eudebug file (returned from connect)
+ * @cmd : cmd
+ * @arg : arguments depending on cmd
+ *
+ * Issue a eudebug command
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
 static long xe_eudebug_ioctl(struct file *file,
 			     unsigned int cmd,
 			     unsigned long arg)
@@ -1029,6 +1059,17 @@ void xe_eudebug_init(struct xe_device *xe)
 	drm_warn(&xe->drm, "eudebug disabled, init fail: %d\n", err);
 }
 
+/**
+ * xe_eudebug_connect_ioctl - Connect to eudebug interface
+ * @dev : DRM device
+ * @data : ioctl data, (struct drm_xe_eudebug_connect)
+ * @file : DRM file
+ *
+ * Connect to the eudebug interface.
+ *
+ * Return: eudebug filedesriptor on success, negative error code on failure.
+ *
+ */
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
 			     struct drm_file *file)
-- 
2.43.0

