Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16972CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 13:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B527E10E891;
	Thu, 14 Aug 2025 13:28:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECA410E891;
 Thu, 14 Aug 2025 13:28:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_Firmware_reported_?=
 =?utf-8?q?Hardware_Errors_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Aug 2025 13:28:57 -0000
Message-ID: <175517813790.236499.14689381822403488754@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250814121448.3380784-1-riana.tauro@intel.com>
In-Reply-To: <20250814121448.3380784-1-riana.tauro@intel.com>
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

Series: Handle Firmware reported Hardware Errors (rev8)
URL   : https://patchwork.freedesktop.org/series/149756/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 72926614d033e6d6c2a9cd8ac1c0de4bd7039dfd
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Aug 14 17:44:40 2025 +0530

    drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
    
    Add a debugfs fault handler to trigger csc error handler that
    wedges the device and enables runtime survivability mode.
    
    v2: add debugfs only for bmg (Umesh)
    v3: do not use csc_fault attribute if debugfs is not enabled
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb drm-intel
2c0b71baf8f6 drm/xe: Add documentation for Xe Device Wedging
-:23: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#23: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
7b22eccaa4b6 drm: Add a vendor-specific recovery method to drm device wedged uevent
56a21781eb3e drm/xe: Set GT as wedged before sending wedged uevent
476cd029acb2 drm/xe: Add a helper function to set recovery method
8d7b747882b0 drm/xe/xe_survivability: Refactor survivability mode
7d2bc990b71a drm/xe/xe_survivability: Add support for Runtime survivability mode
1fefe2b92173 drm/xe/doc: Document device wedged and runtime survivability
b0809b7f4b56 drm/xe: Add support to handle hardware errors
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
288b4ffc6518 drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
-:30: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#30: 
KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 143 lines checked
72926614d033 drm/xe/xe_hw_error: Add fault injection to trigger csc error handler


