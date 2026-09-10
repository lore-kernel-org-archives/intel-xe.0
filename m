Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62875C79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 19:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA2D10E2DE;
	Thu, 10 Sep 2026 19:49:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01210E2DE;
 Thu, 10 Sep 2026 19:49:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_stop_?=
 =?utf-8?q?using_the_configurable_fence_timeout=2C_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 19:49:38 -0000
Message-ID: <178906977816.147924.17074377298976937511@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789069102.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789069102.git.jani.nikula@intel.com>
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

Series: drm/i915/display: stop using the configurable fence timeout, cleanups
URL   : https://patchwork.freedesktop.org/series/173811/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 45877dd97df1f0331a1485563d799fffad78b7cf
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Sep 10 22:42:36 2026 +0300

    drm/i915/display: debug log about fence wait errors
    
    Currently there's no indication if fence wait failed. Debug log about
    it.
    
    v2: Rebase, no timeout anymore
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0f8842cc4eea5bd70f84d3bb89f58520ed0fe036 drm-intel
1e9c9194d265 drm/i915/display: stop using the configurable fence timeout
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
e8ee1f911ecc drm/i915/display: use struct intel_atomic_state *state variable naming
eb5a9890d07f drm/i915/display: reduce indent in intel_atomic_commit_fence_wait()
45877dd97df1 drm/i915/display: debug log about fence wait errors


