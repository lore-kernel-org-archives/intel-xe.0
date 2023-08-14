Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB065C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 16:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BC710E09C;
	Mon, 14 Aug 2023 16:03:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92510E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692029031; x=1723565031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U/ePqrI0Bq6bssGla5Au2JWfSvhNrkbSU6I0h2KoP4k=;
 b=aAAfgBU6+2NDrEexcMHWqGh1ZeddVcJqoRYI7vukw4zkN6DcZNKXP1rl
 SejqzYtAgul5NQ84nEMovHJmEdmy5sNRsVmPQIBwexICnfPdARZLh/N3M
 QRnNuh/7S55RZbAghrIMxZaFTNdT08pFcby2xvPcyKvv+QuUJQRF+vAdF
 tdvJS1bJ0DOZq24cpOT0koZgl8soBZmOrLj9l+y4+d9o3GhPaMtxs+TcY
 pgvst2/g8OcIUpG9Hq7kRpTa636t/fS7TzSNKtAL2S0/Qmu1cPaARh4sR
 rN13+zw+rAT5Ho2Bz9wZ2AtMKuNHUOGqgL6IfrRtiQ9ocCo/tHvAxNZxn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372065713"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="372065713"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710364283"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="710364283"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:02:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 09:02:16 -0700
Message-Id: <20230814160217.10707-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
References: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
 3 files changed, 26 insertions(+), 1 deletion(-)

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
index c44540684462..8e5153cada31 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -338,6 +338,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
 }
 
+static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)
+{
+	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
+}
+
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 				 enum xe_hw_engine_id id)
 {
@@ -370,7 +375,8 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->eclass->sched_props.timeslice_us = 1 * 1000;
 		hwe->eclass->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
 		hwe->eclass->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
-		hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
+
+		hwe->eclass->sched_props.preempt_timeout_us = get_default_preempt_timeout(hwe);
 		hwe->eclass->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
 		hwe->eclass->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
 		/* Record default props */
@@ -562,6 +568,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
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

