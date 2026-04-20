Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED8F588C3
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 13:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA0D10E661;
	Mon, 20 Apr 2026 13:33:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C610E660;
 Mon, 20 Apr 2026 13:33:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Apr 2026 13:33:42 -0000
Message-ID: <177669202234.475664.11946587473110183462@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260417085812.4013309-15-riana.tauro@intel.com>
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling (rev4)
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
commit 45e77385fddebfc0dacfe16aca0ad67c67bf04dd
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Apr 17 14:28:25 2026 +0530

    drm/xe/xe_pci_error: Process errors in mmio_enabled
    
    Query system controller when any non fatal error occurs to check
    the type of the error, contain and recover.
    
    The system controller is queried in the mmio_enabled callback.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 57114c081277a1321173619222eeb13705c20453 drm-intel
451358059101 drm/xe/xe_survivability: Decouple survivability info from boot survivability
ddf47606dc24 drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:100: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#100: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 159 lines checked
5cd7f42f8440 drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
c21eb854dd3e drm/xe: Skip device access during PCI error recovery
75a37c162716 drm/xe/xe_ras: Initialize Uncorrectable AER Registers
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 119 lines checked
2a60d424ff2b drm/xe/xe_ras: Add basic structures and commands for uncorrectable errors
-:51: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#51: FILE: drivers/gpu/drm/xe/xe_ras.c:37:
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEVERITY_MAX);

-:62: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#62: FILE: drivers/gpu/drm/xe/xe_ras.c:48:
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMPONENT_MAX);

-:84: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#84: 
new file mode 100644

total: 0 errors, 1 warnings, 2 checks, 181 lines checked
0f009bc78969 drm/xe/xe_ras: Add support for uncorrectable core-compute errors
a7824c0606c4 drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
-:46: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#46: FILE: drivers/gpu/drm/xe/xe_ras.c:107:
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;

-:65: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#65: FILE: drivers/gpu/drm/xe/xe_ras.c:126:
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;

total: 0 errors, 2 warnings, 0 checks, 128 lines checked
f981b5a3765d drm/xe/xe_ras: Handle uncorrectable device memory errors
f9f76e27f5ef drm/xe/xe_ras: Add support to offline/decline a page
210e332e6fcc drm/xe/xe_ras: Add support for page offline list and queue commands
a12da58df8a1 drm/xe/xe_ras: Query errors from system controller on probe
45e77385fdde drm/xe/xe_pci_error: Process errors in mmio_enabled


