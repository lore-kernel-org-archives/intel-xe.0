Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66485C3ABC9
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 12:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA9D11B845;
	Wed, 21 May 2025 12:19:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDFC11B831;
 Wed, 21 May 2025 12:18:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915_=26_drm/xe=3A_al?=
 =?utf-8?q?locate_struct_intel=5Fdisplay_dynamically?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 12:18:59 -0000
Message-ID: <174782993963.9735.3890938310791615865@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1747822630.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747822630.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: allocate struct intel_display dynamically
URL   : https://patchwork.freedesktop.org/series/149318/
State : success

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
commit 40049ebffbb9398e73324666b493fdfd47e19686
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed May 21 13:21:48 2025 +0300

    drm/xe: stop including intel_display_{core, device}.h from xe_device_types.h
    
    Make xe->display pointer opaque to most of core xe driver. A few places
    now need explicit include of intel_display_core.h.
    
    With this dependency broken, changes in display should cause radically
    less recompilation of xe.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3695d568b260d85e65f9331ca1180a9dd2b5560b drm-intel
19dd6db4eb4a drm/i915/display: allocate struct intel_display dynamically
01af4644eff8 drm/i915: stop including display/intel_display_{core, limits}.h from i915_drv.h
40049ebffbb9 drm/xe: stop including intel_display_{core, device}.h from xe_device_types.h


