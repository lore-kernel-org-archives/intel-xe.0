Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1874DC04A6A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36BC10E3EE;
	Tue,  8 Aug 2023 18:24:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39BD10E3ED
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519058; x=1723055058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCM9YTaQEagwNCJgg2B7baTr3W545yFFboE77Y09hqo=;
 b=nrla9E/2oZG8tYt0HkLb9jSvQW1Fl20nG7jY6U2AWRXwRxDqteFwcPgV
 S6saMyBiC4PXoXqSI2BwxRg37TppemMvxbo02OzJogSKjjYGU342Z2cZF
 dkDzGtDVv/RT4PO5/4vWQo4jYjUUzA9CdssP3nbgTZua/hB55PdRLsZlW
 VN1/DsvEfHD3ZcDqgAqED8nA+v6yLUbBSA4UpmvWqjK6zKhEI8szThfCI
 CeY6Vypf0F/E6QmomgOHA9FSGHn0jEtvIvBvX2WYtVxaTO7V4++mV6tKF
 g5pij7jUWvaKODMWTHhu81zi7yx7KZDVcXf7DXzgy4DVbcLYJtBAKR2FB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370907035"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="370907035"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731512595"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="731512595"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 11:24:11 -0700
Message-Id: <20230808182411.31354-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COPY
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

Allow preemption timeout for copy engines to be specified as a
config option.

If all copy engines are thrashing away at the PCIe bus, plus all
compute engines doing the same, then the per copy bandwidth becomes
tiny. That results in copy operations that should take milliseconds
actually taking seconds. So bump the pre-emption timeout to allow for
the worst case scenario (currently believed to be around 2s).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  |  4 ++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 5ca3305a22b6..219e13d3fd25 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -43,6 +43,18 @@ config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
 	  before the timer expires, the HW will be reset to allow the more
 	  important context to execute.
 
+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
+config DRM_XE_PREEMPT_TIMEOUT_COPY
+	int "Preempt timeout for copy engines (ms, jiffy granularity)"
+	default 2500 # milliseconds
+	help
+	  How long to wait (in milliseconds) for a preemption event to occur
+	  when submitting a new context to a copy engine. If the current
+	  context does not hit an arbitration point and yield to HW before
+	  the timer expires, the HW will be reset to allow the more important
+	  context to execute.
+
 	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
 	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 57a0fb50852c..34b1fdd24b0e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -343,6 +343,8 @@ static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)
 	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
 	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
+	else if (hwe->class == XE_ENGINE_CLASS_COPY)
+		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY;
 	else
 		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
 }
@@ -575,6 +577,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
 
 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c4f0969efc06..66a611f4942a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -41,6 +41,12 @@ struct drm_printer;
 #else
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE XE_HW_ENGINE_PREEMPT_TIMEOUT
 #endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COPY
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY \
+	(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COPY * 1000)
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY XE_HW_ENGINE_PREEMPT_TIMEOUT
+#endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #else
-- 
2.21.0.rc0.32.g243a4c7e27

