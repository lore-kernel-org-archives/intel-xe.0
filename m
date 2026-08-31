Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D08C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5310E79C;
	Mon, 31 Aug 2026 09:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsZkjGyv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C961210E79B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788168085; x=1819704085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FhfmNK/kc1fBemMqV+b5LsTUqDdiK0xvysJ8mSyb8nM=;
 b=jsZkjGyvyeBZC9sSWfP5gB6RGE3s8AWSARXBzgUlA40/y4OG1cSwsMSL
 vV31dyrRDXkNCQxQBw3pnKJ+lS2321WvhN7odTNj6C7bSsw5ecs2BSTLQ
 APqFGkRk2UL+gU0l2Bh3kogrBQnvprrGLWMuCcdywBD3MpoMmUnsqRyD4
 4w3Y0YzM4K6wmVAhJSjROnnYJrdBJBXTO7RmE+uk0FVPOMNUYyA2EAXnr
 GRGq0yL+XOcVRuhPkoKoc7nBprzj9R9BibUBWxxQ9jDNkNAisO1PQ9aKp
 RZs167R5s+SkCm6KJ7RiQjpg+IPPbnFpXLvajnJLgs+NAcdpfw4IWUUmd g==;
X-CSE-ConnectionGUID: +IDDoSo2S6mrS3e8L2Mzcg==
X-CSE-MsgGUID: l1JSBWCyShmQtu6/NIlUyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92435782"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92435782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:21:24 -0700
X-CSE-ConnectionGUID: JvCJM7qpSV+MpMwU1bJObA==
X-CSE-MsgGUID: 6d1RaqW+S7eA+LngiDyaMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270671335"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:21:23 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, satyanarayana.k.v.p@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH] drm/xe/vf: Retry GuC state reset until timeout
Date: Mon, 31 Aug 2026 11:21:18 +0200
Message-ID: <20260831092118.488317-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

Instead of using a fixed number of GuC state reset retries, keep
retrying until timeout with sleeps between attempts.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b22..01873896f77b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -31,6 +31,7 @@
 #include "xe_lrc.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_sleep.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
@@ -86,18 +87,23 @@ static int guc_action_vf_reset(struct xe_guc *guc)
 	return ret > 0 ? -EPROTO : ret;
 }
 
-#define GUC_RESET_VF_STATE_RETRY_MAX	10
+#define GUC_RESET_VF_STATE_TIMEOUT_MS	10000
+#define GUC_RESET_VF_STATE_SLEEP_MS	10
+
 static int vf_reset_guc_state(struct xe_gt *gt)
 {
-	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
 	struct xe_guc *guc = &gt->uc.guc;
+	unsigned long jiffies_end;
 	int err;
 
+	jiffies_end = jiffies + msecs_to_jiffies(GUC_RESET_VF_STATE_TIMEOUT_MS);
 	do {
 		err = guc_action_vf_reset(guc);
 		if (!err || err != -ETIMEDOUT)
 			break;
-	} while (--retry);
+
+		xe_sleep_relaxed_ms(GUC_RESET_VF_STATE_SLEEP_MS);
+	} while (time_before(jiffies, jiffies_end));
 
 	if (unlikely(err))
 		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
-- 
2.43.0

