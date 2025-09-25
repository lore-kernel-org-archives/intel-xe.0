Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22285CAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 12:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D834A10E2C7;
	Thu, 25 Sep 2025 12:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHvs3xXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC4910E2C7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758802912; x=1790338912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YajSQH8ThQgMxA3T1khHLg0CRjxRL+sJ/HJa/Q5tDTI=;
 b=nHvs3xXNyzU3N3Izv9tR+lgk0ZBzc9hBP2P/6m2Ln+lrdHmW19prFG0v
 PEE+qTMXfC18Xq4ZtSGABKu0fl0H1aWug9C1NYcbbJHteR8yXGDWZZ/mv
 w00kYLOqYS2AI70SnMdnFUyiQMlTAlan3885/Eaafd0E0cXvkJ0UcTO+r
 KK9l1d5+D3nq4LqnlTH6UTxNcD+zVsdqGQPQXF52onUwJMKxlglEDmFS9
 ZYGUkQaHxlUSgyfxuz2SrtGNjoVe3DIeeCaM7LuPBxBRcEPW16DkCJusR
 5zBMb7OGaJMVqn+jAAkHoILrWTEDWJUmP8P3NKutXRvzQ8Mezpbglpalp g==;
X-CSE-ConnectionGUID: VogHfvTKSA+i+J4wi0y/9A==
X-CSE-MsgGUID: BDPvRFSfRcKgCqyGhKg2rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60818067"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60818067"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:21:52 -0700
X-CSE-ConnectionGUID: Y23Mc1STSoiloptJcFCWmQ==
X-CSE-MsgGUID: 5M2pxsMqSo6yyE+YPvHReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="181328333"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2025 05:21:49 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 8/8] drm/xe: Handle xe_work_period destruction
Date: Thu, 25 Sep 2025 11:46:58 +0000
Message-ID: <20250925114700.68090-9-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
References: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
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

This adds the xe_work_period destruction procedure.
We iterate over all entries in the xe::work_period::users
xarray and cancel any pending delayed work. Then destroy
the xarray itself.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 30d9f2747eab..3b546d92fa03 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -418,6 +418,8 @@ static struct drm_driver driver = {
 static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_user *user = NULL;
+	unsigned long i;
 
 	xe_bo_dev_fini(&xe->bo_device);
 
@@ -433,6 +435,15 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
+
+	mutex_lock(&xe->work_period.lock);
+	xa_for_each(&xe->work_period.users, i, user) {
+		if (cancel_delayed_work_sync(&user->delay_work))
+			xe_user_put(user);
+	}
+	xa_destroy(&xe->work_period.users);
+	mutex_unlock(&xe->work_period.lock);
+
 	ttm_device_fini(&xe->ttm);
 }
 
-- 
2.49.0

