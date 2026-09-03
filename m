Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE1C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95E10F653;
	Thu,  3 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4ajLhdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B610F653
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447616; x=1819983616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f0N77XNmwk3+OcCAXt3xy0hUDBiyUqW49NvGnkV32CQ=;
 b=Q4ajLhdUg28V5aWN/Pcf4u2IB0IZoT0i6w3iIVnTuciYqCod8lZWbNe5
 PQh5ZyZOQOXt6xtJONU2PTHl3naQK2DH426KDxUgvKrhgeBRC+7GbfbgI
 6rSoUyLVoOYVeHkMe9IvCZNv199fEN9K8KdrgfmgusEajDpmLglnggeeA
 wNBbwbm+VSg0EureHncvmxONLxcL3+mv0xbIr7d2fjU8RlwvuKbB35HAE
 kriwlVGSQE9FjSVnjwCpr5x8Bb9CjrGR/Xn65q7bGz1btRBlVBE5nVRyF
 bRYtLoEof6mbbTm0PpMEDT6MlmvgLwy0hiWGRfhlfVOq1BED8bGyKwbT2 Q==;
X-CSE-ConnectionGUID: nJDCm5c7TyuADEPOsephsQ==
X-CSE-MsgGUID: ob8aQtoBQSq2EpiVDWtR6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486614"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:15 -0700
X-CSE-ConnectionGUID: z0I7KGuESyqYOuBcb4htQQ==
X-CSE-MsgGUID: 7gwsD5wpSYaq7HP5HsPFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440376"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:10 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 02/27] drm/xe/eudebug: Add documentation
Date: Thu,  3 Sep 2026 17:59:26 +0300
Message-ID: <20260903145952.848051-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Add core documentation for connection setup and events.
Follow-up patches can then incrementally add their workings.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 Documentation/gpu/xe/index.rst      |  1 +
 Documentation/gpu/xe/xe_eudebug.rst | 45 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.c     | 19 ++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_eudebug.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 0247a255f7e6..8d4abdfe71a7 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_configfs
    xe_gt_stats
    xe_sigid
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
index 9fe073f60680..f46869ebaf22 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -20,6 +20,25 @@
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
 #define cast_event(T, event) container_of((event), typeof(*(T)), base)
 
 static const struct rhashtable_params rhash_res = {
-- 
2.53.0

