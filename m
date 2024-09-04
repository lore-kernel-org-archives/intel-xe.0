Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4379ECD4F21
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E194F10E803;
	Wed,  4 Sep 2024 16:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXP+/CoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C52710E803
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725466978; x=1757002978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEjKPp+Td6l4CDYszCi93aXcKq6NvpJQaUA+a2TpcLo=;
 b=OXP+/CoLvrCTKtNso3u116kY+J8o7SSObe1VDiZkCSY424R6ACZFp/DJ
 uUyHvWr6aU8VpPYKc9fxk8yRFW26tlDFPLajf+uWTVWmmIvvh2Ct6P9vr
 ehwK6yl9HQENMhcuKFKcWRS36gxxFexgz6XFbNM6Xerc2azZ6S6aL9uwD
 xgrC7j9mw2mPcHYaLk+YbTT/uXBDylPLa96xpqHG+ZnFhsfQWfwoLGV7R
 N6eOk4T46dFIgWFVlQmLyjEXz7jlgDVXzU641nMfhZyhTPix2FA9oOo2K
 NFsctOcxqv2XO0hKB8FoDoD0wetvw4AgntrpnU9K9OczPhWO4d9n5POry w==;
X-CSE-ConnectionGUID: BVSLlS9XTp+fQHz9bt8IUg==
X-CSE-MsgGUID: iPsl9pCjR+CJVTCF6/UIEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24253908"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24253908"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:22:58 -0700
X-CSE-ConnectionGUID: GCasvTq7TEGD2qYVQpjOyg==
X-CSE-MsgGUID: ZIu6X2DURyO8+2pNs2/KjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69951098"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:22:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe: Update runtime detection of has_flat_ccs
Date: Wed,  4 Sep 2024 09:22:38 -0700
Message-ID: <20240904162238.2831202-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904162238.2831202-1-lucas.demarchi@intel.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
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

It's confusing to have a *set* function that actually probes the
hardware rather than receiving a parameter. Rename it to *probe* along
with prefix removal and comment in the relevant places that the
has_flat_ccs flag may be overridden in runtime.

While at it, fix the mixed declaration of struct xe_gt.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 +++++---
 drivers/gpu/drm/xe/xe_pci.c    | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a0d7fdd094b..449b85035d3a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -588,15 +588,17 @@ int xe_device_probe_early(struct xe_device *xe)
 	return 0;
 }
 
-static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
+static int probe_has_flat_ccs(struct xe_device *xe)
 {
+	struct xe_gt *gt;
 	u32 reg;
 	int err;
 
+	/* Always enabled/disabled, no runtime check to do */
 	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
 		return 0;
 
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	gt = xe_root_mmio_gt(xe);
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
@@ -688,7 +690,7 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	err = xe_device_set_has_flat_ccs(xe);
+	err = probe_has_flat_ccs(xe);
 	if (err)
 		goto err;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8642c079bc65..94856ed6686a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -677,7 +677,10 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	if (xe->info.platform != XE_PVC)
 		xe->info.has_device_atomics_on_smem = 1;
+
+	/* Runtime detection may change this later */
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
+
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
 
-- 
2.43.0

