Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E253BC3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A699C10E3E4;
	Mon,  7 Apr 2025 09:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV8Lj7qX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AC510E3E4
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019566; x=1775555566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRtHr7ZT3Hgordev19TtlTMvpdlY1C2DsaAQ2QPDqnI=;
 b=ZV8Lj7qXXV9WGtnZ5bpfrFVr6bndVwoTJ3hcCbFrRx5nl13ypYKtRxmf
 mfs4Pt5pglwQF+EztVEuVJFxUj5hyyI69SIcM9nal6KBtjfRxdtQqrVAT
 TweLtkmbWUp+CJ+4MEWOukDhEhKLHLwcKjDgaKpTXBkEjU4vnl+9FenOq
 OPyC50XEDkG9uytvB5pn5teP0C5JjhjZkG0ykR0x+esF4fgYDE32hM/hz
 q2+f0tQU2IcRY9LqmxhZJtkv9pXwQQvPqCaBnxOaZYI6YHE0kHv1HHw7e
 OKtm8dbFDQRDamDYXoEfuGONNZtdTGi11ZLVD72xrJM8yNU9cdn4Z8yJW Q==;
X-CSE-ConnectionGUID: VaJnpnaHQlOmrFDKdH9VnA==
X-CSE-MsgGUID: IbxpWibETtmzfgMGVBt5Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029357"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029357"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:52:46 -0700
X-CSE-ConnectionGUID: 5B8mZGxzR6qPaB5yQiOeSg==
X-CSE-MsgGUID: RgvgZvi+TW6ahvFYzn+Kew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778530"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 01/32] drm/xe: Introduce xe_vma_op_prefetch_range struct
 for prefetch of ranges
Date: Mon,  7 Apr 2025 15:46:48 +0530
Message-Id: <20250407101719.3350996-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1662604c4486..ae0bcefdbfcd 100644
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
+		/** @prefetch: VMA prefetch range operation specific data */
+		struct xe_vma_op_prefetch_range prefetch_range;
 	};
 };
 
-- 
2.34.1

