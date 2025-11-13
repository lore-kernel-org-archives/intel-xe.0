Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26731CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEA310E91C;
	Thu, 13 Nov 2025 18:03:13 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAB610E91C;
 Thu, 13 Nov 2025 18:03:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_stop_?=
 =?utf-8?q?using_the_configurable_fence_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Nov 2025 18:03:12 -0000
Message-ID: <176305699219.52219.7188471974810751734@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251112155612.8320-1-jani.nikula@intel.com>
In-Reply-To: <20251112155612.8320-1-jani.nikula@intel.com>
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

Series: drm/i915/display: stop using the configurable fence timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/157440/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 67b82ef9d0bda1cae61bb4d4137b65ff55b6a232
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 13 17:53:32 2025 +0200

    drm/i915/display: stop using the configurable fence timeout
    
    i915 has the Kconfig option DRM_I915_FENCE_TIMEOUT, defaulting to 10
    seconds. xe doesn't use it, instead defaulting to
    MAX_SCHEDULE_TIMEOUT. Unify the behaviour by switching to
    dma_fence_wait() which defaults to MAX_SCHEDULE_TIMEOUT.
    
    As dma_fence_wait() returns 0 when the fence was signaled, update the
    return value check.
    
    v2: Use dma_fence_wait(), fix return value check (Maarten)
    
    Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 9d61bbd3042d1976dc5f67a30e0aa6c010cbc98f drm-intel
67b82ef9d0bd drm/i915/display: stop using the configurable fence timeout
-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


