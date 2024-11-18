Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7256DD49221
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 14:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA4310E249;
	Mon, 18 Nov 2024 14:15:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9EB10E249;
 Mon, 18 Nov 2024 14:15:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=5Fmst=3A_Fix_?=
 =?utf-8?q?connector_initialization_in_intel=5Fdp=5Fadd=5Fmst=5Fconnector=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 14:15:10 -0000
Message-ID: <173193931025.1248287.5631609807716840749@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241118131044.1278028-1-imre.deak@intel.com>
In-Reply-To: <20241118131044.1278028-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Fix connector initialization in intel_dp_add_mst_connector()
URL   : https://patchwork.freedesktop.org/series/141496/
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
commit f083f6670e8c839835e7ba5859c84057fed8bf53
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Nov 18 15:10:44 2024 +0200

    drm/i915/dp_mst: Fix connector initialization in intel_dp_add_mst_connector()
    
    The connector initialization in intel_dp_add_mst_connector() depends on
    the device pointer in connector to be valid, at least by connector
    debug printing. The device pointer is initialized by drm_connector_init(),
    however that function also exposes the connector to in-kernel users,
    which can't be done before the connector is fully initialized. For now
    make sure the device pointer is valid before it's used, until a
    follow-up change moving this to DRM core.
    
    This issue was revealed by the commit in the Fixes: line below, before
    which the above debug printing checked and handled a NULL device pointer
    gracefully in DRM core.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 90014f8026e31874d368834834253debd131268b drm-intel
f083f6670e8c drm/i915/dp_mst: Fix connector initialization in intel_dp_add_mst_connector()


