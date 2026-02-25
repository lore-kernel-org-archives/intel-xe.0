Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142F8FD45EC
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A5110E82A;
	Wed, 25 Feb 2026 20:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqsWbbRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694DA10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772051843; x=1803587843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9O6VvGshQA7cPFPT3N752JoQb/EWgdTaUSbDu5dtPH4=;
 b=bqsWbbRWi7RHqV2HO8zPKkl8RQs7LirXlQ81Y41mg/Usqz3d81t5WzUI
 U6kxX56nbVGrl+CWK21RQ6WQ0fmu/N7Db8ZtfBQIMje6IaNECWxmC9O0N
 ztjC511oLLSZmtJwuqkMFx3KyM6ZDQWlDVV1ecGZntMGwBgjF8TByMCaF
 H7ECCLbDZWiPzKvs7O4k+1QnGWXAPu4D06IXL8dLhKCakNpRKvw0R250j
 sqMZv+oloJvcwxSxSe51Iox277qUQrKoULWvCDPYUAdQtFk1y+nmQFpPG
 e5H/3zWSC/fFXI53vIxbNE34KUYomRoL1v6wHN2FpnLtq0tbKsoo+86Uf A==;
X-CSE-ConnectionGUID: 5/KrFYu3T9S0iWPBbWgoXA==
X-CSE-MsgGUID: /QwfVJDHS4WPbWM0/YYYgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84561096"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="84561096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:37:23 -0800
X-CSE-ConnectionGUID: 5HVcFnfIS1KN+eLPRZY03g==
X-CSE-MsgGUID: aXMJ/9vlQVyI2qkXsg+hxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216233984"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:37:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe3p_xpc: Drop stale MCR steering TODO comment
Date: Wed, 25 Feb 2026 12:37:20 -0800
Message-ID: <20260225203719.3310570-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

Proper steering+termination for Xe3p_XPC NODE and BANK multicast ranges
was added in commit 6d5511e56b2d ("drm/xe/xe3p_xpc: Add MCR steering for
NODE and L3BANK ranges") but we forgot to remove the corresponding TODO
comment at the top of the block.  Drop it now to avoid confusion.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 8989d02ea84d..7c6f039c880d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -532,12 +532,6 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 		}
 	} else {
 		if (GRAPHICS_VERx100(xe) == 3511) {
-			/*
-			 * TODO: there are some ranges in bspec with missing
-			 * termination: [0x00B000, 0x00B0FF] and
-			 * [0x00D880, 0x00D8FF] (NODE); [0x00B100, 0x00B3FF]
-			 * (L3BANK). Update them here once bspec is updated.
-			 */
 			gt->steering[DSS].ranges = xe3p_xpc_xecore_steering_table;
 			gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
 			gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
-- 
2.53.0

