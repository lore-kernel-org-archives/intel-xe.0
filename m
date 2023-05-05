Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0946EC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 12:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34CB10E04C;
	Fri,  5 May 2023 12:40:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9902A10E04C
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683290436; x=1714826436;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ioIX2F9rteh4CiWm4XoZRBn/cc+m9l12E+Y6xsrgK9U=;
 b=cIpxETIU6iGBpDuyNtXsU/cK3Whq5eO8AxL7DNqZlWmeWns/rCdTdRAn
 Q043gOv8Ik/wykIEpxu9eNqIfPL6SYrpFhtSyejqamaDMuE3qg/CuSOyB
 gA1+aRQsyk9ZlhqHqKhvKYzQLxtotPVHUwEr1NpkiKgH6f2CHPrF5H1hP
 WLJl1wGwh26b4LotVMab5b7rzCbuw+ssViNeAv6Dws1Ilze9R/R0HluVI
 6WyzHVF4hPLSuAz+JYmWRFHcqaC8mgd+zolrZyMsdtQSBo8J2G9k/GcXz
 AqKn1nsUOh84zulHGK5ts4EIYbitTtLSNUVui8NTV94ArzCEgs8gxjg4Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377275105"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="377275105"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 05:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="730318013"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="730318013"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 05:40:26 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 14:40:19 +0200
Message-Id: <20230505124019.11268-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Do not sleep in atomic
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Set atomic in xe_mmio_wait32() otherwise we would
be scheduling in atomic context.

Fixes: b7bcef224bdd ("drm/xe: Remove i915_utils dependency from xe_pcode.")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 55b240a5eaa7..300b4a6968a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -424,7 +424,7 @@ static void mcr_lock(struct xe_gt *gt)
 	 */
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
-				     false);
+				     true);
 
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
 }
-- 
2.39.0

