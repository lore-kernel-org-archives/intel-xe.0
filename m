Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805F5CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 15:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2983C10E32B;
	Mon,  2 Sep 2024 15:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoWZfSdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8C10E32B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725291480; x=1756827480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JcIV3lfxeY1/WOiZwU2nWYa3ZZPXvC214rKtp5bgrmI=;
 b=KoWZfSdtHaPn0fW1I/qxSWxNarVDBTil1QQEhpZ0yPaQcnztQX2ZVI5t
 JdP85t5bL7vhb5hRr6vcAvxZK1UG1/J1BD+Fo+qehDr0SG+MioYlyvtvf
 NmzrjA6JrGD02AP7DN3ske06LZ2yFhSmdteRgGdS4ztJgKv1vTC/Q51DV
 mSkzjCMOfifwgDAJSiSpIScL9Oqi19XX3LAQzQ/EcvKhd+Af2EuWfOXpi
 q86BCwH5VQTOF/nZ98i6/+BuRFghW4LIg5K5setL8JvVttvdXvIE7uvVj
 E/qhNPtb3N3SG+sYWzyntLjmYPPND5VdGUs9B/c6BkjUSme6ZUwZOK3u5 g==;
X-CSE-ConnectionGUID: y9fRNmjsSHms0sZZdqVpag==
X-CSE-MsgGUID: H5wVzAxeQ6e9T8OfV++2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24031878"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24031878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:38:00 -0700
X-CSE-ConnectionGUID: jrmA4V9YRFiNj1YWv+C3Ow==
X-CSE-MsgGUID: qlrhlE4OQmaGKY1HkWSBzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64457869"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.84])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:37:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe/bmg: improve cache flushing behaviour
Date: Mon,  2 Sep 2024 16:37:45 +0100
Message-ID: <20240902153744.63456-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

The BSpec seems to suggest that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
on for manual global invalidation to take effect and actually flush
device cache, however this also turns on flushing for things like
pipecontrol, which occurs between submissions for compute/render. This
sounds like massive overkill for our needs, where we already have the
manual flushing on the display side with the global invalidation. Some
observations on BMG:

1. Disabling l2 caching for host writes and stubbing out the driver
   global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH enabled, has
   no impact on wb-transient-vs-display IGT, which makes sense since the
   pipecontrol is now flushing the device cache after the render copy.
   Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
   expected since device cache is now dirty and display engine can't see
   the writes.

2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
   invalidation also has no impact on wb-transient-vs-display. This
   suggests that the global invalidation still works as expected and is
   flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH turned on.

With that drop EN_L3_RW_CCS_CACHE_FLUSH.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
 drivers/gpu/drm/xe/xe_gt.c           | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e11..88a01970cc5c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -387,9 +387,6 @@
 
 #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
 
-#define SCRATCH1LPFC				XE_REG(0xb474)
-#define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
-
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index f82b3e8ac5c8..313cc4242281 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -110,7 +110,6 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
-		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
 		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 		reg |= CG_DIS_CNTLBUS;
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
-- 
2.46.0

