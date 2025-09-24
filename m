Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856AFCAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4146510E69C;
	Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIbVXh2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F9610E692
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676569; x=1790212569;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BUKNBfnrj+lADkq/e3YjQCupV/Gx6iQ1YHXZsQcjvv8=;
 b=ZIbVXh2KphwBZDg1VWEryFqqqcfyAnooe6phfsPZRFR8SA4PWvFzOlS3
 PXh/wnnaOPVPqRrKzAxZNtauCfNr+AZoNH5hJzIlbBoRk2AYZxyaBTfTn
 rfXVeljDhpECcGmtwZQrkVITiHuGEV0sZdnaS8+u/bB+qwCF+BnRPerDt
 OcY+GAavisQ6Wwuf4+SXjTpFz6TTkot1RF53wa4uZHoBckWegqOUMCcYC
 M9/FpldSNk84NYPi70nlCltiV7lkvEU4WfcvPjb8Nfo7EEtv5RB2/Qvaf
 lKTGku+hoJqKdRNhOpkvUZ3kID3AzMVf6VHDfTf2NuJuBWwsmOUpfaSw8 A==;
X-CSE-ConnectionGUID: yXmO7yLnTEeyCb14N0sLDA==
X-CSE-MsgGUID: qHpMGYZKSd+vky31Q/El2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908258"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
X-CSE-ConnectionGUID: q/bPQ87kSueY46Q2uYBfjQ==
X-CSE-MsgGUID: h3ctpQfcQVS8u9xGyMuN1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841793"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 13/34] drm/xe/vf: Abort H2G sends during VF post-migration
 recovery
Date: Tue, 23 Sep 2025 18:15:40 -0700
Message-Id: <20250924011601.888293-14-matthew.brost@intel.com>
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

While VF post-migration recovery is in progress, abort H2G sends with
-ECANCEL. These messages are treated as lost, and TLB invalidation
errors are suppressed. During this phase, the H2G channel is down, and
VF recovery requires the CT lock to proceed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 47079ab9922c..661ab1bf4502 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -25,6 +25,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_monitor.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
 #include "xe_guc_relay.h"
@@ -851,7 +852,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
 {
-	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	u16 seqno;
 	int ret;
 
@@ -872,7 +873,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+	if (ct->state == XE_GUC_CT_STATE_STOPPED ||
+	    xe_gt_sriov_vf_recovery_inprogress(gt)) {
 		ret = -ECANCELED;
 		goto out;
 	}
-- 
2.34.1

