Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2E1C982D6
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 11:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D1A10E51D;
	Fri, 18 Sep 2026 11:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFDqBC4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EFD10E51D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789729340; x=1821265340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWdX6tTwgnfCqMFO60qJdJkCIwBQYz3dxpLh41ciJM4=;
 b=HFDqBC4yOdFtaaNn7b+GH9SHwKkaUTpsVFBTnGv/MvayLtkjnZ6ERkXo
 QyoAaN0+tV3VdCDVIbH5UkwoCjBHC7njr2RWthyLEXti11TwrJETzrgz3
 W83aiogkaYt/BQX9WDjywh6/iYw0HOhTWoSX/64sghV5LIbUfEovfjnfN
 MyDZ7KWXCBAm31WQ+1fv237D23czsbr/q5zKsmSTSaqqGEY3TzwM0LnuD
 C2SM5BiKSKVbfgefExvsMQxY5xhQbCVWSeJU9oXxr/8JnqBGZR28mwPU4
 +MINvlugjCRXOqL4oqVTrMPOPdX4ak+jpfCwYKV7LEtgY/coJ3NssmKsm g==;
X-CSE-ConnectionGUID: HO/gJfviSqqmPPbkXvH7Yg==
X-CSE-MsgGUID: 5Tk7OHmbTtGyvtcqE/CpIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90094335"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90094335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 04:02:19 -0700
X-CSE-ConnectionGUID: p1tgaatHRqaFrpz5TE7piA==
X-CSE-MsgGUID: 6bs2VE3RTnGviKC2/0Wr4w==
X-ExtLoop1: 1
Received: from pchelmix-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.119.200])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 04:02:17 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Date: Fri, 18 Sep 2026 13:01:30 +0200
Message-ID: <20260918110130.700332-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
v4:
 - use directly pf_resize_vf_vram_bar helper with device_total_vfs value.
v3:
 - rebased to resolve conflicts, no other functional changes were done
v2:
 - Rename helper to restore_vf_vram_bar_size() (Michal)
 - Use xe->sriov.pf.device_total_vfs instead of pci_sriov_get_totalvfs(),
   which may be capped (Michal)
 - Switch logging to %pe (Michal)
 - Call restore unconditionally on enable-fail path (Michal)
   (drop vf_vram_bar_resized flag)
---
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index c023a2a1fc17..31abcee55211 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -177,6 +177,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
+	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 	pf_finish_vfs_enabling(xe);
@@ -204,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
+	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
+
 	xe_sriov_pf_reprovision_default(xe);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.43.0

