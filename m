Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6146BCAC5B5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EED910E329;
	Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZheCwX8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5410E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844006; x=1790380006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QcB0jLre5jMMscfs/U7zgg78Nu1bZVoBsyyLyvqbXro=;
 b=ZheCwX8KjQdZNLS0fyWRbYXAz2imnAS24+ftUHvufev3MBlMdeb9kJ/r
 /4EPCpaWDfGiXhwUEJu5k8wiJKIoAz2Dj+Z0md+tZxLsRggEmPY5Y0O5X
 oROyaMp6GnpHHxacVN+eXPt0tHZo1BZzFSzgaSr8PI1y4eBhp1AILn50w
 a18/VPbyQwSlFmzfGCttNY8G4iuTKrwIFQtBfSO6K1CSIfzyQmP0hOut6
 RIl2LOrTu4wTGj8YCXiM2dDhTlnlg9H0TT+vm2zWU2DVOgJ2aCQdzACAo
 XP6LBiKwqnzCA9sM+GeyDZCtAYuUr2BbGSL13KaSyhWPqpQ8Rz+o2Yl4L w==;
X-CSE-ConnectionGUID: 73twDQyUSsWKvD6CuCUL+A==
X-CSE-MsgGUID: d/mxqHEPS9WSh2TdKnUujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817663"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: vr92rxtsTgmMHyzrY4v7Og==
X-CSE-MsgGUID: 53O5+GvyS0yh7rxmPzaC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852946"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 01/22] drm/xe/huc: Adjust HuC check on primary GT
Date: Thu, 25 Sep 2025 16:46:29 -0700
Message-ID: <20250925234628.2112163-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

The HuC initialization code determines whether a platform can have a HuC
on the primary GT by checking whether tile->media_gt is NULL; old Xe1
platforms that combined render+media into a single GT will always have a
NULL media_gt pointer.  However once we allow media to be disabled via
configfs, there will also be cases where tile->media_gt is NULL on more
modern platforms, causing this condition to behave incorrectly.

To handle cases where media gets disabled via configfs (or theoretical
cases where media is truly fused off in hardware), change the condition
to consider the graphics version of the primary GT; only the old Xe1
platforms with graphics versions 12.55 or earlier should try to
initialize a HuC on the primary GT.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 7e43b2dd6a32..0a70c8924582 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -66,14 +66,18 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 int xe_huc_init(struct xe_huc *huc)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
 
-	/* On platforms with a media GT the HuC is only available there */
-	if (tile->media_gt && (gt != tile->media_gt)) {
+	/*
+	 * The HuC is only available on the media GT on most platforms.  The
+	 * exception to that rule are the old Xe1 platforms where there was
+	 * no separate GT for media IP, so the HuC was part of the primary
+	 * GT.  Such platforms have graphics versions 12.55 and earlier.
+	 */
+	if (!xe_gt_is_media_type(gt) && GRAPHICS_VERx100(xe) > 1255) {
 		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
 		return 0;
 	}
-- 
2.51.0

