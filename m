Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EEBCD5BD0
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 11:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1B710E1CF;
	Mon, 25 May 2026 11:04:32 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E42210E1CF;
 Mon, 25 May 2026 11:04:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 11:04:31 -0000
Message-ID: <177970707151.4776.12608000863394046434@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525100619.3155663-17-riana.tauro@intel.com>
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling (rev6)
URL   : https://patchwork.freedesktop.org/series/160482/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5088072034f00dd43fd35692f7388971ae86913
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon May 25 15:36:34 2026 +0530

    drm/xe/xe_ras: Process pages from offlined list and queue
    
    This will be integrated with the related address-fault handling flow
    once this patch is merged.
    https://lore.kernel.org/intel-xe/20260506141143.4033299-12-tejas.upadhyay@intel.com/
    Sending for initial comments.
    
    On module load, process pages queued by firmware for offlining by
    reserving and sending the offline/decline command to firmware.
    For already offlined pages in the firmware list, reserve the pages.
    
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch cd7e65a9c3a38736427bbd62baf2aaa1240902a4 drm-intel
e595184940f3 drm/xe/xe_survivability: Decouple survivability info from boot survivability
e732728ced51 drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
a5a72b375d5d drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
a6aac8ebb142 drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
3a191866dc19 drm/xe: Skip device access during PCI error recovery
f5138e5ab85c drm/xe/xe_drm_client: Skip run_ticks fdinfo during device reset
-:56: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
cf92dafebbf4 drm/xe/xe_ras: Initialize Uncorrectable AER Registers
81fe0fa10ccd drm/xe/xe_ras: Add support for uncorrectable core-compute errors
13e46d246529 drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
0abb8b92160c drm/xe/xe_ras: Add support to query device memory errors
8a626ba5e4e1 drm/xe/xe_ras: Add support to query page offline queue and list
0972b3bbceeb drm/xe/xe_ras: Query errors from system controller on probe
08ee11532dd6 drm/xe/xe_pci_error: Process errors in mmio_enabled
654511338fd5 drm/xe/xe_ras: Add support to offline/decline a page address
-:50: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#50: FILE: drivers/gpu/drm/xe/xe_ras.c:50:
+};
+static_assert(ARRAY_SIZE(ras_status_to_errno_map) == XE_RAS_STATUS_UNKNOWN_ERROR + 1);

total: 0 errors, 0 warnings, 1 checks, 236 lines checked
e5088072034f drm/xe/xe_ras: Process pages from offlined list and queue


