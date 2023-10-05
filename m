Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E3EE93710
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 13:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9657810E40A;
	Thu,  5 Oct 2023 13:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E9810E408
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696513937; x=1728049937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K0cpjyL7EO2LMkVdMkc+5PN/Q0YMHyAiUEL7ZvhimVk=;
 b=KNL2P9jtd/qh3NXOKuMMUbeOqj82JdTc7H2qLEvy3kb4RgdTBR5mXI6/
 mLhit3WnoU8yz4U5vquElLLF2x2EYnoWlVj/OBK82FRRqauTyh2nuoKdD
 JP9vRomDtEHN1JGqpDakePqzF7szl7Xa7jc7tEm0ap6zcs01GYDaFIrvp
 zl/KdYtfNw3QNFE+EmMMMWWth4mkFLO2TibeMpWFqiI44poFNHOHnRHHW
 fWCbz/tA8aVcxuNxs9V6fM8ZEhKvog9FOy6Huvihu308Dkg/PdrA1CKAX
 4r251xNd6oeRfxFxwckTrrExBPdCbdjActUZO47bQfbVeoTG9XmbALXJv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="373857268"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="373857268"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925593721"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925593721"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 06:52:16 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 19:29:15 +0530
Message-ID: <20231005135918.2345364-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005135918.2345364-1-uma.shankar@intel.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] Revert "FIXME: drm/i915/vga: disable vga set
 decode for xe"
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
Cc: jani.nikula@intel.com, arun.r.murthy@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 28da6179478e3f29cb27df30b71f68b904dfff26.

This will be addressed with an exclusive version for xe.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 42da1a038042..286a0bdd28c6 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -102,7 +102,6 @@ void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 static unsigned int
 intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = pdev_to_i915(pdev);
 
 	intel_gmch_vga_set_state(i915, enable_decode);
@@ -112,9 +111,6 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
 	else
 		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-#else
-	return -EIO;
-#endif
 }
 
 int intel_vga_register(struct drm_i915_private *i915)
-- 
2.42.0

