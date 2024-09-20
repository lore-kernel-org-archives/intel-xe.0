Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93FFC7883B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9595C10E0E3;
	Fri, 20 Sep 2024 13:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YESPu6vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75D710E0E3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726839142; x=1758375142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EuNgjNDep5xBUxMhqNFl5vcacHDOr6bMV0brEFSnxwk=;
 b=YESPu6vmSVwcsR8WzlAI/OasVlnsU2rYxgedDmAQ9mG+D/zJ5ployB2t
 X+s3QSkRrPtbYOaq9j+BG4Ga8vOTbwjyuat7h4RxvIONMd5BUzVkNquYu
 vHzXnBjiyZfV4kKVutDFSAso405a8lySP7+3+VqQw20OSQuVF013JKOf+
 KSxaZ5ldo6LkW+V0QFLMHFPT/AOm7IFCvImNDQrIEHrrsz38alUOXX3rB
 RjBTUkOLRiGe5x4U/L16f+SU9VaVD9bgtel9PTNlMgS5EHc+3Phc/MoTO
 WHAGBX4hj86Hpe7+sn667JQsCuVQ+oDZSJ/uP8smQebWaNwbutCu4hBHb Q==;
X-CSE-ConnectionGUID: zaW+iu/RRNS89MnLRUDGrA==
X-CSE-MsgGUID: kq1mHRjtS1elB4zOGiY0oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="13606891"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="13606891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:32:21 -0700
X-CSE-ConnectionGUID: Dt0HaMENS/6uAKEJrgQiHg==
X-CSE-MsgGUID: Lq8YrLKqQdSoR8Hm8xHxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75069314"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:32:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: janga.rahul.kumar@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] [RFC]drm/xe: Introduce active ccs tracking
Date: Fri, 20 Sep 2024 19:05:14 +0530
Message-Id: <20240920133514.84426-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Current ccs_mode setting is allowed when no client has
actively opened device. Instead it should be restricted
 if there is any active ccs engine in use.

Closing device fd is always a async and may lead to show
client present even after fd is closed from user perspective.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c  | 3 +++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_types.h    | 6 ++++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..51ab8e5dd583 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -195,6 +195,9 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 		ret |= domain_sleep_wait(gt, domain);
 	}
 	fw->awake_domains &= ~sleep;
+	if (!(fw->awake_domains & XE_FW_GT))
+		if (gt->ccs_mode && !IS_SRIOV_VF(gt_to_xe(gt)))
+			gt->ccs_active = 0;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 9360ac4de489..dbc49d595a6c 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -69,6 +69,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 	}
 
 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
+	gt->ccs_active = mode;
 
 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
 		  mode, config, num_engines, num_slices);
@@ -132,10 +133,9 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
-	/* CCS mode can only be updated when there are no drm clients */
-	spin_lock(&xe->clients.lock);
-	if (xe->clients.count) {
-		spin_unlock(&xe->clients.lock);
+	/* CCS mode can only be updated when there is no active ccs_mode */
+	if (gt->ccs_active) {
+		xe_gt_info(gt, "Setting compute mode not allowed ccs_active:%d\n", gt->ccs_active);
 		return -EBUSY;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index a287b98ee70b..791f9aef8174 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -219,6 +219,12 @@ struct xe_gt {
 	 * available compute slices are allocated to it.
 	 */
 	u32 ccs_mode;
+	/**
+	 * @ccs_active: Number of compute engines active currently.
+	 * Keep track of active ccs engines to allow/deny config by next user with
+	 * new ccs_mode.
+	 */
+	u32 ccs_active;
 
 	/** @usm: unified shared memory state */
 	struct {
-- 
2.34.1

