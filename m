Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BCCCD183
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F78110E2F0;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRS2s60j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850B10E2F6
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272992; x=1790808992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QcB0jLre5jMMscfs/U7zgg78Nu1bZVoBsyyLyvqbXro=;
 b=dRS2s60jR6P1pTEML7WIPe5A55HHLQpqii3dJLBvXS7ODjc2Rdo0SpVp
 TR0JjhbP+/S6oahtEKKC3lwUkLsm27MA3Kq9fmdilqXIjqtBWjfbHaMwf
 4LOy6LfRFLtox0wqQ035VdXNUjY79nTGSyXR7S9JFK0Bek5QgOwhqN7iM
 1Ryxfn024c6ie72RtSauWb18H522kL063FStK7L4TomuSV9z3a03j6+PS
 pjdZPdLGRO8UuGxaSmb2czQ49orOw/nBIaFC9HiURGEENXQwKPtgr8LuZ
 yZkiRNKE17eFVZLmEz5k23dpfKapyWT5zfMvLQFZSBLUB5+osYU4eBq09 w==;
X-CSE-ConnectionGUID: h+5lIIaBTryYt6QABtVZsA==
X-CSE-MsgGUID: vUJGQpmzToC367NfE7oWOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397741"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397741"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: mYLVIhEORdCkB5FZhJWHwg==
X-CSE-MsgGUID: /AOh7E9sQPG3yojDsli6Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229433"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 01/23] drm/xe/huc: Adjust HuC check on primary GT
Date: Tue, 30 Sep 2025 15:56:18 -0700
Message-ID: <20250930225618.140071-26-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

