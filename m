Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4479DC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 15:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A96A10E929;
	Wed,  9 Apr 2025 15:03:40 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B620610E929;
 Wed,  9 Apr 2025 15:03:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 15:03:38 -0000
Message-ID: <174421101874.52982.14485799464568683951@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409140258.785834-1-animesh.manna@intel.com>
In-Reply-To: <20250409140258.785834-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev7)
URL   : https://patchwork.freedesktop.org/series/142278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 66eb4be521d973651231aa66d3323970062b24fc
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Wed Apr 9 19:32:58 2025 +0530

    drm/i915/lobf: Check for sink error and disable LOBF
    
    Disable LOBF/ALPM for any erroneous condition from sink side.
    
    v1: Initial version.
    v2: Add centralized alpm error handling. [Jouni]
    v3: Improve debug print. [Jouni]
    v4: Disable alpm permanently for sink error. [Jouni]
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch c142c0202fe1fd68dbd8f2464b76203b940298b7 drm-intel
2c66629c05f7 drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
f210cd62cdac drm/i915/lobf: Add lobf enablement in post plane update
39940822de94 drm/i915/lobf: Add debug print for LOBF
33c43dcc20fd drm/i915/lobf: Disintegrate alpm_disable from psr_disable
cabfaa060e19 drm/i915/lobf: Add fixed refresh rate check in compute_config()
95fca094d85c drm/i915/lobf: Update lobf if any change in dependent parameters
1bf56d6a75f3 drm/i915/lobf: Add debug interface for lobf
af4442dcea3a drm/i915/lobf: Add mutex for alpm update
-:89: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#89: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1809:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 66 lines checked
66eb4be521d9 drm/i915/lobf: Check for sink error and disable LOBF


