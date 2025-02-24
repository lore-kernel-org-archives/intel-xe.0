Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB3C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 18:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A03510E0C8;
	Mon, 24 Feb 2025 18:45:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8B10E354;
 Mon, 24 Feb 2025 18:45:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 18:45:24 -0000
Message-ID: <174042272474.1687153.16555918520862960008@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224080847.326350-1-animesh.manna@intel.com>
In-Reply-To: <20250224080847.326350-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev3)
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
commit e152a43cbae661eccf12bc16fb0a626a093c09da
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Feb 24 13:38:47 2025 +0530

    drm/i915/lobf: Add debug print for LOBF
    
    Lobf is enabled part of ALPM configuration and if has_lobf
    is set to true respective bit for LOBF will be set. Add debug
    print while setting the bitfield of LOBF.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch a5a9504217e25c850ff9e82d38c1093dbdbf20f9 drm-intel
c98a89e8510d drm/i915/lobf: Add lobf enablement in post plane update
f3ac498b1189 drm/i915/lobf: Disintegrate alpm_disable from psr_disable
74123c2e908b drm/i915/lobf: Add fixed refresh rate check in compute_config()
d9bca6963d35 drm/i915/lobf: Update lobf if any change in dependent parameters
7dba8dc85261 drm/i915/lobf: Add debug interface for lobf
c8b36637e309 drm/i915/lobf: Check for sink error and disable LOBF
3b93c7a82c3a drm/i915/lobf: Add mutex for alpm update
-:142: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#142: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1805:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 116 lines checked
e152a43cbae6 drm/i915/lobf: Add debug print for LOBF


