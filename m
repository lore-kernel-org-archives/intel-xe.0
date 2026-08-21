Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C211C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 12:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326D210E289;
	Fri, 21 Aug 2026 12:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeRWtMdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0B010E289
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787314909; x=1818850909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2iYvBK5ZrTl3e6+xbcau9K2I/uVtEWy0ROa5v3EllcE=;
 b=JeRWtMdEcOEdqzA2+Ll/5EXB8U9ue83iTYY0YMHfAslWeRtJxJtnCNI/
 vSiTp5b5sy6Qmd91BrSHnJJ7XtAO89b4YzFUcqPhy6FZeKz3Z40MXOYVq
 VessVZWnBLtK0rFjE6G6mhu9tb/rVnA71JL8uspnlzSTUxLe2/QK+P1UB
 QXQTzFxOlO/+rhAqpEG0ecPOZW1WoqT/XZj9DJDu+5v9OFa8h8qgNffBz
 Sx8FC5TecI7BmH8YcmF2DomGVbThz7diYbtr5sOgQ9zx85ARcW5skm0Rp
 mu4SBLIL47QQvO6ttkcqCOte6RBj6pe9LrBv38WdBq400WvrXujhybEqi Q==;
X-CSE-ConnectionGUID: HSDT28dAQSOW5jJLC93NkQ==
X-CSE-MsgGUID: TQaYap9uQZqitbgpH3ZVFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="113400402"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="113400402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:21:49 -0700
X-CSE-ConnectionGUID: hdjM2lXASC2Vx5K+RgdnJw==
X-CSE-MsgGUID: kDgiJFf3RwmCLQzGBWj63g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="270560543"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 21 Aug 2026 05:21:46 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com, daniele.ceraolospurio@intel.com,
 sk.anirban@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
Date: Fri, 21 Aug 2026 17:51:14 +0530
Message-ID: <20260821122114.567725-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
cancellation") introduced distinguishable error codes for g2h failure
cases, but also blocked GuC CT for wedged device. This is problematic
in cases where we want to prevent user from accessing the device but
also keep GuC CT functioning on temporarily wedged device. First user
of such requirement is PCIe FLR handling where we require uC firmware
loading while the device is temporarily wedged.

Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..97e38147effd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1062,11 +1062,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (xe_device_wedged(ct_to_xe(ct))) {
-		ret = -ENOTRECOVERABLE;
-		goto out;
-	}
-
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
@@ -1813,9 +1808,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
-	if (xe_device_wedged(xe))
-		return -ENOTRECOVERABLE;
-
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
 
-- 
2.43.0

