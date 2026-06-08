Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6ADCD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 12:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D80110F34C;
	Mon,  8 Jun 2026 12:50:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFA710F34C;
 Mon,  8 Jun 2026 12:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 12:50:42 -0000
Message-ID: <178092304271.53486.12372621410536218116@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608084700.640376-17-riana.tauro@intel.com>
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling (rev8)
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
commit 04869a3c97b9bd5b4f9d27933e7401d947c38680
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jun 8 14:17:16 2026 +0530

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
+ /mt/dim checkpatch 044152a1643f7150f482c8d326caa5023ae4c397 drm-intel
1aa3ba5eac96 drm/xe/xe_survivability: Decouple survivability info from boot survivability
46421da00044 drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
90885357ae38 drm/xe: Improve wedged state management
ff1a7effd277 drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 147 lines checked
0842d9aff03c drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
09c917f97981 drm/xe: Skip device access during PCI error recovery
16759130d544 drm/xe/xe_ras: Initialize Uncorrectable AER Registers
8b70091aa00a drm/xe/xe_ras: Add support for uncorrectable core-compute errors
c46dea9ddd0a drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
cf348f23a90b drm/xe/xe_ras: Query errors from system controller on probe
55f2849a5180 drm/xe/xe_pci_error: Process errors in mmio_enabled
2a3021aee92e drm/xe/xe_ras: Add support to query device memory errors
217e799a985a drm/xe/xe_ras: Add support to query page offline queue and list
2d0c564d0da1 drm/xe/xe_ras: Add support to offline and decline a page address
04869a3c97b9 drm/xe/xe_ras: Process pages from offlined list and queue


