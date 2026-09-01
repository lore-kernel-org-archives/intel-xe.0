Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8DC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 06:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C910E3A0;
	Tue,  1 Sep 2026 06:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckEJdK4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133610E3A0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788244277; x=1819780277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W6y2eckuT0+TlKuTnC2uQ69QdgUYv25y18qqAV5KdHc=;
 b=ckEJdK4PBTFYM+e0Jc0wRHNb4GzzMlG81RZojJ4IZo9CWOl0Wy6mJyKr
 vcjYzUOiFSub3jQeuG20aZa5Va8R6PFT/YWDE/SnnAz/DIafbsGahR9Wl
 8Tr1qBZrjrJIKKF9hnL2P2Oy0thzQClHQz24ddJl2FEJQ4LVfDkUtJa0n
 Ansx8oGXtuH5p1VyGLhu4v/l9Bw8GgtvDYXDZHpWzIdWQEapI6lus0vUZ
 SqLASKUBB04RFZn0zurDF5RV1SCnTfqkjbnG1wnKwgSg8HIRLEVh8VuFU
 6ITyMQGxS48Wk5wS5OLuWehsVs6a1UhLgQ9l6ntJeyvBqtEZrRqsTkpqj Q==;
X-CSE-ConnectionGUID: Sw75a6t+QWyN3ElWrSWhBA==
X-CSE-MsgGUID: ZIb31KNFQRK709D5SjDZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88588890"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88588890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:17 -0700
X-CSE-ConnectionGUID: /zBpUoZKRuC+QrnqqGZTEw==
X-CSE-MsgGUID: fQVB0MbgQbar5XW843y4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272791278"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:16 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v6 2/4] drm/xe/guc: Report reset failure using SIGID
Date: Tue,  1 Sep 2026 12:00:57 +0530
Message-ID: <20260901063059.2547247-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901063059.2547247-1-arvind.yadav@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
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

Route the GuC submit engine reset failure through the structured SIGID
logging helper.

Use the GUCSUBMIT component, which maps to XE_SIGID_GT_TDR, and pass -EIO
as the errno value.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v6:
 - Updated the log message to print class/instance as %u:%u and
   reason as %#x. (Michal)

v5:
 - Added GUCSUBMIT component and mapped it to XE_SIGID_GT_TDR.
   (Michal)
 - Used GUCSUBMIT instead of GT for the GuC submit reset failure.
   (Michal)
 - Dropped "request" from the reset failure message.
   (Michal)

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
index 99d8c807ff05..1df6527130f3 100644
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
+	xe_log_err(gt, GUCSUBMIT, -EIO,
+		   "engine reset failed on %u:%u, reason=%#x\n",
+		   guc_class, instance, reason);
 
 	xe_gt_reset_async(gt);
 
-- 
2.43.0

