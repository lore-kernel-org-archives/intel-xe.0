Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BDEF46C53
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 15:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709DC10E269;
	Mon,  6 Apr 2026 15:33:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B3810E269;
 Mon,  6 Apr 2026 15:33:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 15:33:15 -0000
Message-ID: <177548959567.434106.2028248994618123889@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406142325.157035-6-mallesh.koujalagi@intel.com>
In-Reply-To: <20260406142325.157035-6-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method (rev2)
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
commit 3e036ea44de2da7e9b48027ab87910ee475f013b
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Mon Apr 6 19:53:30 2026 +0530

    drm/xe: Handle PUNIT errors by requesting cold-reset recovery
    
    When PUNIT (power management unit) errors are detected that persist across
    warm resets, mark the device as wedged with DRM_WEDGE_RECOVERY_COLD_RESET
    and notify userspace that a complete device cold reset is required to
    restore normal operation.
    
    v3:
    - Use PUNIT instead of PMU. (Riana)
    - Use consistent wordingi.
    - Remove log. (Raag)
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 7b7217a9e27a82ef10be22ab3a55ad5bbc849688 drm-intel
458eb12ae594 Introduce Xe Uncorrectable Error Handling
-:219: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#219: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 860 lines checked
abef24cd7f63 drm: Add DRM_WEDGE_RECOVERY_COLD_RESET recovery method
626eddcfb09c drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
3e036ea44de2 drm/xe: Handle PUNIT errors by requesting cold-reset recovery


