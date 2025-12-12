Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEB8D59D95
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22DA10E969;
	Fri, 12 Dec 2025 21:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dw65OmmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AE410E96B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575154; x=1797111154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Bo1KoD2UB5W8uwo1QCjn16gYetPStzkRVKLKsUC53w=;
 b=Dw65OmmH5nI5g7iU/cUnhHcbzhK5u4967cZ6IHrmciUekFBESE8b9911
 tB4s3ZSVl5VX5LCDS4nG7KBceb3Ks7jl9pbT/TC1yrhKHoE6AtelGUGxJ
 jq42WP7/FHxJgVUQeZtsTl40lGgkv9YYdFRfOZrlrgZyU5da+GVk8lm0Q
 Ra1Rs2Yvg40ZslitaPGOm9bLxWsZtDQzKC9yebaeu3z0juzPgPIHrUjR9
 KzQ6sGFGMhZL3bpPFOWQAoR0KoOqL5F5+NQJ7TNn2BcZDUET8gmRYX8C/
 NgD5afAV+ZSo2j2m+oMahWwvCK+o6nVdC6w3I/L6flICbCSSvBgHfVDz4 A==;
X-CSE-ConnectionGUID: 1UJco0yqShiXKLyLnAgREQ==
X-CSE-MsgGUID: Y23cCfChT3mZ8W7fqFEtJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541888"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:34 -0800
X-CSE-ConnectionGUID: 9M/AmnM8QI+TYPyLWFpfMg==
X-CSE-MsgGUID: 2qhSSugyTouVX11E9nt4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244680"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:32 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Oak Zeng <oak.zeng@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v6 03/10] drm/xe: Add page reclamation info to device info
Date: Sat, 13 Dec 2025 05:32:29 +0800
Message-ID: <20251212213225.3564537-15-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

From: Oak Zeng <oak.zeng@intel.com>

Starting from Xe3p, HW adds a feature assisting range based page
reclamation. Introduce a bit in device info to indicate whether
device has such capability.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b35ba29d4d35..c1cff865d519 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -317,6 +317,8 @@ struct xe_device {
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
 		u8 has_mert:1;
+		/** @info.has_page_reclaim_hw_assist: Device supports page reclamation feature */
+		u8 has_page_reclaim_hw_assist:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d731b468f1be..f14b4c9c2ab7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -685,6 +685,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
+	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index bfac64d04dee..602efc5c1252 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -50,6 +50,7 @@ struct xe_device_desc {
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
+	u8 has_page_reclaim_hw_assist:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.52.0

