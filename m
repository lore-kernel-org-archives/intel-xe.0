Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0471710A62CB
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C6A10EA25;
	Thu, 26 Mar 2026 13:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG3Ydd5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8AF10EA25
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774531916; x=1806067916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gu/1B+TIC4DFIigg6gMNui2xd6nYMTocnhU8zUOQAIA=;
 b=cG3Ydd5mbS1UIZj2gZ7zc/4Kow9GRoqR5TLpB+qE/YDGUz25aB3vpNp+
 00R9ZH6jJiBnqZW4thnnm74suAyXbXGSFHS05n3TMCIZ8GDJjF5r+C/5L
 BrD/eo8D47RzExB08s9IwAbcbO5CEkPR9HtoNQEfNC4h4mB1PX8ObXLEz
 j3zfIA17y2rRILNCwePJnEUQe2d//1f5c/72dfWP1kztd/Yt7enX0zpSt
 6K5eghZsuwuZ/0P8MUIAuGWYgbc05chbgWR1Oo7Drwy0X1cE0nec8mfZN
 U5L0v+PT7yzHgvx+JZ9TDU4ycV6iM0yGK+QWdgVADLucYGppkK2ipCIlp w==;
X-CSE-ConnectionGUID: XhHBWDELTneEhQ3Y0G0aYQ==
X-CSE-MsgGUID: T5cBlmDQT/OMmvPJdiFm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75492505"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75492505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:31:56 -0700
X-CSE-ConnectionGUID: zqbq8twiSJaI97G6tnOZTA==
X-CSE-MsgGUID: Y/YBmiZbQJaLqBLXVCRsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="248416078"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2026 06:31:54 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Drop all mappings for wedged device
Date: Thu, 26 Mar 2026 18:58:16 +0530
Message-ID: <20260326132816.739363-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

As per uapi documentation[1], the prerequisite for wedged device is to
drop all memory mappings. Follow it.

[1] Documentation/gpu/drm-uapi.rst

v2: Also drop CPU mappings (Matthew Auld)

Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
 drivers/gpu/drm/xe/xe_device.c   | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..f741cda50b2d 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
 	return ret;
 }
 
-static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
+/**
+ * xe_bo_pci_dev_remove_pinned() - Unmap external bos
+ * @xe: xe device
+ *
+ * Drop dma mappings of all external pinned bos.
+ */
+void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
 {
 	struct xe_tile *tile;
 	unsigned int id;
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index e8385cb7f5e9..6ce27e272780 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
 int xe_bo_restore_early(struct xe_device *xe);
 int xe_bo_restore_late(struct xe_device *xe);
 
+void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
 
 int xe_bo_pinned_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b17d4a878686..4c0097f3aefb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
+	/* Drop dma mappings of external bos */
+	xe_bo_pci_dev_remove_pinned(xe);
+	/* Drop all CPU mappings pointing to this device */
+	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
+
 	if (xe_device_wedged(xe)) {
 		/*
 		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
-- 
2.43.0

