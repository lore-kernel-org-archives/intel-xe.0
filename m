Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0241DCEBF93
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC76D10E45C;
	Tue, 18 Nov 2025 09:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpgcGn65";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B810E45B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456763; x=1794992763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CT3L5DFJ3Jiv8TzfdzgnK9ZFOANaF4/agAFOYCw8frc=;
 b=QpgcGn65WS5Ia5TSYHpTYli+uaGbMK0qpBZ2FfOS64ClMABYHjCjn0u1
 L79nTkSCnUsiEOFTjCzFF0cKqrrSHLzExvEVwsQ5oYk2sVou8kFUHoCqP
 EgQ3nOPUItnn3KUFht3/8AMRs8ddp/aWisZxlvH6tWXYJ7qkYGlQKiJCi
 QZ/gTfPMdzKcFV+JEvQ+jyZ2rPe6fNMtLP0Z79RPhL+FT1LOH/eShUVLL
 1036yz9IIkIPBsJbH0k7dtnGkRTSaJV/9/3szmSx7IOEx7rHIK41M4sLN
 NFtiAtZh5zA3Ceq7mv7xgTdg7+tGlHekOBxWsc/LFyowzfHa2cabAtk5m w==;
X-CSE-ConnectionGUID: 5yPBqpkcTPyoLdilj9EnYQ==
X-CSE-MsgGUID: NKbTJIq/QC6lW0cE/e84HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097764"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:03 -0800
X-CSE-ConnectionGUID: WAXqj0AJSBq7lEdqnx5mHA==
X-CSE-MsgGUID: DoysbxCSSx+m8ASuAiLFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500850"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:01 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Oak Zeng <oak.zeng@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 04/11] drm/xe: Add page reclamation info to device info
Date: Tue, 18 Nov 2025 17:05:45 +0800
Message-ID: <20251118090552.246243-5-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0b2fa7c56d38..268c8e28601a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -308,6 +308,8 @@ struct xe_device {
 		u8 has_mbx_power_limits:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
 		u8 has_mem_copy_instr:1;
+		/** @info.has_page_reclaim_hw_assist: Device supports page reclamation feature */
+		u8 has_page_reclaim_hw_assist:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cd03b4b3ebdb..43c47426313e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -673,6 +673,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9892c063a9c5..151743d4cf72 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -47,6 +47,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
+	u8 has_page_reclaim_hw_assist:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.51.2

