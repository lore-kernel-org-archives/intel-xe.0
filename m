Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E7ACCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A44110EA90;
	Thu, 30 Oct 2025 22:34:39 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFEF10EA56;
 Thu, 30 Oct 2025 22:34:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 22:34:37 -0000
Message-ID: <176186367763.2568.13626979334612326898@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030203135.337696-1-michal.winiarski@intel.com>
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration (rev3)
URL   : https://patchwork.freedesktop.org/series/155785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 263066b2d705f8db304edfe0d434fed0b1852a5c
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Thu Oct 30 21:31:35 2025 +0100

    vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device, and uses API exposed by Xe driver bound
    to PF device to control VF device state and transfer the migration data.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch b50629a75c6ecb269adbba8de7b8ab4c9a650641 drm-intel
cb9c438a6475 drm/xe/pf: Remove GuC version check for migration support
6394cab39fde drm/xe: Move migration support to device-level struct
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
9cc9f844dace drm/xe/pf: Convert control state to bitmap
b5283c2f102c drm/xe/pf: Add save/restore control state stubs and connect to debugfs
1c0e2f06e0e5 drm/xe/pf: Add data structures and handlers for migration rings
-:977: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#977: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:31:
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		/** @hdr.version: migration data protocol version */

total: 0 errors, 0 warnings, 1 checks, 936 lines checked
db96f35f6983 drm/xe/pf: Add helpers for migration data allocation / free
-:139: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#139: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 252 lines checked
672fce216f2d drm/xe/pf: Add support for encap/decap of bitstream to/from packet
419fbef27424 drm/xe/pf: Add minimalistic migration descriptor
8a495a649871 drm/xe/pf: Expose VF migration data size over debugfs
fa3394c597ac drm/xe: Add sa/guc_buf_cache sync interface
8300ace99d0c drm/xe: Allow the caller to pass guc_buf_cache size
7df749f4d880 drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migration
f23bf962c576 drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
b77237581d9f drm/xe/pf: Don't save GuC VF migration data on pause
c73ef346efb3 drm/xe/pf: Switch VF migration GuC save/restore to struct migration data
891ecd8c6cd1 drm/xe/pf: Handle GuC migration data as part of PF control
64de699f4212 drm/xe/pf: Add helpers for VF GGTT migration data handling
3c9c099262eb drm/xe/pf: Handle GGTT migration data as part of PF control
8da2718d7967 drm/xe/pf: Handle MMIO migration data as part of PF control
a5e05c66b3bc drm/xe/pf: Add helper to retrieve VF's LMEM object
02e1de9a7a9e drm/xe/migrate: Add function to copy of VRAM data in chunks
075caf44673b drm/xe/pf: Handle VRAM migration data as part of PF control
2c9baa2586e0 drm/xe/pf: Add wait helper for VF FLR
97464d7cab1d drm/xe/pf: Enable SR-IOV VF migration
8f388e8f37cf drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
9d7c033b1774 drm/xe/pf: Export helpers for VFIO
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 286 lines checked
0beba913c1fc drm/intel/pciids: Add match with VFIO override
263066b2d705 vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 591 lines checked


