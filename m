Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D40CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 14:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA64910E7A9;
	Wed, 22 Oct 2025 14:07:59 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D80610E7A9;
 Wed, 22 Oct 2025 14:07:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_replace_drm=5Fprin?=
 =?utf-8?q?t=2Eh_includes_from_headers_with_a_forward_declaration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 14:07:58 -0000
Message-ID: <176114207850.42825.4327188468530536086@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761126446.git.jani.nikula@intel.com>
In-Reply-To: <cover.1761126446.git.jani.nikula@intel.com>
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

Series: drm: replace drm_print.h includes from headers with a forward declaration (rev2)
URL   : https://patchwork.freedesktop.org/series/156268/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f0d1c7d636367ba23b84f6012d013435e12f15fa
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 22 12:48:33 2025 +0300

    drm/ttm: replace drm_print.h include with a forward declaration
    
    The ttm/ttm_resource.h header does not really need anything from
    drm_print.h. A simple forward declaration for struct drm_printer is
    sufficient.
    
    Alas, a gazillion files depend on that indirect include, and need the
    explicit drm_print.h include. Add them all over the place.
    
    v2: Fix loongson, ttm tests, vboxvideo (kernel test robot, Intel Graphics CI)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 59df9bfae7b629576bba2dcf0caacc1e144a6bde drm-intel
4bcf2032b323 drm/mm: replace drm_print.h include with a forward declaration
-:2108: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:2111: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 1628 lines checked
750de8876476 drm/buddy: replace drm_print.h include with a forward declaration
f0d1c7d63636 drm/ttm: replace drm_print.h include with a forward declaration
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
v2: Fix loongson, ttm tests, vboxvideo (kernel test robot, Intel Graphics CI)

-:1059: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#1059: FILE: drivers/gpu/drm/i915/i915_getparam.c:2:
  * SPDX-License-Identifier: MIT

total: 0 errors, 2 warnings, 0 checks, 1121 lines checked


