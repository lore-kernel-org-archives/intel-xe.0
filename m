Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD0C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606E10E48F;
	Fri, 28 Aug 2026 09:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMg10+P7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF77F10E487
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911097; x=1819447097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T+xj4wg0H2OcOjMKAKUipSelL2CX429xPKwwOCDL0fU=;
 b=lMg10+P7djBh65F5kJQnPe39n+9PTh2cqs75PcZg4EhZ6ZIFAtf0p75C
 0qmDE1b2M7KsOciPn4iQD6AqEjXqiBhOoGpN5xQDjC3YQQrYzqEeNsSkR
 fXPhdyahtmkvuUqsLsevCfXfdEuLGjxWC+0UbOyjdj1kFgL0eKFOSGH9y
 IRZJnVU9orSeHkp3Eh+Pt2mGbKDSULPu/xfgKk1ZvG7V6Fuaj8Ci+gXap
 DgAF2KYBIhK+2B5jNaoY4IXBiX1053MmcnV2DMjxbZ0oxjte7U5rzODmw
 e6Ljv+I1PjOe3MPsvQmHazCPjV9HiCSO7Yt0oGRqnQ/o3lNQPO0/8RkNh A==;
X-CSE-ConnectionGUID: oIaftk80SRSu5AguyTi+ZA==
X-CSE-MsgGUID: 7c+3EQySRSuF3su3InNQgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99084936"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99084936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:17 -0700
X-CSE-ConnectionGUID: aV2u5burT0qBg6hYbAFfsg==
X-CSE-MsgGUID: G9tAwLECSBmrQ+bZnsJF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272338895"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:15 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v4 1/4] drm/xe/guc: Report reset-request failure using SIGID
Date: Fri, 28 Aug 2026 15:28:00 +0530
Message-ID: <20260828095803.2130312-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828095803.2130312-1-arvind.yadav@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
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

Route the GuC engine reset-request failure through the structured SIGID
logging helper.

Use the GT component for the engine reset-request failure, which maps to
XE_SIGID_GT_TDR, and pass -EIO as the errno value.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v4:
- Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
  only the errno value. (Sashiko)

v3:
- Split the GuC reset-request failure conversion into a separate patch.
  (Michal)
- Dropped GuC job-timeout warning conversions to avoid changing warn-level
  logs into error-level SIGID reports. (Michal)
- Kept only the existing error path that maps naturally to GT_TDR. (Michal)

v2:
 - Rebased on the latest structured SIGID logging series.
 - Switched from the old xe_ras_log_() helpers to the new xe_log_()
   helpers.
 - Dropped paths already covered by the base SIGID series.

 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..c1d469624215 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -34,6 +34,7 @@
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
@@ -3494,8 +3495,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
-		  guc_class, instance, reason);
+	xe_log_err(gt, GT, -EIO,
+		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
+		   guc_class, instance, reason);
 
 	xe_gt_reset_async(gt);
 
-- 
2.43.0

