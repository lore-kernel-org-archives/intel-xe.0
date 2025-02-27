Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7E7C19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 15:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99DB10E396;
	Thu, 27 Feb 2025 15:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuAtR3pD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C0710EB26
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740671630; x=1772207630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1ntYrvCVzoSMlPCq1tMwyJPBLIGNFuMVpTBH8HT8Ws=;
 b=RuAtR3pDxIcCLrC8WoAUh821s662cdWeYB6Yn6S6QvVZwtNQYHakTHCt
 dsEs2mjzi4x6KQaLQfYFLGboU1yFogk0Y8noa7Mxqb1juUbpPDoQkQsLt
 Npb9Mdkizu05Hg/IgmryRbM1kBDyx8yi+HdSqh0SmW29aagI6+sJpJZ35
 /AIPRIbvgTsM0ixYdnQRDIVEg532KQz345IlO5pyUwuc4YHBQDryF7YEt
 BqFuisltiNdZWiJeO8XvdnYNWv6OcfwrN4jipPGYms3Pb/X1oJEFniDzV
 FUDfuQY2ozJ8S0q19K5L9uUvF9Nu80rdmW+3K3VJePYqJN2W5WCUV9u/p w==;
X-CSE-ConnectionGUID: 0dzNFI3hQD+fN7GA8pn40A==
X-CSE-MsgGUID: bQqjNmpjQD6X1oDr5rl6uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41273511"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41273511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:53:50 -0800
X-CSE-ConnectionGUID: pz40xP0vSfOug2M0KBXq/g==
X-CSE-MsgGUID: HJejp0ldSEafOJeri9PzRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121188676"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:53:49 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v6 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Date: Thu, 27 Feb 2025 11:09:50 -0500
Message-Id: <20250227160952.807885-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250227160952.807885-1-oak.zeng@intel.com>
References: <20250227160952.807885-1-oak.zeng@intel.com>
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
index 833c29fed3a3..94cc93314972 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -318,6 +318,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
+		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
+		u8 needs_scratch:1;
 		/**
 		 * @info.probe_display: Probe display hardware.  If set to
 		 * false, the driver will behave as if there is no display
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6b5fa067b39b..3e3b1cea9bce 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -67,6 +67,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
+	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
@@ -353,6 +354,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.needs_scratch = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -361,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_heci_cscfi = 1,
+	.needs_scratch = true,
 };
 
 static const struct xe_device_desc ptl_desc = {
@@ -369,6 +372,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_sriov = true,
 	.require_force_probe = true,
+	.needs_scratch = true,
 };
 
 #undef PLATFORM
@@ -644,6 +648,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
+	xe->info.needs_scratch = desc->needs_scratch;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-- 
2.26.3

