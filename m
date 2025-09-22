Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D8CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 08:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC19B10E3FD;
	Mon, 22 Sep 2025 08:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kT0e3oNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D6B10E3FD
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758531490; x=1790067490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hvz1g+NJpzi+St5o62shpZ2Zx75nvMMD1qWFk5/O+jo=;
 b=kT0e3oNSgVwLV0oBV2f5StsYZK1zKndzzWQPAXHgDGxatjQh6dkzEuQy
 /bZdjz96QY9zfhDszB7007DMDK0UGzHrCz5Z90hCcGnTGfs39cs3VmqHT
 rXEFgSNhtgBTxX5TTkyzCz1mANnQZyowYR1XmL3pTvHnC5UB6/clQxqrf
 jhxas0sBcD96OltTkpOHC8vgqZyrWu4Oqu6kPSQ2gItCQIyP750E6LMig
 IddBNVV0pUgmzNYdoGPOZig8KvwUhsxtJ1UXDHCTztqEPvVC4XdQN00MT
 f75Z13OvBm6QKXdnNbHWKbLQ8EIc5ip0B3/iChr2o5yAzVs8GvYnZSFya Q==;
X-CSE-ConnectionGUID: mFNnBZZAQ9Gwn9JMIzDNbA==
X-CSE-MsgGUID: m0Z+LHiOTE6YmaT6TiUj7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60677311"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60677311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:58:10 -0700
X-CSE-ConnectionGUID: I2KbHvjeTZGa6qvR8pBtjg==
X-CSE-MsgGUID: i1iua6TAQaWdb3RjJUEGBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="180839193"
Received: from unknown (HELO localhost) ([172.28.180.69])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:58:08 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Date: Mon, 22 Sep 2025 10:57:44 +0200
Message-Id: <20250922085744.99051-1-marcin.bernatowicz@linux.intel.com>
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

v2:
 - Rename helper to restore_vf_vram_bar_size() (Michal)
 - Use xe->sriov.pf.device_total_vfs instead of pci_sriov_get_totalvfs(),
   which may be capped (Michal)
 - Switch logging to %pe (Michal)
 - Call restore unconditionally on enable-fail path (Michal)
   (drop vf_vram_bar_resized flag)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index af05db07162e..4caa82aad140 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -144,6 +144,19 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
 	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
 }
 
+static void restore_vf_vram_bar_size(struct xe_device *xe)
+{
+	int err;
+
+	if (!IS_DGFX(xe))
+		return;
+
+	err = resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
+	if (err)
+		xe_sriov_info(xe, "Failed to restore VF LMEM BAR size: %pe\n",
+			      ERR_PTR(err));
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -194,6 +207,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
+	restore_vf_vram_bar_size(xe);
 	pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 out:
@@ -218,6 +232,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
+	restore_vf_vram_bar_size(xe);
+
 	pf_reset_vfs(xe, num_vfs);
 
 	pf_unprovision_vfs(xe, num_vfs);
-- 
2.31.1

