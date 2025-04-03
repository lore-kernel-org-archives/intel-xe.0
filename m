Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DEAC3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 16:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B55D10E29E;
	Thu,  3 Apr 2025 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoUEmTYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70EE10E283
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743698194; x=1775234194;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nUWiPpuGJaFqB5Eh8S16Jy7Zl/d5cL1+FOkldWce8dM=;
 b=GoUEmTYVqKAY2XmibTrhOeV3rR6xEw5Syese6F/g15G2Wp4RlHhmF/o+
 pCAlKi+UT1Hh0prD8TFdoA+LshaV2ARTkWa1n8P2YdfGMuoyhnQ0idrcQ
 FN0q+cFWVQJw9a7arJTd2ydQmXjVa+jZA4TbqRKvLB2KHNYulAZTbXBgx
 h3p2CK7vdymst86Q0sXtOs7Ao1UcWfdhO7J7pRuBKiHW6xvLRORUxzNlk
 PtGwfhpZDFhmkifFzndKRZpMtxTqULQaXHGnkasdcojnN0snyYGpRY8hp
 bXgv9s1shMCrE9KDgp4ejkp50Th3Jh9MQrkj0XhYiPsRC4MqZyH1MpwPq g==;
X-CSE-ConnectionGUID: XtQCyV9MTpasULYGI5cIPg==
X-CSE-MsgGUID: vpb51/sjSw+ybT2m/i9J2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62521594"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62521594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:36:32 -0700
X-CSE-ConnectionGUID: 4YpzwS5XTnWoe+cc2UUqog==
X-CSE-MsgGUID: KAptWzpqRJaySXIsm5Jm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126864615"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:36:31 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Date: Thu,  3 Apr 2025 12:53:26 -0400
Message-Id: <20250403165328.2438690-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250403165328.2438690-1-oak.zeng@intel.com>
References: <20250403165328.2438690-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On some platform, scratch page is needed for out of bound prefetch
to work. Introduce a bit in device descriptor to specify whether
this device needs scratch page to work.

v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)
v3: drop NEEDS_SCRATCH macro (Matt)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c54adebfe518..e52221389710 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -336,6 +336,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
+		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
+		u8 needs_scratch:1;
 		/**
 		 * @info.probe_display: Probe display hardware.  If set to
 		 * false, the driver will behave as if there is no display
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 772b6c81672c..ae06c4c13fd7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -68,6 +68,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
+	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
@@ -335,6 +336,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.needs_scratch = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -344,6 +346,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_display = true,
 	.has_fan_control = true,
 	.has_heci_cscfi = 1,
+	.needs_scratch = true,
 };
 
 static const struct xe_device_desc ptl_desc = {
@@ -352,6 +355,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_sriov = true,
 	.require_force_probe = true,
+	.needs_scratch = true,
 };
 
 #undef PLATFORM
@@ -592,6 +596,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
+	xe->info.needs_scratch = desc->needs_scratch;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-- 
2.26.3

