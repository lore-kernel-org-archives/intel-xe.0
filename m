Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D50CCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20E510E52B;
	Mon, 20 Oct 2025 21:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQcV9G1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3321510E52D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996734; x=1792532734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lqme8qTFvrZC2p3jEy907wAltZy70wzM65RdKYvpXY=;
 b=XQcV9G1iHdixhKiSJUH9mlGcYtJXxLFIpeGj+1qx/rDnJA3xzihi/c9Y
 85/h+LGzJHc4HtGMwy4Wz6Lncj84tFu6BLBYxZ8BFcroBSJT4qrHXqcrX
 omdZN35ykD3FPzZM+dphvA1TpIrGBRszhXEa2e13t25kQwU0y9wm70EBK
 yI7/q5U9Rrn18ZdH6lucV//tFC83/74yDSd+43VOv/7bUecrFNBFCqEbj
 RDnuz9JAph6NiQRh0jAPU6uSfDeBuzxwiUloXwd8pnzPUl3NMRiK3Ebuf
 qO9lUAjJJMjv2b67i5cmT4j7ViilPzSCrYaNjIJ7h3cIiEp8rYz+K0aU5 g==;
X-CSE-ConnectionGUID: eSD1HJRoQ/2M88AOTyb4LA==
X-CSE-MsgGUID: M9PdlV7ZSluR57hScHm7cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63025948"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63025948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:33 -0700
X-CSE-ConnectionGUID: agM9gXDdQXm59in6+m2rtg==
X-CSE-MsgGUID: IEwpFnYlRne1qQ5THE9mJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183451195"
Received: from dut4084arlh.fm.intel.com ([10.105.10.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/7] drm/xe/doc: Add GuC submission kernel-doc
Date: Mon, 20 Oct 2025 21:45:29 +0000
Message-Id: <20251020214529.354365-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020214529.354365-1-stuart.summers@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
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

Add some documentation for the different roles played by the XeKMD
in communication with the GuC through exec queue management and
the DRM scheduler.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 Documentation/gpu/xe/index.rst         |  1 +
 Documentation/gpu/xe/xe_guc_submit.rst |  8 +++
 drivers/gpu/drm/xe/xe_guc_submit.c     | 70 ++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index bc432c95d1a3..030268ddba87 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -15,6 +15,7 @@ DG2, etc is provided to prototype the driver.
    xe_map
    xe_migrate
    xe_exec_queue
+   xe_guc_submit
    xe_cs
    xe_pm
    xe_gt_freq
diff --git a/Documentation/gpu/xe/xe_guc_submit.rst b/Documentation/gpu/xe/xe_guc_submit.rst
new file mode 100644
index 000000000000..a82b5d57ee6a
--- /dev/null
+++ b/Documentation/gpu/xe/xe_guc_submit.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==============
+GuC Submission
+==============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
+   :doc: GuC Submission
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a11ae4e70809..fd05f73cd96b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -46,6 +46,76 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+/**
+ * DOC: GuC Submission
+ *
+ * The primary submission vehicle for the XeKMD is the GuC firmware.
+ * This includes creating, registering, and submitting exec queues
+ * (see :ref:`execution-queue`). Once submitted, actual hardware scheduling
+ * is handled fully by the GuC.
+ *
+ * To facilitate these operations, XeKMD makes use of the DRM scheduler
+ * to handle state changes and determine when jobs should be scheduled
+ * with the GuC.
+ *
+ * Queue Registration
+ * ==================
+ *
+ * Registration and deregistration of exec queues with the GuC involves
+ * creation of the ring (LRC) for that context. These are asynchronous
+ * actions by the XeKMD which completes that registration/deregistration
+ * process once the GuC responds that the hardware registration has
+ * completed.
+ *
+ * Queue Submission
+ * ================
+ *
+ * The GuC has a parameter for each context indicating whether that
+ * context can be scheduled with the associated engine. After registration
+ * has completed, the KMD, typically as a reaction to a request from
+ * the user exec IOCTL call, will issue a schedule request with the
+ * GuC. The GuC will then add that to its schedule for contexts
+ * and will in turn schedule this with the command streamer based
+ * on time slice availability.
+ *
+ * Queue Destruction
+ * =================
+ *
+ * As mentioned above, before destroying a queue, it must first be
+ * deregistered. In the typical case, this happens first by sending
+ * a schedule disable request, then on confirmation from the GuC,
+ * a deregistration request. Only after that deregistration response
+ * will the XeKMD free resources associated with that queue such as
+ * the LRC.
+ *
+ * Engine Resets
+ * =============
+ *
+ * Any time more than one context is being scheduled by the GuC, the GuC
+ * will give each context a certain configurable time slice. If a context
+ * exceeds this time slice, the GuC will reset the engine and notify the XeKMD
+ * along with an engine state at the time of the reset. The XeKMD will then
+ * resubmit any outstanding jobs to that engine. If a particular job has been
+ * resubmitted in this way more than once, the associated exec queue will be
+ * marked banned and will no longer be schedulable on that engine.
+ *
+ * Queue Wedging
+ * =============
+ *
+ * On device wedging (see :ref:`device-wedging`), each exec queue is also marked
+ * as wedged. This includes taking a reference to that device and adding a
+ * dereference on driver teardown. This additional reference allows a user
+ * to collect certain debug information about the exec queue prior to driver
+ * unbind.
+ *
+ * There are some instances where the device wedge might not take a reference
+ * in this way, for instance, if the context is in the process of being
+ * deregistered with the GuC at the time of the wedge. In this case, a
+ * reference to that exec queue should already be available and any
+ * associated data structures will be cleaned up later in the teardown
+ * sequence.
+ */
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
-- 
2.34.1

