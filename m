Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73086C982DE
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2457910F2C4;
	Fri, 18 Sep 2026 10:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kt5lOwrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96C610F2B6
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725946; x=1821261946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVnpA/oG8E0EGlIdUW7FeS93LXdxRCN4KqCsP6WKzwg=;
 b=kt5lOwrgLLhZ+ZO0uxwGSV0SRN9JXMO9b0Ei13EdKH0hIAcYInaTMlAJ
 UnzVpPtZv21yNJrUgbTPVO36OPm+b48cCJYRwANRZKPIpaY8H3tA4q4X0
 b6vuppnc9FlTxQ+qtaL9hYilpRDDrvy4BjGuB+oLbPsjAAecGLsvP7EZL
 7DFqo+WMf2X0L434FvY8+VFSOkEPlcOAAOqdhGOs86Mke1ARQo+KGlJTt
 qRqV3ZJMv+XKWaw0HvZwORY8DvO47gHJKqaqREZOj9PJpjcbYAamwTsfk
 6RNjgIo3dea1Feyv53K3Auph0ap3/WizbxCz//Hp9D7QT7nSKK+f4JutE A==;
X-CSE-ConnectionGUID: lvCdLl+dRxiEXRFRdsZR6g==
X-CSE-MsgGUID: ZLqppYA5RXKz3FTtXZguEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="737216"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="737216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:05:46 -0700
X-CSE-ConnectionGUID: 4Z9I4VfdT7eKBE/ty4Jhfg==
X-CSE-MsgGUID: LzvmIj8fQdGcdqS6reDfjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271003546"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 03:05:45 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 03/10] drm/xe/vf: Add bounds checking for queried context
 and doorbell counts
Date: Fri, 18 Sep 2026 15:35:27 +0530
Message-ID: <20260918100533.567225-15-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
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
V8 -> V9:
- Updated error codes (Michal W).
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

