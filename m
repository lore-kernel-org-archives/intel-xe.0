Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74ACFEFB7C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 19:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89010EC1B;
	Fri, 27 Feb 2026 19:23:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5B10EC19;
 Fri, 27 Feb 2026 19:23:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=2C_drm/xe=3A_cle?=
 =?utf-8?q?an_up_i915=5Fvma=2Eh_usage_for_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 19:23:23 -0000
Message-ID: <177222020339.297701.18237258301289271266@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772212579.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772212579.git.jani.nikula@intel.com>
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

Series: drm/i915, drm/xe: clean up i915_vma.h usage for display
URL   : https://patchwork.freedesktop.org/series/162332/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5f4491ca7244db2cc62e6ccb57da7af29ac61bf5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Feb 27 19:17:14 2026 +0200

    drm/xe/display: clean up xe_initial_plane.c includes
    
    Remove excess includes, group and sort include directives.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1 drm-intel
9245d167385b drm/i915/fbdev: stop debug logging i915_ggtt_offset()
bc625d436967 drm/i915: add VMA to parent interface
af253c5462ac drm/xe/compat: remove i915_vma.h from compat
-:19: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
5f4491ca7244 drm/xe/display: clean up xe_initial_plane.c includes


