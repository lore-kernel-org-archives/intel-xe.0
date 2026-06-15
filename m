Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89883CD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C24C10E5DF;
	Mon, 15 Jun 2026 18:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnVsWQU/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506B910E5DC;
 Mon, 15 Jun 2026 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781549298; x=1813085298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0UeFM+yCKVy4UbyTLk6+LcLiTGh1ICHzhY3LQtCn7oY=;
 b=YnVsWQU/CZHSmVIZqK+kK0mdeGT1foIa2BszMsC9L1sHuH7iIB1x6MXF
 swwsSvKSoeZWyVPaPlddmvA2l9oI1+xBKgyKpgpWK+HmhiX/wF+1jx/D1
 2nNHiM6qEOmDUb2hr+Ky/dkeHKyHaelAP3ASi1q4bmi0osYNQsZH+/Gzs
 1g2fvv3Ux1+vpJ4SE3hVomRInYqBe6+RIHdkwwGd8fo4OvkQurBgB6i/4
 TGR3unydqt1EOFoK97QkNAHpc/pxTMxbgfALZ4ygUEjcsc5ZuuuB4yvJg
 cQh0m2APYTBpwPUnOkWvoLZX9XYJeNjL/M6BH1BWxNFftY2UaKqKoJH5n A==;
X-CSE-ConnectionGUID: ud+VYAP+SGuIuNakzM1EmA==
X-CSE-MsgGUID: rFJxOWkITQyHNlHY4lPoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81438580"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81438580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:18 -0700
X-CSE-ConnectionGUID: mn049pFbTpyrl86mZvGEGA==
X-CSE-MsgGUID: A8kVCyXESrGfrVzsmFqJ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247628574"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/6] drm/i915: remove superfluous checks for pdev->msi_enabled
Date: Mon, 15 Jun 2026 21:47:59 +0300
Message-ID: <71f61eee227178b61af9c1211be8545828a3f3ef.1781549229.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781549229.git.jani.nikula@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

pci_disable_msi() checks for pdev->msi_enabled internally. There's no
need to peek at pdev internals in i915. Remove them.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index a69eb3a84005..d1d3f039483f 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -583,8 +583,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 err_opregion:
 	intel_opregion_cleanup(display);
-	if (pdev->msi_enabled)
-		pci_disable_msi(pdev);
+	pci_disable_msi(pdev);
 err_mem_regions:
 	intel_memory_regions_driver_release(dev_priv);
 err_ggtt:
@@ -610,8 +609,7 @@ static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
 
 	intel_opregion_cleanup(display);
 
-	if (pdev->msi_enabled)
-		pci_disable_msi(pdev);
+	pci_disable_msi(pdev);
 }
 
 /**
-- 
2.47.3

