Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70182C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 18:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC46B10E3E8;
	Mon, 10 Jun 2024 18:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8DDKss3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE23F10E3E8
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 18:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718044696; x=1749580696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9ljaQQ4cc4i+bSjST1L+Jy3s0HLpkQXRpmnVgG8/qw=;
 b=e8DDKss3yMHWXpzeImOiMBMcl+t5qyzT08r1+Wm/ClhINAkr+6+RFQvt
 YWQsJf6WqwgmibFQifjvSp+yqGekHxW8qztuhGZJmw4NrCEX3pv7WmNTR
 6ga1kaUxf8z6ASTcU2AOW24nFMiFcjKDYiDQBxSib3cEeYwU4CHuMK8t9
 mgyIuOAza9z2yDVy6hNYFUC4aEsdDSCSzFf7yLPKVYiKhVkxG/bTzfniK
 NwntX5aaturHPKNsTAloPrAcb/WP55/AUXIGtIlXxJTwSxNKYcYNCeDB9
 QSX8awsJp31I8u38WmtzXp0KP/J0Ki5VRrwYY1Whlz6v67ewsyEB+jiDW w==;
X-CSE-ConnectionGUID: Wbtp5Q2pSjGxE6XgMqTcqg==
X-CSE-MsgGUID: u8XAgNJIR2mcaFkZKCpNkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14846277"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14846277"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:15 -0700
X-CSE-ConnectionGUID: goAGNWGISQGb/rih9KUhag==
X-CSE-MsgGUID: I+wN0l8CSCSRSOMAVn/ktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43726883"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/4] drm/xe/vf: Ignore force-wake requests if VF
Date: Mon, 10 Jun 2024 20:37:57 +0200
Message-Id: <20240610183757.1812-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240610183757.1812-1-michal.wajdeczko@intel.com>
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
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

The control and ack force-wake registers are not accessible for
the VF drivers. To avoid changing existing code logic that tracks
woken domains, simply ignore all attempts to access control or ack
registers if we are running as a VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index b0baa9094418..4d472192e87b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
@@ -101,6 +102,9 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 
 static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
 {
+	if (IS_SRIOV(gt_to_xe(gt)))
+		return;
+
 	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
 }
 
@@ -109,6 +113,9 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	u32 value;
 	int ret;
 
+	if (IS_SRIOV(gt_to_xe(gt)))
+		return 0;
+
 	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
-- 
2.43.0

