Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B613CCD188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373810E38E;
	Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8EKNo4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3110E38D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b31Qz9aX6CJIDbli6QICXiWmPyWOBRJZZDqml2M2zwM=;
 b=C8EKNo4IGDhtBJJkwzc1trNcsAPqbRW2jzcYzb+/iSDoHzjOe8aqMK2X
 g93U+X7kjAXeLHoxYVAe+oEzg0eBFIw2S/eG+dBZ9T6hV92I4aG4S2hpH
 okoE3UgRAEXmyLW/fMZohvIaKwXtcAu7QOWn176/F6iyMRhkjtstS3Pc/
 OEnR2aV/5qeqhJjDs6ukRuneEng2nXIQ5KuTD0Z3YbNmfMSAU1W/7k5Ch
 D1cylpEdeA1AGS4y1oNXWnNO2uS6xE/zMe+OAIVa1IYbonkrdK0T/TDt5
 NcOIJ3mslBRTa2JPjRgiSOGSoALPM2xMq+BK0RHJY1ib92KBuML/KmjJ1 Q==;
X-CSE-ConnectionGUID: kHr+iBUMSouVl/PplCO58w==
X-CSE-MsgGUID: 0rnAwQyPQim91mH8+Rz3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616744"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: e2vxrfZPTEaddoz1BmzQLQ==
X-CSE-MsgGUID: r9kyDNP1R6+hFWM+lwApXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631079"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 08/23] drm/xe: Move primary GT allocation from
 xe_tile_init_early to xe_tile_init
Date: Tue,  7 Oct 2025 13:48:38 -0700
Message-ID: <20251007204829.1468209-33-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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
index 02655cf9244d..a49e7cf8c73e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -773,6 +773,10 @@ static int xe_info_init(struct xe_device *xe,
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
index 6edb5062c1da..786f085aaebd 100644
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

