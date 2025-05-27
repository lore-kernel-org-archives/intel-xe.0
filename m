Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390D5C61CE5
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C921110E54F;
	Tue, 27 May 2025 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar0Qe4he";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AE110E169
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362518; x=1779898518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dth5dGcrrcioNK1iNWbtGd9Q5e25bq0TGZgD+mEsSyE=;
 b=ar0Qe4heiro9RrvZVTvfHpEkWCiUWoUC1YBKhRhlNF5SNuZJLR1KJBVT
 VaKScBPW04HvxgdE9JJKqll2vTz+LNhhgRKUYVRWQoL4O0259VAuR5DuT
 cAiwcuRQ75f7L0/YErlUw/GeNzwEXgdrricBaekqus5l0kxY7zPWtzyVR
 3ZtpDSe2Vfu/yPsX6fKkrUn/bj2T6KwIcJ/QbTY+JV2cac98B1FWUDx3J
 j8CgaRWzkggvIpEJYP7LMi0QFhzdLsP8EZNSqGewgKIWWuOzITPc99ypd
 DsQFRWPFJpIi4fjHnZNHinSqQhkpTbwospyb0p8WFZ15BcaJBP6yd1W4/ Q==;
X-CSE-ConnectionGUID: nLsSGpjRRzea8aYHZBNd6Q==
X-CSE-MsgGUID: Ig9BwMbqSiyDn+CJ/k95Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471860"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471860"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:26 -0700
X-CSE-ConnectionGUID: 111SMaMKQf6TaYEGVTQ/Jw==
X-CSE-MsgGUID: l2DPvT07TtKWmbTdjsN5eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147645949"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:24 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 03/19] drm/xe/vm: Add attributes struct as member of vma
Date: Tue, 27 May 2025 22:09:47 +0530
Message-Id: <20250527164003.1068118-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

The attribute of xe_vma will determine the migration policy and the
encoding of the page table entries (PTEs) for that vma.
This attribute helps manage how memory pages are moved and how their
addresses are translated. It will be used by madvise to set the
behavior of the vma.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bfc145baad49..5d4bbe547d0d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,19 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location*/
+	struct {
+		u32 migration_policy; /* represents migration policies */
+		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
+	} preferred_loc;
+	/** @atomic_access: The atomic access type for the vma */
+	u32 atomic_access;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -128,6 +141,13 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	/**
+	 * @attr: The attributes of vma which determines the migration policy
+	 * and encoding of the PTEs for this vma.
+	 */
+	struct xe_vma_mem_attr attr;
+
 };
 
 /**
-- 
2.34.1

