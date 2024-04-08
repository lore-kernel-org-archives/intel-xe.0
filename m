Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDD0CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A4D1128C2;
	Mon,  8 Apr 2024 17:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkeMaQ28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B9E1128B5
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595931; x=1744131931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukOWG6pHW3LVkvOgPt6VlLTx4AXls+xcPa+HvtNGGJ0=;
 b=VkeMaQ286n+m1ocIiquehJwH/DF5QLRhR8aB+PXrCBL22tpb2VvElv3X
 hdvbhdDqHibgjbAV6t1H+E0GXWNP+I9aqHLpHB3yqhg6oe3SRfkVcnbdP
 4nkbSfr/C2T4e7wDaVeM2lJ+sRtQU3A2jVGx+jYh6Cm+AUw6fSbb7btjm
 sC+zW57n0gNkIDhMGQMS6n99L+BXkvW7G6MrZcXgdf6mNzvHwsqdSBs+C
 sIDrXplwDHr8f2dEesvbS58oFZ3AuVxELh9U1PXGKkuCEZyKX9ITGaXEs
 q5a6yUyqw3IAbc/1LK9BjrP90qT5IJEib4Ya8SdtvhmAEmnGlW2QLylIw w==;
X-CSE-ConnectionGUID: sOM0SywiTK2CwLitkqXIWg==
X-CSE-MsgGUID: TNLdrjMXT0yutyuDU1EQ2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679143"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:31 -0700
X-CSE-ConnectionGUID: 3tm+ZQQ3SpeQCLxpKISFSA==
X-CSE-MsgGUID: GMNPT0N1TX+Fic+Bxzekdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733847"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:29 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 03/11] drm/xe/bmg: Add BMG platform definition
Date: Mon,  8 Apr 2024 22:35:37 +0530
Message-Id: <20240408170545.3769566-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

BMG is a discrete GPU based on the Xe2 architecture.
No device ids are bound to the BMG platform descriptor yet.
BMG device ids will be added once we have all the basic required
platform enabling patches landed.

v2: Removed device ids, deferring it to a later patch

Bspec: 68090
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 6 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2d3b18d6404e..3b30353dbc09 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -337,6 +337,12 @@ static const struct xe_device_desc lnl_desc = {
 	.require_force_probe = true,
 };
 
+static const struct xe_device_desc bmg_desc __maybe_unused = {
+	DGFX_FEATURES,
+	PLATFORM(XE_BATTLEMAGE),
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 553f53dbd093..79b7042c4534 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -22,6 +22,7 @@ enum xe_platform {
 	XE_PVC,
 	XE_METEORLAKE,
 	XE_LUNARLAKE,
+	XE_BATTLEMAGE,
 };
 
 enum xe_subplatform {
-- 
2.25.1

