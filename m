Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB21C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 11:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0810E3C5;
	Thu, 12 Jun 2025 11:55:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2393F10E3C5;
 Thu, 12 Jun 2025 11:55:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/plane=3A_file_an?=
 =?utf-8?q?d_function_renames_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 11:55:44 -0000
Message-ID: <174972934414.71058.11832491452086192933@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749728173.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749728173.git.jani.nikula@intel.com>
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

Series: drm/i915/plane: file and function renames (rev2)
URL   : https://patchwork.freedesktop.org/series/147415/
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
commit 3fee2f671090b2298c1ff85bf3e5d18a1d96c952
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 12 14:37:11 2025 +0300

    drm/i915/plane: rename intel_atomic_add_affected_planes() to intel_plane_add_affected()
    
    Rename to follow filename based naming.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 97cffe7577962cb45e3a66d758f9a7cd2633c303 drm-intel
87fe9dca9401 drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
-:211: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#211: 
rename from drivers/gpu/drm/i915/display/intel_atomic_plane.c

total: 0 errors, 1 warnings, 0 checks, 253 lines checked
6decd6240775 drm/i915/plane: drop atomic from intel_atomic_plane_check_clipping()
99aec090a137 drm/i915/plane: make intel_plane_atomic_check() static and rename
09492bfcd048 drm/i915/plane: rename intel_atomic_check_planes() to intel_plane_atomic_check()
3fee2f671090 drm/i915/plane: rename intel_atomic_add_affected_planes() to intel_plane_add_affected()


