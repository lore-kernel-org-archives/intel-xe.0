Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4589CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3310F6B6;
	Mon,  8 Jun 2026 16:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht2YU87h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0047810F6B6
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935438; x=1812471438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0qfyY32SlSwkdPdGRM239MP2ryR608wKy3cuc50NSA=;
 b=ht2YU87hThXs0isTeev4psM2sf0u8BRrDz/ZD6BfHwSZKuTV4EF/PHqD
 p8X4oAveZVZFHrqG3lbQv8E5uwVG/Dk9U987WXZ8bCIYeUggYp0qq8x+V
 tTSOM3agwiRxnYum3FcoW/6TmAkSzeckoL2M53JYqrkqxntn/ii8wjXA3
 NrurMs2oCF5FI/QaqztSXvrgxwHsqpBy4rSAwFY2K67hq465fqjs59bXB
 +5F5OfCuSppcTdu75NqkpMbp1mBFWzl8dueUfKD58p4uOR0PHVd4tu+AO
 jZYcV6d+wHNhtcz3iF/oF/K5jpHMeEDhx1Rsgl2XglNpz2k6cEHvROARE w==;
X-CSE-ConnectionGUID: pSZSO9XgRP+tHUOx0s6pUg==
X-CSE-MsgGUID: L6CMTW9GR8SPYR6Dqwmetw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531754"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:13 -0700
X-CSE-ConnectionGUID: JXPB92DkQeK+rYcxppcXfA==
X-CSE-MsgGUID: Q76Ith59QEe3HeolvzL85w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247457254"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:04 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 02/18] drm/xe/eudebug: Add documentation
Date: Mon,  8 Jun 2026 19:16:20 +0300
Message-ID: <20260608161639.1652127-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_eudebug.c     | 19 ++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_eudebug.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 665c0e93601c..a6888245899b 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
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
index 6f4ac6c83b56..4fdd4e8394da 100644
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
-- 
2.43.0

