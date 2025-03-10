Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27976C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67310E418;
	Mon, 10 Mar 2025 12:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g84bBwSi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3994810E418
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609177; x=1773145177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3qQ517t73hzm/PSNCfYsPbkjMmMD2z0Pm1Ls/V5fvDA=;
 b=g84bBwSilZXIJDGVmUWJrZrPaPC98l4o0L38yJP8nN6XQhyLoMtnc1Cx
 F5lQpTWxx93q1o+Z0KarV/nIWPw8MLFF9HyjRlHVGctBAlkXTifT3rUOb
 oKfNnONN7iiBtZ8sDJs/0/P4RpscmEZOvuhzU+2k7hzCWk2jAkp8o0wbl
 sMRJpZCf8pVHi2Ub/c7UjLBWdBUWoAjGZxpo7KfqZ2zvjbBGOCc5+mJzT
 AHKD9YkxjL5dDEsgfF+2E1vC6yTbUc8LauaSBhOTottPqK428FMpMG8Nx
 lNOGMh5pbDJ7VAPEO+evFhShScGrOVowqCuQNRi6gcqG4XV43BYbV2Sj2 g==;
X-CSE-ConnectionGUID: fYe27LfvR/yFfrJ1hs3TeA==
X-CSE-MsgGUID: k2gM3KhiRsi2pAobyB9QqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056408"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:37 -0700
X-CSE-ConnectionGUID: 8lkHP06EQ4Wz5XjXEXNk0w==
X-CSE-MsgGUID: TFv7wIf0Re6Z4nFVOM01bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179052"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 01/12] drm/xe: Introduce xe_vma_op_prefetch_range struct for
 prefetch of ranges
Date: Mon, 10 Mar 2025 18:13:30 +0530
Message-Id: <20250310124341.1819568-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 84fa41b9fa20..93224a87ab03 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -372,6 +372,16 @@ struct xe_vma_op_unmap_range {
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
@@ -414,6 +424,8 @@ struct xe_vma_op {
 		struct xe_vma_op_map_range map_range;
 		/** @unmap_range: VMA unmap range operation specific data */
 		struct xe_vma_op_unmap_range unmap_range;
+		/** @prefetch: VMA prefetch range operation specific data */
+		struct xe_vma_op_prefetch_range prefetch_range;
 	};
 };
 
-- 
2.34.1

