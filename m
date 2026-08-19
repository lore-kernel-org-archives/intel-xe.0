Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81624C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D210E574;
	Wed, 19 Aug 2026 14:11:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2C110E574;
 Wed, 19 Aug 2026 14:11:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/disp?=
 =?utf-8?q?lay=3A_another_stab_at_i915=5Ffence=5Ftimeout=28=29_removal?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Aug 2026 14:11:18 -0000
Message-ID: <178714867895.67647.14898218702548605370@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1787148235.git.jani.nikula@intel.com>
In-Reply-To: <cover.1787148235.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/display: another stab at i915_fence_timeout() removal
URL   : https://patchwork.freedesktop.org/series/172457/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42d61bfe1f6438f3f02c54f9e1ceb0763641f2ed
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Aug 19 17:05:13 2026 +0300

    drm/i915/display: use fixed 10 second timeout for fence wait
    
    i915 has a configurable fence wait timeout, defaulting to 10 seconds,
    and xe uses MAX_SCHEDULE_TIMEOUT i.e. it has no timeout.
    
    Use a fixed 10 second timeout for both drivers instead of having them do
    different things. Ditch the now unused compat header from xe.
    
    i915 actually needs the timeout to deal with CI reset tests, but there
    shouldn't be any harm in having a 10 second timeout in xe either.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 291141d363710c4ac7ef9ab71153459d746ed50c drm-intel
8d2e935ed675 drm/i915/display: use struct intel_atomic_state *state variable naming
97640ef1cffe drm/i915/display: reduce indent in intel_atomic_commit_fence_wait()
1fc9fa65676e drm/i915/display: debug log about fence wait timeouts and other errors
42d61bfe1f64 drm/i915/display: use fixed 10 second timeout for fence wait
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


