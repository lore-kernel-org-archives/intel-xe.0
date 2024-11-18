Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EACAD49231
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 15:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E1D10E4F8;
	Mon, 18 Nov 2024 15:09:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67C710E4F8;
 Mon, 18 Nov 2024 15:09:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_MST_and_DDI_c?=
 =?utf-8?q?leanups_and_refactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 15:09:06 -0000
Message-ID: <173194254696.1264219.11376231605496987933@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731941270.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731941270.git.jani.nikula@intel.com>
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

Series: drm/i915: MST and DDI cleanups and refactoring
URL   : https://patchwork.freedesktop.org/series/141501/
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
commit 76c35052e622be613a9542cd2c08a665da33ae57
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Nov 18 16:49:06 2024 +0200

    drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly
    
    Use a temporary variable for DDI mode to simplify the conditions. This
    is in line with the other places that read DDI mode.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 90014f8026e31874d368834834253debd131268b drm-intel
1bd3c90824a9 drm/i915/mst: pass intel_dp around in mst stream helpers
48dbc28f4e7b drm/i915/mst: unify MST connector function naming to mst_connector_*
118d7e5f3a3c drm/i915/mst: simplify mst_connector_get_hw_state()
374dcd94a518 drm/i915/mst: unify MST topology callback naming to mst_topology_*
54f54cf312f8 drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/disable
b9285fce6b31 drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
34ce3f4cdd34 drm/i915/dp: refactor clear/wait for act sent
ef929768565c drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl()
33122ca1faae drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
a3d8610d03d8 drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
76c35052e622 drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly


