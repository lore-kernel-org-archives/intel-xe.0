Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F5BCCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79A310E65F;
	Tue, 21 Oct 2025 22:50:46 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4968910E65F;
 Tue, 21 Oct 2025 22:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 22:50:45 -0000
Message-ID: <176108704529.37900.4183898428494170744@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021224133.577765-1-michal.winiarski@intel.com>
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration (rev2)
URL   : https://patchwork.freedesktop.org/series/155785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b82a10cc3f43ce803b06ce658eeae3003abe9237
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Oct 22 00:41:33 2025 +0200

    vfio/xe: Add vendor-specific vfio_pci driver for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device, and uses API exposed by Xe driver bound
    to PF device to control VF device state and transfer the migration data.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 drm-intel
321de158be1a drm/xe/pf: Remove GuC version check for migration support
b487eb481c8c drm/xe: Move migration support to device-level struct
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
56433d82f34d drm/xe/pf: Add save/restore control state stubs and connect to debugfs
a0cbfad30ce1 drm/xe/pf: Add data structures and handlers for migration rings
-:966: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#966: FILE: drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h:31:
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		/** @hdr.version: migration data protocol version */

total: 0 errors, 0 warnings, 1 checks, 923 lines checked
5c14f038ac18 drm/xe/pf: Add helpers for migration data allocation / free
-:138: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#138: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 254 lines checked
51e6c2506795 drm/xe/pf: Add support for encap/decap of bitstream to/from packet
9d37f453b2ae drm/xe/pf: Add minimalistic migration descriptor
35f8c429f742 drm/xe/pf: Expose VF migration data size over debugfs
e2229aec069e drm/xe: Add sa/guc_buf_cache sync interface
514e84589401 drm/xe: Allow the caller to pass guc_buf_cache size
e89c08330892 drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migration
e3b603c29f93 drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
8b367bba4c77 drm/xe/pf: Don't save GuC VF migration data on pause
e9553880f7d0 drm/xe/pf: Switch VF migration GuC save/restore to struct migration data
c113a66051b3 drm/xe/pf: Handle GuC migration data as part of PF control
dcdd6ecf3136 drm/xe/pf: Add helpers for VF GGTT migration data handling
6d16a98e682e drm/xe/pf: Handle GGTT migration data as part of PF control
00bcc153301a drm/xe/pf: Add helpers for VF MMIO migration data handling
b21e7cdd491b drm/xe/pf: Handle MMIO migration data as part of PF control
c33e314d02a5 drm/xe/pf: Add helper to retrieve VF's LMEM object
53415a20bd18 drm/xe/migrate: Add function to copy of VRAM data in chunks
4c049199d3ba drm/xe/pf: Handle VRAM migration data as part of PF control
43af51d05795 drm/xe/pf: Add wait helper for VF FLR
e87b59a97ecf drm/xe/pf: Enable SR-IOV VF migration for PTL and BMG
6cfadcffbe2c drm/xe/pf: Export helpers for VFIO
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 332 lines checked
b82a10cc3f43 vfio/xe: Add vendor-specific vfio_pci driver for Intel graphics
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 509 lines checked


