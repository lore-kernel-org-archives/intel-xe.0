Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308D2C001E0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 11:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21B510E365;
	Wed, 16 Aug 2023 11:52:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EDB10E35E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692186764; x=1723722764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7mlCE7r2/bvjXVd2G+fpMpHpV2hhkvNNAij8zxA7BNI=;
 b=H4pkzxErPel61qeGsOfDjSpm6X+L6DabEGgX9yct99V7EuIMVU4W7gVo
 BDHJ1YpXWfQ7h3YHIXotbWsXRSyxq3biKX3Si4ReKw61sfpsxtLAcYvIX
 5fnjE47A7BI63nHjtBUMK2a8DGYs/YZJdy7bb+UUAcUwVV9JZGogDmHhk
 AVTTie02Sa77BaicPJBLkhTPyZZgDbbF9T6qK1YTf8EtxXRc0DJqMSJ0g
 Rs4wLmFHmF2u4l+II4i+MhDRLEG9v25mSv3sYN/43ZZSOG5GbEFKoHJOz
 uxCF5vxylcXd11Beq8wNNjXWG9iKLX4R9xRjoKclF96hZA+rXkyIvzhn/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436407012"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="436407012"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 04:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857796799"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="857796799"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 04:52:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 04:52:38 -0700
Message-Id: <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
References: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/2] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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

Allow preemption timeout to be specified as a config option.

v2: Change unit to microseconds (Tejas)
v3: Remove get_default_preempt_timeout()

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
 drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 9ad487647ca1..a3655ee6978e 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
 	help
 	  Configures the default min timeslice duration between multiple
 	  contexts by guc scheduling.
+config DRM_XE_PREEMPT_TIMEOUT
+	int "Preempt timeout (us, jiffy granularity)"
+	default 640000 # microseconds
+	help
+	  How long to wait (in microseconds) for a preemption event to occur
+	  when submitting a new context. If the current context does not hit
+	  an arbitration point and yield to HW before the timer expires, the
+	  HW will be reset to allow the more important context to execute.
+
+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
 	int "Default max  preempt timeout (us)"
 	default 10000000 # microseconds
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c44540684462..4c812d04e182 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->eclass->sched_props.timeslice_us = 1 * 1000;
 		hwe->eclass->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
 		hwe->eclass->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
-		hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
+		hwe->eclass->sched_props.preempt_timeout_us = XE_HW_ENGINE_PREEMPT_TIMEOUT;
 		hwe->eclass->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
 		hwe->eclass->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
 		/* Record default props */
@@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
 
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
+
 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 3d37d6d44261..71968ee2f600 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -30,6 +30,11 @@ struct drm_printer;
 #else
 #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
 #endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
+#endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #else
-- 
2.21.0.rc0.32.g243a4c7e27

