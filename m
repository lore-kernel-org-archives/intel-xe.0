Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF19F532E9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 07:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C44D10E5DC;
	Tue, 24 Mar 2026 07:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPtZSJr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E0B10E5DC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774336698; x=1805872698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J6nCQ2x12AJ4zS7ZTyJegxjMtujOsJLqVJGlJ3b6wcs=;
 b=EPtZSJr8xSfs4/wBRDkHMHRZu9D0qLqYzcCJVtKuIqsI8pqLc7sZEKxH
 5G/QK7/vgEJtKcHnd743z2/40g7kIDekrsKxfWx825j7wIWjgTIQxa8mS
 ra/lFOuQHvdEB36EZ7eXi822vbpghZ4r4AkYag/x+RUstbtKf+ciZFZzw
 XRzS5WkR3K+qj5Kkv6XmYoExG5XXcGvLmKLFLcgWmK12+HCbsglk1qN5o
 yaONDTQQPoPwXY01BB1zNfa+RX9egvsHt6ih26Ie6D55hDFEH5XPzRHna
 LYqIGiTZnhCbqHp9LeHNK/eZ49juttwfmJ3ViYdMH+JqPH6r0Bn6pE4Li A==;
X-CSE-ConnectionGUID: NEt9fWdKTjmah4yGbzB9Rw==
X-CSE-MsgGUID: /BxSxvSuR6+2ns/hQBAQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75415575"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75415575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 00:18:17 -0700
X-CSE-ConnectionGUID: sHd1tQeYTPiJ9bMoUmT9cg==
X-CSE-MsgGUID: M2z1ULGKSmCm3GroqzHITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="247913036"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2026 00:18:15 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Drop dma mappings for wedged device
Date: Tue, 24 Mar 2026 12:43:02 +0530
Message-ID: <20260324071529.447319-1-raag.jadav@intel.com>
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
drop all dma mappings. Reuse xe_bo_pci_dev_remove_pinned() for this,
which iterates over external bo list and removes all dma mappings.

[1] Documentation/gpu/drm-uapi.rst

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
PS: This is pretty much uncharted territory for me, so please consider
this an RFC.

 drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
 drivers/gpu/drm/xe/xe_device.c   | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

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
index 207ad2eea412..ac51b04560df 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1351,6 +1351,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
+	xe_bo_pci_dev_remove_pinned(xe);
+
 	if (xe_device_wedged(xe)) {
 		/*
 		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
-- 
2.43.0

