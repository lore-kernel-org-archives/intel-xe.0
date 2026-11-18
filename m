Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F838606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNseED0s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B8C10ECD6;
	Wed, 18 Nov 2026 23:39:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A75910ECD6
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 23:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795045146; x=1826581146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AVhhCAzzi8tgEYGlT5AN4EJuPfz2ppHWc2HseHUMLRc=;
 b=fNseED0sAUNih2bmwAfmmAp1O5B9sQJqvHTXwLLlCaaPmoIolBBDRp3Y
 KcCNef62ivh9WVYLLlD1F4uapTFXTyhTPrFlg9lZZ2Q88uy92dCdsMOem
 4OaVzesOf4fOomr5Naf8DFKgqZ4p0E6ntTFWwhrqZvIJQ2oyQb8GIeejq
 O54DITl0IhbArwPBWJyL/cymmkwi30JqloPwJK8RmqdJ5l+R0nTbxZQwB
 +VkHM2htXp3ATt6g9+qGeN6gSH9VurhkOYYW1AsBaLnsdwYnhoy0fI0Ry
 hfDXq0LQxpr8knAoAL/UMDwTWfZR1nPZLDwS/VWaT2OaI1wDAIK24qUBA Q==;
X-CSE-ConnectionGUID: l7dLcNEqQxOtEtdVAgOa5A==
X-CSE-MsgGUID: dK8FYljIQguOXABlHutF6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3891044"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3891044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 15:39:05 -0800
X-CSE-ConnectionGUID: 9RQ7yOZzTdyldMMGGd5Wsw==
X-CSE-MsgGUID: lpGzdmjuT8K0aNak5vi1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10542918"
Received: from fvishwan-4tb.jf.intel.com ([10.54.60.87])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 15:39:05 -0800
From: FNU VISHWANATHA <fnu.vishwanatha@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 FNU VISHWANATHA <fnu.vishwanatha@intel.com>
Subject: [PATCH] drm/xe/pf: Restore PF config before resuming submission after
 GT reset
Date: Wed, 18 Nov 2026 15:39:45 -0800
Message-Id: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A GT reset reloads the GuC, which loses the configuration the PF pushed
to it, including the PF's own scheduling parameters. It is restored by
the asynchronous PF restart worker, which is only queued after
xe_uc_start() has already resumed submission and re-registered the exec
queues.

Exec queues registered with the GuC in that window are acknowledged
(SCHED_CONTEXT_MODE_DONE) but are never dispatched, so their jobs never
start and their fences never signal. This shows up as repeated "Check
job timeout ... not started" errors after the first GT reset and,
eventually, as a hung task in ttm_bo_delayed_delete() waiting for a
fence that never signals.

Restore the configuration synchronously after the GuC has been reloaded
and before calling xe_uc_start(), using xe_gt_sriov_pf_config_restart().
That pushes the PF self configuration and all non-empty VF
configurations. The rest of the PF restart (policy and VF control state)
is still done by the asynchronous worker, which also pushes the
configuration again; this is harmless.

Fixes: 1c38dd6afa4a ("drm/xe/pf: Resend PF provisioning after GT reset")
Signed-off-by: FNU VISHWANATHA <fnu.vishwanatha@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fe71cb011d3a..a5f7a4bf4d94 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -35,6 +35,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_sysfs.h"
@@ -891,6 +892,18 @@ static int do_gt_restart(struct xe_gt *gt)
 	/* Get CCS mode in sync between sw/hw */
 	xe_gt_apply_ccs_mode(gt);
 
+	/*
+	 * The GuC was reloaded and lost the PF configuration pushed to it,
+	 * including the scheduling parameters. Restore it before
+	 * xe_uc_start() resumes submission: exec queues re-registered with
+	 * the GuC under its default configuration may be accepted but never
+	 * dispatched, leaving their jobs unstarted and their fences unsignaled.
+	 * The asynchronous PF restart below pushes the configuration again,
+	 * which is harmless.
+	 */
+	if (IS_SRIOV_PF(gt_to_xe(gt)))
+		xe_gt_sriov_pf_config_restart(gt);
+
 	err = xe_uc_start(&gt->uc);
 	if (err)
 		return err;
-- 
2.34.1

