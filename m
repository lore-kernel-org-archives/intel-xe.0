Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789F4C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3403110E0D8;
	Wed, 26 Jun 2024 21:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg8Wg5RF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155C10E0D8
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719435942; x=1750971942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MQmSYjS6gAzfBtcDhRXRCrjA/jd95yGmisdUSY/VfK0=;
 b=Vg8Wg5RFzttqQDAX1B2ZGfIx07OwfxJU4bVS59El9KsC12hA2fOanbTi
 /0E/06G3uvuqTSVtHGG0DsRzCA6twr7FdCrDNOEUDdB7SFKB/mq1PXET0
 95uJl1yEe5Wn4e0Gtcg/ZU97yKL+IF/lE9TP8fMpNL+kHCJoUTuw5s8NG
 Un/i24OFWmr9kOPoiC3avR0jEfPtKuXWNYU1v2Cuq9K5a0WurekHKcAtI
 aBl3AnbAsf5hb/bughE5hjr2C7TAfCLPHG+XiRmUQm/5iPl+CWjlP2a3h
 ZJLrsJVxIEl+BK26Pqrja2BXtE+JqpvPSEEIHck1zx4s0I4AuHKSONKnu w==;
X-CSE-ConnectionGUID: oNm1kjluQhWlM8EJVmKG7Q==
X-CSE-MsgGUID: U8lAqizNSLe3E9QFgNDDXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16663100"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16663100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:05:42 -0700
X-CSE-ConnectionGUID: syApTU9vRe2Ww4RsNtU2sw==
X-CSE-MsgGUID: ygjjQWBwRsCTFTq3MMF+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44023267"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:05:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/mcr: Avoid clobbering DSS steering
Date: Wed, 26 Jun 2024 14:05:37 -0700
Message-ID: <20240626210536.1620176-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.0
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

A couple copy/paste mistakes in the code that selects steering targets
for OADDRM and INSTANCE0 unintentionally clobbered the steering target
for DSS ranges in some cases.

The OADDRM/INSTANCE0 values were also not assigned as intended, although
that mistake wound up being harmless since the desired values for those
specific ranges were '0' which the kzalloc of the GT structure should
have already taken care of implicitly.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 386ac3269909..6d948a469126 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -342,7 +342,7 @@ static void init_steering_oaddrm(struct xe_gt *gt)
 	else
 		gt->steering[OADDRM].group_target = 1;
 
-	gt->steering[DSS].instance_target = 0;		/* unused */
+	gt->steering[OADDRM].instance_target = 0;	/* unused */
 }
 
 static void init_steering_sqidi_psmi(struct xe_gt *gt)
@@ -357,8 +357,8 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
 
 static void init_steering_inst0(struct xe_gt *gt)
 {
-	gt->steering[DSS].group_target = 0;		/* unused */
-	gt->steering[DSS].instance_target = 0;		/* unused */
+	gt->steering[INSTANCE0].group_target = 0;	/* unused */
+	gt->steering[INSTANCE0].instance_target = 0;	/* unused */
 }
 
 static const struct {
-- 
2.45.0

