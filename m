Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580C8CA0FE8
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 06:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378A410E72B;
	Fri,  1 Sep 2023 06:58:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF8D10E729
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 06:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693551505; x=1725087505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JIvBv/N9b9syNk+ngqP1JNDwAUoI+cqeYgeArjoXhJs=;
 b=EZTbttHdqpsO5ajlYqGWHeX4NlW/Aayj6TAC1TyApMLxBy9e08NME+CG
 u6ZCGhMG4rY+Gvd7gbIxezD/UjgVV2moMbNiibz9whqGci8AGEe8xhc6U
 Z2CN81df0txYqHT6XeIZAN/wwpdRXcxyp8HRknnpfX0cB+6s27K6zTHF6
 H+jGxwBVfekUpm1YOdUvRcX1e8KI7CxBIBLhVI2Xnp8beslMSgQmhy/vc
 hmjWsUgEO6H3MGzemWXmpX8DNcC87bxygja2+ZKitywze1VKxJsS7GFd9
 TLqHieacLwU6Hj1MC3HGCPE4Q1iZY1gcpcIYrLntgZijsygy0kh5vRG0r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379936687"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="379936687"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 23:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883091794"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="883091794"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 23:58:27 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 12:36:47 +0530
Message-Id: <20230901070648.1100049-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901070648.1100049-1-aravind.iddamsetty@linux.intel.com>
References: <20230901070648.1100049-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Use spinlock in forcewake instead of
 mutex
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In PMU we need to access certain registers which fall under GT power
domain for which we need to take forcewake. But as PMU being an atomic
context can't expect to have any sleeping calls.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 14 +++++++-------
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index ef7279e0b006..53d5b013a80c 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -42,7 +42,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	struct xe_device *xe = gt_to_xe(gt);
 
 	fw->gt = gt;
-	mutex_init(&fw->lock);
+	spin_lock_init(&fw->lock);
 
 	/* Assuming gen11+ so assert this assumption is correct */
 	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
@@ -116,7 +116,7 @@ static int domain_wake_wait(struct xe_gt *gt,
 {
 	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
 			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			      NULL, false);
+			      NULL, true);
 }
 
 static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
@@ -129,7 +129,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
 {
 	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
 			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			      NULL, false);
+			      NULL, true);
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
@@ -147,7 +147,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	enum xe_force_wake_domains tmp, woken = 0;
 	int ret, ret2 = 0;
 
-	mutex_lock(&fw->lock);
+	spin_lock(&fw->lock);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!domain->ref++) {
 			woken |= BIT(domain->id);
@@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 				   domain->id, ret);
 	}
 	fw->awake_domains |= woken;
-	mutex_unlock(&fw->lock);
+	spin_unlock(&fw->lock);
 
 	return ret2;
 }
@@ -176,7 +176,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	enum xe_force_wake_domains tmp, sleep = 0;
 	int ret, ret2 = 0;
 
-	mutex_lock(&fw->lock);
+	spin_lock(&fw->lock);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!--domain->ref) {
 			sleep |= BIT(domain->id);
@@ -191,7 +191,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 				   domain->id, ret);
 	}
 	fw->awake_domains &= ~sleep;
-	mutex_unlock(&fw->lock);
+	spin_unlock(&fw->lock);
 
 	return ret2;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index cb782696855b..ed0edc2cdf9f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -76,7 +76,7 @@ struct xe_force_wake {
 	/** @gt: back pointers to GT */
 	struct xe_gt *gt;
 	/** @lock: protects everything force wake struct */
-	struct mutex lock;
+	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
 	enum xe_force_wake_domains awake_domains;
 	/** @domains: force wake domains */
-- 
2.25.1

