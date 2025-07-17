Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EBC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228510E883;
	Thu, 17 Jul 2025 18:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVpXu7OC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E7510E0B7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752778121; x=1784314121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ekGn/SKeFvXgKJkfXUzKrhszQBAwUcO8Em+ausERbMA=;
 b=hVpXu7OCFkT5ptSRRYjSfHDTeSpDZt1Mi4iEAduX9QciVAt6axAmrP8o
 8aoP8Qaz5/3MKF3bKYbOeFX9yRDuaa210hSk+BVTrlgnkp/L4wZWQQ6Pb
 FjqA7n1mAinerupdtI8XZZPf030Ua/VlUNiTg5rr52QS1+bTNsIrs1sT2
 y5CE7FaBQTS11hitN2NUNRxe3/enMePty0AAv8PKbpx5vCvNd4r4OCAIF
 ib/vtguIbYFNf5F8BSh+/yi/ucY3FsYg45DRzxnVG3HnlD+nE59ss+OHA
 Kmr4vvxkz5KM2Fcqk5H5+KPoiXIA9LZTPkwYKEF9byW11mqp4stn1L9AF Q==;
X-CSE-ConnectionGUID: /1d+nxRcQn2mA66HFBIolQ==
X-CSE-MsgGUID: FU8KLKw+QuKp7bwnvDI4Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80513743"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="80513743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:41 -0700
X-CSE-ConnectionGUID: xvjHgI8JQgyJZyESr31S8g==
X-CSE-MsgGUID: c3CMm9tgTdu4tPWvyxGAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181580957"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
Date: Thu, 17 Jul 2025 20:48:23 +0200
Message-Id: <20250717184825.851-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250717184825.851-1-michal.wajdeczko@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
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

There is no need to manually build PCI device name from BDF data,
since it was already prepared and assigned and can be accessed by
calling pci_name() function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 90b4fe92a611..00bb4e412c12 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -312,13 +312,9 @@ static struct configfs_subsystem xe_configfs = {
 static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 {
 	struct config_item *item;
-	char name[64];
-
-	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->bus),
-		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 
 	mutex_lock(&xe_configfs.su_mutex);
-	item = config_group_find_item(&xe_configfs.su_group, name);
+	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
 	mutex_unlock(&xe_configfs.su_mutex);
 
 	if (!item)
-- 
2.47.1

