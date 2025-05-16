Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF50C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 13:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DFA10EAB7;
	Fri, 16 May 2025 13:19:23 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B59510EABB;
 Fri, 16 May 2025 13:19:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915_=26_drm/xe=3A_pr?=
 =?utf-8?q?ep_work_towards_opaque_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 13:19:22 -0000
Message-ID: <174740156204.88035.10658913973095563024@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747397638.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747397638.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: prep work towards opaque struct intel_display
URL   : https://patchwork.freedesktop.org/series/149113/
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
commit 1a0dd4524b306ba90d587c2c579f612110345ddf
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri May 16 15:17:00 2025 +0300

    drm/xe/display: use xe->display to decide whether to do anything
    
    Since we only initialize xe->display when xe->info.probe_display, we can
    use !xe->display to bail out early. This seems cleaner and more accurate
    than relying on xe->info.probe_display, since xe->display may indeed be
    NULL.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 drm-intel
2ae12a3e3ce0 drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue()
a3eb99cb829b drm/xe/display: Add check for alloc_ordered_workqueue()
5fc66d16a706 drm/xe/display: drop duplicate display->fb_tracking.lock init
ff99a48c01d3 drm/i915/display: move hotplug.dp_wq init from xe and i915 to display
2a088cc55aa8 drm/xe/display: move xe->display initialization to xe_display_probe()
aeb6a58439cd drm/xe/display: add notes about how early a few functions can be called
1a0dd4524b30 drm/xe/display: use xe->display to decide whether to do anything


