Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8940C3ABC5
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 16:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6FD10E85B;
	Wed,  7 May 2025 16:10:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA6410E85B;
 Wed,  7 May 2025 16:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_determ?=
 =?utf-8?q?ining_SST/MST_mode_during_MTP_TU_state_computation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 16:10:03 -0000
Message-ID: <174663420330.56619.7117255234891251268@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507151953.251846-1-imre.deak@intel.com>
In-Reply-To: <20250507151953.251846-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix determining SST/MST mode during MTP TU state computation
URL   : https://patchwork.freedesktop.org/series/148704/
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
commit c7837d3e3cbc4a026a12700b87ddd5e67837269a
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed May 7 18:19:53 2025 +0300

    drm/i915/dp: Fix determining SST/MST mode during MTP TU state computation
    
    Determining the SST/MST mode during state computation must be done based
    on the output type stored in the CRTC state, which in turn is set once
    based on the modeset connector's SST vs. MST type and will not change as
    long as the connector is using the CRTC. OTOH the MST mode indicated by
    the given connector's intel_dp::is_mst flag can change independently of
    the above output type, based on what sink is at any moment plugged to
    the connector.
    
    Fix the state computation accordingly.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Fixes: f6971d7427c2 ("drm/i915/mst: adapt intel_dp_mtp_tu_compute_config() for 128b/132b SST")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4607
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4f521146ae830688a534fa249e5ee37ae31b095a drm-intel
c7837d3e3cbc drm/i915/dp: Fix determining SST/MST mode during MTP TU state computation


