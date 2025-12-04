Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992A6D1D892
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 09:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E708D10E908;
	Thu,  4 Dec 2025 09:46:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C5010E905;
 Thu,  4 Dec 2025 09:46:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_fix_VFIO_lin?=
 =?utf-8?q?k_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 09:46:50 -0000
Message-ID: <176484161054.56921.16254333742825128111@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204094154.1029357-1-arnd@kernel.org>
In-Reply-To: <20251204094154.1029357-1-arnd@kernel.org>
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

Series: drm/xe/pf: fix VFIO link error
URL   : https://patchwork.freedesktop.org/series/158478/
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
commit 1bc29f1fc068722f1a74c3eba2d76c187a3eced4
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Dec 4 10:41:36 2025 +0100

    drm/xe/pf: fix VFIO link error
    
    The Makefile logic for building xe_sriov_vfio.o was added incorrectly,
    as setting CONFIG_XE_VFIO_PCI=m means it doesn't get included into a
    built-in xe driver:
    
    ERROR: modpost: "xe_sriov_vfio_stop_copy_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_stop_copy_exit" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_suspend_device" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_wait_flr_done" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_error" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_resume_data_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_resume_device" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_resume_data_exit" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_data_write" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    ERROR: modpost: "xe_sriov_vfio_migration_supported" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
    WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)
    
    Check for CONFIG_XE_VFIO_PCI being enabled in the Makefile to decide whether to
    include the the object instead.
    
    Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 2d16d4e1aef3cb501fcd37c8558dafeb579be813 drm-intel
1bc29f1fc068 drm/xe/pf: fix VFIO link error
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
ERROR: modpost: "xe_sriov_vfio_stop_copy_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!

-:23: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#23: 
include the the object instead.

total: 0 errors, 2 warnings, 0 checks, 10 lines checked


