Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA26CCED250
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF7E10E44C;
	Tue,  8 Oct 2024 01:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0iFj+Rn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF2210E44A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351320; x=1759887320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zEQuZTX7MdTHap5TRVqrHP7pXinww5P7zqW17B8UReM=;
 b=j0iFj+RnBKlHytzZQQICIF5cZj7N6VSxuQ/L2CYbYuD1nzD/mkQCnbx2
 UoA0IXvYD0iRouSvOq/njBRGVaEhJu3irYxJ1cZoMX8DH3RLIsbiP6Y/k
 vULFcGqkkFGsjMv45bjNHLJn7BDRPMZOXSnd3O6eXgmO2LMTEo/b0WJ/y
 ZVjNxB6iJHujzOkiGgjN6HCpnI2KJLfTHHJGsUlpdswkg188UmDf3kM7l
 PTLMesRkMxLfwuXYgjkabJvZq4KUAyHSUzjVLQmyyQmXa11OEI1ziAhBI
 bfbUrmdTia9aKa3Fg1CPncm3bJUFbWHfr0LkNnKNd3xFqOEcD+JvG5T3b g==;
X-CSE-ConnectionGUID: eEkKB6jcQL2adAADcQFWjQ==
X-CSE-MsgGUID: FaMuh9o1QmW6Jf5p7SCDXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652978"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652978"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:20 -0700
X-CSE-ConnectionGUID: 5CIGT/9+RaK2rTkvZ39P/A==
X-CSE-MsgGUID: BbPpFuWiRpO3axjAWqiUCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454325"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:19 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 6/6] drm/xe/xe3lpm: Add new "instance0" steering table
Date: Mon,  7 Oct 2024 18:35:09 -0700
Message-ID: <20241008013509.61233-7-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

v2: Merge continuous entries 38D0D0 - 38F0FF

Bspec: 74298
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 4c0767403881..e21eb6c0fc20 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -237,6 +237,17 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xe3lpm_instance0_steering_table[] = {
+	{ 0x384000, 0x3847DF },         /* GAM, rsvd, GAM */
+	{ 0x384900, 0x384AFF },         /* GAM */
+	{ 0x389560, 0x3895FF },         /* MEDIAINF */
+	{ 0x38B600, 0x38B8FF },         /* L3BANK */
+	{ 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
+	{ 0x38D0D0, 0x38F0FF },		/* MEDIAINF, GAM */
+	{ 0x393C00, 0x393C7F },         /* MEDIAINF */
+	{},
+};
+
 static void init_steering_l3bank(struct xe_gt *gt)
 {
 	struct xe_mmio *mmio = &gt->mmio;
@@ -441,7 +452,10 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
-		if (MEDIA_VERx100(xe) >= 1301) {
+		if (MEDIA_VER(xe) >= 30) {
+			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
+			gt->steering[INSTANCE0].ranges = xe3lpm_instance0_steering_table;
+		} else if (MEDIA_VERx100(xe) >= 1301) {
 			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
 		} else {
-- 
2.45.0

