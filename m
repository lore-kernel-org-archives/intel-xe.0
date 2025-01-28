Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BCEC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6C210E703;
	Tue, 28 Jan 2025 22:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eaa91jUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67210E025
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738101992; x=1769637992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cySwKgD15BN0cm7nhw2MxHMkD1PSuVdgo18bZbgtPo0=;
 b=Eaa91jUsTi9GzwY8mfZU1zSMB/s5KcX00vzLW82CjZ1V/x1F7t0EU6sP
 tV9iusK7f7rBMVM5KCrqOau5H7dzGwPXvgI7ndBID8LZH7r2q9EoYJP8/
 EyX5OV51qmaWP/UcWYyTCYyZqRMk3FnXjJ/7PhXIhcufPT/SpEY9HGBKG
 wEIOk5PxEYcIUlrhT6PfERC2Fev3D841mMw1C0FzI4qOX2hpzgC1NJnIz
 YMGtIbFvlfbzCpPjeIm/c9T9P4WwCBxeYGz9IwiDN/oyhwZiADROSiskW
 GWTIbcEkgQWI47YvHL/H7tNWn8XLnEIH/6qdhOFL2ytzo6PltsSWyVLJQ Q==;
X-CSE-ConnectionGUID: 45HQOzp9R1Ko7vbXeWLsRw==
X-CSE-MsgGUID: G/8YDtD6Qm24YF2G5luI0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38488943"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38488943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:06:32 -0800
X-CSE-ConnectionGUID: sOuyWMd7R1Grl/kuKxio1A==
X-CSE-MsgGUID: DJjBiit9STuB/bD7NiixNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="108665460"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:06:31 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@linux.intel.com,
	Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 1/3] drm/xe: Add a function to zap page table by address range
Date: Tue, 28 Jan 2025 17:21:43 -0500
Message-Id: <20250128222145.3849874-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

Add a function xe_pt_zap_range. This is similar to xe_pt_zap_ptes
but is used when we don't have a vma to work with, such as zap
a range mapped to scratch page where we don't have vma.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..2363260da6a6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -792,6 +792,34 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
 
+/**
+ * xe_pt_zap_range() - Zap (zero) gpu ptes of an virtual address range
+ * @tile: The tile we're zapping for.
+ * @vm: The vm we're zapping for.
+ * @start: Start of the virtual address range, inclusive.
+ * @end: End of the virtual address range, exclusive.
+ *
+ * This is similar to xe_pt_zap_ptes() but it's used when we don't have a
+ * vma to work with. This is used for example when we're clearing the scratch
+ * page mapping during vm_bind.
+ *
+ */
+void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_pt_zap_ptes_walk xe_walk = {
+		.base = {
+			.ops = &xe_pt_zap_ptes_ops,
+			.shifts = xe_normal_pt_shifts,
+			.max_level = XE_PT_HIGHEST_LEVEL,
+		},
+		.tile = tile,
+	};
+	struct xe_pt *pt = vm->pt_root[tile->id];
+
+	(void)xe_pt_walk_shared(&pt->base, pt->level, start,
+				end, &xe_walk.base);
+}
+
 /**
  * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
  * @tile: The tile we're zapping for.
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..b166b324f455 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -43,4 +43,6 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
+void xe_pt_zap_range(struct xe_tile *tile, struct xe_vm *vm, u64 start, u64 end);
+
 #endif
-- 
2.26.3

