Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573C2E81DE9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 11:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297B910E1F4;
	Fri,  6 Oct 2023 11:49:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B522410E0D2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696592987; x=1728128987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mAKc7CFtzhf+CfXrmvj6vGA823FS8CB5MbE3ZD/+9QA=;
 b=fbxzFjuHp88e2ezgcAkLBeZimiGZPocyv1f3j0lkE4V1+yIy9z6DP+55
 a6LnXp4kdCIgRrMzx+Wi9tEXSw8Y9p7TjPEDx9zDjRA60c6hWY/LY8aO+
 Ag7dgrAi0RPcfZkMYt/CWxlX2CFxzD19w5DcrJPBkXfMNr4COmGKytEYF
 MwR/dPUklFK0NCRCyJRQk/T4Fcls7e34RPz61HD8x4qERzkOUmYP7uliY
 iHxk45tUvpQ6S4eCbKtGHXXDvdaUE58ZLQfI++4BRpLnPUm9xSaBCtAaz
 0bemH//k7V3lMsWJXaHkM/2B3DxKEF884jufrc8UKveKw8nlL3s0p/yMi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414731370"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="414731370"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 04:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="1083423642"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="1083423642"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 04:49:43 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 17:26:43 +0530
Message-ID: <20231006115645.2402795-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006115645.2402795-1-uma.shankar@intel.com>
References: <20231006115645.2402795-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [v2 1/3] Revert "FIXME: drm/i915/vga: disable vga set
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

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
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

