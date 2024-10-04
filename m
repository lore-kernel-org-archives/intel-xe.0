Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63218CF8853
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F02810E16D;
	Fri,  4 Oct 2024 22:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKJr9zTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B710E16D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728079565; x=1759615565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5cW/m5zQ8+8+AOHqcQ6QQuv8S0LcMuTCnfitfZqJ32k=;
 b=LKJr9zTeEwAe6+0RkrZrpsyb5Al35l88EBPKeQqsiMyGaTQB1fP3wsVp
 gasOY+5yscXUmBuHJQj9oMefdzrmwwWz7O95dEv88lRxL/t4+t64pLAYy
 wGwnTLc7ZvG5IvfxHxrZViGQ5E7pm2npoeuXm9bLeEOYG6POw3xxDIU8h
 JkBA6NmoqkZjyvBRXhC7H07cmQJn/7GsiPTPJC3V0Bj6VJ+hhP98JetV/
 axrksUU53wAaNMkXwTF7G0QBvkIIZezVRdw+8fJ9PQ74Vd3HRI688T1wQ
 iWWuBxF2NfQuiSAz+R0V+96WSZ6ku7OjQT4vAMyvPu7yLtiwCBpg9WjS5 A==;
X-CSE-ConnectionGUID: IR8Ma9xbR9S9JwtxMQtbvA==
X-CSE-MsgGUID: /sftyAndTzG0EehzD8OEQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30199421"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="30199421"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:04 -0700
X-CSE-ConnectionGUID: dJZaQeiUThmHN0EjI+xvyg==
X-CSE-MsgGUID: 9q04WLMFRSGNfYa2b/XIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74836997"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 6/6] drm/xe/xe3lpm: Add new "instance0" steering table
Date: Fri,  4 Oct 2024 15:05:50 -0700
Message-ID: <20241004220550.94308-7-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241004220550.94308-1-matthew.s.atwood@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
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
index 4c0767403881..2f2fb84b4e58 100644
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
 	struct xe_mmio *mmio = &gt->mmio;
@@ -441,7 +453,10 @@ void xe_gt_mcr_init(struct xe_gt *gt)
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

