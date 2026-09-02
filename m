Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9630BC624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D6210F1A1;
	Wed,  2 Sep 2026 12:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdyOAtBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45910F1BA
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788353283; x=1819889283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=STGyOw4H4iz5sqGi6+vybMnd8ea75XIVEzB16Ziy3cI=;
 b=DdyOAtBUn2jA3QtItm7q4DAHYYzTJt9MQNYpXLdzBDsyOSNsFqkTTI6S
 vK35Rj1yMnBIbnCGrYMuI7X9tkYofal+GZ3uroV9ixXiPu1Xv5sfk5+V4
 ZvS1m50EHk7N7rxnGj7myMZmMDr7AyCdQUhZWAzZ4dWUPTKsycNZZuooI
 R7DCekg6S9GCR0t0eqIXYrK3b0Cchwvm/bHh5eikTMa/6OvMNnMfIriKD
 EXhYxjbaauE2w7BckG/OjqRMJOGqceNyLJG62Q7U2eLJfsS9qKHpZKtk7
 PN5XPV4KC4scyP8W06pomZA3MZ7NYY/grCknP91paYKrtVy2vPfb7bxdd w==;
X-CSE-ConnectionGUID: Uq6UzDf9RguxXHa1Ypmxag==
X-CSE-MsgGUID: 3JntOBp3TuaWiqxLIfNy8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88838716"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88838716"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:48:03 -0700
X-CSE-ConnectionGUID: Q2yfaNODS6iVySLNp/tn/Q==
X-CSE-MsgGUID: 1kVqrRQ7ToOueWXlKxzybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="271364010"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.63])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:48:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Date: Wed,  2 Sep 2026 14:47:51 +0200
Message-ID: <20260902124751.512730-1-marcin.bernatowicz@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_pci_sriov.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 35e6b53e18ce2..c23f06f897b42 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -94,6 +94,19 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
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
 static int pf_prepare_vfs_enabling(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
@@ -164,6 +177,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
+	restore_vf_vram_bar_size(xe);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 	pf_finish_vfs_enabling(xe);
@@ -191,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
+	restore_vf_vram_bar_size(xe);
+
 	xe_sriov_pf_reprovision_default(xe);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.43.0

