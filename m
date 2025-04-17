Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD31C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 11:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5CC10EAE3;
	Thu, 17 Apr 2025 11:53:27 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6FA10EAE3;
 Thu, 17 Apr 2025 11:53:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 11:53:25 -0000
Message-ID: <174489080595.14498.3810423514896062150@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417094123.1662424-1-animesh.manna@intel.com>
In-Reply-To: <20250417094123.1662424-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev8)
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
commit 3c9c0107e7dc05a9e1990f264713ddccf0eaeee5
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Thu Apr 17 15:11:23 2025 +0530

    drm/i915/display: Disintegrate sink alpm enable from psr with lobf
    
    Make a generic alpm enable function for sink which can be used for
    PSR2/PR/Lobf.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 830407db6fa5a871d1a6fcba1e51b42899ff57f6 drm-intel
8df59f438d62 drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
e78cc0c10cde drm/i915/lobf: Add lobf enablement in post plane update
80715ff0a477 drm/i915/lobf: Add debug print for LOBF
25d7e44d41cf drm/i915/lobf: Disintegrate alpm_disable from psr_disable
43a70bb773e4 drm/i915/lobf: Add fixed refresh rate check in compute_config()
2d60850e378f drm/i915/lobf: Update lobf if any change in dependent parameters
508b09eb10c9 drm/i915/lobf: Add debug interface for lobf
05999eee771e drm/i915/lobf: Add mutex for alpm update
-:107: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#107: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1809:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 82 lines checked
1d0503268146 drm/i915/lobf: Check for sink error and disable LOBF
3c9c0107e7dc drm/i915/display: Disintegrate sink alpm enable from psr with lobf


