Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B345CCD4846
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 01:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB6810E958;
	Tue, 12 May 2026 01:05:11 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461A810E959;
 Tue, 12 May 2026 01:05:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 01:05:10 -0000
Message-ID: <177854791028.58917.11440632652234690017@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511172908.1122252-16-riana.tauro@intel.com>
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling (rev5)
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
commit 9c44dbc8ff9a79bcae53820437fa206409969539
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon May 11 22:59:21 2026 +0530

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
+ /mt/dim checkpatch 0ce1c813197dfbe15ff14143da97ec11161e1795 drm-intel
daaa6454b82e drm/xe/xe_survivability: Decouple survivability info from boot survivability
e04b5f5dedf7 drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
676e0712bbbb drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 137 lines checked
681f5750178b drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
527456ae5680 drm/xe: Skip device access during PCI error recovery
28692df5a94d drm/xe/xe_ras: Initialize Uncorrectable AER Registers
12028cfd1a03 drm/xe/xe_ras: Add support for uncorrectable core-compute errors
c1e82c7e0a94 drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
-:44: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#44: FILE: drivers/gpu/drm/xe/xe_ras.c:123:
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;

-:62: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#62: FILE: drivers/gpu/drm/xe/xe_ras.c:141:
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;

total: 0 errors, 2 warnings, 0 checks, 125 lines checked
eb68afd68fae drm/xe/xe_ras: Add support to query device memory errors
d4b6835be237 drm/xe/xe_ras: Add support to query page offline queue and list
aa54e68eecac drm/xe/xe_ras: Query errors from system controller on probe
315d78bbd45c drm/xe/xe_pci_error: Process errors in mmio_enabled
b08ce89a9ba6 drm/xe/xe_ras: Add support to offline/decline a page address
-:50: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#50: FILE: drivers/gpu/drm/xe/xe_ras.c:49:
+};
+static_assert(ARRAY_SIZE(ras_status_to_errno_map) == XE_RAS_STATUS_UNKNOWN_ERROR + 1);

-:110: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#110: FILE: drivers/gpu/drm/xe/xe_ras.c:146:
+		xe_err(xe, "sysctrl: page offline command failed with status %d\n", response.status);

total: 0 errors, 1 warnings, 1 checks, 240 lines checked
9c44dbc8ff9a drm/xe/xe_ras: Process pages from offlined list and queue


