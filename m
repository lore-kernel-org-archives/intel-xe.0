Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34658CD4F2C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 08:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EBD10F319;
	Fri, 12 Jun 2026 08:16:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762B010F319;
 Fri, 12 Jun 2026 08:16:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 08:16:57 -0000
Message-ID: <178125221747.72880.16705745571625997778@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612080722.26726-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20260612080722.26726-8-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method (rev8)
URL   : https://patchwork.freedesktop.org/series/163428/
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
commit dd455b46800eb95a9023673fb3ed152a6286ce38
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Fri Jun 12 13:37:29 2026 +0530

    drm/xe/ras: Add debugfs entry to inject punit error
    
    Add a write-only debugfs file 'inject_punit_error' under the DRI device
    root that allows triggering punit_error_handler() manually for testing.
    Writing 1 to the file invokes the handler, which suppresses spurious
    Surprise Link Down AER events on slots and declares the
    device wedged for a cold reset recovery.
    
    Usage:
      echo 1 > /sys/kernel/debug/dri/<N>/inject_punit_error
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 9ce63e3d9903982c053b125686abcb7a84357ed4 drm-intel
c9a46513efa5 Introduce Xe Uncorrectable Error Handling
-:297: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#297: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1266 lines checked
0cad634c8bcd drm: Add DRM_WEDGE_RECOVERY_COLD_RESET recovery method
c8f81118a89d drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
927f5643b21c drm/xe: Handle PUNIT errors by requesting cold-reset recovery
e855ecfbd078 drm/xe: Suppress Surprise Link Down on device
dd455b46800e drm/xe/ras: Add debugfs entry to inject punit error


