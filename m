Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAACCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 01:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631FA10E18A;
	Thu, 16 Oct 2025 01:05:09 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C50210E18A;
 Thu, 16 Oct 2025 01:05:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_move_i915_spe?=
 =?utf-8?q?cific_display_adaptation_files_to_display-adapt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 01:05:08 -0000
Message-ID: <176057670837.20008.9513515647633570491@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015160140.2296120-1-jani.nikula@intel.com>
In-Reply-To: <20251015160140.2296120-1-jani.nikula@intel.com>
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

Series: drm/i915: move i915 specific display adaptation files to display-adapt
URL   : https://patchwork.freedesktop.org/series/156006/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ccae0b077da7deed4f0a7d26600eefa62594009
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 15 19:01:40 2025 +0300

    drm/i915: move i915 specific display adaptation files to display-adapt
    
    The display/ subdirectory currently contains files that are about i915
    core driver adaptation to display rather than generic display
    implementation. Move them to a new i915 subdirectory display-adapt/.
    
    In the xe driver, all of its display/ is basically xe core adaptation to
    display. It's just that i915 display/ contains the actual display
    implementation for both. Ideally, we'd have the shared display code
    somewhere else, and the adaptation in i915 would be under display/, but
    we're not quite ready for that kind of churn yet. So let's just call it
    display-adapt for now.
    
    xe basically has equivalent files to the ones that are being moved,
    apart from intel_dpt.c, for which the implementation is quite different.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f019aaad58112f89234f7b68557c831846437008 drm-intel
4ccae0b077da drm/i915: move i915 specific display adaptation files to display-adapt
-:115: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#115: 
rename from drivers/gpu/drm/i915/display/intel_bo.c

total: 0 errors, 1 warnings, 0 checks, 238 lines checked


