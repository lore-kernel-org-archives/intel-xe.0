Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E755F34C78
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 17:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAD410E4E5;
	Mon, 13 Apr 2026 17:43:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262E410E4E9;
 Mon, 13 Apr 2026 17:43:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_cold_reset_reco?=
 =?utf-8?q?very_method_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Apr 2026 17:43:01 -0000
Message-ID: <177610218113.458495.13714062589542333806@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413133013.560239-6-mallesh.koujalagi@intel.com>
In-Reply-To: <20260413133013.560239-6-mallesh.koujalagi@intel.com>
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

Series: Introduce cold reset recovery method (rev3)
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
commit ed829386708a77573b6d72b333eccafe17f869bc
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Mon Apr 13 19:00:18 2026 +0530

    drm/xe: Handle PUNIT errors by requesting cold-reset recovery
    
    When PUNIT (power management unit) errors are detected that persist across
    warm resets, mark the device as wedged with DRM_WEDGE_RECOVERY_COLD_RESET
    and notify userspace that a complete device power cycle is required to
    restore normal operation.
    
    v3:
    - Use PUNIT instead of PMU. (Riana)
    - Use consistent wordingi.
    - Remove log. (Raag)
    
    v4:
    - Make function static. (Raag)
    
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 488f8a27b77d45c77f2e1fb3801a06876a4db737 drm-intel
47256c632fdf Introduce Xe Uncorrectable Error Handling
-:219: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#219: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 860 lines checked
35e95ce6a0f4 drm: Add DRM_WEDGE_RECOVERY_COLD_RESET recovery method
b53c0d1147b4 drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
ed829386708a drm/xe: Handle PUNIT errors by requesting cold-reset recovery


