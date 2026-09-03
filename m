Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FCCC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840210F668;
	Thu,  3 Sep 2026 15:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUxx2dwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10F110E154
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447620; x=1819983620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6Rys9VH6cYn33XOdAD4Zmgpq1cl9Y+oHpqyvmcZnFw=;
 b=kUxx2dwen+rw8Fg8J4bkV66RAStI4U+NV55UxM8E17oyNvJtM4sHUCNB
 ZG+Nkb437qPQkjFUSJnfkr30p4YQCtVPq4zbXZ2XdvJxfsESiqctOhUCl
 R3OonOuWRy6PARcU+sNssrRFS16MbId99byaqNt1657pIoxhGN46sVsPp
 FNCC2CUyzfW5EBg1YewoMToXhmrwQohGHLEO5pPOPVBBhv6ifXyF9b6vV
 2foCwdQIiI57qTLqTtt+ckFrCdwOXd4BWIdsksDDd394nLLl1cgiYzdEF
 N5Bj6EKp1NXG/TkshdYMdCX1ZcHMWQi8L5/Wla1gOqRFI21OxwHn1iQfx Q==;
X-CSE-ConnectionGUID: Gg8tkvszTZK+L3Ww9SE6lA==
X-CSE-MsgGUID: 4Lee+usbRt6zLFXQ47nfOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486623"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:20 -0700
X-CSE-ConnectionGUID: cpOXeEudR960ysnrFXsRCA==
X-CSE-MsgGUID: OxcbVqy2ST6+AlEFQ7ICVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440444"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:15 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 03/27] drm/xe/eudebug: Add connection establishment
 documentation
Date: Thu,  3 Sep 2026 17:59:27 +0300
Message-ID: <20260903145952.848051-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Add documentation for connecting to a target DRM Xe client
for debugging.

v2: improved Pipe and Fork documentation (Sashiko)
v10: qualify the ptrace_may_access() parity claim per fd
     acquisition method (Claude)

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/xe_eudebug.rst | 11 ++++
 drivers/gpu/drm/xe/xe_eudebug.c     | 86 +++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

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
index f46869ebaf22..835dbd7309af 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -26,6 +26,92 @@
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
+ * For a remote process, possession of that process's DRM client fd is
+ * the capability: the connect ioctl adds no credential check of its own.
+ * What sets the bar is therefore how that fd was obtained.
+ *
+ * Taking an fd from a process that did not offer it goes through
+ * pidfd_getfd(), and the kernel enforces credentials there.
+ * __pidfd_fget() requires ptrace_may_access() with
+ * PTRACE_MODE_ATTACH_REALCREDS, under the target's
+ * signal->exec_update_lock. That is the same check, under the same lock,
+ * that /proc/<pid>/mem takes in mm_access(), so for this path the same
+ * ptrace_may_access() rules apply as in CPU process debugging with gdb.
+ * Most of the acquisition methods below end up here, including those
+ * that only use procfs to discover which fd number to ask for.
+ *
+ * Two methods do not involve ptrace_may_access(), because nothing is
+ * being taken. With SCM_RIGHTS the target sends its own fd over a unix
+ * socket, which is the target consenting. With fork() inheritance the fd
+ * belonged to the debugger before the fork and the child merely
+ * inherited a copy of it.
+ *
+ * See :ref:`File Descriptor Acquisition Methods <fd_acquisition_methods>`.
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
2.53.0

