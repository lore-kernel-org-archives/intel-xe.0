Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE1EA4E3A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 16:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7103C10E1D1;
	Mon,  2 Mar 2026 16:10:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6329B10E1D1;
 Mon,  2 Mar 2026 16:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 16:10:22 -0000
Message-ID: <177246782238.304038.7198126825252002137@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302102155.4074630-13-riana.tauro@intel.com>
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling (rev2)
URL   : https://patchwork.freedesktop.org/series/160482/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af594481a53e24cd7bedefcf31ead2d9ff64b9d3
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Mar 2 15:52:06 2026 +0530

    drm/xe/xe_pci_error: Process errors in mmio_enabled
    
    Query system controller when any non fatal error occurs to check
    the type of the error, contain and recover.
    
    The system controller is queried in the mmio_enabled callback.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 01a56db3d9c2632675c23778a174b989aac4e050 drm-intel
0ed4ca338105 drm/xe/xe_sysctrl: Add System controller patch
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:781: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Anoop Vijay <anoop.c.vijay@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 699 lines checked
a2b045dfc4ca drm/xe/xe_survivability: Decouple survivability info from boot survivability
6787619d6b29 drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 151 lines checked
624b371e52c4 drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
59d6156957c6 drm/xe: Skip device access during PCI error recovery
b904b169337e drm/xe/xe_ras: Initialize Uncorrectable AER Registers
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
23db84843498 drm/xe/xe_ras: Add structures and commands for Uncorrectable Core Compute Errors
-:47: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#47: FILE: drivers/gpu/drm/xe/xe_ras.c:36:
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEVERITY_MAX);

-:58: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#58: FILE: drivers/gpu/drm/xe/xe_ras.c:47:
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMPONENT_MAX);

-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

total: 0 errors, 1 warnings, 2 checks, 213 lines checked
d7876791b623 drm/xe/xe_ras: Add support for Uncorrectable Core-Compute errors
62e967557cf8 drm/xe/xe_ras: Add structures for SoC Internal errors
7971db29a95f drm/xe/xe_ras: Handle Uncorrectable SoC Internal errors
-:50: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#50: FILE: drivers/gpu/drm/xe/xe_ras.c:120:
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;

-:69: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#69: FILE: drivers/gpu/drm/xe/xe_ras.c:139:
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;

total: 0 errors, 2 warnings, 0 checks, 70 lines checked
af594481a53e drm/xe/xe_pci_error: Process errors in mmio_enabled


