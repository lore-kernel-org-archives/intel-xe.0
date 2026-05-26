Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C57BCD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EA510E1DE;
	Tue, 26 May 2026 19:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrozgFnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05888C11
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779825308; x=1811361308;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UpAyly7anf8tBhAz1f23DDvrky0JynOKYS6hIT68HJs=;
 b=WrozgFnCUJ7l6AP6pYCih2WatS/lXzi8PVN8A6AujEl3AOVY/KK5D632
 81YSY5mnGaKjKH5Enw7bG9z4zapEHWPOUnK5g2mIOqaZWlH8RScT5DdyG
 GEM5oQlt228WIL4ZImj50uCdCQb7MV1PFqUd0b/kL8XfRso16hUupXFoB
 vaWqWIB43nUQFO9HwlwQzGvNdQObkWrg6J77Qpi1MCgauUXjxeUhmReDh
 0hPpDROmm3uJs4uIQaGMq2NzsLLOLAnSBRCRJHd45TeLGiL5J/OQW54ew
 jQEWlFCqZRUDHqNu6WIa+AePbLjI8gf75FRy1jCXCr/d+F2pEmNeBrVk8 Q==;
X-CSE-ConnectionGUID: 8pizHUshQKOgezXTIZyVOA==
X-CSE-MsgGUID: 7uOgGzrjQGq6mt2RiEerWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80498758"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80498758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:08 -0700
X-CSE-ConnectionGUID: bYMvs3yKQG+NWz0tGjXkQw==
X-CSE-MsgGUID: d4iyZGuiTwKluNmrmWy8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="239013264"
Received: from adobrzyn-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/xe: Drop unused param from xe_device_create()
Date: Tue, 26 May 2026 21:54:47 +0200
Message-ID: <20260526195452.20545-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526195452.20545-1-michal.wajdeczko@intel.com>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
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

We never used or need anything from the struct pci_device_id there.
And while around, add simple kernel-doc for this function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++++++--
 drivers/gpu/drm/xe/xe_device.h |  3 +--
 drivers/gpu/drm/xe/xe_pci.c    |  2 +-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 576095cf0952..3f063e5530bb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -475,8 +475,15 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
-struct xe_device *xe_device_create(struct pci_dev *pdev,
-				   const struct pci_device_id *ent)
+/**
+ * xe_device_create() - Create a new &xe_device instance
+ * @pdev: the parent &pci_dev
+ *
+ * Allocate and initialize a device managed Xe device structure.
+ *
+ * Return: pointer to new &xe_device on success, or ERR_PTR on failure.
+ */
+struct xe_device *xe_device_create(struct pci_dev *pdev)
 {
 	const struct drm_driver *driver = &regular_driver;
 	struct xe_device *xe;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 355d69dc8f54..27cd2329b99f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -43,8 +43,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
-struct xe_device *xe_device_create(struct pci_dev *pdev,
-				   const struct pci_device_id *ent);
+struct xe_device *xe_device_create(struct pci_dev *pdev);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 59b18a80100b..b2484503f432 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1094,7 +1094,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe = xe_device_create(pdev, ent);
+	xe = xe_device_create(pdev);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
-- 
2.47.1

