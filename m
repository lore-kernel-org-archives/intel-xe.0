Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9854DEE01F7
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DD910E943;
	Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFJrKmkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1013510E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x+6e2u9/VjZMFrhTbypTyrH9bIYbNmlTU6fInLewEXA=;
 b=bFJrKmkh71quuta4/O697D3XXphyUJ86HUv3yCXibm1bfV0kRAW6eaLo
 CNPyld4jQ6MGnXCQyst5T2aUtDM1hvodnp8Enla1OkIEdmLqOvoso+bgF
 gvOEF7zGddpTnsnFxb6tImX35iWOwg+/8m6iihYyRtRm+gwlguCpcWdCV
 U9jWWX0O/kDkj1w9HVPYXyzSEtfV0dC4qSHGAraU4IucWsq1m8DgQSi+7
 XJFmDmvzHbHXaXItLpV8WyFwHAjU+6GLy6dwOrSTfC1baTVnSyAu2OSh1
 RPixppRbQ1LvvPdQKs2x+55NbF1QOq9wQZSiQBCvCV7ZK86pfB5FTWOmB A==;
X-CSE-ConnectionGUID: LL7X8WyPTYG8Fn0+Y3w5Zw==
X-CSE-MsgGUID: bm5XsgHBSrK/pefy3cr4mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144299"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144299"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: jF/IxAJUTyS0iy+CEqCI6g==
X-CSE-MsgGUID: dNmYMx3xRyKUMFLD/4enRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989556"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 08/43] drm/xe: Adjust mmio code to pass VF substructure to
 SRIOV code
Date: Tue, 10 Sep 2024 16:47:28 -0700
Message-ID: <20240910234719.3335472-53-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>  # v1
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
 drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3a23083ec3cf..c92df0a2423f 100644
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

