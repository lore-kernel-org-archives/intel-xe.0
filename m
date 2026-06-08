Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD2CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050710F6B3;
	Mon,  8 Jun 2026 16:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQa8kAvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3910F6B7
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935438; x=1812471438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=piDyTEoB3dwfFR6020CUDbUqaTofZ+rf4w2nYeo/WUE=;
 b=dQa8kAvx0rG6mi/Q+fi6Qnl6MzB4w9bzTZRC7PXuGyE/fosD91xPmuPp
 NVtW1J3aro7uKI1j7t+RcBCUtL29yxKyLzKOHkQbNQ40yoE8u7h8GR/Hs
 fYNW012MVHQghhkf0/P80vgZeWhjUfKTlIWRGIFn/nEDF9lC362lfCcsP
 SPrEH/CuwyuhX1WGAK5IhwosizD9058/A+rIanUEdMrWzisRAp5RoM18d
 VqsFJmAwYOdWC9nREXTH90Wr9zr3GR6vfgSoDJClMO7kBmt8i3B0b6V97
 CWDlAIFOJCLe0IqzEnWaKiTffOiKU+iqdCPOIQRKkbrEhTCnlPYyTk6zd w==;
X-CSE-ConnectionGUID: nopNqkSNTxeVc62BXG0q/g==
X-CSE-MsgGUID: RRThfO7HR9epfG4Ta8Eszw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531769"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:15 -0700
X-CSE-ConnectionGUID: ++M3W6IPSPqujqdZo9qoCg==
X-CSE-MsgGUID: Mckpk87PTTWO5HwIwwosWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247457316"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:11 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 03/18] drm/xe/eudebug: Add connection establishment
 documentation
Date: Mon,  8 Jun 2026 19:16:21 +0300
Message-ID: <20260608161639.1652127-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

v2: improved Pipe and Fork documentation (Sashiko)

Add documentation for connecting to a target DRM Xe client
for debugging.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst | 11 +++++
 drivers/gpu/drm/xe/xe_eudebug.c     | 71 +++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

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
index 4fdd4e8394da..88c6065f31d1 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -24,6 +24,77 @@
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
+ *     The target sends the fd number through a pipe, and the debugger
+ *     duplicates it via pidfd_getfd(). This requires coordination between
+ *     the processes to establish the pipe and synchronize the transfer.
+ *
+ * Fork
+ *     If the debugger spawns the target process via fork(), a DRM client
+ *     fd can be shared across the fork boundary — either inherited by the
+ *     child from the debugger, or acquired from the child by the debugger
+ *     via pidfd_getfd() after the child opens the device. This is useful
+ *     when the debugger launches the target directly, similar to how gdb
+ *     spawns inferiors.
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

