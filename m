Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC85EC35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 19:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2AF10E35D;
	Wed, 19 Mar 2025 19:42:26 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7244810E35D;
 Wed, 19 Mar 2025 19:42:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 19:42:25 -0000
Message-ID: <174241334546.55671.1818726753104747870@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250319191508.2751216-1-animesh.manna@intel.com>
In-Reply-To: <20250319191508.2751216-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev5)
URL   : https://patchwork.freedesktop.org/series/142278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9668cbf5d7cdf8e0555ae1ea798b714964cf6267
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Thu Mar 20 00:45:08 2025 +0530

    drm/i915/lobf: Add debug print for LOBF
    
    Lobf is enabled part of ALPM configuration and if has_lobf
    is set to true respective bit for LOBF will be set. Add debug
    print while setting the bitfield of LOBF.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
200f390062a4 drm/i915/lobf: Add lobf enablement in post plane update
b544c780bd66 drm/i915/lobf: Disintegrate alpm_disable from psr_disable
e373adf0ea94 drm/i915/lobf: Add fixed refresh rate check in compute_config()
a3cd848691f3 drm/i915/lobf: Update lobf if any change in dependent parameters
a2e547dc09e7 drm/i915/lobf: Add debug interface for lobf
5a56748208cb drm/i915/lobf: Check for sink error and disable LOBF
00f09db0cff1 drm/i915/lobf: Add mutex for alpm update
-:87: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#87: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1809:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 68 lines checked
9668cbf5d7cd drm/i915/lobf: Add debug print for LOBF


