Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93765C3DA6F
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 19:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C71F10E0E9;
	Wed, 23 Aug 2023 19:55:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E2C10E0E9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692820541; x=1724356541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d968KP7WLJVyR8a6BFzryAHRG99DU1xAXGBHWCyQOSs=;
 b=VBOfe4icR2+wCgGY05NZWfMcL5iZQM3Nd9bb2IFJ9wrL7iooinCvGzN2
 CzoUf5I9WyKALRDwhSf6zXAw3VrWVF9lZehMLUsRF2OUio2DZjkMSH2nM
 RaFaDRG/Qc1HZ7R7RUG1NUK4oR0NuDb1q6wBCJR67J5nXiK6sxHWrQUrN
 eBVO9Gfj2cmVN3gjrYXqaEXsekWzC2n8NtUKnVnwDki/OiJjo3p4Ch5Te
 31/FhfY2iRpyG5kB13BAynRPJSNCsOgt9pLZ1D3SdybX8kZagTTwOSwp0
 Dmy+9Reg/tH48XEalgMj3qZuHI4oS2D945mHEAv5c6J/6n+1KJvKwtDA0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440613187"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="440613187"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860437362"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="860437362"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.99])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:55:39 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com
Date: Wed, 23 Aug 2023 12:55:32 -0700
Message-Id: <20230823195533.125633-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2 v3] drm/xe: Add infrastructure for per engine
 tuning
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

Add the infrastructure that allows for per engine tuning preparation for
disable indirect state.

v3: rebase

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c    | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_tuning.h    |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index dd673a684b70..9dafc56d5fe8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -24,6 +24,7 @@
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
+#include "xe_tuning.h"
 #include "xe_wa.h"
 
 #define MAX_MMIO_BASES 3
@@ -401,6 +402,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	}
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
+	xe_tuning_process_engine(gt);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 412e59de9842..702cb41dab53 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -27,6 +27,10 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	{}
 };
 
+static const struct xe_rtp_entry_sr engine_tunings[] = {
+	{}
+};
+
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
@@ -65,6 +69,14 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
 
+void xe_tuning_process_engine(struct xe_gt *gt)
+{
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
+
+	xe_rtp_process_to_sr(&ctx, engine_tunings, &gt->reg_sr);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
+
 /**
  * xe_tuning_process_lrc - process lrc tunings
  * @hwe: engine instance to process tunings for
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index 2b95b0c8effc..740cb1bd2f0a 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -10,6 +10,7 @@ struct xe_gt;
 struct xe_hw_engine;
 
 void xe_tuning_process_gt(struct xe_gt *gt);
+void xe_tuning_process_engine(struct xe_gt *gt);
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.40.1

