Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA0CCCFA13
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 01:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9047210E480;
	Tue, 11 Nov 2025 01:13:33 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F7D10E480;
 Tue, 11 Nov 2025 01:13:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 01:13:32 -0000
Message-ID: <176282361203.38378.9055620406177091749@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251111010439.347045-1-michal.winiarski@intel.com>
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration (rev5)
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
commit 4b3619a157a3662e897f0b1215851784a525d22a
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Tue Nov 11 02:04:39 2025 +0100

    vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device and uses API exposed by Xe driver to
    transfer the VF migration data under the control of PF device.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 4ce351022716985e9c1dd18583acd4d3d149cb5b drm-intel
6c93e477aa72 drm/xe/pf: Remove GuC version check for migration support
4a37fe114252 drm/xe: Move migration support to device-level struct
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 161 lines checked
aaaecefb9c44 drm/xe/pf: Convert control state to bitmap
84c292864e6b drm/xe/pf: Add save/restore control state stubs and connect to debugfs
67e77c382ef8 drm/xe/pf: Add data structures and handlers for migration rings
-:815: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#815: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1007 lines checked
60c04a021a8c drm/xe/pf: Add helpers for migration data packet allocation / free
-:164: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#164: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 302 lines checked
db47fb34afe9 drm/xe/pf: Add support for encap/decap of bitstream to/from packet
7971f574310f drm/xe/pf: Add minimalistic migration descriptor
27e418d9026f drm/xe/pf: Expose VF migration data size over debugfs
3af01944563f drm/xe: Add sa/guc_buf_cache sync interface
1c030f54c358 drm/xe: Allow the caller to pass guc_buf_cache size
4b51da66f2c8 drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migration
8b4b78cd6a6b drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
91746dfe485e drm/xe/pf: Don't save GuC VF migration data on pause
624ff795c034 drm/xe/pf: Switch VF migration GuC save/restore to struct migration data
cd7ee1d9f449 drm/xe/pf: Handle GuC migration data as part of PF control
f7b415f54b0e drm/xe/pf: Add helpers for VF GGTT migration data handling
c58f1265644b drm/xe/pf: Handle GGTT migration data as part of PF control
75130d856138 drm/xe/pf: Handle MMIO migration data as part of PF control
fc96593d6e43 drm/xe/pf: Add helper to retrieve VF's LMEM object
bb6060e21c7d drm/xe/migrate: Add function to copy of VRAM data in chunks
a007665b0f35 drm/xe/pf: Handle VRAM migration data as part of PF control
c4558407b2be drm/xe/pf: Add wait helper for VF FLR
3f796da6a46f drm/xe/pf: Enable SR-IOV VF migration
3ba03da1e402 drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
1eaff8dea991 drm/xe/pf: Export helpers for VFIO
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 285 lines checked
6a08cfe65008 drm/intel/bmg: Allow device ID usage with single-argument macros
4b3619a157a3 vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
-:59: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#59: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 607 lines checked


