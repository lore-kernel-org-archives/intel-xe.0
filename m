Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5425FC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1775C10E8EB;
	Fri, 13 Jun 2025 12:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hroH7Exp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61310E210
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817804; x=1781353804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWF0IXQ4XIWSHz8h2tbVB6fah9DXoYwBZjvqhmWRoxc=;
 b=hroH7ExpHMsTVXe9ju7cXZdNTnl9ZRXXeXkgOaGyNQCY3+GYEogYLI6Y
 E/II3Pt/t5GoEiJ/rnh+A/R9vySIINUd3c/QH/ff56hYE1GKm7mydeulG
 HmxrwAviyxZCqN8u6VFahVvA+pCFcZ7a+9z3bfKn+MExcwCeh/xJfHsYx
 /3ZLm7A9Dls/wKuR3klcySauKkKYLIQqDB7Q1Qu/C96niOBnW7uGksKUn
 SU7BP91GI2ie5rgj4nY6xXwtAlyWeHDVkIPzVnkvUiHPSNvt0vWH1Xgpg
 gjpNFfujjsUZ5TB76rNcDAveJKmxa+bfJMw64FOH11PL3JurfgAKYWLxA g==;
X-CSE-ConnectionGUID: pEAgQYAoTZO3hkugaMGWFQ==
X-CSE-MsgGUID: 7kC8pKgKSlylIGoPd/63fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610146"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610146"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:04 -0700
X-CSE-ConnectionGUID: gpzrs5qUQriO6fzsC7fPRg==
X-CSE-MsgGUID: 4PlvQID0QHyOvakRhIFVLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290269"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 03/20] drm/xe/vm: Add attributes struct as member of vma
Date: Fri, 13 Jun 2025 18:25:41 +0530
Message-Id: <20250613125558.2607665-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

v2 (Matthew Brost)
- Add docs

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bed6088e1bb3..c7663058a7e3 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,27 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location*/
+	struct {
+		/** @preferred_loc.migration_policy: Policy for migration of pages */
+		u32 migration_policy;
+
+		/**
+		 * @preferred_loc.devmem_fd: used for determining pagemap_fd requested by user
+		 * DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean
+		 * system memory or closest device memory respectively.
+		 */
+		u32 devmem_fd;
+	} preferred_loc;
+
+	/** @atomic_access: The atomic access type for the vma */
+	u32 atomic_access;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -135,6 +156,13 @@ struct xe_vma {
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

