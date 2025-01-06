Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AEDE77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 05:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417B710E1CF;
	Mon,  6 Jan 2025 05:33:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D254610E1CF;
 Mon,  6 Jan 2025 05:33:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 05:33:09 -0000
Message-ID: <173614158985.4175944.7033758952784553526@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106041516.924101-1-animesh.manna@intel.com>
In-Reply-To: <20250106041516.924101-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev2)
URL   : https://patchwork.freedesktop.org/series/142278/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b0b450f765d283de4c98614d63af2f3e93dbb403
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Jan 6 09:45:16 2025 +0530

    drm/i915/lobf: Add debug print for LOBF
    
    Lobf is enabled part of ALPM configuration and if has_lobf
    is set to true respective bit for LOBF will be set. Add debug
    print while setting the bitfield of LOBF.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 856baaf960db044e0ce5e3f5d04d35a7b9879837 drm-intel
0af5c0f870be drm/i915/lobf: Add lobf enablement in post plane update
3e3bb3771abd drm/i915/lobf: Add fixed refresh rate check in compute_config()
b10e72cbff7b drm/i915/lobf: Update lobf if any change in dependent parameters
2faa00858af1 drm/i915/lobf: Add debug interface for lobf
d42b67fe91f4 drm/i915/lobf: Check for sink error and disable LOBF
b0b450f765d2 drm/i915/lobf: Add debug print for LOBF


