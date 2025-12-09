Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E166D3B7F3
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DA710E62B;
	Tue,  9 Dec 2025 20:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evzq6QFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8599110E62B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310907; x=1796846907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0J9lYfbtarHFbFENkR1K0GxrzUPZMD7pviLp2bsojkI=;
 b=evzq6QFRuoLGmkGlA6M1YRDRyjewy8R5VZ6bTVrka4WJ4H+GletMoYsw
 r76QPLs9geg/+MOolgV0z/HorD6Q3eCs7QRfjwBleOXZtFJwac+DSQkd/
 C75bby/iddlxh3okEWpXGwVsCXfWkFHHhzKnuwTsKsUudTiJeppA8zLKB
 bXVw7rNybQzpjUxrx8103lwAjPE2lbOVkcWc3c6HmbXjxVgo1XXPrbR+w
 rT5OISIZlAEdc7BoX6YgdBBqysb/9BH8GYVQ4dTplZjF/6Jc2GA6iBcfn
 a/KdchoLNVqDhNF1idLRqKMRacO6jPfhiR+wqDBWBqFPj2Y8swx9tc/dq Q==;
X-CSE-ConnectionGUID: zN7BcuAvTgKivdWfmTshgA==
X-CSE-MsgGUID: CSjobm5JSpm/Sn5GMHqvow==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67328707"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67328707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:08:27 -0800
X-CSE-ConnectionGUID: N3T1eGQfR8e0+lcGZphm/A==
X-CSE-MsgGUID: 7uJuCH8DQsqI3OZHeWsFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195563887"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 12:08:25 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v4 03/10] drm/xe: Add page reclamation info to device info
Date: Wed, 10 Dec 2025 04:08:19 +0800
Message-ID: <20251209200815.2570770-15-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209200815.2570770-12-brian3.nguyen@intel.com>
References: <20251209200815.2570770-12-brian3.nguyen@intel.com>
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
index 9de73353223f..3836c5ed1c72 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -315,6 +315,8 @@ struct xe_device {
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
 		u8 has_mert:1;
+		/** @info.has_page_reclaim_hw_assist: Device supports page reclamation feature */
+		u8 has_page_reclaim_hw_assist:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 04fcbacda12a..0e9d23c20f20 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -681,6 +681,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mert = desc->has_mert;
+	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f19f35359696..96feae80b705 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -49,6 +49,7 @@ struct xe_device_desc {
 	u8 has_mbx_power_limits:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
+	u8 has_page_reclaim_hw_assist:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.52.0

