Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD32ACAC5BB
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4771210E9D5;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XocPuZ/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC410E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wo/jwhXCZxqMDObYeMjizAKULdUVFOBdWNC4BMiVdSQ=;
 b=XocPuZ/RBxPi20TxLHxtx56F04olc5pJWpW6HqRK7Pm6HJBftO7gnW6h
 8TDQyQgMWzcUeoO5ddCg7MB7RskNiigUiYKL3LyHVhX4dtcvWH8c0Wuqv
 V7OtJ0zAR3ewPlYGxX+MgIbu82iluVrT+kIok46QzpN/8m38NfnZ6JHPa
 ZVCGsuXOx8tGo1LDAy9NRUNh3leZwWYTvlFpWhqEYcTWw4R8QfMtrdxrB
 lS6kSzA4FF9udurUkvILAO6jqoqi+trLIe7viU+TWPl89oQr8KeNNr9F5
 3D/F8FcHoMqBtvM/BpAr6EMiRT4mT04/vBn7n4ahcvsOStBDcTVJZgHaq Q==;
X-CSE-ConnectionGUID: jTLjGOIsQqG2mMFCkwLlHw==
X-CSE-MsgGUID: sIV7bHW0QQedUAdFkZaCpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817669"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: +EZ3d4ChQASi5MGgCAnJZQ==
X-CSE-MsgGUID: ZDgE+j3qRBunU7aD7tGpCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852965"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 07/22] drm/xe: Move primary GT allocation from
 xe_tile_init_early to xe_tile_init
Date: Thu, 25 Sep 2025 16:46:35 -0700
Message-ID: <20250925234628.2112163-31-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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
xe_tile_init() where GT initialization happens and where we're doing the
allocation of the media GT.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c  | 4 ++++
 drivers/gpu/drm/xe/xe_tile.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 976002aae301..bd21940a6541 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -745,6 +745,10 @@ static int xe_info_init(struct xe_device *xe,
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

