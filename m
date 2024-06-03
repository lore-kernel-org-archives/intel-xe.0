Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76510C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2401F10E174;
	Mon,  3 Jun 2024 19:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mD2PnHbV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537E910E174
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717441698; x=1748977698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Mhd7mopSh7TDaYyV37doINwSy3WyW/gsVcCwL5RSaA=;
 b=mD2PnHbVSpx3Vuq10la/dBRCdZk9mtlzolekhaVTAw/0TzNnChZCnmFM
 vFWPeNdpbC2KG+N+ZueSVNqc/4/cLm5Hmydje1FB931vg12wggazeioRL
 5s+cNjyEaxPSNqmooOigRI8r9BrSvyGAQ120X2lhHr0n1PQZBcKyoJRGG
 V1xMnTDWz10Z3HIbAVWQ/ms/utZ5jCiXg+jg0JB/5uhbFDYgrmyPu+LSc
 8OekoJhC3lX42iyaaCtX+vr47daV/l4zAzy56QB7XH8va9/rJcCxdrbD9
 QI41HQSL8b4QJvKYgtqCvd6uF26of05E7R/OaJ7/Be0Vfek3Pd8Mjcm+E Q==;
X-CSE-ConnectionGUID: /bumiveBQIu676nayP2Yfg==
X-CSE-MsgGUID: benZfvstTLuT/dXaS3zV5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31454732"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="31454732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:08:17 -0700
X-CSE-ConnectionGUID: eYoS32hHRtK9J4OnMdCGlA==
X-CSE-MsgGUID: 5Ed/R8Y1RSejz/WYgKNxNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41400569"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:08:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Drop redundant ARAT timer enabling
Date: Mon,  3 Jun 2024 21:07:47 +0200
Message-Id: <20240603190747.1372-1-michal.wajdeczko@intel.com>
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

This interrupt is enabled by default and there is no need to
re-enable it as there is no other code in the Xe driver that
could change this setting.

Bspec: 52572
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 086a048876ba..f4d728350694 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -862,9 +862,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 			return err;
 	}
 
-	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
-		      ARAT_EXPIRED_INTRMSK, 0);
-
 	err = xe_guc_ct_enable(&guc->ct);
 	if (err)
 		return err;
-- 
2.43.0

