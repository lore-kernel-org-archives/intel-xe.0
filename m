Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DFDC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 13:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B25F10E90F;
	Wed, 26 Feb 2025 13:16:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A159010E90F;
 Wed, 26 Feb 2025 13:16:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pfit=3A_panel_fi?=
 =?utf-8?q?tter_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 13:16:41 -0000
Message-ID: <174057580165.2338785.15112704051648056877@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740564009.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740564009.git.jani.nikula@intel.com>
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

Series: drm/i915/pfit: panel fitter refactors
URL   : https://patchwork.freedesktop.org/series/145470/
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
commit 7160cf4ce68bc6e00bcbee38fee865eecb879471
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Feb 26 12:01:11 2025 +0200

    drm/i915/pfit: split out intel_pfit_regs.h
    
    Split out the panel fitter registers to a separate file.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5bcb67a2a4c61034f5a25c024631c5fbf351ee8d drm-intel
53dbb4f45bfa drm/i915/pfit: rename intel_panel_fitting() to intel_pfit_compute_config()
cac94d1eda49 drm/i915/pfit: move ilk and i9xx pfit code to intel_pfit.[ch]
-:356: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#356: FILE: drivers/gpu/drm/i915/display/intel_pfit.c:595:
+	 * it's in use. The hw state code will make sure we get this right. */

-:422: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#422: FILE: drivers/gpu/drm/i915/display/intel_pfit.c:661:
+	 * default, change to something else for debugging. */

total: 0 errors, 2 warnings, 0 checks, 436 lines checked
a7ce51624301 drm/i915/pfit: fix comment style for moved comments
80c4a238ff82 drm/i915/pfit: convert moved code to struct intel_display
7160cf4ce68b drm/i915/pfit: split out intel_pfit_regs.h
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 189 lines checked


