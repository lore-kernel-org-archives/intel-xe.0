Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71632CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 16:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3687310E8D3;
	Thu, 18 Sep 2025 16:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfJSkWwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E0110E8D3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758213843; x=1789749843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cGLWHK2lSYQpvUPsbz2a/4hH2xGz2J5zfpqQBXBRiAU=;
 b=UfJSkWwuwyUgiPrerZABKRYD8sWMasDVAEeaGaeL3I7WpsYfQoSYqf7M
 k66h6+JcV70QiqSEZh5g1IpGGLIwZl5tnLcnsLjHR0dhCBrNW/HnUJZ88
 YLNfM/xz+wuhYAX1H2S0o6aVk9v7LZPfgtETKCssYrvDhCjCO2NGd9uPo
 MGQxJ32mxdH8MLYv7dtipWfDVirWk7Rh1q6droG6fdeD4CZU+YOMoXuU5
 I6tM2M6WK25in5CJkSaFHw4aTKVwA4zs14r2hUqq9kdpBOy6ovo2dMz/9
 oAkZMv4Id3TXEE+5+58UvbqjuJQx8ifsdhhv262A0nOFC2CugU/ndoWY2 w==;
X-CSE-ConnectionGUID: l6AvUoABQNKn0gomfjDakA==
X-CSE-MsgGUID: ASH3GUt8RyOPRXzWsB8WeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78155529"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="78155529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 09:44:03 -0700
X-CSE-ConnectionGUID: 3OSuE/DSTYKhmFuUMCVHsw==
X-CSE-MsgGUID: 7KOWRWSqSEOCEXyo3lRVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176037341"
Received: from unknown (HELO localhost) ([172.28.180.84])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 09:44:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Date: Thu, 18 Sep 2025 18:43:55 +0200
Message-Id: <20250918164355.1459200-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
fit the requested layout. After VFs are disabled the PF VF BAR
size is left as-is. On platforms with tight MMIO apertures a
subsequent unplug/rescan followed by another enable may fail with:

  "VF BAR …: can't assign; no space"

because the PCI core reserves address space based on the (now large) VF
template, often multiplied by totalvfs.

v2: Use pci.total_vfs in helper (Michał Wajdeczko)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index af05db07162e..ff003a650f79 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -144,11 +144,26 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
 	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
 }
 
+static void reduce_vf_vram_bar_size(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int err;
+
+	if (!IS_DGFX(xe))
+		return;
+
+	err = resize_vf_vram_bar(xe, pci_sriov_get_totalvfs(pdev));
+	if (err)
+		xe_sriov_info(xe, "Failed to reduce VF LMEM BAR size: %d\n",
+			      err);
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
 	int err;
+	bool vf_vram_bar_resized = false;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 	xe_assert(xe, num_vfs > 0);
@@ -178,6 +193,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 		err = resize_vf_vram_bar(xe, num_vfs);
 		if (err)
 			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
+		else
+			vf_vram_bar_resized = true;
 	}
 
 	err = pci_enable_sriov(pdev, num_vfs);
@@ -194,6 +211,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
+	if (vf_vram_bar_resized)
+		reduce_vf_vram_bar_size(xe);
+
 	pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 out:
@@ -218,6 +238,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
+	reduce_vf_vram_bar_size(xe);
+
 	pf_reset_vfs(xe, num_vfs);
 
 	pf_unprovision_vfs(xe, num_vfs);
-- 
2.31.1

