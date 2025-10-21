Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFF2CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 16:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385B510E625;
	Tue, 21 Oct 2025 16:53:42 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77D510E625;
 Tue, 21 Oct 2025 16:53:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_replace_drm=5Fprin?=
 =?utf-8?q?t=2Eh_includes_from_headers_with_a_forward_declaration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 16:53:40 -0000
Message-ID: <176106562094.36825.14927637914260897771@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761063757.git.jani.nikula@intel.com>
In-Reply-To: <cover.1761063757.git.jani.nikula@intel.com>
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

Series: drm: replace drm_print.h includes from headers with a forward declaration
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
commit 33544f8964fa534cd7036fcb6bda3f6a15e19e90
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 21 19:29:28 2025 +0300

    drm/ttm: replace drm_print.h include with a forward declaration
    
    The ttm/ttm_resource.h header does not really need anything from
    drm_print.h. A simple forward declaration for struct drm_printer is
    sufficient.
    
    Alas, a gazillion files depend on that indirect include, and need the
    explicit drm_print.h include. Add them all over the place.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5b93624944844e355037231c08ee088d33b4cf3b drm-intel
8edb13031db9 drm/mm: replace drm_print.h include with a forward declaration
-:1703: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:1706: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus-qemu.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 1390 lines checked
354fb3643448 drm/buddy: replace drm_print.h include with a forward declaration
33544f8964fa drm/ttm: replace drm_print.h include with a forward declaration
-:1057: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#1057: FILE: drivers/gpu/drm/i915/i915_getparam.c:2:
  * SPDX-License-Identifier: MIT

total: 0 errors, 1 warnings, 0 checks, 1002 lines checked


