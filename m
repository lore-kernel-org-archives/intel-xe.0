Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4810ED678
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDA810EDBB;
	Fri, 27 Mar 2026 13:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9R51ucF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B066310EE4E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617553; x=1806153553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=82XvDhlrePaegYhqDghGSD7zC5lQYmnA53UxlFzv4E0=;
 b=W9R51ucFEzf36YQiPohExQdCqgJ1ThuJLHyA+n9JbW7v+XgRR0eKMB2k
 dOPi7pnowEWF8QxkQRygpFL8QCNRkVfbDqM60AAZzlBCJx/vfbNWeSGT1
 Lc7bMHbY14NmylZdhbCigxK+kYxPT6iaKf9qRD5Aqnm/Yc7UmyXSoYD4Q
 mfZZTDuDaiobpdfivNNoqLa0Ixd8gys/xf/OGMcLTH6FYWzpSdBM5KNyU
 pjupQEKcecsfPlni0SYx7cMGnGJQhAVrSm1yuzpZaoIXg2cIdF553vKA7
 pH15n0ItJfzB3EnrxnCQipak/08uvxG0KUWKHrhVHoO5yBgmVQQbpCTUD w==;
X-CSE-ConnectionGUID: MwnipwubTnuNns0um57sgw==
X-CSE-MsgGUID: q0KhUwlpT6uV+Gfyzu6LzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75656142"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75656142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:19:11 -0700
X-CSE-ConnectionGUID: IbdF0tm0TkedNAvshuqI7A==
X-CSE-MsgGUID: WEVa08MuT32XxulDUhif8g==
X-ExtLoop1: 1
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:19:07 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v13 7/7] drm/xe/xe_pci: Enable System Controller support on
 CRI platform
Date: Fri, 27 Mar 2026 06:18:44 -0700
Message-ID: <20260327131837.2192929-16-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Enable System Controller support on CRI by setting has_sysctrl capability
flag in device descriptor and runtime device information.

This allows sysctrl subsystem and mailbox communication to be initialized
on CRI platforms.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v8: (Matt, Michal)
- Reordered patches for logical flow

v10: (Riana)
- Cleaned up commit message

v13: (Umesh)
- Disable sysctrl and SoC remapper capabilities for SR-IOV VFs in xe_info_init()
---
 drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 189e2a1c29f9..1df3f08e2e1c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -465,6 +465,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -764,6 +765,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
@@ -960,6 +962,12 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 	xe->info.has_mem_copy_instr = GRAPHICS_VER(xe) >= 20;
 
+	if (IS_SRIOV_VF(xe)) {
+		xe->info.has_sysctrl = 0;
+		xe->info.has_soc_remapper_sysctrl = 0;
+		xe->info.has_soc_remapper_telem = 0;
+	}
+
 	xe_info_probe_tile_count(xe);
 
 	for_each_remote_tile(tile, xe, id) {
-- 
2.43.0

