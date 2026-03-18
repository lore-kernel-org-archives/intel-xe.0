Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE889FCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 06:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D61510E02F;
	Wed, 18 Mar 2026 06:49:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229D10E02F;
 Wed, 18 Mar 2026 06:49:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Mar 2026 06:49:30 -0000
Message-ID: <177381657044.370302.7188776579603821036@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260318064016.374656-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260318064016.374656-7-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method
URL   : https://patchwork.freedesktop.org/series/163428/
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
commit c28828b028bc9deaa12917490edc967ba70a630b
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Wed Mar 18 12:10:22 2026 +0530

    drm/xe/debugfs: Add interface to trigger power management unit error handler
    
    Add a debugfs interface to manually trigger power management unit error
    handler for testing cold reset recovery paths. This is useful for
    validating the error recovery mechanism.
    
    The new debugfs entry 'trigger_punit_error' is located at:
      /sys/kernel/debug/dri/N/trigger_punit_error
    
    Reading the file displays usage instructions. Writing '1' invokes
    xe_punit_error_handler(), which marks the device as wedged with
    DRM_WEDGE_RECOVERY_COLD_RESET method and sends a uevent to userspace
    indicating that a complete device power cycle is required for recovery.
    
    Writing '0' or any other false value has no effect.
    
    This interface is intended for development, testing, and validation
    of power management unit error recovery code.
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 146a21986f74225d0343edeb925095825fa5474f drm-intel
f1fbd4586e6a Introduce Xe Uncorrectable Error Handling
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

-:1765: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Riana Tauro <riana.tauro@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 1628 lines checked
576aef7e2f0d drm: Add DRM_WEDGE_RECOVERY_COLD_RESET for power management unit error
ca74123dec02 drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
5d0d53688229 drm/xe: Add handler for power management unit errors which require cold-reset
c28828b028bc drm/xe/debugfs: Add interface to trigger power management unit error handler


