Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5935EC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B5710EFA3;
	Wed, 12 Aug 2026 12:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQupDTpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F0910EFA3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538484; x=1818074484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZCvnsfR4XwFEg/Xg5tv0UzP6p0chDyATcxuCPb+f4M=;
 b=GQupDTplIiz28NhKr7VxS2Tzm5YC14WKqig0CsRkxPZR3uB5/9HGrvxs
 8gxuZ0gjH0cHVZ5zoqtGiXu4rRQCOPrS6UWepAHmcOSF7Nvap0BIl6Ywm
 1SLJHKwmwDrO/WEnhXUcC9Z7SkxTQ0X0grYSy7ovApRjylDTMu5zXykPH
 QcTVxtAhnowCzCCWO8PsJoYrQ0Iep+cLAOaEoTTOFI7GFVxh9WgZypD+E
 JyisSMCma/pT/KDFMXAx7GzTz1UOP0RRwZNHW5QqsGUt0VK7XUQDjEa3L
 cFt4Xd6nQg4WzqUBwNxGRl4Cy9PD6cVjcJqrGtVxJ7H4FOb7NdqlfYuD0 w==;
X-CSE-ConnectionGUID: 7Juu1K41QT6px9zen3Wymw==
X-CSE-MsgGUID: CLhKCWLiS+KU9Nz3E4NPJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98238695"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98238695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:41:24 -0700
X-CSE-ConnectionGUID: 7zeblFGeQ/q8uY2aI2ZmWw==
X-CSE-MsgGUID: lG1cmi/PRFGTnkJdu0ZY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263674047"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 05:41:23 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 3/7] drm/xe/vf: Add bounds checking for queried context and
 doorbell counts
Date: Wed, 12 Aug 2026 18:13:15 +0530
Message-ID: <20260812124313.1377582-12-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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
V4 -> V5:
- Fixed review comments (Michal W).

V3 -> V4:
 - New commit
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

