Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE2C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A0B89DA9;
	Thu, 22 Jan 2026 09:42:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5636A89DA9;
 Thu, 22 Jan 2026 09:42:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Uncorrectabl?=
 =?utf-8?q?e_Error_Handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jan 2026 09:42:24 -0000
Message-ID: <176907494435.182776.4296480967983377747@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122100613.3631582-10-riana.tauro@intel.com>
In-Reply-To: <20260122100613.3631582-10-riana.tauro@intel.com>
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

Series: Introduce Xe Uncorrectable Error Handling
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
commit bcc1ba1c41f29174a9fdb42feea194d18ecfb69a
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Jan 22 15:36:20 2026 +0530

    drm/xe/xe_pci_error: Process errors in mmio_enabled
    
    Query system controller when any non fatal error occurs to check
    the type of the error, contain and recover.
    
    The system controller is queried in the mmio_enabled callback.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch a3ecd278f9a05323fab7471760a7ea10081251d6 drm-intel
d51de1f66d6b drm/xe/xe_sysctrl: Add System controller patch
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:838: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Anoop Vijay <anoop.c.vijay@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 756 lines checked
0cb5e94d1a88 drm/xe/xe_pci_error: Implement PCI error recovery callbacks
-:98: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#98: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 137 lines checked
5d864a6762e3 drm/xe/xe_pci_error: Group all devres to release them on PCIe slot reset
e160972b6c2b drm/xe: Skip device access during PCI error recovery
5f63d857187d drm/xe/xe_ras: Initialize Uncorrectable AER Registers
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
798a8d3a9d74 drm/xe/xe_ras: Add structures and commands for Uncorrectable Core Compute Errors
-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 212 lines checked
934e28278724 drm/xe/xe_ras: Add support for Uncorrectable Core-Compute errors
bcc1ba1c41f2 drm/xe/xe_pci_error: Process errors in mmio_enabled


