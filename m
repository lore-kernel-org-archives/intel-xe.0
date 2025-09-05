Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FB1CA1010
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 17:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9BA10EC12;
	Fri,  5 Sep 2025 17:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9VMcTOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7056710EC12
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757093800; x=1788629800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JT8qIf9bAeL4l5TubfttzZvuX/JHs/LBeh640mLwv1E=;
 b=Q9VMcTOoil2OlSWq+nhntWUKZUtJ9p003ISldr3/CJm/k8xmH+sSHS7Z
 APS1Wp9dv/osNgiGOcwuX7hpZOWBdWJb2NdqW7U3QINf/Wh7r/BLwJ4xy
 aWsh5+Rq5srMi/bp3nQYe8gA/7Ih/M5qwP0eq22UwuCnlHzUsDUuo93ru
 lm/PZr2bIzM+IUZRyJq4n1NiATFV9XlEuyyBSEdtF3jjeAD3NEvsT7ToF
 t11RVE2us3wrTz7zSQNR0nFmUN6N4BQG7Oc0Axm2UAV1kP28O3v5maCGR
 EtsC+HCIL+QWA2A7sNMbcTK3jLyu/v2C4vskXlZP1XKYl4e1T8JslqtTO Q==;
X-CSE-ConnectionGUID: pnySD2Z2SfG4N5JXqNP4dw==
X-CSE-MsgGUID: 73tPbK+NTNShJAAhoxtsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="84885901"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="84885901"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 10:36:40 -0700
X-CSE-ConnectionGUID: /AdGxJ03QeStEDjU/iMS2Q==
X-CSE-MsgGUID: VWMBwMIDSdmHUytTCspF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="195877873"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 10:36:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH] drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
Date: Fri,  5 Sep 2025 19:36:25 +0200
Message-ID: <20250905173625.8398-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

In addition of checking if we are running on the BATTLEMAGE,
we should also check for not being a VF driver, as VFs can't
access necessary registers, and doing so leads to:

 | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
 | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
 | Call Trace:
 |  xe_mmio_read32+0x110/0x280 [xe]
 |  read_residency_counter+0x42/0xd0 [xe]
 |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
 | .. [drm] Package G2 counter failed to read, ret -19

or

 | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
 | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
 | Call Trace:
 |  xe_mmio_read32+0x110/0x280 [xe]
 |  read_residency_counter+0x42/0xd0 [xe]
 |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
 | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19

Similarly, there is no point to expose inject_csc_hw_error on VFs,
as HW errors support is already disabled for VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 4b71570529a6..8be8304cb05c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -346,7 +346,7 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);
-- 
2.47.1

