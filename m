Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C828C87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B5710E694;
	Wed, 30 Jul 2025 12:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdo+1eaP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEA410E203
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878850; x=1785414850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q8ebR3YJpQisPGjrAOCoZdqzbAS+e+1pa3+TMI1DpOQ=;
 b=cdo+1eaPGbTiaJStpWSwGLu8aUppb0DkPfCDzKvH8nWgmEYqaLJj7f+l
 gsGIbwRCoEFjwsNDRnKPrAfvA++wBcJ5x4txAABduki9ZRAf9hcN4zTN1
 oPGZwUbjNOJESZrFXBigrQpLzoaXEtPUHI5zBY0A1RxD4UkB4T/ChLZcj
 UhjYzswLxYsRmgqk29HCe8aaxdPH9K5JXg+fMYXTb2viGtaIvz2YIDerB
 77fvgKsPnFNJQJVnm7NpN91x/agV1gqlw2lFlt4CEkB+874YEckHu4SKk
 5PUpaQ2f3HhCLlOgP16smoa5ApINIwKViGrHi6ydMqc8IZIAa4NjtXdH8 A==;
X-CSE-ConnectionGUID: 9w3g0+ouSDak7ncZ751mtA==
X-CSE-MsgGUID: V8N5Tk5ITRi5ddtbGFSE3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450137"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450137"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:10 -0700
X-CSE-ConnectionGUID: VvfTcUVyRwyKo8fEirIiVQ==
X-CSE-MsgGUID: TZPaEb7kQ7uBZclhYAGylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649453"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 06/25] drm/xe/vm: Add attributes struct as member of vma
Date: Wed, 30 Jul 2025 18:30:31 +0530
Message-Id: <20250730130050.1001648-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

