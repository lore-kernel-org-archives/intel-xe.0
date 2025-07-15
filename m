Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3BC83F21
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 12:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09FB892AA;
	Tue, 15 Jul 2025 12:29:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D8B892AA;
 Tue, 15 Jul 2025 12:28:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_Firmware_reported_?=
 =?utf-8?q?Hardware_Errors_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Jul 2025 12:28:59 -0000
Message-ID: <175258253959.162891.100690908627203589@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250715104730.2109506-1-riana.tauro@intel.com>
In-Reply-To: <20250715104730.2109506-1-riana.tauro@intel.com>
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

Series: Handle Firmware reported Hardware Errors (rev5)
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
commit cb2dbabf11f160feaaa238c4acf45068fc873a46
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Jul 15 16:17:29 2025 +0530

    drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
    
    Add a debugfs fault handler to trigger csc error handler that
    wedges the device and sends drm uevent
    
    v2: add debugfs only for bmg (Umesh)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 64f56ca0926a30d50bcc0c215b262f5149c7e5cd drm-intel
5135331fa2e8 drm: Add a vendor-specific recovery method to device wedged uevent
953fc786b491 drm/xe: Set GT as wedged before sending wedged uevent
79318cd5a879 drm/xe: Add a helper function to set recovery method
184426fab842 drm/xe/xe_survivability: Refactor survivability mode
a0ae0751e7c8 drm/xe/xe_survivability: Add support for Runtime survivability mode
9c46c5206d04 drm/xe/doc: Document device wedged and runtime survivability
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 111 lines checked
0da7b5f3d14e drm/xe: Add support to handle hardware errors
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 172 lines checked
19c1f5cce7b7 drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
-:30: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#30: 
KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
cb2dbabf11f1 drm/xe/xe_hw_error: Add fault injection to trigger csc error handler


