Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDD5C77B70
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082CB10ECDE;
	Thu,  6 Apr 2023 20:18:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1022810ECD2
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680812333; x=1712348333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fJxW2LJwdknPVq99d79TxeXAU207I8nhq2f4mrqHBfQ=;
 b=HsEekoTs8Lw8y8W1V7/pE4hJq0Mu00+iAarVncOESXEss+w1juvuDCZJ
 YbX2wWVY5MQBDvY3TUUZ7y2Sc5VVztlvk03qUp+0QT4iFp+wQrZJEbNXR
 lQ+Z5wZ26VwFlInWLZE6h/VetUk27bhuQLXqMkD7Kim4gK2XGnE8U4BpS
 RRnjFs3R7+bBchwbRBJxt58omZBtNd4W57NU6gBiweIXq+DJI436/TO7Z
 Dkaz+1m/iwgobfer3g7ebMwZsOJdq0JA02Qy70LXL2UMEoRvLJ+TdI2XW
 e37L/dKIAqHPiH/gcyi4IimkP17ffkNay99eHdISgDAbUQRbVmk1VSusv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322482255"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322482255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751775487"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="751775487"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:18:45 -0700
Message-Id: <20230406201845.1797532-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406201845.1797532-1-matthew.d.roper@intel.com>
References: <20230406201845.1797532-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 9/9] drm/xe: Clean up xe_device_desc
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that most of the characteristics of a device are associated with the
graphics and media IPs, the remaining contents of xe_device_desc can be
cleaned up a bit:

 * 'gt' is unused; drop it
 * DEV_INFO_FOR_EACH_FLAG only covers two flags and is only used in this
   one file; drop the unnecessary macro complexity
 * Convert .has_4tile to a single bitfield bit so that it can be packed
   with the other feature flags
 * Move 'platform' lower in the structure for better packing

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c10f2d45ae91..b92d8b5a391e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,11 +25,6 @@
 #include "xe_pm.h"
 #include "xe_step.h"
 
-#define DEV_INFO_FOR_EACH_FLAG(func) \
-	func(require_force_probe); \
-	func(is_dgfx); \
-	/* Keep has_* in alphabetical order */ \
-
 struct xe_subplatform_desc {
 	enum xe_subplatform subplatform;
 	const char *name;
@@ -47,23 +42,20 @@ struct xe_device_desc {
 	const struct xe_graphics_desc *graphics;
 	const struct xe_media_desc *media;
 
-	enum xe_platform platform;
 	const char *platform_name;
 	const struct xe_subplatform_desc *subplatforms;
 	const struct xe_gt_desc *extra_gts;
 
-	u8 gt; /* GT number, 0 if undefined */
-
-#define DEFINE_FLAG(name) u8 name:1
-	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
-#undef DEFINE_FLAG
+	enum xe_platform platform;
 
+	u8 require_force_probe:1;
+	u8 is_dgfx:1;
 	/*
 	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
 	 * already determine that from the graphics IP version.  This flag
 	 * should eventually move entirely into the display code's own logic.
 	 */
-	bool has_4tile;
+	u8 has_4tile:1;
 };
 
 __diag_push();
-- 
2.39.2

