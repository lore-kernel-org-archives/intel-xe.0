Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D418ACC6B1F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 08:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9400110F112;
	Thu,  2 Apr 2026 08:01:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CBC10F112;
 Thu,  2 Apr 2026 08:01:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Apr 2026 08:01:31 -0000
Message-ID: <177511689190.427200.5872148439855842762@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402070131.1603828-12-riana.tauro@intel.com>
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling (rev3)
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
commit 446ded128503bb77bbb56fa6439349c0a6d40484
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Apr 2 12:31:41 2026 +0530

    drm/xe/xe_pci_error: Process errors in mmio_enabled
    
    Query system controller when any non fatal error occurs to check
    the type of the error, contain and recover.
    
    The system controller is queried in the mmio_enabled callback.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 5ab3838428d9d2baa881cb9b23a30cc77e5c893c drm-intel
4e89a6a4f8f0 drm/xe/xe_survivability: Decouple survivability info from boot survivability
81f644da87b3 drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 156 lines checked
a568e82c5715 drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
cfcf31cdc00b drm/xe: Skip device access during PCI error recovery
bd74ddad2b88 drm/xe/xe_ras: Initialize Uncorrectable AER Registers
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
22a9fbc7240a drm/xe/xe_ras: Add structures and commands for Uncorrectable Core Compute Errors
-:51: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#51: FILE: drivers/gpu/drm/xe/xe_ras.c:37:
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEVERITY_MAX);

-:62: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#62: FILE: drivers/gpu/drm/xe/xe_ras.c:48:
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMPONENT_MAX);

-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
new file mode 100644

total: 0 errors, 1 warnings, 2 checks, 217 lines checked
1884f85ee324 drm/xe/xe_ras: Add support for Uncorrectable Core-Compute errors
bccea9aafb4d drm/xe/xe_ras: Add structures for SoC Internal errors
728f676d0b06 drm/xe/xe_ras: Handle Uncorrectable SoC Internal errors
-:46: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#46: FILE: drivers/gpu/drm/xe/xe_ras.c:105:
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;

-:65: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#65: FILE: drivers/gpu/drm/xe/xe_ras.c:124:
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;

total: 0 errors, 2 warnings, 0 checks, 67 lines checked
446ded128503 drm/xe/xe_pci_error: Process errors in mmio_enabled


