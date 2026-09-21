Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4268C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E98710E579;
	Mon, 21 Sep 2026 09:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGojWn5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127ED10E5B9
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982478; x=1821518478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2pljAsIHrRkJ2F1raqd81g3zhLUkNlbANQyg/zTAlw=;
 b=CGojWn5QSqkpxFiM5W6dTZU8K+0NfGFoOTk9YpjybPWSzpjUqfWXTzCd
 w7V3C1qgoHLRNIqj3WR+0mlmygee6ADXQjT+BE2fiE8aK6FiTuE3bGGBf
 Glw9vH6YXBlAi6NlkCz569V/uJAczpL6amGTKJZH7sw3hp+eQ1eLv6z8U
 HSZdOWDgvA4NPKhBeHTtGzOURZxUDwC/SggC7VEVPNKtvif6v4Kq4qSU4
 VGKbtMyk9BwfK9Y2o+YKiQryHj4RHvvrWiR2Ph7IGkT/O200rx+iswzZ0
 TikKrPDWpRcn+lcH2BgtxpcMweQw3BHx7keZwz3Dw0Kjb2KnyTWIcTo2M w==;
X-CSE-ConnectionGUID: 5iXJxBpdRquZ8jx989kRlw==
X-CSE-MsgGUID: 0OU86HN2T62fyrw638wIrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606609"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606609"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:18 -0700
X-CSE-ConnectionGUID: PtAYAoo9QvOHA5602mRPBw==
X-CSE-MsgGUID: gfkuTrtySfWH3wK/Zu+u8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578406"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:12 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 03/10] drm/xe/vf: Add bounds checking for queried context
 and doorbell counts
Date: Mon, 21 Sep 2026 14:51:02 +0530
Message-ID: <20260921092101.1243989-15-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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
index 339ea0d3344c..715dfb04a1f3 100644
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
+		return -ERANGE;
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
+		return -ERANGE;
+	}
+
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
-- 
2.53.0

