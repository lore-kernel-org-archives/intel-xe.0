Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8E8D711C7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9FF10EAD9;
	Thu, 18 Dec 2025 21:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BM+tkDY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8487210EB73
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766093389; x=1797629389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29kUn7U6+WiT++iWU2DolVqjAxyHb6KnyMPV3LU09ZM=;
 b=BM+tkDY3lg09zREzeaKGMpiTvrfVdfazp752Ydf8d4FPX7C4IqOy7pSs
 XA7ApW7yVvowPSsnYYvSamhnxVL0Hxq5DNUB5iXVGzDbn03b+A/YUdvD2
 Z0OEOSYDAg1imQxxU3TXvY+QY9l144snhk7rZ385QYDE8/LaQyEl8K2nK
 6vpKcpoSHqTum+eUBy3sdJ8KAnEJmdy7yj4OriZoglwTOqMWYdwow3513
 Ly0/lq7hjEwddvEFIwAxHbP5sB/PHThdHBmkeUKYH6i1JJTf8UnLrfjov
 mP3KV80JpT9RgUp3r8tdUdvnCNIJAlkXSmnJ/GCLsmaFxWueexdM18m+e Q==;
X-CSE-ConnectionGUID: 6bJ/NHLGQeGKIviKnDl2jQ==
X-CSE-MsgGUID: G9cP/HdbTX2RIV+hIaYOcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67808712"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67808712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:49 -0800
X-CSE-ConnectionGUID: ppgQh8/rTn6uEKFPg0FqgA==
X-CSE-MsgGUID: rBrpS8dXQcq1O/0uyKekrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198594096"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, dixit.ashutosh@intel.com
Subject: [PATCH v2 3/4] drm/xe/guc: READ/WRITE_ONCE ct state in
 ct_change_state and enabled
Date: Thu, 18 Dec 2025 21:29:50 +0000
Message-ID: <20251218212946.16577-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218212946.16577-6-jonathan.cavitt@intel.com>
References: <20251218212946.16577-6-jonathan.cavitt@intel.com>
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

Use WRITE_ONCE when operating on ct->state in guc_ct_change_state to
prevent the compiler from ignoring this operation.  Use READ_ONCE when
reading ct->state in xe_guc_ct_enabled for the same reason.

Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 +++-
 drivers/gpu/drm/xe/xe_guc_ct.h | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 38b58590c94b..c59e38189cf0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -529,7 +529,9 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
-	ct->state = state;
+
+	/* WRITE_ONCE pairs with READ_ONCE in xe_guc_ct_enabled. */
+	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
 		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5599939f8fe1..5f2811a06833 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -35,7 +35,8 @@ static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
 
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
-	return ct->state == XE_GUC_CT_STATE_ENABLED;
+	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
+	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
 }
 
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
-- 
2.43.0

