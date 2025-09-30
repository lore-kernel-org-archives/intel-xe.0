Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B72CCD180
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFC710E647;
	Tue, 30 Sep 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRGLMU1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8910E568
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yA+RIGFwZs4r0Kpetd24mil5YPE2jX0zLHWMubgQyRw=;
 b=MRGLMU1xE0qxKZnxU5YfxMwHNcaLHB5JVnxRA7vyB9nGtofoiEDECVVA
 C9XCTQVQe644g2YbTWCFmGubcEvoGjLzyfC0uodtHvJvXyOwbVNxPRyLL
 GLqOk+uX/CgrsLxHJZHqm5+ZYBcQ2XDF82+DfZwfAxp5fgWSfIRiFaYGy
 YRn56qEGWZeYCfEXzQIQRHwKW9D3JDtVvhUOqa7kGJSOWO6F8a4vJ928Z
 vKeSyztzvOC8BLv+I6exjVqYFDBeTIS4VDBv2dFjqwii0YpfAp6kqm3Lv
 smfyJ99kI6cH9g1zSCk1bl0Qr7vRfzvk2QCJTH041iblZHcHNj8MXuvp+ w==;
X-CSE-ConnectionGUID: IYqu9iHJR3e9NZ3EB9XpLA==
X-CSE-MsgGUID: t2eIPcb1RfSDbC7SUyBXKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397748"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: jgKu+iKKReitcgf7mPTYCg==
X-CSE-MsgGUID: 7h6aU+qRSuqB07uVST5/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229456"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 08/23] drm/xe: Move primary GT allocation from
 xe_tile_init_early to xe_tile_init
Date: Tue, 30 Sep 2025 15:56:25 -0700
Message-ID: <20250930225618.140071-33-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

During the early days of the Xe driver, there were cases where we
accessed some fields in the primary GT's xe_gt structure before the GT
itself was formally initialized; this required that the structure itself
be allocated during xe_tile_init_early().  A lot of refactoring of the
device probe has happened since that time and there's no longer a need
to allocate the primary GT early.  Move the allocation into
xe_info_init() where GT initialization happens and where we're doing the
allocation of the media GT.

v2:
 - Only make this change after a separate patch to perform VF GMD_ID
   lookup with a dummy GT instead of xe_root_mmio_gt().

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c  | 4 ++++
 drivers/gpu/drm/xe/xe_tile.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9fb5df10844d..13e8d379a1cd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -768,6 +768,10 @@ static int xe_info_init(struct xe_device *xe,
 	for_each_tile(tile, xe, id) {
 		int err;
 
+		tile->primary_gt = xe_gt_alloc(tile);
+		if (IS_ERR(tile->primary_gt))
+			return PTR_ERR(tile->primary_gt);
+
 		gt = tile->primary_gt;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.id = tile->id * xe->info.max_gt_per_tile;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..10545654f9eb 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -149,10 +149,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (err)
 		return err;
 
-	tile->primary_gt = xe_gt_alloc(tile);
-	if (IS_ERR(tile->primary_gt))
-		return PTR_ERR(tile->primary_gt);
-
 	xe_pcode_init(tile);
 
 	return 0;
-- 
2.51.0

