Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD33C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434DF10E7D2;
	Wed,  9 Jul 2025 12:28:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E94D10E7D2;
 Wed,  9 Jul 2025 12:28:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_Firmware_reported_?=
 =?utf-8?q?Hardware_Errors_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Jul 2025 12:28:58 -0000
Message-ID: <175206413805.147214.3822702273840714452@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250709112024.1053710-1-riana.tauro@intel.com>
In-Reply-To: <20250709112024.1053710-1-riana.tauro@intel.com>
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

Series: Handle Firmware reported Hardware Errors (rev4)
URL   : https://patchwork.freedesktop.org/series/149756/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 687f6fef4cdc2359f8a5cab02cbdad009dec90a8
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Jul 9 16:50:21 2025 +0530

    drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
    
    Add a debugfs fault handler to trigger csc error handler that
    wedges the device and sends drm uevent
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 20adfb60af27bc0e490b2d20609c3158ae2fbd26 drm-intel
bbc7ca5d17df drm: Add a vendor-specific recovery method to device wedged uevent
2c51c0258aa6 drm/xe: Set GT as wedged before sending wedged uevent
236f7ec3b4a6 drm/xe: Add a helper function to set recovery method
9712ceb6cd2a drm/xe/xe_survivability: Refactor survivability mode
51371af8f5e3 drm/xe/xe_survivability: Add support for Runtime survivability mode
62dc45c71895 drm/xe/doc: Document device wedged and runtime survivability
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
9be309241b33 drm/xe: Add support to handle hardware errors
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 174 lines checked
c2731205f14d drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
687f6fef4cdc drm/xe/xe_hw_error: Add fault injection to trigger csc error handler


