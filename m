Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D69C369D3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6C310E3D9;
	Mon, 28 Apr 2025 10:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtMfc8Gy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A1310E3D9
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745834847; x=1777370847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ak5GzWca/vjcRiAm2P4o56QcMmQtDqVsksOPF1yM+ak=;
 b=QtMfc8GyNCn2szKF2hqMxlbzhbxg0c8xqWXM7CSSsrtSHWDlNMCd9/Gw
 6fc2+ip75/tVe+bTcXtvDf+7rD25zyXeLW+ZyebM2lrpmUjnxib4vOBkm
 i9+SvgTkZr/vjV28jDcsc8NUtZrlyofTAPhONCeA1tgNVAejZM9xcod0K
 w+K3y+LrqPm9zHXWywPsGfiyHl5CyaEKdm5BVxK9bZj8hgO8uE71tmaxq
 /tEBmhMMD7BoenhNjA/QZIYuqxOhhmIrw2+ox8V9Mv2tLo7eXgap9TAGM
 2sY0mv8u0+ePEwVpOKLxa6/gnnnn9rtOwzdNh6/PlSsQxFW+fW4rAm/yj Q==;
X-CSE-ConnectionGUID: k5GeNBdGT7SNQzgoALRvlA==
X-CSE-MsgGUID: joGtFe7uR52EO4g1hQhCmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58783941"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58783941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:07:26 -0700
X-CSE-ConnectionGUID: nLvAZjknQUWgNWBxDadQBg==
X-CSE-MsgGUID: LUS2ydcsTV+clpP4TudKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138291477"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 03:07:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 06/18] drm/xe: Introduce xe_vma_op_prefetch_range struct
 for prefetch of ranges
Date: Mon, 28 Apr 2025 16:02:12 +0530
Message-Id: <20250428103224.69534-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
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

Add xe_vma_op_prefetch_range struct for svm ranges prefetching, including
an xarray of SVM range pointers, range count, and target memory region.

-v2: Fix doc

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1662604c4486..0afd0296a57e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -374,6 +374,16 @@ struct xe_vma_op_unmap_range {
 	struct xe_svm_range *range;
 };
 
+/** struct xe_vma_op_prefetch_range - VMA prefetch range operation */
+struct xe_vma_op_prefetch_range {
+	/** @range: xarray for SVM ranges data */
+	struct xarray range;
+	/** @ranges_count: number of svm ranges to map */
+	u32 ranges_count;
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -416,6 +426,8 @@ struct xe_vma_op {
 		struct xe_vma_op_map_range map_range;
 		/** @unmap_range: VMA unmap range operation specific data */
 		struct xe_vma_op_unmap_range unmap_range;
+		/** @prefetch_range: VMA prefetch range operation specific data */
+		struct xe_vma_op_prefetch_range prefetch_range;
 	};
 };
 
-- 
2.34.1

