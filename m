Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46113CD4F24
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 19:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C810E1BC;
	Wed,  4 Sep 2024 19:21:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C0410E1BC;
 Wed,  4 Sep 2024 19:21:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_Merge_x?=
 =?utf-8?q?e=27s_display_info_probe_and_i915_HAS=5FDISPLAY_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 19:21:19 -0000
Message-ID: <172547767929.936021.12267295982608010503@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904173713.26891-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240904173713.26891-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/display: Merge xe's display info probe and i915 HAS_DISPLAY checks
URL   : https://patchwork.freedesktop.org/series/138224/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b128562cc9e3893c1053bf4a86fb13cf8cb665c
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Sep 4 13:37:13 2024 -0400

    drm/xe/display: Merge xe's display info probe and i915 HAS_DISPLAY checks
    
    Instead of having multiple checks and the has_display in the middle
    of the functions, only execute the Xe display functions if
    Xe probed display and pipe_masks still have something valid
    after i915's runtime init.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch c72d3ffc0308b71024de6f80c3596668991c67ea drm-intel
2b128562cc9e drm/xe/display: Merge xe's display info probe and i915 HAS_DISPLAY checks


