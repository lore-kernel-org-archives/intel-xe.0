Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D73C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 09:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268B710E38D;
	Mon,  3 Mar 2025 09:06:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDED10E38D;
 Mon,  3 Mar 2025 09:06:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 09:06:16 -0000
Message-ID: <174099277605.71151.16825616684908611298@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303083522.845224-1-animesh.manna@intel.com>
In-Reply-To: <20250303083522.845224-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev4)
URL   : https://patchwork.freedesktop.org/series/142278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6105810b1797ac5cf2cf90852bde50a09a053ee8
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Mar 3 14:05:22 2025 +0530

    drm/i915/lobf: Add debug print for LOBF
    
    Lobf is enabled part of ALPM configuration and if has_lobf
    is set to true respective bit for LOBF will be set. Add debug
    print while setting the bitfield of LOBF.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 60b234fe25a41a2678a21d545477e22e0550faba drm-intel
ad365c3b4ae0 drm/i915/lobf: Add lobf enablement in post plane update
e470580b0c19 drm/i915/lobf: Disintegrate alpm_disable from psr_disable
92f68e139c13 drm/i915/lobf: Add fixed refresh rate check in compute_config()
b90bb5735cc7 drm/i915/lobf: Update lobf if any change in dependent parameters
ba9caeef1706 drm/i915/lobf: Add debug interface for lobf
844f3000dfb3 drm/i915/lobf: Check for sink error and disable LOBF
7f643154f4ad drm/i915/lobf: Add mutex for alpm update
-:144: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#144: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1805:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 117 lines checked
6105810b1797 drm/i915/lobf: Add debug print for LOBF


