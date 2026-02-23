Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C03BEA4FC3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9F10E42C;
	Mon, 23 Feb 2026 14:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+CZWr5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C0E10E42B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855440; x=1803391440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVH0OMl14U8693Hp4HHQIDkyVoo/aJJLUF8ToVD2G38=;
 b=T+CZWr5ayVY5GT/gE1oXCjv3nryPEwc28kKaF9g/MxKO1PVhIVabZesc
 xj515gDcq78NW28geMvrUrlwU6iKwOEhxlqvawH6f6aAVTkhCq6gITjIM
 prSmmx2DD6W6rV3YYdg4m73VhDRgcu1IWO0rUVeuUvHBdrF18N/IE6U8x
 dPC5Tecqi3hskHhK4d8/75RK8CH5w6xwVOIIIG6epkj4yjIps5X4s7ncA
 3FUtFWAY7Q1bxPKPVLYj3sxbCJvugiK2jtPb3SctRJrBeyXN+cZFlQY2n
 zdr8tP8W725nQDoRTSCFg1WWn2KEw9HWtZxB8LdRlWqjrdTgwArqsJ7R0 A==;
X-CSE-ConnectionGUID: BTxHp6/XSS6EqlVssexqFg==
X-CSE-MsgGUID: eaB5TE1JRoOVkiKrGA2DrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460839"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:47 -0800
X-CSE-ConnectionGUID: 8v2f8cyqSNm9RPoNo2UtIQ==
X-CSE-MsgGUID: jgcbbdjkQTS7o/mHgsV9+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656263"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:43 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 03/22] drm/xe/eudebug: Add connection establishment
 documentation
Date: Mon, 23 Feb 2026 16:02:58 +0200
Message-ID: <20260223140318.1822138-4-mika.kuoppala@linux.intel.com>
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
index 768d07ae4af0..fa81b7a314f6 100644
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

