Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FECCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C480710E2C1;
	Mon, 18 Sep 2023 17:30:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2110E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695058215; x=1726594215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwHabhnm65S0kWqsTEy/Y0WBobA0Bj+BE8UQWNME6qg=;
 b=HBENJW7Ucrubo6ihmd+a0MYSYH/Ia3AD/3CfcQk0OXDzDMSt/igkid4L
 uXeT5fXgQTrldiTDLpPtpqZgwklGJA03HvXa/Ek/JAS30X5V/J0gIxikn
 Bih2dAPVsRHm+PcIRrxni5GBHRh3wJ8YwP0AhPK9X/3KSOOIqgYyy4PC2
 4zEYyZWnSEuX0kTxBvCASdixrKgCFmDTZsHJ29HWJ9VaKjYjTRfNNwbxD
 TVH53obSUkNjJVKYjc0b5ygUN5gJxS285M9ndrHN7BD0TxtF4nr1uaPfu
 /rGpK8s1+Df7Ae8QOw/GSoz59mDQEbxnA/TDqyT29lC9rsfU8liQ9lzBt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359140674"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="359140674"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919543219"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="919543219"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 18 Sep 2023 10:30:13 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 23:07:11 +0530
Message-ID: <20230918173711.625930-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230918173711.625930-1-uma.shankar@intel.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/i915: Use the wrapper function for vga
 decode setup
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some of the VGA functionality is not needed by the proposed
Intel Xe driver. A wrapper function for VGA decode setup, this
patch uses the same.

This fixes
commit b9e2d240d489 ("FIXME: drm/i915/vga: disable vga set decode for xe")
Reverts the changes added in the patch.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 42da1a038042..145fb184b0df 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -99,24 +99,6 @@ void intel_vga_reset_io_mem(struct drm_i915_private *i915)
 	vga_put(pdev, VGA_RSRC_LEGACY_IO);
 }
 
-static unsigned int
-intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
-{
-#ifdef I915
-	struct drm_i915_private *i915 = pdev_to_i915(pdev);
-
-	intel_gmch_vga_set_state(i915, enable_decode);
-
-	if (enable_decode)
-		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
-		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-	else
-		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-#else
-	return -EIO;
-#endif
-}
-
 int intel_vga_register(struct drm_i915_private *i915)
 {
 
@@ -131,7 +113,7 @@ int intel_vga_register(struct drm_i915_private *i915)
 	 * then we do not take part in VGA arbitration and the
 	 * vga_client_register() fails with -ENODEV.
 	 */
-	ret = vga_client_register(pdev, intel_vga_set_decode);
+	ret = vga_client_register(pdev, intel_gmch_vga_set_decode);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.42.0

