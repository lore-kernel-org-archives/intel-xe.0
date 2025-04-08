Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A06C369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 16:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5E510E281;
	Tue,  8 Apr 2025 16:28:51 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374110E281;
 Tue,  8 Apr 2025 16:28:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/plane=3A_file_an?=
 =?utf-8?q?d_function_renames?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 16:28:50 -0000
Message-ID: <174412973000.48724.14395578958884640240@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744129283.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744129283.git.jani.nikula@intel.com>
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

Series: drm/i915/plane: file and function renames
URL   : https://patchwork.freedesktop.org/series/147415/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af08d4edfe1c2efbe70d45f0c4d63e9bdb6c33c7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 8 19:22:04 2025 +0300

    drm/i915/plane: rename intel_atomic_add_affected_planes() to intel_plane_add_affected()
    
    Rename to follow filename based naming.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch bc033b97f4cf51b56a927e050839bf9e16f6a1b1 drm-intel
8dff5ef3f218 drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
-:220: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#220: 
rename from drivers/gpu/drm/i915/display/intel_atomic_plane.c

total: 0 errors, 1 warnings, 0 checks, 269 lines checked
62d2ca068381 drm/i915/plane: drop atomic from intel_atomic_plane_check_clipping()
8bb829d676e6 drm/i915/plane: make intel_plane_atomic_check() static and rename
fdd598363c1a drm/i915/plane: rename intel_atomic_check_planes() to intel_plane_atomic_check()
af08d4edfe1c drm/i915/plane: rename intel_atomic_add_affected_planes() to intel_plane_add_affected()


