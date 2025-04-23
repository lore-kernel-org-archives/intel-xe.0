Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05DEC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 09:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822410E675;
	Wed, 23 Apr 2025 09:53:01 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DF010E677;
 Wed, 23 Apr 2025 09:53:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 09:53:00 -0000
Message-ID: <174540198019.28789.12875468093272332524@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250423092334.2294483-1-animesh.manna@intel.com>
In-Reply-To: <20250423092334.2294483-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev9)
URL   : https://patchwork.freedesktop.org/series/142278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e9f0724e0ccb9e1b9f3596df1297b38c158eb0cf
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Wed Apr 23 14:53:34 2025 +0530

    drm/i915/display: Disintegrate sink alpm enable from psr with lobf
    
    Make a generic alpm enable function for sink which can be used for
    PSR2/PR/Lobf.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 3a6aa65ba6ed7ef9992ded617f44faa063b664d9 drm-intel
8b8b664e4cd5 drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
d3a7cc904bc2 drm/i915/lobf: Add lobf enablement in post plane update
80481412c107 drm/i915/lobf: Add debug print for LOBF
8181e73c4326 drm/i915/lobf: Disintegrate alpm_disable from psr_disable
110c136b8e68 drm/i915/lobf: Add fixed refresh rate check in compute_config()
0764ad679797 drm/i915/lobf: Update lobf if any change in dependent parameters
a781341c7a88 drm/i915/lobf: Add debug interface for lobf
b54e406d682b drm/i915/lobf: Add mutex for alpm update
-:100: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#100: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1809:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 76 lines checked
0b1720219e37 drm/i915/lobf: Check for sink error and disable LOBF
457f3dc3274b drm/i915/alpm: Add intel_psr_need_alpm() to simplify alpm check
e9f0724e0ccb drm/i915/display: Disintegrate sink alpm enable from psr with lobf


