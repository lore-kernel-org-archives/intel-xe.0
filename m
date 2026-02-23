Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053CBEA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABD010E42A;
	Mon, 23 Feb 2026 14:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuJFTxGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049E410E42A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855436; x=1803391436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sFOTHsHqSC83vSPUdri6F9YYEESswf+cEiSfh0r3eMg=;
 b=XuJFTxGjVaJiVA/xk08zZ1sBxhTwKv7jWa+/jPuvAeWcvnSp1XnDpuWB
 73p9ACZU3xznufUsNbxwIW7Lh1A/lkPsCLtnNt2C2j3qaYYHEknj2i+Lf
 6xQgxCDL6Nk+KFRn3sghOOAIISZtwKR0gpsK2HlLK4vgNrbgCxnD+v24A
 H72phUzoA6GFiUg6pLO3sCgmpGXgv6X6mJ7a2REE0Y9tQBDk/7Iuck3yS
 77SmDVekMfmG/cEUZiY9PUGG8QNNtbWUanfPj/oX0e1iC9aoq3wieSrdq
 1iB9hSUOANIsOge2TkZNOf9uAJRXO+wnLxf2vqTJ6ouvOES9SiaJ1n3Vk A==;
X-CSE-ConnectionGUID: DtSEuggCQ2qEGcfGpzLWXA==
X-CSE-MsgGUID: V1pFweQvQ9uu54sEjom37Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460814"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:45 -0800
X-CSE-ConnectionGUID: FUJwa9E7SEWwq2cW/BnFYg==
X-CSE-MsgGUID: Ky3wxEuVTu2pQbe8uLYPEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656242"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:39 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 02/22] drm/xe/eudebug: Add documentation
Date: Mon, 23 Feb 2026 16:02:57 +0200
Message-ID: <20260223140318.1822138-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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
index bc432c95d1a3..34e2f32a96ca 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -29,3 +29,4 @@ DG2, etc is provided to prototype the driver.
    xe_device
    xe-drm-usage-stats.rst
    xe_configfs
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
index 2b7e4afa9b54..768d07ae4af0 100644
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
@@ -812,6 +831,17 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
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
@@ -1016,6 +1046,17 @@ void xe_eudebug_init(struct xe_device *xe)
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

