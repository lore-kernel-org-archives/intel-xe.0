Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0AFC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F32D10E9A3;
	Fri,  9 Aug 2024 16:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUdXmwRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D51910E9A0
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222352; x=1754758352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/+6S8uoTgNGCiPNy+xkTIDSuB6Aj8Ro1AKnYTYJYqo=;
 b=ZUdXmwRC9Qs8MmsnbzkmwNTmnN4raEVGHu/vRUO01t5Xxxs6tQwWcTK1
 4zqyRW/tGavChpZvtYKKc8TKqgBcKy99nFXdW3E/wFdhPNLo69MOVtm+5
 Oc0Fd8Q53GXOyLsiWE6T7BfQnYjav8r3ulbBBYIPYgL0/dsOpTwgRu+uV
 LIkS6kcB9O6/DxgWQF5PVxgFK4sNlgXgpMOF4BVP+s6NDxKSpBpAlu68G
 q7i0OAvxvsEFj7nHI+q6HcJPTOTN6GHOMli9qM7s3oxdgt9H76ovHt9ua
 Yv77DFvf83sU4AohmuiUUzAbjVqdVIlkVgb7NjTap1m9UzT9EY4yG5tIf g==;
X-CSE-ConnectionGUID: JZHPxzsORyCianfJhvHOLQ==
X-CSE-MsgGUID: lr6U3/xDRkOQMu+KVRpVyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379444"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379444"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:31 -0700
X-CSE-ConnectionGUID: AdTEk9OZRHWsFFEoPuL1RQ==
X-CSE-MsgGUID: 1SLP/V37Tc2uD9x0lG4F2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569357"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe/pf: Define stub for pf_send_vf_control_cmd()
Date: Fri,  9 Aug 2024 18:51:57 +0200
Message-Id: <20240809165159.662-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

For some advanced KUnit test cases we may want to use replacement
function instead of the real pf_send_vf_control_cmd().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       | 1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 1ed7d49bef8c..e91c71d768ff 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -58,6 +58,7 @@ static int pf_send_vf_control_cmd(struct xe_gt *gt, unsigned int vfid, u32 cmd)
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_sriov_dbg_verbose(gt, "sending VF%u control command %s\n",
 				vfid, control_cmd_to_string(cmd));
+	XE_TEST_REDIRECT(gt->sriov.pf.control.send_vf_control_cmd, gt, vfid, cmd);
 
 	err = guc_action_vf_control_cmd(&gt->uc.guc, vfid, cmd);
 	if (unlikely(err))
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 11830aafea45..6d7a3c8cc38a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -10,6 +10,10 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue_types.h>
 
+#include "tests/xe_test.h"
+
+struct xe_gt;
+
 /**
  * enum xe_gt_sriov_control_bits - Various bits used by the PF to represent a VF state
  *
@@ -102,6 +106,9 @@ struct xe_gt_sriov_pf_control {
 
 	/** @lock: protects VF pending list */
 	spinlock_t lock;
+
+	/* private: */
+	XE_TEST_DECLARE(int (*send_vf_control_cmd)(struct xe_gt *gt, unsigned int vfid, u32 cmd));
 };
 
 #endif
-- 
2.43.0

