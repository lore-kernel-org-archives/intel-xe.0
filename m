Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3868BCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E3B10E503;
	Mon, 13 Oct 2025 20:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfHWvcvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1B810E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386202; x=1791922202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qT9wKb7T1Hfkhn102l5Z6ucPNaAXdkMABCwEvPBxm4w=;
 b=DfHWvcvxWeGf07oydp0QOF3yVflNlVNEVJ7f+4l2fb4+UNePz7v/cCFl
 +ds4kWLduuJZfnE/c56nRKc2ASysAuSkZ8iMdGxul470PP1CZVLh0HTPe
 +qfrzzD1nTI0FwCkgNujjCRpuvh1orgs6oPDtcsRsYcvgVPJFjpp6tDIC
 0zKRgnwNfM4sC2IBUTutEcok7oUjTspBBlDGOlhnF6HNhBNGz7Juf6dYN
 ZcOO0dzgBF5fr12dIjErvt3z7qi/UIC+Y6tXC9pIveC/+cThMjPEGXAug
 H4eNn2CQjtSWG8cG0hkZYHv0TyLSmuw94LyGZA8BoJWsmlu3+2mJXi9Fv g==;
X-CSE-ConnectionGUID: O+abDVi8QBqQ5tBl7puOcw==
X-CSE-MsgGUID: hfXFvf9xS26dqtopOaBw3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800535"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800535"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
X-CSE-ConnectionGUID: pA1SQHbpRA6Ci3/An1jaUA==
X-CSE-MsgGUID: n33Z1X47Smu6nAxkkKXCbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707546"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 08/23] drm/xe: Move primary GT allocation from
 xe_tile_init_early to xe_tile_init
Date: Mon, 13 Oct 2025 13:09:51 -0700
Message-ID: <20251013200944.2499947-33-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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
index 7fb960b61bf4..4b8dd40decd8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -776,6 +776,10 @@ static int xe_info_init(struct xe_device *xe,
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
index 8fd6ee990d14..4f4f9a5c43af 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -157,10 +157,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
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

