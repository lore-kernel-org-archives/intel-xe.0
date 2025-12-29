Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A4AE8FDB1
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 12:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17C10E0ED;
	Mon, 29 Dec 2025 12:01:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A736110E0ED;
 Mon, 29 Dec 2025 12:01:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/disp?=
 =?utf-8?q?lay=3A_remove_the_-Ddrm=5Fi915=5Fprivate=3Dxe=5Fdevice_hack?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Dec 2025 12:01:11 -0000
Message-ID: <176700967169.119487.7389439747055946884@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1767009044.git.jani.nikula@intel.com>
In-Reply-To: <cover.1767009044.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/display: remove the -Ddrm_i915_private=xe_device hack
URL   : https://patchwork.freedesktop.org/series/159523/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b4f1c009d9f8879b5284defbdaaa98dcaed0d32
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Dec 29 13:54:45 2025 +0200

    drm/i915/utils: drop unnecessary ifdefs
    
    The i915_utils.h and intel_display_utils.h were in some cases included
    from the same files, the former via i915_drv.h and the latter
    directly. This lead to a clash between MISSING_CASE() and
    fetch_and_zero() defined in both, requiring ifdefs.
    
    With the display dependency on i915_drv.h removed, we can also remove
    the now unnecessary ifdefs.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch df5d22c1ab5224f7e58dfef51e03f239f25a407f drm-intel
435614e5f640 drm/i915: drop i915 param from i915_fence{, _context}_timeout()
496b24349a5f drm/xe: remove compat i915_drv.h and -Ddrm_i915_private=xe_device hack
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
2b4f1c009d9f drm/i915/utils: drop unnecessary ifdefs


