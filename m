Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49899D63936
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 13:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DC310E75E;
	Wed, 20 Nov 2024 13:13:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43210E75E;
 Wed, 20 Nov 2024 13:13:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_MST_and_DDI_c?=
 =?utf-8?q?leanups_and_refactoring_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 13:13:32 -0000
Message-ID: <173210841286.722476.15524443173467088059@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732106557.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732106557.git.jani.nikula@intel.com>
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

Series: drm/i915: MST and DDI cleanups and refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/141501/
State : warning

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
commit a8696bc1c2dcf8e175c0929385653cc2daf4e54c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Nov 20 14:43:19 2024 +0200

    drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly
    
    Use a temporary variable for DDI mode to simplify the conditions. This
    is in line with the other places that read DDI mode.
    
    Reviewed-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0cb17ecec562c61d45997a2fced4e5ed99b31f99 drm-intel
3a25c008d2c3 drm/i915/mst: pass intel_dp around in mst stream helpers
2248d62ad30e drm/i915/mst: unify MST connector function naming to mst_connector_*
65cc31729292 drm/i915/mst: simplify mst_connector_get_hw_state()
70a158a4c4fb drm/i915/mst: unify MST topology callback naming to mst_topology_*
7a8634fa5e37 drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/disable
98db6e65f70b drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
-:87: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/i915_reg.h:3857:
+#define   DP_TP_STATUS_STREAMS_ENABLED_MASK	REG_GENMASK(18, 16) /* 17:16 on hsw but bit 18 mbz */

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
0895f90c64e9 drm/i915/dp: refactor clear/wait for act sent
7a8db8be2861 drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl()
87650eb3e075 drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
f2e536258a01 drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
a8696bc1c2dc drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly


