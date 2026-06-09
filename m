Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDA0CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6E010E628;
	Tue,  9 Jun 2026 20:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nV/fkj3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D774110E209
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036268; x=1812572268;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ftztjQvO1gRUjj7dI2We5whO3smgdWJuTk6O9OCkw64=;
 b=nV/fkj3owGvbzcb1FjEeZykk+SPtAI/bDM5n78smWbXlzS5lGK2aiEiO
 47PIluPWMBxT8fDpuJsQWAEb+H0zy/Bc23wbAYKtbCeLEunJ4pW/oJzNK
 Bx6AODWV8NJ4Nv2X5A90KIFZOBrHfH/a9MOZqGq4UevH0L6HfNpl4ktQu
 gNDE0lvrzIVEcVKGUTeiMF37YS8491dquihNiL4i4ueBZa6Qxr8R5RxKq
 GlgiFJXn40YFAvHPtiKWe+MSPnHCf9NfxssGfo3NYg4z2FbfKvkZYaPIp
 Dp0yg0uatzT4S+n4Ec8tA3MppSg9pzRZb0yVGkPNOT6rTTHrXgR/Lg4Sc g==;
X-CSE-ConnectionGUID: plv4X9PBRGuzTEB6j4IZFQ==
X-CSE-MsgGUID: wIOIjzGxSW6AsLfmX0BbDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383294"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:48 -0700
X-CSE-ConnectionGUID: DZdbWHAvQZyfGd6xK9jgUA==
X-CSE-MsgGUID: pRvCfikBQ3Wq/szH8GUY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027523"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:33 -0300
Subject: [PATCH 1/9] drm/xe: Add framework for info probing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Functions xe_info_init_early() and xe_info_init() currently probe some
information from the hardware while doing initialization of info
fields.  Besides mixing responsibilities, another issue from this
approach is that kunit tests need to implement static stubs for the
probing part.

Let's prepare the ground to ensuring that those functions stop probing
the information from the hardware by creating the necessary framework
for extracting the probing bits out of them.  Do that by creating a
new struct type called xe_probed_info and the functions responsible
for populating it.

In upcoming changes, we will gradually refactor the code so that all
info needed by xe_info_init_early() and xe_info_init() that is probed
from the hardware is passed to them via struct xe_probed_info.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 16 +++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c       | 41 +++++++++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 9240aff779da..51d032a9e01a 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -338,13 +338,21 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
 	/* Nothing to do, just use the statically defined value. */
 }
 
+static int fake_probe_info(struct xe_device *xe,
+			   struct xe_probed_info *probed_info)
+{
+	return 0;
+}
+
 int xe_pci_fake_device_init(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
 	struct xe_pci_fake_data *data = test->priv;
+	struct xe_probed_info probed_info = {};
 	const struct pci_device_id *ent = pciidlist;
 	const struct xe_device_desc *desc;
 	const struct xe_subplatform_desc *subplatform_desc;
+	int err;
 
 	if (!data) {
 		desc = (const void *)ent->driver_data;
@@ -379,8 +387,12 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
-	xe_info_init(xe, desc);
+	err = fake_probe_info(xe, &probed_info);
+	if (err)
+		return err;
+
+	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
+	xe_info_init(xe, desc, &probed_info);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6..7f1da6d25011 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -737,13 +737,27 @@ static void init_devid(struct xe_device *xe)
 	xe->info.revid = pdev->revision;
 }
 
+struct xe_probed_info {
+	/* Nothing for now. */
+};
+
+/*
+ * Probe from the hardware the info required by xe_info_init_early().
+ */
+static int xe_probe_info_early(struct xe_device *xe,
+			       struct xe_probed_info *probed_info)
+{
+	return 0;
+}
+
 /*
  * Initialize device info content that only depends on static driver_data
  * passed to the driver at probe time from PCI ID table.
  */
 static int xe_info_init_early(struct xe_device *xe,
 			      const struct xe_device_desc *desc,
-			      const struct xe_subplatform_desc *subplatform_desc)
+			      const struct xe_subplatform_desc *subplatform_desc,
+			      struct xe_probed_info *probed_info)
 {
 	int err;
 
@@ -910,6 +924,15 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	return gt;
 }
 
+/*
+ * Probe from the hardware the info required by xe_info_init().
+ */
+static int xe_probe_info(struct xe_device *xe,
+			 struct xe_probed_info *probed_info)
+{
+	return 0;
+}
+
 /*
  * Initialize device info content that does require knowledge about
  * graphics / media IP version.
@@ -917,7 +940,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
  * present in device info.
  */
 static int xe_info_init(struct xe_device *xe,
-			const struct xe_device_desc *desc)
+			const struct xe_device_desc *desc,
+			struct xe_probed_info *probed_info)
 {
 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
 	const struct xe_ip *graphics_ip;
@@ -1073,6 +1097,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
  */
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct xe_probed_info probed_info = {};
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
 	struct xe_device *xe;
@@ -1117,7 +1142,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	err = xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_probe_info_early(xe, &probed_info);
+	if (err)
+		return err;
+
+	err = xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
 	if (err)
 		return err;
 
@@ -1136,7 +1165,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	err = xe_info_init(xe, desc);
+	err = xe_probe_info(xe, &probed_info);
+	if (err)
+		return err;
+
+	err = xe_info_init(xe, desc, &probed_info);
 	if (err)
 		return err;
 

-- 
2.53.0

