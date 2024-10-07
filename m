Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D66CFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 07:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A1A10E1EC;
	Mon,  7 Oct 2024 07:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTcrQhBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E5410E1EC
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728287193; x=1759823193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yNGrHEgsrpJtODlZhhYsT8AQ66Y82J/jdRVmBMs3BV8=;
 b=TTcrQhBsbPy1rUXW4ji6CPjYBY2eGdwybQP1oFivL57Zxx4gMIe9jZcY
 bWpKPdE3HS+63liap7/ctI9EWXS26b9MhwC9+HVbxErienrvgJ1w2hNMs
 OEvyFqVJVJfoYbMw9ez1TLh2spp16qKQqD6l100ZswU6cPxOA2mmFwKsU
 Ram8vOXmrzdF9URj4afS13bsT7gpUGh+llbzLECr1W2vF1sUfSB7lLbyP
 3f+OqDwLGa7d0H45dpMblZtLlTk3q63wzsN/tgyO7L4uZj10Jks2Pe/Y7
 iMsBurEGyp7qePGpBfdZBybSU2PFsqcRDbPkZunfo58auxLwFofPX9RCp g==;
X-CSE-ConnectionGUID: o1Cceb6sRCa5ewNwEQAweA==
X-CSE-MsgGUID: cIVfma4DQEWkLrc3cuXhLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38790630"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38790630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 00:46:32 -0700
X-CSE-ConnectionGUID: E2hKSJTBRuSULSpuApJfag==
X-CSE-MsgGUID: ipVDyHwZQzOqQFyRkn4+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="80174177"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.118])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 00:46:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vitasta Wattal <vitasta.wattal@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2] drm/xe/bmg: improve cache flushing behaviour
Date: Mon,  7 Oct 2024 08:45:42 +0100
Message-ID: <20241007074541.33937-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
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

The BSpec says that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
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

With that drop EN_L3_RW_CCS_CACHE_FLUSH. This helps some workloads since
we no longer flush the device cache between submissions as part of
pipecontrol.

Edit: We now also have clarification from HW side that BSpec was indeed
wrong here.

v2:
  - Rebase and update commit message.

BSpec: 71718
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Vitasta Wattal <vitasta.wattal@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
 drivers/gpu/drm/xe/xe_gt.c           | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index fb80042cbe0d..e98b7b91116d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -401,9 +401,6 @@
 
 #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
 
-#define SCRATCH1LPFC				XE_REG(0xb474)
-#define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
-
 #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
 
 #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2d5e78311b76..1c79660fb086 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -108,7 +108,6 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		return;
 
 	if (!xe_gt_is_media_type(gt)) {
-		xe_mmio_write32(&gt->mmio, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
 		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 		reg |= CG_DIS_CNTLBUS;
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
-- 
2.46.2

