Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F68C00528
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 22:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6870A10E4C7;
	Wed, 26 Jul 2023 22:26:10 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA7A10E4C7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690410368; x=1721946368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/sFYEMfktFvxCn9lqOjVBNj54hf5fvLjTb/W+94qagE=;
 b=D+OypKFUolFf+cqMjPEMbh8G146IaL4/cZ2F1h4pxQqHd9lrtIPfeDov
 dQ2L+8RyccmeVs1ihQJej3uiUe0zPV/3iI6mYehKMndjwHYtwnjIF5Hgx
 VvW+0UOjMJ6HyRcGmkhx/D2Q2PwhcaBCSb4AtEKDxS5t2UidiCJUjxQTZ
 FCoc2IeDTHlqQwHf6ls42ir49rQMWvPJGIdQMVugDM3UUa6s7/FU908Sy
 jOS6SCzt/gfb6Y+o8dFCaOTDhfi+NXervvpXlOCZ6FM4nISK3sM4KUBeV
 KbTO7rGe/FQ7to24WA1T/O8XccIDeAVYS2LKyocxvbMYDa3guUlX3Pp0O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434417771"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="434417771"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 15:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816854212"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="816854212"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 15:26:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 15:25:28 -0700
Message-ID: <20230726222528.366732-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix mcr semaphore locking for MTL
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

in commit 8604f978f45b ("drm/xe: Convert xe_mmio_wait32 to us so we can
stop using wait_for_us.") the mcr semaphore register read was
accidentally switched from waiting for the register to go to 1 to
waiting for the register to go to 0, so we need to flip it back.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index c56815af0686..9eb7a6a1348d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -420,10 +420,11 @@ static void mcr_lock(struct xe_gt *gt)
 	/*
 	 * Starting with MTL we also need to grab a semaphore register
 	 * to synchronize with external agents (e.g., firmware) that now
-	 * shares the same steering control register.
+	 * shares the same steering control register. The semaphore is obtained
+	 * when a read to the relevant register returns 1.
 	 */
 	if (GRAPHICS_VERx100(xe) >= 1270)
-		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
+		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
 				     true);
 
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
@@ -431,7 +432,7 @@ static void mcr_lock(struct xe_gt *gt)
 
 static void mcr_unlock(struct xe_gt *gt)
 {
-	/* Release hardware semaphore */
+	/* Release hardware semaphore - this is done by writing 1 to the register */
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
 		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
 
-- 
2.41.0

