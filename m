Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AEFEE3F31
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 21:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422F410E094;
	Tue, 12 Sep 2023 21:28:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC4510E091
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 21:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694554130; x=1726090130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2hcdKf/5OY/9WElrJW7cYFNmo1pwhlxgR7kOWj6gTRs=;
 b=aKXckY4P1+8e4kBokcFy5RK/7N9EudWpq/ISHZ3lGViOUEcNJlaVy6jx
 x0LNeSS3SaGko7XqfagdvEcZIRlfBtv2xfA1wYESYBZKkNsPZRsv4z67E
 hmF04d8iIZZV9UoPANgPFrL2KXAFvfZGgty97guRm5IedOe9QEPghoajC
 VTSENjnyCNyxOAOA0JpRhABd2p0roh3sILl81xnO9laI2reSg6G2e4Pcz
 TZKF087PYi6Kluo7wBRiBhU99CMyBquGMP83/gpZsXal0ryrRN+ivoChZ
 3fB1ZMq9I3IYEQ2O4DwohSwHq31WdIfvVjjxuTVCDviTzz5lDhdr4WLHZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358769854"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="358769854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809418425"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="809418425"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.251.31.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:28:48 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com
Date: Tue, 12 Sep 2023 14:28:42 -0700
Message-Id: <20230912212843.681802-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/2] drm/xe: Add infrastructure for per engine
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
v4: fix rebasing issues

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c    | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_tuning.h    |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index dd673a684b70..eff289ae09b2 100644
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
+	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 412e59de9842..266f6ac38e37 100644
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
 
+void xe_tuning_process_engine(struct xe_hw_engine *hwe)
+{
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+
+	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
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
2.40.1

