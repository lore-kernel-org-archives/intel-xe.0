Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87ABC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650EB10E08F;
	Tue, 15 Sep 2026 07:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7X8mQV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B9E10E08F
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456333; x=1820992333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OYq7HrbF1jSEL10aX6e3UgsufmwGlg1Wxj7YY57/PKo=;
 b=T7X8mQV19zI2ra+UdKyPlbK4pQ6aUZ63RknOgjh3j/5g5Hnm5di7M8dz
 iIrDC9EhnC/z1URRIPoTkJMXPFRM6MNEAvpTO95LMHateh3gzlHquGLjU
 nipbB1KBNz9VB4s0T+zrHEx1Wlpt9o4+7mGQwyj/dVGaznKbzp3gHqqML
 p0Wi4cvrD/mKhp3G/gsj9LTOotZQ5kaTgOLYXXGTNtC2MpMDG13V/be7j
 gsj6hNbguaaLW+bgMu7zpl2kkGLswthkB6T4k4fSYprj0/jTEjOI04/+U
 dk65SBmYVFVI6sqr1RCClxtZwHdX66iFQVE4qIurtuUvZAl72v34CCbWc A==;
X-CSE-ConnectionGUID: Kqn591UfTcu6x96ISC+0rA==
X-CSE-MsgGUID: fdVhkQLqSv+ogMgwH46XFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511741"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511741"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:12 -0700
X-CSE-ConnectionGUID: O8Eb0gwbQTazWz+r4iwEXQ==
X-CSE-MsgGUID: 4GtvxD+mRseOmwebl6EDLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081587"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:11 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 03/10] drm/xe/vf: Add bounds checking for queried context
 and doorbell counts
Date: Tue, 15 Sep 2026 12:42:00 +0530
Message-ID: <20260915071159.51402-15-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for context and doorbells which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 339ea0d3344c..81d68fe5ad7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,6 +15,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -581,6 +582,11 @@ static int vf_get_ctxs_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	if (num_ctxs > GUC_ID_MAX) {
+		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
+		return -EPROTO;
+	}
+
 	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
@@ -607,6 +613,11 @@ static int vf_get_dbs_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	if (num_dbs > GUC_NUM_DOORBELLS) {
+		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
+		return -EPROTO;
+	}
+
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
-- 
2.53.0

