Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E120C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 16:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427C310E538;
	Mon, 28 Jul 2025 16:18:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBC710E538;
 Mon, 28 Jul 2025 16:18:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_Firmware_reported_?=
 =?utf-8?q?Hardware_Errors_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Jul 2025 16:18:55 -0000
Message-ID: <175371953519.194392.6499082989110328231@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250728102809.502324-1-riana.tauro@intel.com>
In-Reply-To: <20250728102809.502324-1-riana.tauro@intel.com>
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

Series: Handle Firmware reported Hardware Errors (rev7)
URL   : https://patchwork.freedesktop.org/series/149756/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad19d573929945f50c6f71d2207d46710b39063c
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jul 28 15:57:59 2025 +0530

    drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
    
    Add a debugfs fault handler to trigger csc error handler that
    wedges the device and enables runtime survivability mode.
    
    v2: add debugfs only for bmg (Umesh)
    v3: do not use csc_fault attribute if debugfs is not enabled
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09 drm-intel
2ad2d82b28d8 drm: Add a vendor-specific recovery method to drm device wedged uevent
58b71fc08939 drm/xe: Set GT as wedged before sending wedged uevent
15ea02cf19b4 drm/xe: Add a helper function to set recovery method
4df926c587f9 drm/xe/xe_survivability: Refactor survivability mode
69dcd5c1d779 drm/xe/xe_survivability: Add support for Runtime survivability mode
cd92a67858b0 drm/xe/doc: Document device wedged and runtime survivability
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 119 lines checked
34b11ccd7655 drm/xe: Add support to handle hardware errors
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
7f590f44e97b drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
-:30: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#30: 
KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
ad19d5739299 drm/xe/xe_hw_error: Add fault injection to trigger csc error handler


