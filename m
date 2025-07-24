Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C44C87FCE
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716B310E86A;
	Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuhRiWcQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135910E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319083; x=1784855083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LoO3JhsKkVq6uallgBYPcIAWWo1hiLWtJ+fh3MxhM28=;
 b=IuhRiWcQZ60Pcr8NDiR6OQvF4/+3iL40ZoI16+32cT4Nn6KXNlzs8k9M
 GHu1wGPdSFmosmga0J3DW0gkZaOjcd2F7vraBVVDsE5fUHXlJoF/3nJIM
 FlJqNlQpYbjTxhrlqtZRSuuAWs9Y0Rt+aCLdHo9sOCZADonh9MW1c81up
 SqSrHL1IbXNXpntf41aqlOlfT8Y2EWKjqU2IMGUa+3hCwLMCkZExgyNPr
 NWgmirTJMygBxbzsGfefRQgE84GAo2iz3IhfMFkzLmdq2mB6resMa03+t
 43PaV6bBBxjFw/sqc63u0MfkR4Ickg8MbTwRn45HsfKpRtSNzvqB0Yaxu A==;
X-CSE-ConnectionGUID: kukZJcdORUuxKzXeYzxbAw==
X-CSE-MsgGUID: gaGYd7psREqBr80qmiRmSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766482"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55766482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
X-CSE-ConnectionGUID: RYVJAPlfQsqHJZRKzkuxpQ==
X-CSE-MsgGUID: rxu8Wj6LQ6WGMs3pCPcPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160106381"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 2/7] drm/xe/psmi: Add debugfs interface for PSMI
Date: Wed, 23 Jul 2025 18:04:23 -0700
Message-ID: <20250723-psmi-v2-2-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
Content-Transfer-Encoding: quoted-printable
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

Requirement for PSMI capture is to have a physically contiguous buffer.=0D
All the needed configuration is done by the userspace tool directly to=0D
the GPU via mmio access.=0D
=0D
This interface only support allocating from VRAM regions. For integrated=0D
devices, the PSMI buffer is in SYSTEM memory and should be allocated by=0D
userspace using hugetlbfs.=0D
=0D
Here we add the ability to allocate a region of physically contiguous=0D
memory by writing to debugfs file (listed below). For multi-tile devices,=0D
the capture tool requires ability to allocate a capture buffer per tile=0D
(VRAM region) and so user can specify a region_mask. The tool then=0D
can mmap the buffers via direct mmap of the PCIBAR via sysfs.=0D
=0D
To support the capture tool, 3 new debugfs entries are added:=0D
=0D
   psmi_capture_addr - physical address per VRAM region's capture buffer=0D
   psmi_capture_region_mask - select which region(s) to allocate a buffer=0D
   psmi_capture_size - size of current capture buffer=0D
=0D
Writing psmi_capture_size will allocate new buffer of requested size per=0D
region after freeing any current buffers.=0D
=0D
Cc: Matt Roper <matthew.d.roper@intel.com>=0D
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>=0D
Original-author: Brian Welty <brian.welty@intel.com>=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
v2:=0D
 - Fix kernel-doc=0D
 - Do not walk all region_mask on cleanup: it should never be needed=0D
 - Replace sysmem checks by asserts as they should never be set=0D
 - s/debugfs_create/debugfs_register/ and do not pass the root dir:=0D
   this makes it similar to other parts registering debugfs=0D
 - Do not export a cleanup function, rather use a init that registers=0D
   a devm action if needed=0D
 - Drop modparam in favor of configfs whose attribute will be=0D
   implemented when everything is ready=0D
---=0D
 drivers/gpu/drm/xe/Makefile          |   1 +=0D
 drivers/gpu/drm/xe/xe_debugfs.c      |   3 +=0D
 drivers/gpu/drm/xe/xe_device.c       |   5 +=0D
 drivers/gpu/drm/xe/xe_device_types.h |   8 +=0D
 drivers/gpu/drm/xe/xe_psmi.c         | 313 +++++++++++++++++++++++++++++++=
++++=0D
 drivers/gpu/drm/xe/xe_psmi.h         |  14 ++=0D
 6 files changed, 344 insertions(+)=0D
=0D
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile=0D
index a6c42485149ad..85e834fe2990c 100644=0D
--- a/drivers/gpu/drm/xe/Makefile=0D
+++ b/drivers/gpu/drm/xe/Makefile=0D
@@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \=0D
 	xe_pcode.o \=0D
 	xe_pm.o \=0D
 	xe_preempt_fence.o \=0D
+	xe_psmi.o \=0D
 	xe_pt.o \=0D
 	xe_pt_walk.o \=0D
 	xe_pxp.o \=0D
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c=0D
index 0b4a532f7c45c..bc717519502dd 100644=0D
--- a/drivers/gpu/drm/xe/xe_debugfs.c=0D
+++ b/drivers/gpu/drm/xe/xe_debugfs.c=0D
@@ -20,6 +20,7 @@=0D
 #include "xe_guc_ads.h"=0D
 #include "xe_mmio.h"=0D
 #include "xe_pm.h"=0D
+#include "xe_psmi.h"=0D
 #include "xe_pxp_debugfs.h"=0D
 #include "xe_sriov.h"=0D
 #include "xe_sriov_pf.h"=0D
@@ -400,6 +401,8 @@ void xe_debugfs_register(struct xe_device *xe)=0D
 =0D
 	xe_pxp_debugfs_register(xe->pxp);=0D
 =0D
+	xe_psmi_debugfs_register(xe);=0D
+=0D
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);=0D
 =0D
 	if (IS_SRIOV_PF(xe))=0D
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c=0D
index d04a0ae018e66..893ab5530e578 100644=0D
--- a/drivers/gpu/drm/xe/xe_device.c=0D
+++ b/drivers/gpu/drm/xe/xe_device.c=0D
@@ -54,6 +54,7 @@=0D
 #include "xe_pcode.h"=0D
 #include "xe_pm.h"=0D
 #include "xe_pmu.h"=0D
+#include "xe_psmi.h"=0D
 #include "xe_pxp.h"=0D
 #include "xe_query.h"=0D
 #include "xe_shrinker.h"=0D
@@ -907,6 +908,10 @@ int xe_device_probe(struct xe_device *xe)=0D
 	if (err)=0D
 		return err;=0D
 =0D
+	err =3D xe_psmi_init(xe);=0D
+	if (err)=0D
+		return err;=0D
+=0D
 	err =3D drm_dev_register(&xe->drm, 0);=0D
 	if (err)=0D
 		return err;=0D
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h=0D
index 38c8329b4d2c5..86506cdfc8013 100644=0D
--- a/drivers/gpu/drm/xe/xe_device_types.h=0D
+++ b/drivers/gpu/drm/xe/xe_device_types.h=0D
@@ -576,6 +576,14 @@ struct xe_device {=0D
 	atomic64_t global_total_pages;=0D
 #endif=0D
 =0D
+	/** @psmi: GPU debugging via additional validation HW */=0D
+	struct {=0D
+		/** @psmi.capture_obj: PSMI buffer for VRAM */=0D
+		struct xe_bo *capture_obj[XE_MAX_TILES_PER_DEVICE + 1];=0D
+		/** @psmi.region_mask: Mask of valid memory regions */=0D
+		u8 region_mask;=0D
+	} psmi;=0D
+=0D
 	/* private: */=0D
 =0D
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)=0D
diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c=0D
new file mode 100644=0D
index 0000000000000..e6a67e85e1bb2=0D
--- /dev/null=0D
+++ b/drivers/gpu/drm/xe/xe_psmi.c=0D
@@ -0,0 +1,313 @@=0D
+// SPDX-License-Identifier: MIT=0D
+/*=0D
+ * Copyright =C2=A9 2025 Intel Corporation=0D
+ */=0D
+=0D
+#include <linux/debugfs.h>=0D
+=0D
+#include "xe_bo.h"=0D
+#include "xe_device.h"=0D
+#include "xe_configfs.h"=0D
+#include "xe_psmi.h"=0D
+=0D
+/*=0D
+ * PSMI capture support=0D
+ *=0D
+ * Requirement for PSMI capture is to have a physically contiguous buffer.=
  The=0D
+ * PSMI tool owns doing all necessary configuration (MMIO register writes =
are=0D
+ * done from user-space). However, KMD needs to provide the PSMI tool with=
 the=0D
+ * required physical address of the base of PSMI buffer in case of VRAM.=0D
+ *=0D
+ * VRAM backed PSMI buffer:=0D
+ * Buffer is allocated as GEM object and with XE_BO_CREATE_PINNED_BIT flag=
 which=0D
+ * creates a contiguous allocation. The physical address is returned from=
=0D
+ * psmi_debugfs_capture_addr_show(). PSMI tool can mmap the buffer via the=
=0D
+ * PCIBAR through sysfs.=0D
+ *=0D
+ * SYSTEM memory backed PSMI buffer:=0D
+ * Interface here does not support allocating from SYSTEM memory region.  =
The=0D
+ * PSMI tool needs to allocate memory themselves using hugetlbfs. In order=
 to=0D
+ * get the physical address, user-space can query /proc/[pid]/pagemap. As =
an=0D
+ * alternative, CMA debugfs could also be used to allocate reserved CMA me=
mory.=0D
+ */=0D
+=0D
+static bool psmi_enabled(struct xe_device *xe)=0D
+{=0D
+	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));=0D
+}=0D
+=0D
+static void psmi_free_object(struct xe_bo *bo)=0D
+{=0D
+	xe_bo_lock(bo, NULL);=0D
+	xe_bo_unpin(bo);=0D
+	xe_bo_unlock(bo);=0D
+	xe_bo_put(bo);=0D
+}=0D
+=0D
+/*=0D
+ * Free PSMI capture buffer objects.=0D
+ */=0D
+static void psmi_cleanup(struct xe_device *xe)=0D
+{=0D
+	unsigned long id, region_mask =3D xe->psmi.region_mask;=0D
+	struct xe_bo *bo;=0D
+=0D
+	for_each_set_bit(id, &region_mask,=0D
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {=0D
+		/* smem should never be set */=0D
+		xe_assert(xe, id);=0D
+=0D
+		bo =3D xe->psmi.capture_obj[id];=0D
+		if (bo) {=0D
+			psmi_free_object(bo);=0D
+			xe->psmi.capture_obj[id] =3D NULL;=0D
+		}=0D
+	}=0D
+}=0D
+=0D
+static struct xe_bo *psmi_alloc_object(struct xe_device *xe,=0D
+				       unsigned int id, size_t bo_size)=0D
+{=0D
+	struct xe_bo *bo =3D NULL;=0D
+	struct xe_tile *tile;=0D
+	int err;=0D
+=0D
+	if (!id || !bo_size)=0D
+		return NULL;=0D
+=0D
+	tile =3D &xe->tiles[id - 1];=0D
+=0D
+	/* VRAM: Allocate GEM object for the capture buffer */=0D
+	bo =3D xe_bo_create_locked(xe, tile, NULL, bo_size,=0D
+				 ttm_bo_type_kernel,=0D
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |=0D
+				 XE_BO_FLAG_PINNED |=0D
+				 XE_BO_FLAG_NEEDS_CPU_ACCESS);=0D
+=0D
+	if (!IS_ERR(bo)) {=0D
+		/* Buffer written by HW, ensure stays resident */=0D
+		err =3D xe_bo_pin(bo);=0D
+		if (err)=0D
+			bo =3D ERR_PTR(err);=0D
+		xe_bo_unlock(bo);=0D
+	}=0D
+=0D
+	return bo;=0D
+}=0D
+=0D
+/*=0D
+ * Allocate PSMI capture buffer objects (via debugfs set function), based =
on=0D
+ * which regions the user has selected in region_mask.  @size: size in byt=
es=0D
+ * (should be power of 2)=0D
+ *=0D
+ * Always release/free the current buffer objects before attempting to all=
ocate=0D
+ * new ones.  Size =3D=3D 0 will free all current buffers.=0D
+ *=0D
+ * Note, we don't write any registers as the capture tool is already confi=
guring=0D
+ * all PSMI registers itself via mmio space.=0D
+ */=0D
+static int psmi_resize_object(struct xe_device *xe, size_t size)=0D
+{=0D
+	unsigned long id, region_mask =3D xe->psmi.region_mask;=0D
+	struct xe_bo *bo =3D NULL;=0D
+	int err =3D 0;=0D
+=0D
+	/*=0D
+	 * Buddy allocator anyway will roundup to next power of 2,=0D
+	 * so rather than waste unused pages, require user to ask for=0D
+	 * power of 2 sized PSMI buffers.=0D
+	 */=0D
+	if (size && !is_power_of_2(size))=0D
+		return -EINVAL;=0D
+=0D
+	/* if resizing, free currently allocated buffers first */=0D
+	psmi_cleanup(xe);=0D
+=0D
+	/* can set size to 0, in which case, now done */=0D
+	if (!size)=0D
+		return 0;=0D
+=0D
+	for_each_set_bit(id, &region_mask,=0D
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {=0D
+		/* smem should never be set */=0D
+		xe_assert(xe, id);=0D
+=0D
+		bo =3D psmi_alloc_object(xe, id, size);=0D
+		if (IS_ERR(bo)) {=0D
+			err =3D PTR_ERR(bo);=0D
+			break;=0D
+		}=0D
+		xe->psmi.capture_obj[id] =3D bo;=0D
+=0D
+		drm_info(&xe->drm,=0D
+			 "PSMI capture size requested: %zu bytes, allocated: %lu:%zu\n",=0D
+			 size, id, bo ? xe_bo_size(bo) : 0);=0D
+	}=0D
+=0D
+	/* on error, reverse what was allocated */=0D
+	if (err)=0D
+		psmi_cleanup(xe);=0D
+=0D
+	return err;=0D
+}=0D
+=0D
+/*=0D
+ * Returns an address for the capture tool to use to find start of capture=
=0D
+ * buffer. Capture tool requires the capability to have a buffer allocated=
 per=0D
+ * each tile (VRAM region), thus we return an address for each region.=0D
+ */=0D
+static int psmi_debugfs_capture_addr_show(struct seq_file *m, void *data)=
=0D
+{=0D
+	struct xe_device *xe =3D m->private;=0D
+	unsigned long id, region_mask;=0D
+	struct xe_bo *bo;=0D
+	u64 val;=0D
+=0D
+	region_mask =3D xe->psmi.region_mask;=0D
+	for_each_set_bit(id, &region_mask,=0D
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {=0D
+		/* smem should never be set */=0D
+		xe_assert(xe, id);=0D
+=0D
+		/* VRAM region */=0D
+		bo =3D xe->psmi.capture_obj[id];=0D
+		if (!bo)=0D
+			continue;=0D
+=0D
+		/* pinned, so don't need bo_lock */=0D
+		val =3D __xe_bo_addr(bo, 0, PAGE_SIZE);=0D
+		seq_printf(m, "%ld: 0x%llx\n", id, val);=0D
+	}=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+/*=0D
+ * Return capture buffer size, using the size from first allocated object =
that=0D
+ * is found. This works because all objects must be of the same size.=0D
+ */=0D
+static int psmi_debugfs_capture_size_get(void *data, u64 *val)=0D
+{=0D
+	unsigned long id, region_mask;=0D
+	struct xe_device *xe =3D data;=0D
+	struct xe_bo *bo;=0D
+=0D
+	region_mask =3D xe->psmi.region_mask;=0D
+	for_each_set_bit(id, &region_mask,=0D
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {=0D
+		/* smem should never be set */=0D
+		xe_assert(xe, id);=0D
+=0D
+		bo =3D xe->psmi.capture_obj[id];=0D
+		if (bo) {=0D
+			*val =3D xe_bo_size(bo);=0D
+			return 0;=0D
+		}=0D
+	}=0D
+=0D
+	/* no capture objects are allocated */=0D
+	*val =3D 0;=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+/*=0D
+ * Set size of PSMI capture buffer. This triggers the allocation of captur=
e=0D
+ * buffer in each memory region as specified with prior write to=0D
+ * psmi_capture_region_mask.=0D
+ */=0D
+static int psmi_debugfs_capture_size_set(void *data, u64 val)=0D
+{=0D
+	struct xe_device *xe =3D data;=0D
+=0D
+	/* user must have specified at least one region */=0D
+	if (!xe->psmi.region_mask)=0D
+		return -EINVAL;=0D
+=0D
+	return psmi_resize_object(xe, val);=0D
+}=0D
+=0D
+static int psmi_debugfs_capture_region_mask_get(void *data, u64 *val)=0D
+{=0D
+	struct xe_device *xe =3D data;=0D
+=0D
+	*val =3D xe->psmi.region_mask;=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+/*=0D
+ * Select VRAM regions for multi-tile devices, only allowed when buffer is=
 not=0D
+ * currently allocated.=0D
+ */=0D
+static int psmi_debugfs_capture_region_mask_set(void *data, u64 region_mas=
k)=0D
+{=0D
+	struct xe_device *xe =3D data;=0D
+	u64 size =3D 0;=0D
+=0D
+	/* SMEM is not supported (see comments at top of file) */=0D
+	if (region_mask & 0x1)=0D
+		return -EOPNOTSUPP;=0D
+=0D
+	/* input bitmask should contain only valid TTM regions */=0D
+	if (!region_mask || region_mask & ~xe->info.mem_region_mask)=0D
+		return -EINVAL;=0D
+=0D
+	/* only allow setting mask if buffer is not yet allocated */=0D
+	psmi_debugfs_capture_size_get(xe, &size);=0D
+	if (size)=0D
+		return -EBUSY;=0D
+=0D
+	xe->psmi.region_mask =3D region_mask;=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+DEFINE_SHOW_ATTRIBUTE(psmi_debugfs_capture_addr);=0D
+=0D
+DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_region_mask_fops,=0D
+			 psmi_debugfs_capture_region_mask_get,=0D
+			 psmi_debugfs_capture_region_mask_set,=0D
+			 "0x%llx\n");=0D
+=0D
+DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_size_fops,=0D
+			 psmi_debugfs_capture_size_get,=0D
+			 psmi_debugfs_capture_size_set,=0D
+			 "%lld\n");=0D
+=0D
+void xe_psmi_debugfs_register(struct xe_device *xe)=0D
+{=0D
+	struct drm_minor *minor;=0D
+=0D
+	if (!psmi_enabled(xe))=0D
+		return;=0D
+=0D
+	minor =3D xe->drm.primary;=0D
+	if (!minor->debugfs_root)=0D
+		return;=0D
+=0D
+	debugfs_create_file("psmi_capture_addr",=0D
+			    0400, minor->debugfs_root, xe,=0D
+			    &psmi_debugfs_capture_addr_fops);=0D
+=0D
+	debugfs_create_file("psmi_capture_region_mask",=0D
+			    0600, minor->debugfs_root, xe,=0D
+			    &psmi_debugfs_capture_region_mask_fops);=0D
+=0D
+	debugfs_create_file("psmi_capture_size",=0D
+			    0600, minor->debugfs_root, xe,=0D
+			    &psmi_debugfs_capture_size_fops);=0D
+}=0D
+=0D
+static void psmi_fini(void *arg)=0D
+{=0D
+	psmi_cleanup(arg);=0D
+}=0D
+=0D
+int xe_psmi_init(struct xe_device *xe)=0D
+{=0D
+	if (!psmi_enabled(xe))=0D
+		return 0;=0D
+=0D
+	return devm_add_action(xe->drm.dev, psmi_fini, xe);=0D
+}=0D
diff --git a/drivers/gpu/drm/xe/xe_psmi.h b/drivers/gpu/drm/xe/xe_psmi.h=0D
new file mode 100644=0D
index 0000000000000..b1dfba80d893d=0D
--- /dev/null=0D
+++ b/drivers/gpu/drm/xe/xe_psmi.h=0D
@@ -0,0 +1,14 @@=0D
+/* SPDX-License-Identifier: MIT */=0D
+/*=0D
+ * Copyright =C2=A9 2025 Intel Corporation=0D
+ */=0D
+=0D
+#ifndef _XE_PSMI_H_=0D
+#define _XE_PSMI_H_=0D
+=0D
+struct xe_device;=0D
+=0D
+int xe_psmi_init(struct xe_device *xe);=0D
+void xe_psmi_debugfs_register(struct xe_device *xe);=0D
+=0D
+#endif=0D
=0D
-- =0D
2.50.1=0D
=0D
