Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07398CAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E3710E40E;
	Wed, 17 Sep 2025 03:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUeuvSGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B4C10E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080782; x=1789616782;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BUKNBfnrj+lADkq/e3YjQCupV/Gx6iQ1YHXZsQcjvv8=;
 b=OUeuvSGibaESSjT3OBCICD659rDkaF1nL1zCe3q0XpTXpjkEELWJgZIC
 +HGZqtcZgA8Z43dx8+xfvv86jQrDMN63KTOi9MxwEKYpimkWQhnQ9a8+k
 tANP8J9AvYMl3KiNPIrI/jugxgaAptzDYL5h57etabHgIEJOwE48HMwMm
 JwJ79jV2p3ez0crOTF4yNQdmclHLrbyKojvBYxqGwTvI2KrL6/+gOWVmH
 I17wBXQrU2G7z8a9t8Su1a2nX7ksCqZKgNhB5s3P3y/4uKqwWpTkkmJHu
 zFtR7VNfyjrwF/u0SMn25zzoHL2O1dMUey0lp0Ziq2t8sKQ9CQP1g6SCH g==;
X-CSE-ConnectionGUID: lI9EqxurRlWuu8+wbf6Idg==
X-CSE-MsgGUID: Xlp7AKDHThu0+2O3dOljzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060794"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060794"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
X-CSE-ConnectionGUID: MIIKFwwZSieDST6JqpnTpQ==
X-CSE-MsgGUID: YjnpknI1Shu5/g9I9ywHGA==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/28] drm/xe/vf: Abort H2G sends during VF post-migration
 recovery
Date: Tue, 16 Sep 2025 20:45:59 -0700
Message-Id: <20250917034615.3977603-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

