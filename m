Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0BFC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 16:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9AA10E21A;
	Mon, 14 Aug 2023 16:03:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7674910E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692029033; x=1723565033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=efQIv4qu2IlVUVqJqInSQxHiPVRgp/tlJ3S6R/gWAMc=;
 b=g+ycPxdT0gQTzuSq6HTpiuvgvYLzsiabmI4vrFEhP5TDQToRe4fJV4GV
 WM0FkC9u+QVPejFAGv4e4XaCx5x298zNL2GCyo6VlU26Ob3hsKStc5m/H
 pqXj5R5qQpcYdZM+fMJvK/f78jDP+fr5gYJosHYV1m1L/n5GX3nijOhb9
 ETDNPWQ59eKN+TNYU70UdPTOAezPRYhD4wzUeWNVH12TTsiAO+dSo5cF+
 MAdUgaGY3SkDqoX6jyhSvsfwiVB/d4nV/zKqNXEjZagkU2IfhaSIiLxMp
 lfQRSbv5fBeeZMP0wZeyrkLNjeCArfDaXeoFTykZgpODQne/TYuNitQ7l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372065716"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="372065716"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710364285"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="710364285"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:02:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 09:02:17 -0700
Message-Id: <20230814160217.10707-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
References: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe: Add
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

v2: Change unit to microseconds (Tejas)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
 drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index a3655ee6978e..dd7f155371fa 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
 	  an arbitration point and yield to HW before the timer expires, the
 	  HW will be reset to allow the more important context to execute.
 
+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
+config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
+	int "Preempt timeout for compute engines (us, jiffy granularity)"
+	default 7500000 # microseconds
+	help
+	  How long to wait (in microseconds) for a preemption event to occur
+	  when submitting a new context to a compute capable engine. If the
+	  current context does not hit an arbitration point and yield to HW
+	  before the timer expires, the HW will be reset to allow the more
+	  important context to execute.
+
 	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
 	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8e5153cada31..e9ce34faa2da 100644
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
@@ -570,6 +574,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
 
 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..cee0b40a62a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -35,6 +35,11 @@ struct drm_printer;
 #else
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
 #endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE XE_HW_ENGINE_PREEMPT_TIMEOUT
+#endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #else
-- 
2.21.0.rc0.32.g243a4c7e27

