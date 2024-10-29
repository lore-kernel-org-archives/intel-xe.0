Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A4BD2AB3A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 12:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B8310E1C1;
	Tue, 29 Oct 2024 12:41:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC36D10E1C1;
 Tue, 29 Oct 2024 12:41:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_minor_cle?=
 =?utf-8?q?anups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 12:41:09 -0000
Message-ID: <173020566983.1359138.533525639249472999@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730201504.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730201504.git.jani.nikula@intel.com>
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

Series: drm/i915/psr: minor cleanups
URL   : https://patchwork.freedesktop.org/series/140652/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1002bbc91aa7b260591242fb0c745f32a04ea54d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 29 13:32:50 2024 +0200

    drm/i915/psr: clarify intel_psr_pre_plane_update() conditions
    
    Make the conditions easier to follow. We don't do anything for
    !psr->enabled, so hoist psr->enabled check higher, avoiding all the
    checks when !psr->enabled. Stop the bitwise OR abuse on booleans by
    removing the temporary variable altogether.
    
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 738c18d8599dce736da8b6958f96d2eac08a36ab drm-intel
100680433fa9 drm/i915/psr: add LATENCY_REPORTING_REMOVED() register bit helper
709c070e4146 drm/i915/psr: stop using bitwise OR with booleans in wm_optimization_wa()
1002bbc91aa7 drm/i915/psr: clarify intel_psr_pre_plane_update() conditions


