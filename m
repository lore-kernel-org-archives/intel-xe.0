Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C0DCCD184
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 19:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B5010E321;
	Sat, 11 Oct 2025 19:48:47 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5D10E321;
 Sat, 11 Oct 2025 19:48:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Oct 2025 19:48:46 -0000
Message-ID: <176021212644.2413.17288675862267885130@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: vfio/xe: Add driver variant for Xe VF migration
URL   : https://patchwork.freedesktop.org/series/155785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ac75a40392b4b3630c22ee31258a4af5e0fb758e
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Sat Oct 11 21:38:47 2025 +0200

    vfio/xe: Add vendor-specific vfio_pci driver for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device, and uses API exposed by Xe driver bound
    to PF device to control VF device state and transfer the migration data.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 8fcdbd2480bd7d0f6ce819561685462e94c4ed48 drm-intel
3ef7944e6c4c drm/xe/pf: Remove GuC version check for migration support
5e06eee2937f drm/xe: Move migration support to device-level struct
-:110: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#110: 
new file mode 100644

-:184: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#184: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration.h:21:
+}
+static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)

total: 0 errors, 1 warnings, 1 checks, 150 lines checked
2fe92847b760 drm/xe/pf: Add save/restore control state stubs and connect to debugfs
c1a4b2262ba9 drm/xe/pf: Extract migration mutex out of its struct
-:62: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#62: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h:61:
+	struct mutex snapshot_lock;

total: 0 errors, 0 warnings, 1 checks, 32 lines checked
76181eba94eb drm/xe/pf: Add data structures and handlers for migration rings
-:167: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#167: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:483:
+		ret = wait_event_interruptible_timeout(*wq,
+					 !ptr_ring_empty(&migration->ring) ||

-:508: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#508: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration.h:31:
 }
+static inline struct xe_sriov_pf_migration_data *

-:513: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#513: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration.h:36:
+}
+static inline int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,

-:518: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#518: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration.h:41:
+}
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)

-:551: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#551: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:22:
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		u8 version;

total: 0 errors, 0 warnings, 5 checks, 515 lines checked
9ed9b0cc1f1c drm/xe/pf: Add helpers for migration data allocation / free
-:145: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#145: 
new file mode 100644

-:232: WARNING:LINE_SPACING: Missing a blank line after declarations
#232: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c:83:
+		void *buff = kvzalloc(data->size, GFP_KERNEL);
+		if (!buff)

total: 0 errors, 2 warnings, 0 checks, 273 lines checked
27c56caee965 drm/xe/pf: Add support for encap/decap of bitstream to/from packet
-:389: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!data"
#389: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c:235:
+	if (*data == NULL)

-:503: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!data"
#503: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c:349:
+		if (*data == NULL)

total: 0 errors, 0 warnings, 2 checks, 611 lines checked
d145d8079012 drm/xe/pf: Add minimalistic migration descriptor
2faeb8adf299 drm/xe/pf: Expose VF migration data size over debugfs
ca43ca066fe2 drm/xe: Add sa/guc_buf_cache sync interface
8cb0dc61bcc7 drm/xe: Allow the caller to pass guc_buf_cache size
257914ed972f drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migration
a18eff542d6f drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
f6de517b1ced drm/xe/pf: Don't save GuC VF migration data on pause
d9284db7a3d8 drm/xe/pf: Switch VF migration GuC save/restore to struct migration data
612503635905 drm/xe/pf: Handle GuC migration data as part of PF control
26b3683d36b1 drm/xe/pf: Add helpers for VF GGTT migration data handling
6e89b40d5882 drm/xe/pf: Handle GGTT migration data as part of PF control
0201e49e0771 drm/xe/pf: Add helpers for VF MMIO migration data handling
-:142: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#142: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf.h:47:
 }
+size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)

-:146: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#146: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf.h:51:
+}
+int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)

-:150: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#150: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf.h:55:
+}
+int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,

total: 0 errors, 0 warnings, 3 checks, 131 lines checked
56fdb73878ca drm/xe/pf: Handle MMIO migration data as part of PF control
e9ae8cf39654 drm/xe/pf: Add helper to retrieve VF's LMEM object
c7241d4aa138 drm/xe/migrate: Add function for raw copy of VRAM and CCS
14bb82ec2442 drm/xe/pf: Handle VRAM migration data as part of PF control
38ec710bc17e drm/xe/pf: Add wait helper for VF FLR
387f29c65fe2 drm/xe/pf: Export helpers for VFIO
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 288 lines checked
ac75a40392b4 vfio/xe: Add vendor-specific vfio_pci driver for Intel graphics
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 509 lines checked


