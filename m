Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5516CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588710E709;
	Tue,  7 Oct 2025 20:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chgc1TBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00C010E38D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870129; x=1791406129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QcB0jLre5jMMscfs/U7zgg78Nu1bZVoBsyyLyvqbXro=;
 b=chgc1TBFtyaRWgoDD3gg5jLQ86GZ6IizAn1glAwMU3W/l9cj0djXO8ku
 KAKkhkdJaPIZQe5iael7K3Q1mD++UxGN8cSUUUAMZaW6g5AP65uyHuovk
 pqN9/NUN+fqwxyRM+qGdwMNMr2WNkqJmeT4Bcsy4BOUnndkb9jMJ9/CjF
 8aRzRun8UcfGLwRkcQzGBcAH5DAGCtiBGckBAJ9P7eDf6OjMMjCCUA47G
 9dSUIcg1qNDfDsGs26DSpMna5SArq46IMrYhGl0gfvKlLezNOUJbW7f7H
 kMFg8sw35UyqmV6sYAjNsBzXmQ2Screw3ButkICl8P1FXdY1njN5MLIDH A==;
X-CSE-ConnectionGUID: 3zLKeQBjRhS0JRUGnH+a+w==
X-CSE-MsgGUID: uZ6zcdCjSn2/8m2WflMe7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616734"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
X-CSE-ConnectionGUID: MZxMjvmOTO64mmSqUaLLpw==
X-CSE-MsgGUID: dfTB6wI5QSaoXdMs3IARwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631057"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 01/23] drm/xe/huc: Adjust HuC check on primary GT
Date: Tue,  7 Oct 2025 13:48:31 -0700
Message-ID: <20251007204829.1468209-26-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

