Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF3C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Apr 2023 20:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B844110E88F;
	Tue, 18 Apr 2023 20:14:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE63710E88F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Apr 2023 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681848847; x=1713384847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YokA/0IrrB4J5j2kunL4uKEny2QR6ChUNT1sIAWN0IE=;
 b=gyDZLGK+8r5WxuUaq7Xl81bsIGSpmTPMsebw7dd6str51WLclHEOfvsW
 SckTGkA00s8m7CpAR3kZXqMceWm0+NmHPeI92kXlTl4ccZoQfEvrVjfxM
 tSPD746CnpVEnhGEgsuHTgeh4s1Lo+3uQ8QqQlXjkl6EIae3DdDcCVxEk
 pE/Yei9uA+0Z+Zx7UEK9v9GNkS/G2rRZQw7nGWyaM8yjy8e4hpVSeceL3
 YtdxYfVKtlLdGrwiVjESAtBGJwrqIAYsxgMHFVsmrqvk1RMVTLJQPzLiB
 yM+dLLQs/Cp0On5AYR3nQaSH+48enlgBnak5t5jyzHLo4b0f2YnBMXxNL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324894782"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="324894782"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 13:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684727164"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="684727164"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.209.23.216])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 13:14:06 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com, jose.souza@intel.com
Date: Tue, 18 Apr 2023 13:14:02 -0700
Message-Id: <20230418201403.289184-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: add infrastructure for per engine
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

Add the infrastructure that allows for per engine tuning in preparation
for disable indirect state.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c    | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tuning.h    |  1 +
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4b56c35b988d..f0b78efc6cf7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -22,6 +22,7 @@
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
 #include "xe_sched_job.h"
+#include "xe_tuning.h"
 #include "xe_wa.h"
 
 #define MAX_MMIO_BASES 3
@@ -292,6 +293,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->engine_id = id;
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
+	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 27cf1330facd..35af2624b28a 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -29,6 +29,10 @@ static const struct xe_rtp_entry gt_tunings[] = {
 	{}
 };
 
+static const struct xe_rtp_entry engine_tunings[] = {
+	{}
+};
+
 static const struct xe_rtp_entry lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
@@ -66,6 +70,12 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
 
+void xe_tuning_process_engine(struct xe_hw_engine *hwe)
+{
+	xe_rtp_process(engine_tunings, &hwe->reg_sr, hwe->gt, hwe);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
+
 /**
  * xe_tuning_process_lrc - process lrc tunings
  * @hwe: engine instance to process tunings for
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index 2b95b0c8effc..4f9c3ac3b516 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -10,6 +10,7 @@ struct xe_gt;
 struct xe_hw_engine;
 
 void xe_tuning_process_gt(struct xe_gt *gt);
+void xe_tuning_process_engine(struct xe_hw_engine *hwe);
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.39.2

