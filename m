Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE32CC04A94
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C467610E3ED;
	Tue,  8 Aug 2023 18:24:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7822910E3ED
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519058; x=1723055058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oj+qDksl6PMeYwRXOWUfpYJEztLzQnzj2NUSJrs8EGE=;
 b=kzVTcIqZeNljNKoJPRD5HoGQGxNFT4ny8HV2cDKeKsstjzvTxqkbClG3
 jzWXnBJ6L1JiKlBqpIbdDUt+BWwmioGTL4CZJUKV/omJLCyQ00Tm9p1JX
 hXR7IQK2L4gP3j0hxY4jDuiXeAvsgyGBnPUg8iOjWT6GtKzNtJ5Qxjn7o
 ZUFqJuFXCUj+stTq5m/TjzNcnudVcydOefHxI/4Oq7LiiOEQGLOUxRiPU
 k5nc8ATRBZy9zs7Dz2Nb7h72p7qHRJnB34FFn8is+kLo0Qgtu8NrFbMpb
 wJELLi+rDXPq0/uyZMUSIvZcFg2rtAg1GA3OFYVzNJ+7O95wXI/w7GFbE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370907031"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="370907031"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731512591"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="731512591"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 11:24:10 -0700
Message-Id: <20230808182411.31354-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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

Allow preemption timeout for compute engines to be specified as a
config option. The purpose is actually to give compute tasks longer
time to reach a pre-emption point after a pre-emption request has been
issued. This is necessary because Gen12 does not support mid-thread
pre-emption and compute tasks can have long running threads.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
 drivers/gpu/drm/xe/xe_hw_engine.h  |  6 ++++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 06742e192206..5ca3305a22b6 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
 	  an arbitration point and yield to HW before the timer expires, the
 	  HW will be reset to allow the more important context to execute.
 
+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
+config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
+	int "Preempt timeout for compute engines (ms, jiffy granularity)"
+	default 7500 # milliseconds
+	help
+	  How long to wait (in milliseconds) for a preemption event to occur
+	  when submitting a new context to a compute capable engine. If the
+	  current context does not hit an arbitration point and yield to HW
+	  before the timer expires, the HW will be reset to allow the more
+	  important context to execute.
+
 	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
 	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 25bad007a85b..57a0fb50852c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -340,7 +340,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 
 static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)
 {
-	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
+	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
+		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
+	else
+		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
 }
 
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
@@ -569,6 +573,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
 
 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 582be209355b..c4f0969efc06 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -35,6 +35,12 @@ struct drm_printer;
 #else
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
 #endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE \
+	(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE * 1000)
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE XE_HW_ENGINE_PREEMPT_TIMEOUT
+#endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #else
-- 
2.21.0.rc0.32.g243a4c7e27

