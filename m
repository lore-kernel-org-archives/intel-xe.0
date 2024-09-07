Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CF5E6FE4C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F42910EB30;
	Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azijkHAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB24910EB25
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XVShsON2nbWlKAHcDAEbclp8GxHobvWMsf1+3TT07o=;
 b=azijkHAK82NO+ZEGZeqoIJQrP6+V4Cat7LIeHN8gY2K3VSgM7STckZQV
 +8L58CPvGltC1UeXP6SX3qJ3dDx+SuRjgfOz1sGddBxarZjCejYm3dXND
 ha1w6VZ4jQkiJ2FBpVGhRgMzx2I7R5HSTPTDssBPPS4buHkpmrBzaIGPZ
 HRD/u6HT7q1zu6ukHdC/+hFKcPRF59pxL8AN/i6U+4BSwFJ209xQ5emjF
 a9gqA4ssTnfx23932TzTSQtwar52+rn3ZDP+NkXXFvCrzAvKkdkngM0UN
 HIhaqLpt8JBOVEHLs/zL+FM1VGU1TeXuuj6BlerMKsF+BgupfDCOsbzAo Q==;
X-CSE-ConnectionGUID: QPCszOYrTr6U+BywpTj6/A==
X-CSE-MsgGUID: KvzpL668Ri2Dk1G6iev38g==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855298"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855298"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: 4ZqS+xYUT1yHnNQzY7DwCw==
X-CSE-MsgGUID: jBQCOG3yTBKKQdAHNPNyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792639"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 08/43] drm/xe: Adjust mmio code to pass VF substructure to
 SRIOV code
Date: Fri,  6 Sep 2024 17:07:57 -0700
Message-ID: <20240907000748.2614020-53-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Although we want to break the GT-centric nature of the MMIO code in the
general driver, the SRIOV handling still relies on data in a VF
substructure of the GT.  So add a GT backpointer, but name it
sriov_vf_gt to make it clear that it's only for this one specific
special case and will not be set or usable for anything else.

v2:
 - Store backpointer to the GT itself rather than the SRIOV-specific
   substructure.  (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>  # v1
---
 drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 27fd16bedb4a..1bd6f677a772 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -121,6 +121,14 @@ struct xe_mmio {
 	/** @regs: Map used to access registers. */
 	void __iomem *regs;
 
+	/**
+	 * @sriov_vf_gt: Backpointer to GT.
+	 *
+	 * This pointer is only set for GT MMIO regions and only when running
+	 * as an SRIOV VF structure
+	 */
+	struct xe_gt *sriov_vf_gt;
+
 	/**
 	 * @regs_size: Length of the register region within the map.
 	 *
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9914d7d4b9de..aa0c29450b4a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -719,6 +719,9 @@ static int xe_info_init(struct xe_device *xe,
 		gt->mmio.regs = tile->mmio.regs;
 		gt->mmio.regs_size = tile->mmio.regs_size;
 		gt->mmio.tile = tile;
+		if (IS_SRIOV_VF(xe))
+			gt->mmio.sriov_vf_gt = gt;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
@@ -742,6 +745,8 @@ static int xe_info_init(struct xe_device *xe,
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 		gt->mmio.tile = tile;
+		if (IS_SRIOV_VF(xe))
+			gt->mmio.sriov_vf_gt = gt;
 
 		/*
 		 * FIXME: At the moment multi-tile and standalone media are
-- 
2.45.2

