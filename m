Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9203CCD5BCF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12710E3C7;
	Mon, 25 May 2026 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFfLit+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A6310E3B3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725139; x=1811261139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rqsU7ug0zCFHLmDjp5mP7X90E0uWUityWvOZXs6TT8=;
 b=dFfLit+1fEsOpcqnBLWT1YvnwVPH8+b7oGgCJ8Re05gPTqqlWNlcxf58
 wg0X8XE+Af7VW/mNyu3Slo3owwjyCWx0E2ZvVc3VPfQEYP9C/kD9MOzrG
 Rvof4u6x9xDdG5+Xs9rquVP4b8S4s/i3wgXt/4Ds6ZZ7ySrLksCjkW3tK
 qQd/BXUncCronqAqJ0EHCKZqOqaKoUAwdygIYCUalIrtI1WBV5o44qBY9
 U9KoEfiVhjo95UB8F8eCGRAao2EgMsilIMUE4HZBngQGB9gmkMIGtd+Ib
 kDS8hN60Y1Elq+yaONqMEZYaMTDzdzYArGNiei+6yLQrO/chn/naGCtqY A==;
X-CSE-ConnectionGUID: px3R6uAyS36yrOmOlF6TUw==
X-CSE-MsgGUID: FfgN1nduTY6kpNZfdEcs4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275432"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:39 -0700
X-CSE-ConnectionGUID: KT+XGA/5RzSCv0l5F7lZQg==
X-CSE-MsgGUID: AnWg0nLeR1ahH+LWiJaccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275236"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/6] drm/xe: Drop unused param from xe_device_create()
Date: Mon, 25 May 2026 18:05:24 +0200
Message-ID: <20260525160529.15890-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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
index e2a1232c4fbf..c2bf9f0c325b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1092,7 +1092,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe = xe_device_create(pdev, ent);
+	xe = xe_device_create(pdev);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
-- 
2.47.1

