Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319FAC38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 05:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99710E03E;
	Wed, 10 Jul 2024 05:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFq+9OlX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA6B10E03E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 05:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720589200; x=1752125200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G7yqFFcGD82jMltNgejFCGl/bM5U/fdalWroMeDYObU=;
 b=nFq+9OlXgMBXrOyvocCu0b4KN2JwwQq2b5U3jtO1T3N1kAnOmI9VgTod
 gJk5jICQQrP32H6HSKht+iuOmerUczczTvY/s+KKITmmTD8TOqoiXjnLp
 ksEjt7CycUL/hCRP5Bk/13jlz/4PcQJYQMQUtTlMjKaPdhgyZ3PjG7mx6
 UXz4n8FVeyXefnHr0S9dUy4JTsjD76GN52R44c7rxCkU2/M/ReQG9ir9O
 9DmX3hMmlNUvYu4Pb47W2hHK+DXbeVq3EtsipX6q0hxdzTpV9s6hwvnTX
 eQJKs/ty1x/VUuBlQ3eHdG7d/Offl5qeusUbV7LYHzckqzCETR1zD98lI A==;
X-CSE-ConnectionGUID: bHmqjO6gQcSaPWQBStinOg==
X-CSE-MsgGUID: CLn7Y6RrRsiVdoA0mlyxEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29285429"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="29285429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:26:40 -0700
X-CSE-ConnectionGUID: 6J9p2uZJRC64vNBWSLOlgA==
X-CSE-MsgGUID: 6tICEmJjSbqsfjz9r77LNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="52898731"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa003.jf.intel.com with ESMTP; 09 Jul 2024 22:26:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2: Make subsequent L2 flush sequential
Date: Wed, 10 Jul 2024 10:57:50 +0530
Message-Id: <20240710052750.3031586-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

Issuing the flush on top of an ongoing flush is not desirable.
Lets use lock to make it sequential.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   | 2 ++
 drivers/gpu/drm/xe/xe_gt.c       | 1 +
 drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 64aea962afd5..06cebaffb451 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -833,10 +833,12 @@ void xe_device_l2_flush(struct xe_device *xe)
 	if (err)
 		return;
 
+	spin_lock(&gt->global_invl_lock);
 	xe_mmio_write32(gt, XE2_GLOBAL_INVAL, 0x1);
 
 	if (xe_mmio_wait32(gt, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
+	spin_unlock(&gt->global_invl_lock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b04e47186f5b..85f974441d50 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -387,6 +387,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	xe_pcode_init(gt);
+	spin_lock_init(&gt->global_invl_lock);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6b5e0b45efb0..38a0d0e178c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -362,6 +362,12 @@ struct xe_gt {
 	 */
 	spinlock_t mcr_lock;
 
+	/**
+	 * @global_invl_lock: protects the register for the duration
+	 *    of a global invalidation of l2 cache
+	 */
+	spinlock_t global_invl_lock;
+
 	/** @wa_active: keep track of active workarounds */
 	struct {
 		/** @wa_active.gt: bitmap with active GT workarounds */
-- 
2.25.1

