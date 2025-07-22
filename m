Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9A5C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E92C10E689;
	Tue, 22 Jul 2025 13:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8pKQrXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640910E689
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189727; x=1784725727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q8ebR3YJpQisPGjrAOCoZdqzbAS+e+1pa3+TMI1DpOQ=;
 b=l8pKQrXGT5wk3e4DMcy1xNQ3ln+jriJtqQ7Hmr2wcA2dj21vqmqS7FGA
 CFgH7H/qsvjb4LHioSiVDV+8MP8tL//Lrt87YpoxBt0LGhTwx485yqYkV
 S38WRIrgmbHO/AZrL1DXYkLSb/CNm0CvX0ReokSxb1xGfO+2qVjf3Vhqg
 lO7dxf3CYQbqUNius1NHjZmTAwHNP8A+s1AfdCkfFq0xAV7CATI1oHPjZ
 cws9yIP2oZtO0KNEPG0qHBcMNkbFrOI2ozs3rWnPymbG6SfvBSNvisClw
 fszf/MTCYr9qQzTp8ncgzSek3AH26MUIvCjIKo1cvLjWGTy7oXf0du/3x w==;
X-CSE-ConnectionGUID: xXfOSyekSNa9jI187eTfbA==
X-CSE-MsgGUID: Qv7Cjv0XTSmmsofqmjy6Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530348"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:08:47 -0700
X-CSE-ConnectionGUID: IfFDHeTPQ5eN0zosL5A7EQ==
X-CSE-MsgGUID: iwTk2v2oTAu965efBI62Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420516"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:08:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 03/23] drm/xe/vm: Add attributes struct as member of vma
Date: Tue, 22 Jul 2025 19:05:06 +0530
Message-Id: <20250722133526.3550547-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v3 (Matthew Brost)
- Add uapi references
- 80 characters line wrap

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bed6088e1bb3..5777b0e0c6a9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,33 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location */
+	struct {
+		/** @preferred_loc.migration_policy: Pages migration policy */
+		u32 migration_policy;
+
+		/**
+		 * @preferred_loc.devmem_fd: used for determining pagemap_fd
+		 * requested by user DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and
+		 * DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean system memory or
+		 * closest device memory respectively.
+		 */
+		u32 devmem_fd;
+	} preferred_loc;
+
+	/**
+	 * @atomic_access: The atomic access type for the vma
+	 * See %DRM_XE_VMA_ATOMIC_UNDEFINED, %DRM_XE_VMA_ATOMIC_DEVICE,
+	 * %DRM_XE_VMA_ATOMIC_GLOBAL, and %DRM_XE_VMA_ATOMIC_CPU for possible
+	 * values. These are defined in uapi/drm/xe_drm.h.
+	 */
+	u32 atomic_access;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -135,6 +162,12 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	/**
+	 * @attr: The attributes of vma which determines the migration policy
+	 * and encoding of the PTEs for this vma.
+	 */
+	struct xe_vma_mem_attr attr;
 };
 
 /**
-- 
2.34.1

