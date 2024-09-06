Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB9ECE7AA3
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 12:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB5110EA2D;
	Fri,  6 Sep 2024 12:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/HLuQ0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDB210EA2D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 12:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725624393; x=1757160393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5mTp/Egt5jLMuzuaRJ6kwgqUw6pLWkvvITLTdY+JavM=;
 b=G/HLuQ0ve+xappauJy3ooGCOqMIIywzpMGF7SNEU6D0e8/iQ/CtnXs69
 CRK4RIVaT3yiUtuLQtdHh5+QvM/YvqJsTk3WyhHacJZC+pZ7ySpjqJBxP
 +dJef0/z8s7TsOXTgQGJDYxeJfig30i8IaxiSuqBWmPuE4RnAg2oZOvZx
 UCJua5DdxZTvR3PLcWaczw2PAC+7sKdLb51cVcJXYIOgGf5crnnD/kT66
 QNcfZ7VbKdthdCB7Wz71rVK7hC0RLAp9gdHU8JmD7ZyJdPZfD3dkv8Knl
 5HcrG+vUBKfr5qF0DUgkyqco8Svrst6t+2VczftJqbExOJxGTioSqqwTr g==;
X-CSE-ConnectionGUID: PI0TzK9jRzysqkH/KQNO9Q==
X-CSE-MsgGUID: NXQuoLVKTpCcchO4q369vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35527224"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="35527224"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:32 -0700
X-CSE-ConnectionGUID: 0KPcU546Tpyf7c3CGzQcnQ==
X-CSE-MsgGUID: mxMnfdQyTyWTr4Mc271HQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65982271"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 3/3] drm/xe: Add PVC's PCI device IDs
Date: Fri,  6 Sep 2024 15:06:04 +0300
Message-Id: <26820994f2080e988dde4f78c4ea3aad082922b0.1725624296.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725624296.git.jani.nikula@intel.com>
References: <cover.1725624296.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

This patch introduces Ponte Vecchio support in Xe driver.

Please note that besides this patch, likely the force_probe
still needs to be used in order to actually enable the
support for PVC.

This patch was separated from the rest so we can ensure
compliance with DRM uAPI rules on compute platforms.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1154
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

This is the minimal patch for xe-for-CI.
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2c9f9dc783d9..c05ca61787be 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -323,7 +323,7 @@ static const struct xe_device_desc dg2_desc = {
 	.has_display = true,
 };
 
-static const __maybe_unused struct xe_device_desc pvc_desc = {
+static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(PVC),
@@ -392,6 +392,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
+	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
 	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
-- 
2.39.2

