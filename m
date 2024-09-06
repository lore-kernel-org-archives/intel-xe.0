Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954B7E6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8FB10EB05;
	Fri,  6 Sep 2024 21:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FepmRP9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2CB10EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659526; x=1757195526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQ58eOUIuw1S+DmJTlI5O+tbx9tOMM7xCAtybfLusVU=;
 b=FepmRP9PmE3Zf/Z/9FOuW5Z9hUp07EMWzkX+vCirhfPm74ri7dMuuiC6
 6TTabu3pIEHpmb9olHdNDR5spPOvzA8roZzu+J7NWSY95sThXHxjbleIv
 9B8wEIsLPsB02aknekR6fpo/v6cXemUuAg2O23FVtawxWF8cAAYZFFBWR
 Og2GQZ3B3wcGAB8LIxWVJ5+AlpFHe9d0NRdDXkt/cq10RwGW4pndxGVcu
 svUZwVvrZ4FOQN0frnadr31KU4uKjJGOibJ24dKfW7zRoU3fvbsP0FQCO
 RmKsAi8dIj8VmO42n0kD6WYqvEwiz6pIgGzlkbgzHHqHsjfEmtYusVLmd Q==;
X-CSE-ConnectionGUID: RiXyTJdVTmSe6CNN6y2cTQ==
X-CSE-MsgGUID: JoJX8buyTZuuExI+85jQnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580586"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:05 -0700
X-CSE-ConnectionGUID: ho2cT6NCThykOcAGOLmjZA==
X-CSE-MsgGUID: fHYy0EYzRh+HN7hHINqN4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656339"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:05 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 6/9] drm/xe/xe3lpm: Add new "instance0" steering table
Date: Fri,  6 Sep 2024 14:51:50 -0700
Message-ID: <20240906215153.31210-7-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

MCR steering on Xe3 media IP is almost the same as it was on Xe2, except
for one new range (0x38D0D0 - 0x38D0FF) which has changed to an MCR
"MEDIAINF" range on Xe3.  Since we can always steer to to grpid /
instanceid 0 for MEDIAINF ranges, define a new "INSTANCE0" steering
table for Xe3 media.  Xe3 can continue to use the same OADDRM/GPMXMT
table as Xe2.

Bspec: 74298
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7d7bd0be6233..d0d84754c3f6 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -237,6 +237,18 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xe3lpm_instance0_steering_table[] = {
+	{ 0x384000, 0x3847DF },         /* GAM, rsvd, GAM */
+	{ 0x384900, 0x384AFF },         /* GAM */
+	{ 0x389560, 0x3895FF },         /* MEDIAINF */
+	{ 0x38B600, 0x38B8FF },         /* L3BANK */
+	{ 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
+	{ 0x38D0D0, 0x38D0FF },		/* MEDIAINF */
+	{ 0x38F000, 0x38F0FF },         /* GAM */
+	{ 0x393C00, 0x393C7F },         /* MEDIAINF */
+	{},
+};
+
 static void init_steering_l3bank(struct xe_gt *gt)
 {
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
@@ -439,7 +451,10 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
-		if (MEDIA_VER(xe) >= 20) {
+		if (MEDIA_VER(xe) >= 30) {
+			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
+			gt->steering[INSTANCE0].ranges = xe3lpm_instance0_steering_table;
+		} else if (MEDIA_VER(xe) >= 20) {
 			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
 		} else {
-- 
2.44.0

