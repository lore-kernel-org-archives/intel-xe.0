Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64531C2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71BC10E2AC;
	Fri, 14 Jun 2024 21:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJEYsO/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA3C10E2C5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401653; x=1749937653;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J6g8N25+0qrhan9Q8JX9OBjpTX079d2Fq7xt6DkIDOo=;
 b=bJEYsO/gzR9BJHIkSecgYxVVUKkYDDtNMv0+63PYUL65H82D/pY6SX0F
 vL8iU2GQT/jqqR/cq4AX+3SJVb+1nHzjKUlRZlAVy7KmBsLfaTV3fOnv6
 Ug/ulhq4TEynpEsmWmRZTA5b6wKFz3qWmzOvEMcLleV1x7pFrASfUGhBG
 TdKP9KS/cdLKPNwbE4QmiBbSKX0KOjs9dReTm/lC2WtcqdFcNe1vmEdfl
 uuisKBSh9NGvUiUiHueorhoBPBwxwFIjWk4Om5+PJyhL722OM1ndccPdq
 G/O14RuyyQueuf6hIHbuKHE8Buf0aOEYjsxdFAiVpAmBmu4PCHj8bJh1T g==;
X-CSE-ConnectionGUID: /02rG6wXSc+Ik+T2MgZVKA==
X-CSE-MsgGUID: NDr8uMqSRCCQfBv/m5qVKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886577"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: p38oVPqlR8+MZH63jnzpJA==
X-CSE-MsgGUID: yImk8TyxT16FwVk/N1PjTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572410"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 16/44] drm/svm: Introduce DRM_SVM kernel config
Date: Fri, 14 Jun 2024 17:57:49 -0400
Message-Id: <20240614215817.1097633-16-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

Introduce a DRM_SVM kernel config entry for
DRM svm feature. DRM svm provides helpers for
driver to implement share virtual address space
between CPU and GPU program.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Krishna Bommu <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/Kconfig  | 23 ++++++++++++++++++
 drivers/gpu/drm/Makefile |  2 +-
 include/drm/drm_svm.h    | 50 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 981f43d4ca8c..2d9079f65ab0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -312,6 +312,29 @@ config DRM_SCHED
 	tristate
 	depends on DRM
 
+config DRM_SVM
+	bool "Enable Shared Virtual Memory support in DRM"
+	depends on DRM
+	depends on ARCH_ENABLE_MEMORY_HOTPLUG
+	depends on ARCH_ENABLE_MEMORY_HOTREMOVE
+	depends on MEMORY_HOTPLUG
+	depends on MEMORY_HOTREMOVE
+	depends on ARCH_HAS_PTE_DEVMAP
+	depends on SPARSEMEM_VMEMMAP
+	depends on ZONE_DEVICE
+	depends on DEVICE_PRIVATE
+	depends on MMU
+	select HMM_MIRROR
+	select MMU_NOTIFIER
+	default y
+	help
+	  Choose this option if you want Shared Virtual Memory (SVM)
+	  and userptr support in DRM. With SVM, virtual address space
+	  is shared between CPU and GPU program. This means any virtual
+	  address such as malloc or mmap returned, variables on stack,
+	  or global ointers, can be used for GPU program transparently.
+	  If you are not sure, say yes.
+
 source "drivers/gpu/drm/i2c/Kconfig"
 
 source "drivers/gpu/drm/arm/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1e4237d80cff..b129a25d404c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -68,7 +68,6 @@ drm-y := \
 	drm_prime.o \
 	drm_print.o \
 	drm_property.o \
-	drm_svm.o \
 	drm_syncobj.o \
 	drm_sysfs.o \
 	drm_trace_points.o \
@@ -91,6 +90,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 obj-$(CONFIG_DRM)	+= drm.o
+obj-$(CONFIG_DRM_SVM)   += drm_svm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 
diff --git a/include/drm/drm_svm.h b/include/drm/drm_svm.h
index 4a97ab030569..17888091d7f4 100644
--- a/include/drm/drm_svm.h
+++ b/include/drm/drm_svm.h
@@ -166,10 +166,6 @@ static inline u64 drm_mem_region_page_to_dpa(struct drm_mem_region *mr, struct p
 	return dpa;
 }
 
-int drm_svm_register_mem_region(const struct drm_device *drm,
-				struct drm_mem_region *mr,
-				enum memory_type type);
-
 /**
  * struct drm_hmmptr- hmmptr pointer
  *
@@ -220,6 +216,11 @@ struct drm_hmmptr {
 	struct drm_gpuva * (*get_gpuva)(struct drm_hmmptr *hmmptr);
 };
 
+#if defined(CONFIG_DRM_SVM)
+int drm_svm_register_mem_region(const struct drm_device *drm,
+				struct drm_mem_region *mr,
+				enum memory_type type);
+
 int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
 			const struct mmu_interval_notifier_ops *ops);
 void drm_svm_hmmptr_release(struct drm_hmmptr *hmmptr);
@@ -233,4 +234,45 @@ int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
 				   struct drm_mem_region *mr,
 				   struct drm_hmmptr *hmmptr,
 				   unsigned long start, unsigned long end);
+#else
+static inline int drm_svm_register_mem_region(const struct drm_device *drm,
+					      struct drm_mem_region *mr,
+					      enum memory_type type)
+{
+	DRM_WARN_ONCE("DRM_SVM kernel config is not enabled, "
+		      "Add CONFIG_DRM_SVM in config file to fix this\n");
+	return -ENODEV;
+}
+
+static inline int drm_svm_hmmptr_init(struct drm_hmmptr *hmmptr,
+				      const struct mmu_interval_notifier_ops *ops)
+{
+	DRM_WARN_ONCE("DRM_SVM kernel config is not enabled, "
+		      "Add CONFIG_DRM_SVM in config file to fix this\n");
+	return -ENODEV;
+}
+static inline void drm_svm_hmmptr_release(struct drm_hmmptr *hmmptr) {}
+static inline void drm_svm_hmmptr_map_dma_pages(struct drm_hmmptr *hmmptr,
+						u64 page_idx, u64 npages) {}
+static inline void drm_svm_hmmptr_unmap_dma_pages(struct drm_hmmptr *hmmptr,
+						  u64 page_idx, u64 npages) {}
+static inline int drm_svm_hmmptr_populate(struct drm_hmmptr *hmmptr, void *owner, u64 start,
+					  u64 end, bool write, bool is_mmap_locked)
+{
+	DRM_WARN_ONCE("DRM_SVM kernel config is not enabled, "
+		      "Add CONFIG_DRM_SVM in config file to fix this\n");
+	return -ENODEV;
+}
+
+static inline int drm_svm_migrate_hmmptr_to_vram(struct drm_gpuvm *vm,
+						 struct drm_mem_region *mr,
+						 struct drm_hmmptr *hmmptr,
+						 unsigned long start, unsigned long end)
+{
+	DRM_WARN_ONCE("DRM_SVM kernel config is not enabled, "
+		      "Add CONFIG_DRM_SVM in config file to fix this\n");
+	return -ENODEV;
+}
+#endif
+
 #endif
-- 
2.26.3

