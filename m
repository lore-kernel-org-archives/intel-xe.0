Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ECDC7EE45
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jun 2023 00:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4265210E17A;
	Sat, 10 Jun 2023 00:12:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACE710E16F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jun 2023 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686355951; x=1717891951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GvBOu0Cx8p1F3vDvlqGn7yeVnq0jB8MOC4QsVKF9oKo=;
 b=mlk+LQ5wCCSkoqW9cDr4KKRUTCdQhRskIh+zieZaTPgfnqPy9QNnTKj1
 Y2QuKjcsSCtoMzNbDwmeONSXJ2cw0XHopcHzRva62XaRKLla7Q0941vBL
 LAaH96ZV7T/ZCoPmO+xCBDUZ2xCbJ3D9HRpr2AAAzc/7BgogKX57/Per6
 ylV5yiy8quDWhrD3E6ADj0dAtMhFBVhe3LT/28Yz9XGm+4qMF3JDXfEMv
 vu0QVX5qRG/mAtyS1dXE6PWZLUULjYwpeSD8KbiRO4ErweTWaglxZ6/uI
 yhJbs/uuERBrSGbVuBXZA6b/6xVVZQDODKPlBVVgCOt+lxeHEYGqiGYQe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355199678"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="355199678"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743647064"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="743647064"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 17:12:24 -0700
Message-Id: <20230610001226.4577-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/3] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow preemption timeout to be specified as a config option.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig         |  6 ++++++
 drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_engine.c     | 16 +++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index d44794f99338..0e912bab2bc5 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,3 +83,9 @@ depends on DRM_XE
 depends on EXPERT
 source "drivers/gpu/drm/xe/Kconfig.debug"
 endmenu
+
+menu "drm/Xe Profile Guided Optimisation"
+visible if EXPERT
+depends on DRM_XE
+source "drivers/gpu/drm/xe/Kconfig.profile"
+endmenu
diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
new file mode 100644
index 000000000000..27be86adc6cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -0,0 +1,12 @@
+config DRM_XE_PREEMPT_TIMEOUT
+        int "Preempt timeout (ms, jiffy granularity)"
+        default 640 # milliseconds
+        help
+          How long to wait (in milliseconds) for a preemption event to occur
+          when submitting a new context. If the current context does not hit
+          an arbitration point and yield to HW before the timer expires, the
+          HW will be reset to allow the more important context to execute.
+
+          This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
+
+          May be 0 to disable the timeout.
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..cdc4bfdaf015 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -21,6 +21,19 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+/* Default preempt timeout in us */
+#define XE_DEFAULT_PREEMPT_TIMEOUT  (640 * 1000)
+
+static inline void xe_engine_set_preempt_timeout(struct xe_engine *e)
+{
+	e->sched_props.preempt_timeout_us = XE_DEFAULT_PREEMPT_TIMEOUT;
+
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT)
+	e->sched_props.preempt_timeout_us =
+		CONFIG_DRM_XE_PREEMPT_TIMEOUT * 1000;
+#endif
+}
+
 static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 					    struct xe_vm *vm,
 					    u32 logical_mask,
@@ -54,7 +67,8 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 
 	/* FIXME: Wire up to configurable default value */
 	e->sched_props.timeslice_us = 1 * 1000;
-	e->sched_props.preempt_timeout_us = 640 * 1000;
+
+	xe_engine_set_preempt_timeout(e);
 
 	if (xe_engine_is_parallel(e)) {
 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
-- 
2.21.0.rc0.32.g243a4c7e27

