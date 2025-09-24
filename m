Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7AACAC5B6
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0578B10E6A3;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDUXV/2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C0910E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676571; x=1790212571;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gyv0nF3njB7vF+VT1irr+F0DgK45tW/358hyHKUhYWk=;
 b=GDUXV/2R6daeIR8owspYcJCW3QCmFzoIvxZCEmFtFKSmBodUh3iSSRfW
 9Zqc21Gy0Og6iNyz9P1a+3DMUM+EBOXFsH5zscKJ98FHBVNLwAY22hD6L
 yTyo/TUBHIvrE9J3YOSrUlmJJh7JrrZYIwumfwHLq8ZzpR9x+HcYw2Ei3
 M02W7KrrYA3CSJAXz54Vou8PR2gBVr1i3Zkwt5SB4sDDgHQM2BfWupltw
 Pu5WBZIh8fJWhdtrZ7Pwi6aDArtHicTiwZNmgZgtMA6/uB/ma690VpnAA
 fANfKqrnUFHTcbCP4sQN+sc8LWtEgBHodk3bRLq+P/k5lkHuBYDcT6fmD w==;
X-CSE-ConnectionGUID: kzrdCmOxQYmpKCzfxmk4+w==
X-CSE-MsgGUID: WkhuISsmQfatGnheuPVl0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908271"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
X-CSE-ConnectionGUID: fjwY4K/nTASX/GDPKB5EPQ==
X-CSE-MsgGUID: yYWUpznwTnqKUerYEday3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841801"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 21/34] drm/xe/vf: Stop and flush CTs in VF post migration
 recovery
Date: Tue, 23 Sep 2025 18:15:48 -0700
Message-Id: <20250924011601.888293-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index e79ab4a2a273..071c2c5e0d0a 100644
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
 
+	xe_guc_ct_flush(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index aa9fb08f7856..d4a132b81b86 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -574,6 +574,17 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
 	stop_g2h_handler(ct);
 }
 
+/**
+ * xe_guc_ct_flush - Flush all processing of G2H / H2G
+ * @ct: the &xe_guc_ct
+ */
+void xe_guc_ct_flush(struct xe_guc_ct *ct)
+{
+	receive_g2h(ct);
+	wake_up_all(&ct->g2h_fence_wq);
+	xe_guc_ct_stop(ct);
+}
+
 /**
  * xe_guc_ct_stop - Set GuC to stopped state
  * @ct: the &xe_guc_ct
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index d6c81325a76c..1e32a59817cc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -17,6 +17,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
+void xe_guc_ct_flush(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
-- 
2.34.1

