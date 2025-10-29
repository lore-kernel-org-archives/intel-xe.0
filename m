Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC80CCF9F0
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 14:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F0210E151;
	Wed, 29 Oct 2025 14:32:11 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C96010E151;
 Wed, 29 Oct 2025 14:32:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_replace_drm=5Fprin?=
 =?utf-8?q?t=2Eh_includes_from_headers_with_a_forward_declaration_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Oct 2025 14:32:10 -0000
Message-ID: <176174833035.68558.11375926924799660570@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761734313.git.jani.nikula@intel.com>
In-Reply-To: <cover.1761734313.git.jani.nikula@intel.com>
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

Series: drm: replace drm_print.h includes from headers with a forward declaration (rev3)
URL   : https://patchwork.freedesktop.org/series/156268/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8ed7b8b50a41090a067434da4187346ee1dab217
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 29 12:39:48 2025 +0200

    drm/ttm: replace drm_print.h include with a forward declaration
    
    The ttm/ttm_resource.h header does not really need anything from
    drm_print.h. A simple forward declaration for struct drm_printer is
    sufficient.
    
    An explicit drm_print.h include has previously been added to all the
    files that indirectly depended on this include.
    
    v3: Only remove the include here (Thomas)
    
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c96b6fcb185b5fd5ebc9ea5d788a94a0f477d4ae drm-intel
bb9599d1d497 drm: include drm_print.h where needed
-:1927: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#1927: FILE: drivers/gpu/drm/i915/i915_getparam.c:2:
  * SPDX-License-Identifier: MIT

-:3819: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:3822: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 3 warnings, 0 checks, 2732 lines checked
29cf0db1a9e5 drm/buddy: replace drm_print.h include with a forward declaration
c4ad3b6becf6 drm/mm: replace drm_print.h include with a forward declaration
8ed7b8b50a41 drm/ttm: replace drm_print.h include with a forward declaration


