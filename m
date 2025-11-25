Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD2FCFD364
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 08:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7874510E2E4;
	Tue, 25 Nov 2025 08:39:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2057D10E2E4;
 Tue, 25 Nov 2025 08:39:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Nov 2025 08:39:27 -0000
Message-ID: <176405996712.23759.4094875846852920291@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251124230841.613894-1-michal.winiarski@intel.com>
In-Reply-To: <20251124230841.613894-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration (rev6)
URL   : https://patchwork.freedesktop.org/series/155785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 013fc28654658f1ce4c4ba859e9ab060336d88e9
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Tue Nov 25 00:08:41 2025 +0100

    vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device and uses API exposed by Xe driver to
    transfer the VF migration data under the control of PF device.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
+ /mt/dim checkpatch d4e10540f736e4bf0f07b1d4b27a15a8bea5d7c1 drm-intel
fd1892403990 drm/xe/pf: Enable SR-IOV VF migration
a73d9e7f1e62 drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
a3a7efbb8c36 drm/xe/pf: Export helpers for VFIO
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 314 lines checked
013fc2865465 vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 607 lines checked


