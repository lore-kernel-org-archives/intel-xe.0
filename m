Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1792C7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDAD10E06F;
	Wed, 28 Aug 2024 21:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ra76o8FW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7BB10E06F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724879334; x=1756415334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AoyrkuHt7kzTtwG1nCIaULQD6/qosjFaBiykVMirCwY=;
 b=Ra76o8FWr4zvWci5H7a/oBKVFf9Et23opG4nQBZQJ9pxNMHVMjJ57I/A
 nAGyZt35G1X3Z6Xw9Y/rpM5NQtJ+GqdNf3z33nyzBsndnLTSIeRWOrhtN
 Yv/Fy5CwGPHztZjfC4Iw+vMi4APLs0Zdjawlhgt3OTi57XNQjBq6CltTQ
 y2efZwj2YXW0cSTTG4W/8+811sUtJIRC+clfSrZ0wFUnOM/EmPXwfETBK
 Jy0WZuODXxl74tUTYiLKF6mNd55fOTgx3yrDBCy9gxt2ulE83hRqOHn7A
 TkFjKnc5uh+FsZVqSxAq3+4OFL75WbU9rV+SEc3lHUoFYgGOHejrk7tHr Q==;
X-CSE-ConnectionGUID: lVHo9nRSSdmnjnSBq9b0uA==
X-CSE-MsgGUID: 9CoG9fjTTHqIWdI4JTVfTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23626040"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23626040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:08:54 -0700
X-CSE-ConnectionGUID: e0+u/JGXQv66N44ffvh4Dg==
X-CSE-MsgGUID: DP9Kg8jqRtO+yQ7QDgStbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67720236"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:08:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/4] drm/xe/pf: Fix documentation formatting
Date: Wed, 28 Aug 2024 23:08:07 +0200
Message-Id: <20240828210809.1528-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240828210809.1528-1-michal.wajdeczko@intel.com>
References: <20240828210809.1528-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Current formatting of "The VF FLR Flow with GuC" only looks fine,
but it will not render properly when included in htmldocs due to:

  WARNING: Block quote ends without a blank line; unexpected unindent.
  CRITICAL: Missing matching underline for section title overline.

Fix that by adding proper indent and using list markup.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 54 +++++++++++----------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index ebf06e037750..d11839d9e7d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -153,33 +153,35 @@ int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
 /**
  * DOC: The VF FLR Flow with GuC
  *
- *          PF                        GUC             PCI
- * ========================================================
- *          |                          |               |
- * (1)      |                         [ ] <----- FLR --|
- *          |                         [ ]              :
- * (2)     [ ] <-------- NOTIFY FLR --[ ]
- *         [ ]                         |
- * (3)     [ ]                         |
- *         [ ]                         |
- *         [ ]-- START FLR ---------> [ ]
- *          |                         [ ]
- * (4)      |                         [ ]
- *          |                         [ ]
- *         [ ] <--------- FLR DONE -- [ ]
- *         [ ]                         |
- * (5)     [ ]                         |
- *         [ ]                         |
- *         [ ]-- FINISH FLR --------> [ ]
- *          |                          |
+ * The VF FLR flow includes several steps::
  *
- * Step 1: PCI HW generates interrupt to the GuC about VF FLR
- * Step 2: GuC FW sends G2H notification to the PF about VF FLR
- * Step 2a: on some platforms G2H is only received from root GuC
- * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
- * Step 3a: on some platforms PF must send H2G to all other GuCs
- * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
- * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
+ *	         PF                        GUC             PCI
+ *	========================================================
+ *	         |                          |               |
+ *	(1)      |                         [ ] <----- FLR --|
+ *	         |                         [ ]              :
+ *	(2)     [ ] <-------- NOTIFY FLR --[ ]
+ *	        [ ]                         |
+ *	(3)     [ ]                         |
+ *	        [ ]                         |
+ *	        [ ]-- START FLR ---------> [ ]
+ *	         |                         [ ]
+ *	(4)      |                         [ ]
+ *	         |                         [ ]
+ *	        [ ] <--------- FLR DONE -- [ ]
+ *	        [ ]                         |
+ *	(5)     [ ]                         |
+ *	        [ ]                         |
+ *	        [ ]-- FINISH FLR --------> [ ]
+ *	         |                          |
+ *
+ * * Step 1: PCI HW generates interrupt to the GuC about VF FLR
+ * * Step 2: GuC FW sends G2H notification to the PF about VF FLR
+ * * Step 2a: on some platforms G2H is only received from root GuC
+ * * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
+ * * Step 3a: on some platforms PF must send H2G to all other GuCs
+ * * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
+ * * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
  */
 
 static bool needs_dispatch_flr(struct xe_device *xe)
-- 
2.43.0

