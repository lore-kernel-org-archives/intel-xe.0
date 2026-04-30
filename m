Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7184ECCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBD310F304;
	Thu, 30 Apr 2026 10:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCEYIIc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A07D10F304
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546327; x=1809082327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0H0pR6hUhcG04tRFaAYzTKNFicBRy5jVQ9S8bWEdXs=;
 b=JCEYIIc7soNyvjhWy/ATCDXwU/xGpeZkdGttoNzMIukvS95Wqd7Bpnyp
 T4P8FOfGHJ0zK0fol3AslxTcZetp66hGyrk12aRheOGIhNaqWrNIRJFCd
 iDGuTi4FT6IxPn4RGfhEJXT7zYHyMhj3IHE30S7PX7ok+7EXiQldI5AQf
 Bm8/g5pQRWDgoJrpNfDOle6fUrwb6mJN6sf1CLOf+V4qcKBwQ9sfvYV5Y
 TaKDNi+ji97zVUHObD3IZV+eWmPrOV63PamxG1QJ13DqvcPaSg7Zc0zsr
 Jurh3fUyr+NKBHhA8zqHYCx8N1VSEIHLgiWfQVBYLL8zEIj+e0CWmhruC A==;
X-CSE-ConnectionGUID: tnA7JVIbTM6XjacKZHgWow==
X-CSE-MsgGUID: liSUkV4MQjSmN3gF9u54aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585888"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:06 -0700
X-CSE-ConnectionGUID: nxXM8FAzSXWbbhOqcoMvUg==
X-CSE-MsgGUID: DINl2764SeK14OPdLd11HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518492"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:01 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 03/24] drm/xe/eudebug: Add connection establishment
 documentation
Date: Thu, 30 Apr 2026 13:50:59 +0300
Message-ID: <20260430105121.712843-4-mika.kuoppala@linux.intel.com>
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

Add documentation for connecting to a target DRM Xe client
for debugging.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst | 11 +++++
 drivers/gpu/drm/xe/xe_eudebug.c     | 70 +++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/gpu/xe/xe_eudebug.rst b/Documentation/gpu/xe/xe_eudebug.rst
index ff7fbc403ebb..c21fa7c47ab8 100644
--- a/Documentation/gpu/xe/xe_eudebug.rst
+++ b/Documentation/gpu/xe/xe_eudebug.rst
@@ -21,6 +21,17 @@ Connection Establishment
 .. kernel-doc:: drivers/gpu/drm/xe/xe_eudebug.c
    :doc: Connection Establishment
 
+File Descriptor Acquisition Methods
+-----------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_eudebug.c
+   :doc: File Descriptor Acquisition Methods
+
+Security Model
+--------------
+.. kernel-doc:: drivers/gpu/drm/xe/xe_eudebug.c
+   :doc: Security Model
+
 Events
 ======
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index f1d17f03054e..f661b3ae9c9a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -24,6 +24,76 @@
  * To debug a target DRM client, the debugger must first establish
  * a connection using :c:type:`drm_xe_eudebug_connect`.
  *
+ * The debug target's DRM client file descriptor is passed into the
+ * connect ioctl via :c:member:`drm_xe_eudebug_connect.fd`.
+ * This is the fd that the target process obtained from open('/dev/dri/cardX').
+ *
+ * This file descriptor must be a valid DRM client fd in the debugger's
+ * (calling) process context. For debugging an Xe DRM client in
+ * another process, pidfd_getfd() can be used to acquire a duplicate
+ * of the file descriptor from the target process. See
+ * :ref:`File Descriptor Acquisition Methods <fd_acquisition_methods>` for
+ * details on how to obtain the target's fd.
+ *
+ */
+
+/**
+ * DOC: Security Model
+ *
+ * If you are inside the same process, you can connect to your own DRM client
+ * by simply passing its fd to drm_xe_eudebug_connect.
+ *
+ * The security model for connecting to a remote process uses
+ * file descriptor access via pidfd_getfd(). The kernel enforces
+ * credentials with ptrace_may_access(). So in order to connect to a
+ * remote DRM client, the same ptrace_may_access() checks apply
+ * as in CPU process debugging with gdb.
+ *
+ */
+
+/**
+ * DOC: File Descriptor Acquisition Methods
+ * .. _fd_acquisition_methods:
+ *
+ * There are multiple ways to get the target DRM client fd for
+ * another process:
+ *
+ * Unix domain socket
+ *     The debugger can receive the DRM client fd from the target via a Unix
+ *     domain socket using SCM_RIGHTS ancillary data. This is the standard
+ *     mechanism for passing file descriptors between processes, but requires
+ *     coordination to establish the socket connection.
+ *
+ * Pipe
+ *     The debugger can acquire the DRM client fd through a pipe from the target.
+ *     This requires coordination between the processes to establish
+ *     a pipe to deliver the fd.
+ *
+ * Fork
+ *     If the debugger spawns the target process, the DRM client fd can be
+ *     inherited across fork(). The debugger opens the DRM device before
+ *     forking, and the child process inherits the fd. This is useful
+ *     when the debugger launches the target, similar to how gdb launches
+ *     programs for debugging.
+ *
+ * Ptrace
+ *     The debugger can attach to the target process using ptrace. It can
+ *     intercept the return value of the target's open() or drmOpen() call
+ *     by inspecting registers at syscall exit to catch the fd when it is
+ *     created. Alternatively, if the target has already opened the device,
+ *     the debugger can read the target's memory using PTRACE_PEEKDATA to
+ *     locate the stored fd value in a known variable or data structure.
+ *     Once the fd number is known, pidfd_getfd() can be used to acquire a
+ *     duplicate in the debugger's process context.
+ *
+ * Procfs
+ *     The debugger can look through /proc/<targetpid>/fd for file descriptors
+ *     and inspect /proc/<targetpid>/fdinfo to see which of those
+ *     are for an Xe DRM client.
+ *
+ * Brute force
+ *     The debugger can traverse /proc/<targetpid>/fd descriptors
+ *     and try to connect to each to see if it succeeds.
  */
 
 /**
-- 
2.43.0

