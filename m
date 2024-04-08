Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C8C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E91112775;
	Mon,  8 Apr 2024 16:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGbHsUZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C6D112774
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593747; x=1744129747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukOWG6pHW3LVkvOgPt6VlLTx4AXls+xcPa+HvtNGGJ0=;
 b=ZGbHsUZZgOkh+bAX6o0e73rnuGK8DMArXp1mmdD1M0xhy088muVGyj3o
 CMsPB8SoG+QxMGPwo7mm6BUtKwclnFbcEzcJ/cyq9Hk/RLhRJo+FJMmeL
 oViDaMtykJgVUhXURnLJJwwanLLN7ntEnXhHw2ty1egXwgEUo7+b+o8gD
 7AHB0id03+MqK1Vg+9lpFXX8nD5Yx3B2vRgfGSm0541oKoNLd/WtxTGMw
 CfGqodgbnN5j6wQ+rQshPQREh5e1HIgBixWpXACXLPchcqJn5/jtuk7rk
 1jwoES8/jpC7NRXfh5tYDd0B+7ZgS/ApxbSB7ndmZ1VxxAT82GB/hR4hT A==;
X-CSE-ConnectionGUID: Ycfn3Wu+TjuBYClJsopBoA==
X-CSE-MsgGUID: xhJDBMjyTgKoxYLbgrQvgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024949"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:06 -0700
X-CSE-ConnectionGUID: 1FHukDXNRim0+vHgWJulKQ==
X-CSE-MsgGUID: l+wP1y8BT/CRXTSWdDuvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683417"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:04 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 03/11] drm/xe/bmg: Add BMG platform definition
Date: Mon,  8 Apr 2024 21:59:02 +0530
Message-Id: <20240408162916.3767771-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

