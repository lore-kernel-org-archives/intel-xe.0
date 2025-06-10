Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8791C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 10:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ED110E4DF;
	Tue, 10 Jun 2025 10:19:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1A10E4E9;
 Tue, 10 Jun 2025 10:19:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/panel=2C_drm/i915=3A_?=
 =?utf-8?q?ACPI_support_for_panel_follower_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 10:19:35 -0000
Message-ID: <174955077509.63316.1218697988776386122@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749199013.git.jani.nikula@intel.com>
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

Series: drm/panel, drm/i915: ACPI support for panel follower (rev2)
URL   : https://patchwork.freedesktop.org/series/149923/
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
commit 4c8ce130d0604cc55831064197ce5e0caa096955
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jun 6 12:05:12 2025 +0300

    drm/i915/panel: sync panel prepared state at register
    
    If the panel is enabled at probe, and we take over the hardware state,
    the drm_panel prepared state will be out of sync. We'll need to notify
    drm_panel framework about the state at probe, so it can in turn notify
    the panel followers.
    
    Cc: Lee Shawn C <shawn.c.lee@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 52ecbb6a68785860c776b29f58792d9807243979 drm-intel
69a61e48aac8 drm/panel: use fwnode based lookups for panel followers
0331863901b7 drm/i915/panel: add panel register/unregister
f8269d2eeff2 drm/i915/panel: register drm_panel and call prepare/unprepare for ICL+ DSI
4c8ce130d060 drm/i915/panel: sync panel prepared state at register


