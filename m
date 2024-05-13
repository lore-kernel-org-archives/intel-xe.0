Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81AEC25B79
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893C310E532;
	Mon, 13 May 2024 08:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6s2zwoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D764910E505
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715589748; x=1747125748;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OzEwzdeDBduIs9yt2dNd7fsjGxonjrNTAwLKqD5RBuU=;
 b=T6s2zwoe5ys0TF2BCMSgcJaBvmgfHE9YwrdGAITjCRHLh3x4H0eh+8V6
 YsiH36vqin4O/O4bLS5FMhSTuwF6KvlPnk26lQxkF9SXV6Wyj3zwoHFc7
 uqiCgIeivvluD1sPtleYlAQwap9zAvOhqVDDHf3K0xp0WcEmXDYMH04bo
 zb7/3aDGC0LqufrZkp8YnurLQvS75vkaSwVFTrmYbz70W2MwSLS5W1ev4
 5foLMP4bVVFZvRV5G1yVxYsY+zLNSSYM0jtT1e9eFtySWs3iJ4AtXnxqC
 A4vZIRM1QiXm3YrFVCWjIYCuLoDO9H3hkigPImX6narXxgwEXcJStNQ/L g==;
X-CSE-ConnectionGUID: jD2l3ZLzRDaSy2nXY7c1Cw==
X-CSE-MsgGUID: R9ORe2ART1W1kin4kmRU2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11452632"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11452632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:28 -0700
X-CSE-ConnectionGUID: B8XvoBCXTtmcvzvjBmo3bw==
X-CSE-MsgGUID: HwXFmgXNQ0aqGDwefSHl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30306516"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Fix xe_gt_throttle_sysfs.h
Date: Mon, 13 May 2024 10:42:15 +0200
Message-Id: <20240513084218.2084-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240513084218.2084-1-michal.wajdeczko@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
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

We don't need to include drm/drm_managed.h here.
We don't need to comment final #endif.
Also remove empty line at the end.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
index 6c61e6f228a8..335c402b51a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -6,11 +6,8 @@
 #ifndef _XE_GT_THROTTLE_SYSFS_H_
 #define _XE_GT_THROTTLE_SYSFS_H_
 
-#include <drm/drm_managed.h>
-
 struct xe_gt;
 
 int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
 
-#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
-
+#endif
-- 
2.43.0

