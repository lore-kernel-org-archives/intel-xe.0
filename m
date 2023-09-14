Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD52CEDE986
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 06:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED3A10E508;
	Thu, 14 Sep 2023 06:05:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7603B10E506
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694671547; x=1726207547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qcrG4LrxaZaoc4RqOuP5Q3xEYfx/V/wBfiNuCtD/m8I=;
 b=UJUhIHH7xhMnzCbBEyMdZIkqXYPedWBF6hWcsBsnZIivSoGkqtr+4iGN
 Uy86/nnYajkc3lb4ii+iHJxwYZbz4cwbwXQ4pmozjeuGWeYu6jtaUSq4K
 a1VhpIlC37c7QmhzqG39kPBHznM68erjPHqCoqI0tumJhGj52fV6izcNW
 3HuLK41LgzUkgm6bQ5gSigUZZXC+H7sX+g+Uq4pvy/yb3S4T8XNRlBqNq
 AA2G/57V0XE1odTzISTEBDK169AxOlwiW/wiaiaErSV7iL9BXKhaOEGsS
 Q8lDKMc9aOVFbqlJ7e2H2cid7uj4eu1JOK73k/WJlPmfH93V0U6t9dT2j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381547251"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="381547251"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773770203"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="773770203"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:04:50 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 11:43:16 +0530
Message-Id: <20230914061317.1024579-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
References: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
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
index ed2ecb20ce8e..32d6c4dd2807 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -42,7 +42,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	struct xe_device *xe = gt_to_xe(gt);
 
 	fw->gt = gt;
-	mutex_init(&fw->lock);
+	spin_lock_init(&fw->lock);
 
 	/* Assuming gen11+ so assert this assumption is correct */
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
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

