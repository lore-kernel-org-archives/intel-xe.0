Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73756EE49A0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C36110E582;
	Fri, 18 Aug 2023 22:08:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786E10E0E8
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vBdhR+A0Y5FLoQntltqtHs7IlcGMO9I5fDHCznSGnG0=;
 b=XF3wVh0GcAMvY2jvzSP0PGJrmQtj2cXbUfI/fXWlqnt2E1NECvzYOHyT
 3t0XXo7SAvZhqfVSpB3VXZt7PZYGn1z3W/qPouak/eZIkz52R1SR3KN+a
 +xOuFfzMu1iM6eGrpHtcakVTdFPZwxV6z0ANV2ClIP5D2+r0e9NJUQGKi
 GpCUK0MLMa7AjV+0s4+0s/yIp3bClSgarhdQeXw+ez5IVppU2WgIUJcBS
 vaKPZn4xC7D+tql9GD6pGS0bgYiPjhoqcYLxCke4G466wL8lrO1pJwq2r
 kBtYB+b/NH80UqtJ5Utq1s1rinaiCm8PUj+s3ZR6538SbJFd4zXfNnNoC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592990"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592990"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758197"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758197"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:17 -0700
Message-Id: <20230818220824.700519-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/15] drm/xe/xe2: Define Xe2_LPG IP features
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Define a common set of Xe2 graphics feature flags and definitions that
will be used for all platforms in this family.

Several of the feature flags are inherited unchanged from Xe_HP and/or
Xe_HPC platforms:
 - dma_mask_size remains 46   (Bspec 70817)
 - supports_usm=1             (Bspec 59651)
 - has_flatccs=1              (Bspec 58797)
 - has_asid=1                 (Bspec 59654, 59265, 60288)
 - has_range_tlb_invalidate=1 (Bspec 71126)

However some of them still need proper implementation in the driver to
be used, so they are disabled.

Notable Xe2-specific changes:
 - All Xe2 platforms use a five-level page table, regardless of the
   virtual address space for the platform.  (Bspec 59505)

The graphics engine mask represents the Xe2 architecture engines (Bspec
60149), but individual platforms may have a reduced set of usable
engines, as reflected by their fusing.

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 46e3a9632efe..ed6c4bf8c63b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -176,6 +176,24 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_flat_ccs = 0,
 };
 
+#define XE2_GFX_FEATURES \
+	.dma_mask_size = 46, \
+	.has_asid = 1, \
+	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
+	.has_range_tlb_invalidation = 1, \
+	.supports_usm = 0 /* FIXME: implementation missing */, \
+	.vm_max_level = 4, \
+	.hw_engine_mask = \
+		BIT(XE_HW_ENGINE_RCS0) | \
+		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
+		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
+
+static const struct xe_graphics_desc graphics_xe2 = {
+	.name = "Xe2_LPG",
+
+	XE2_GFX_FEATURES,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -320,6 +338,7 @@ __diag_pop();
 static struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
+	{ 2004, &graphics_xe2 },
 };
 
 /* Map of GMD_ID values to media IP */
-- 
2.40.1

