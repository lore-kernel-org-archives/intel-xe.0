Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B643C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 21:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB3410EA63;
	Mon, 29 Jun 2026 21:35:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306010EA63;
 Mon, 29 Jun 2026 21:35:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PCI_error_handlers_to?=
 =?utf-8?q?_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 21:35:28 -0000
Message-ID: <178276892879.130542.9066301085421920658@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260629082802.3690896-6-riana.tauro@intel.com>
In-Reply-To: <20260629082802.3690896-6-riana.tauro@intel.com>
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

Series: Add PCI error handlers to Xe
URL   : https://patchwork.freedesktop.org/series/169407/
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
commit ffe5cf9cb7933e201a71df4376117df71ba1208f
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jun 29 13:58:06 2026 +0530

    drm/xe/xe_ras: Initialize Uncorrectable AER Registers
    
    Uncorrectable errors from different endpoints in the device are steered to
    the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
    Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
    bus driver from triggering a Secondary Bus Reset (SBR). This allows error
    detection, containment and recovery in the driver.
    
    The Uncorrectable Error Severity Register has the 'Uncorrectable
    Internal Error Severity' set to fatal by default. Set this to
    non-fatal and unmask the error.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 03288b34f48c3fe60055353c30da4aacab572cdc drm-intel
c153d0640b8b drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:59: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#59: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 152 lines checked
893f9d3103b9 drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
a91df86e3fd9 drm/xe: Skip device access during PCI error recovery
ffe5cf9cb793 drm/xe/xe_ras: Initialize Uncorrectable AER Registers


