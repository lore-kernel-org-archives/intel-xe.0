Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B104FC2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 15:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFC410E43E;
	Mon, 17 Jun 2024 15:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipanfxm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD6F10E443
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718639269; x=1750175269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1cCD3w30HTW49pc1fuhjsbFJ5/V1PkAp/IScUb3Z3lQ=;
 b=ipanfxm/o+RfDYAdoLsCvaflEYY1RXVT/40wUZg1j5bSqe71GI+ejrzT
 WMYO6QL0txj6uME0DjsDPKbDls6EV/Yjxa0F8eFFVjk8e6yvH0Fmghthr
 JHrvl6YGCVXKy2T89jXQBL4fUjZfxxuc+WAQlH0PiW7ssbzTZLIAmDXsE
 bI+bESzO4ttGH+vxZTcb9Zo3ppLjRDGOMZEAUtqzLt5dsTXEH5O+cDnhP
 mOtrMYYuB6D+slIcaDxPwkWFYNhmM/PL9Zr9x+iPdcChI/VifeN03IhqM
 g+NVytW/WX8a3WqVDuoQU1A47gzxmaOosVFI+Ut5Gh3wo+VGY2VSVmBZM g==;
X-CSE-ConnectionGUID: bdzIwKXyT2Sxme5jO0BAvQ==
X-CSE-MsgGUID: y3nSmA5PSXuuiwbOaa7tcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19327281"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19327281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:47:48 -0700
X-CSE-ConnectionGUID: Vy+oi/XjSbed9thOn7jlIw==
X-CSE-MsgGUID: nBOinZ/bSiKVlUcGqzsCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41106687"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:47:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/vf: Don't touch GuC irq registers if using memory irqs
Date: Mon, 17 Jun 2024 17:47:36 +0200
Message-Id: <20240617154736.685-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

On platforms where VFs are using memory based interrupts, we
missed invalid access to no longer existing interrupt registers,
as we keep them marked with XE_REG_OPTION_VF. To fix that just
either setup memirq vectors in GuC or enable legacy interrupts.

Fixes: aef4eb7c7dec ("drm/xe/vf: Setup memory based interrupts in GuC")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0e1a5674ef13..7ecb509c87d7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -854,8 +854,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	struct xe_device *xe = guc_to_xe(guc);
 	int err;
 
-	guc_enable_irq(guc);
-
 	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
 		struct xe_gt *gt = guc_to_gt(guc);
 		struct xe_tile *tile = gt_to_tile(gt);
@@ -863,6 +861,8 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
 		if (err)
 			return err;
+	} else {
+		guc_enable_irq(guc);
 	}
 
 	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
-- 
2.43.0

