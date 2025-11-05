Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE63CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 18:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33D910E2FA;
	Wed,  5 Nov 2025 18:07:12 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D58010E2F2;
 Wed,  5 Nov 2025 18:07:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 18:07:11 -0000
Message-ID: <176236603144.20673.10204967160418019031@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105151027.540712-1-michal.winiarski@intel.com>
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration (rev4)
URL   : https://patchwork.freedesktop.org/series/155785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 140c05512313acfbaa9a2943141361720f6e43b6
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Nov 5 16:10:26 2025 +0100

    vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device, and uses API exposed by Xe driver bound
    to PF device to control VF device state and transfer the migration data.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch d296e1cac1210831a20d7f0370346adfa037e422 drm-intel
522ececd6ff0 drm/xe/pf: Remove GuC version check for migration support
2e0b18c4cfed drm/xe: Move migration support to device-level struct
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 161 lines checked
c6aaf939f3b6 drm/xe/pf: Convert control state to bitmap
4888b69b0401 drm/xe/pf: Add save/restore control state stubs and connect to debugfs
13a6de21a337 drm/xe/pf: Add data structures and handlers for migration rings
-:1041: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1041: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:47:
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		/** @hdr.version: migration data protocol version */

total: 0 errors, 0 warnings, 1 checks, 984 lines checked
b6d7122bd25d drm/xe/pf: Add helpers for migration data packet allocation / free
-:164: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#164: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 277 lines checked
269b53816137 drm/xe/pf: Add support for encap/decap of bitstream to/from packet
9b0ad70cb8ee drm/xe/pf: Add minimalistic migration descriptor
5e07d851b86a drm/xe/pf: Expose VF migration data size over debugfs
f5f202c20dd7 drm/xe: Add sa/guc_buf_cache sync interface
8b7956f2a306 drm/xe: Allow the caller to pass guc_buf_cache size
74a0d68019df drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migration
5ae80ba8aa47 drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
24ac85fbcd04 drm/xe/pf: Don't save GuC VF migration data on pause
c84e1d5b737f drm/xe/pf: Switch VF migration GuC save/restore to struct migration data
58655282aa1c drm/xe/pf: Handle GuC migration data as part of PF control
f2482a5eb07c drm/xe/pf: Add helpers for VF GGTT migration data handling
0718303c452f drm/xe/pf: Handle GGTT migration data as part of PF control
bacfea0ffdaa drm/xe/pf: Handle MMIO migration data as part of PF control
13236be85e2f drm/xe/pf: Add helper to retrieve VF's LMEM object
3090918fe309 drm/xe/migrate: Add function to copy of VRAM data in chunks
72b2623f53dc drm/xe/pf: Handle VRAM migration data as part of PF control
6609ec8e1f52 drm/xe/pf: Add wait helper for VF FLR
94915d561ae8 drm/xe/pf: Enable SR-IOV VF migration
296fdd8c9d0c drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
8cfdd5c84902 drm/xe/pf: Export helpers for VFIO
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 285 lines checked
0c0cea4c04d4 drm/intel/bmg: Allow device ID usage with single-argument macros
140c05512313 vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
-:59: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#59: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 595 lines checked


