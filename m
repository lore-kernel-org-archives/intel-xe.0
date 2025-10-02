Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095C9CCD18A
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F27E10E79E;
	Thu,  2 Oct 2025 05:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sok9X49g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EBA10E798
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y70TsVG42ynkVjIJ1IY2cbCes1mswnOytAz+vfbH6dQ=;
 b=Sok9X49gTTnsEhlYJdKH93tSqSGbyinIeW/RAK8vCrNhjGJlsqaNRJ7C
 EyEKsljAdi0Vl6b6FwydAzMxCGfy6DMqtU5eBFwthmtQQ+Pef/qTHMUhX
 j/39Xa3w7Sp5WdH4BTFOK2if5l7HmNJv2xr3QXZLDF5RbfQR6Xn11qp4x
 cCiGkHhtCwTsPhPW8zO/wHFqcaVi2ZX11N37wO51aDVcd3polIOOVxuLx
 +0XqKWa30SWX1JwnSzBHhgn6zAcdO36/g9GYVUHWzzq9BJzoJ7YA4M+wt
 +OE6WHjPYLWl/E8biquki6g/wqdCkylcNWo/KcPWvsXbgwnazNG7IEK+b Q==;
X-CSE-ConnectionGUID: 4pzobe4OSqm0Cp2mMDPaYA==
X-CSE-MsgGUID: jALMCNfpR+eEgq+mgwK1DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304514"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: SebkLeCRRj+5Qg5NhyGAMA==
X-CSE-MsgGUID: efHuuCNJRe++w2dXmmjAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083546"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 21/34] drm/xe/vf: Flush and stop CTs in VF post migration
 recovery
Date: Wed,  1 Oct 2025 22:53:49 -0700
Message-Id: <20251002055402.1865880-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c      | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index e8fd2fe98076..3c3b9a88eda9 100644
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
@@ -1108,6 +1109,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
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

