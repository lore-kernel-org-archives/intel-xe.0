Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCBAD35E3D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9C10E17A;
	Tue,  5 Nov 2024 20:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD9H4uy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A556C10E17A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 20:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730839572; x=1762375572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=chVlfHIELorprfxrdrc+DQ0YI34sxAFCPMHenNOrSy8=;
 b=CD9H4uy0vvl2ffPV0IsejM2uqe8BLJ/FAmzhhz1YRgnkrn5LPcxhtvqU
 OgiC8RqmyFdt+wJgoQ76sRZOeas4dCIOk5HV+xaX1gemkCvb5h08qQalm
 Yz7IOFvR626zD/Lz41n3Jz09eQswZfbITqIn1aRnpvmcofv5SYUvqtox4
 QZd7P3kx7l1kcuaSu1m/YHRIZokefcz9/BGJuGG32UytPjKs+tENcVK9w
 1LRNIECp3diWZ7bSlllfzU/MlZwuC7LpIZrwC8wmLB385QqqgMn+H8aK4
 +PptSDzGnSsfANdEOLEQDnPRzLdifDKRDAA0enwIVR/GbMdDJr/kc0iCK w==;
X-CSE-ConnectionGUID: UtHpLADqR2a8fvUI87ZL+A==
X-CSE-MsgGUID: Q9dttRI5Spa90/e3E5E5cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30730282"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="30730282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:46:11 -0800
X-CSE-ConnectionGUID: oCZX+Gd0Tu+czl1doNj8nw==
X-CSE-MsgGUID: BvzXe+3iTkmojDOl5ucySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="84483629"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:46:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] drm/xe/guc: Don't treat GuC generic CAT error as
 protocol error
Date: Tue,  5 Nov 2024 21:45:57 +0100
Message-Id: <20241105204557.1991-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241105173032.1947-5-michal.wajdeczko@intel.com>
References: <20241105173032.1947-5-michal.wajdeczko@intel.com>
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

GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any
context. We shouldn't treat that as G2H protocol error that would
justify a GT reset, as it may happen due to some VF activity.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
v2: replaced 16b GUC_ID_MAX with 32b GUC_ID_UNKNOWN
---
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 08ffe59f22fa..057153f89b30 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -17,6 +17,7 @@
 #define G2H_LEN_DW_TLB_INVALIDATE		3
 
 #define GUC_ID_MAX			65535
+#define GUC_ID_UNKNOWN			0xffffffff
 
 #define GUC_CONTEXT_DISABLE		0
 #define GUC_CONTEXT_ENABLE		1
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 147000fd1177..614110dbb527 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2023,6 +2023,15 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	guc_id = msg[0];
 
+	if (guc_id == GUC_ID_UNKNOWN) {
+		/*
+		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
+		 * context. In such case only PF will be notified about that fault.
+		 */
+		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
+		return 0;
+	}
+
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
 		return -EPROTO;
-- 
2.43.0

