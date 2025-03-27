Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F18C36010
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 16:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D3810E927;
	Thu, 27 Mar 2025 16:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8eVAh7r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A47C10E1A3
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743092361; x=1774628361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nlC4ELMiIWCqkU4G4f4oogvhM2K40SVgNHMgKG5bUIc=;
 b=i8eVAh7rFclJiTxYF2/f6BxTmHWdTfY9iRna2H+gs9hwgZQGhx7GTk9B
 P4ixQqvn2xTFH2hEP818bm5CxAxiZScXorQ1eo7ITfWpwqXnWrHLffB/V
 j2VowbN4ViXJBPKeE/e+/aluFD8sx7PXb9ALkPiKmKtcVcxrP0uTT67vt
 qF22TpxVcCQGMlEFFPsxaps8WqfHEnigT90ncE9Towk301jU7pS91mmb9
 GSEEnifhMG8RUYCeXYVunV2GjxIBeexOZI1/tEwM/axmP0JHBiH/4vSxB
 Yoby75VQwG9Ob82AmO1sSxTOl+JjO3zZkQHuYDxMiqYIQYkKYxeqLm58m w==;
X-CSE-ConnectionGUID: NN8GmG8eQ3aw/0rm7g8dSg==
X-CSE-MsgGUID: /mWc9C+rTpy7YEPyilhl+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61829388"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="61829388"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 09:19:21 -0700
X-CSE-ConnectionGUID: CK3rnXQdRu+zl8+R0kKUYQ==
X-CSE-MsgGUID: X1N5LO3DTrSbwA0ZrmDpsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125420589"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 09:19:19 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 rafael.j.wysocki@intel.com, raag.jadav@intel.com
Subject: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Date: Thu, 27 Mar 2025 21:49:14 +0530
Message-Id: <20250327161914.432552-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

According to pci core guidelines, pci_save_config is recommended when the
driver explicitly needs to set the pci power state. As of now xe kmd is
only doing pci_save_config while entering to s2idle/s3 state, which makes
pci core think that device driver has already applied required pci power
state. This leads to GPU remain in D0 state. To fix the issue setting
the pci power state to D3Cold.

Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7046e7e9a6c7..3317d475be79 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
 
 	pci_save_state(pdev);
 	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3cold);
 
 	return 0;
 }
-- 
2.34.1

