Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564ECCA474
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D16510E3A1;
	Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNDuHu8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2FE10E20C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wI1XqC8N7KOYSWFhCtWlqtUWjAh+YFQ6XdjIZjARiOw=;
 b=HNDuHu8Q3uuzd7IorJ3gny69U5ajcy53MDe5DlDSeKItGSbL9bWsy1Cm
 R8PFu7Z1KL3TbgVPMH3bFByRNKVhXx/4t5OJ1sgosNpHbp0qYhIT6hwb0
 sSYXI8pLDItBpMsn6PpA6So5LLCi2N1VrAkjlPO76+6TMYI3E9E6fWTm0
 Gmmv+C65dbBvaCtJE4D59M2osCORUiuAXe6AhHAQTHUMMWwoKG2+2D+at
 FYkvDOixLkQhfcM2kT2Rrdsl5f6qSij5PKdNzU65Hgizock4iY5l45iYB
 vt/O8LPOmrlBr20NvABFD4tnB4rKmJSzDMMRzItl4lNWHFU68UjcjNAIR g==;
X-CSE-ConnectionGUID: 5SkHknlNQbKbnC9SB6SD5A==
X-CSE-MsgGUID: sGVA4h5bRG6O8legB+5lAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398539"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:51 -0700
X-CSE-ConnectionGUID: hbskiwMHQtSgJ9FbXTEcyA==
X-CSE-MsgGUID: MptgEd9NSMumremZICiCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529273"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 23/36] drm/xe/vf: Flush and stop CTs in VF post migration
 recovery
Date: Sun, 28 Sep 2025 19:55:29 -0700
Message-Id: <20250929025542.1486303-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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

Flushing CTs (i.e., progressing all pending G2H messages) gives VF
post-migration recovery an accurate view of which H2G messages the GuC
has processed, enabling the GuC submission state machine to correctly
rebuild all state.

Also, stop all CT traffic, as the CT is not live during VF
post-migration recovery.

v3:
 - xe_guc_ct_flush_and_stop rename (Michal)
 - Drop extra GuC CT WQ wake up (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a564f296e4b9..37ef1c42bacb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -23,6 +23,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
@@ -1185,6 +1186,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	gt->sriov.vf.migration.recovery_queued = false;
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
+	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d84de8544532..fd6e731c0395 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -573,6 +573,16 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
 	stop_g2h_handler(ct);
 }
 
+/**
+ * xe_guc_ct_flush_and_stop - Flush and stop all processing of G2H / H2G
+ * @ct: the &xe_guc_ct
+ */
+void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct)
+{
+	receive_g2h(ct);
+	xe_guc_ct_stop(ct);
+}
+
 /**
  * xe_guc_ct_stop - Set GuC to stopped state
  * @ct: the &xe_guc_ct
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index d6c81325a76c..0a88f4e447fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -17,6 +17,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
+void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
-- 
2.34.1

